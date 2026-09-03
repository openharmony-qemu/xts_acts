'use static';


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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from "../Util.test";
interface ObjKey { id: int; }
interface ObjVal { name: string; }
interface NestedObjInner { count: double; }
interface NestedObj { inner: NestedObjInner; }
interface KeyObj { id: int; }
const INT_MAX: int = 2147483647;

export default function MapConstructorPart03Test(): void {
  describe('MapConstructorPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_0100
     * @tc.name mapConstructorPart03Test001
     * @tc.desc Verify new Map([["a", 1]]) with a single entry yields size 1, has("a") true and get("a") returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      expect(m.size).assertEqual(1);
      expect(m.has('a')).assertTrue();
      expect(m.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_0200
     * @tc.name mapConstructorPart03Test002
     * @tc.desc Verify new Map([["a", 1], ["b", 2], ["c", 3]]) with three entries yields size 3 and get returns 1, 2 and 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      expect(m.size).assertEqual(3);
      expect(m.get('a')).assertEqual(1);
      expect(m.get('b')).assertEqual(2);
      expect(m.get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_0300
     * @tc.name mapConstructorPart03Test003
     * @tc.desc Verify new Map<int, string>([[100, "x"]]) stores int key 100 with size 1, has(100) true and get(100) returns "x"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[100, 'x']]);
      expect(m.size).assertEqual(1);
      expect(m.has(100)).assertTrue();
      expect(m.get(100)).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_0400
     * @tc.name mapConstructorPart03Test004
     * @tc.desc Verify new Map([["", 999]]) stores the empty string as key with has("") true and get("") returns 999
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['', 999]]);
      expect(m.has('')).assertTrue();
      expect(m.get('')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_0500
     * @tc.name mapConstructorPart03Test005
     * @tc.desc Verify new Map([["😀", 1]]) stores the emoji character U+1F600 as key with has("😀") true and get("😀") returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['😀', 1]]);
      expect(m.has('😀')).assertTrue();
      expect(m.get('😀')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_0600
     * @tc.name mapConstructorPart03Test006
     * @tc.desc Verify zero-width space key (U+200B) is stored and retrieved by value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['​', 42]]);
      expect(m.has('​')).assertTrue();
      expect(m.get('​')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_0700
     * @tc.name mapConstructorPart03Test007
     * @tc.desc Verify new Map<int, string>([[0, "zero"]]) stores int key 0 with has(0) true and get(0) returns "zero"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[0, 'zero']]);
      expect(m.has(0)).assertTrue();
      expect(m.get(0)).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_0800
     * @tc.name mapConstructorPart03Test008
     * @tc.desc Verify new Map<int, string>([[-1, "minus_one"]]) stores int key -1 with has(-1) true and get(-1) returns "minus_one"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[-1, 'minus_one']]);
      expect(m.has(-1)).assertTrue();
      expect(m.get(-1)).assertEqual('minus_one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_0900
     * @tc.name mapConstructorPart03Test009
     * @tc.desc Verify new Map<int, string>([[2147483647, "max_int"]]) stores the maximum int key with has() true and get() returns "max_int"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: int = 2147483647;
      const m: Map<int, string> = new Map<int, string>([[key, 'max_int']]);
      expect(m.has(key)).assertTrue();
      expect(m.get(key)).assertEqual('max_int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_1000
     * @tc.name mapConstructorPart03Test010
     * @tc.desc Verify new Map<int, string>([[-2147483647 - 1, "min_int"]]) stores the minimum int key with has() true and get() returns "min_int"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: int = -2147483647 - 1;
      const m: Map<int, string> = new Map<int, string>([[key, 'min_int']]);
      expect(m.has(key)).assertTrue();
      expect(m.get(key)).assertEqual('min_int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_1100
     * @tc.name mapConstructorPart03Test011
     * @tc.desc Verify new Map<long, string>([[1, "one"]]) stores long key 1 with has(1) true and get(1) returns "one"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>([[1, 'one']]);
      expect(m.has(1)).assertTrue();
      expect(m.get(1)).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_1200
     * @tc.name mapConstructorPart03Test012
     * @tc.desc Verify new Map<long, string>([[9223372036854775807, "max_long"]]) stores the maximum long key with has() true and get() returns "max_long"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: long = 9223372036854775807;
      const m: Map<long, string> = new Map<long, string>([[key, 'max_long']]);
      expect(m.has(key)).assertTrue();
      expect(m.get(key)).assertEqual('max_long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_1300
     * @tc.name mapConstructorPart03Test013
     * @tc.desc Verify new Map<long, string>([[-9223372036854775807 - 1, "min_long"]]) stores the minimum long key with has() true and get() returns "min_long"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: long = -9223372036854775807 - 1;
      const m: Map<long, string> = new Map<long, string>([[key, 'min_long']]);
      expect(m.has(key)).assertTrue();
      expect(m.get(key)).assertEqual('min_long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_1400
     * @tc.name mapConstructorPart03Test014
     * @tc.desc Verify new Map<double, string>([[1.5, "float_key"]]) stores double key 1.5 with has(1.5) true and get(1.5) returns "float_key"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>([[1.5, 'float_key']]);
      expect(m.has(1.5)).assertTrue();
      expect(m.get(1.5)).assertEqual('float_key');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_1500
     * @tc.name mapConstructorPart03Test015
     * @tc.desc Verify new Map<double, string>([[0.0, "positive_zero"]]) stores double key 0.0 with has(0.0) true and get(0.0) returns "positive_zero"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>([[0.0, 'positive_zero']]);
      expect(m.has(0.0)).assertTrue();
      expect(m.get(0.0)).assertEqual('positive_zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_1600
     * @tc.name mapConstructorPart03Test016
     * @tc.desc Verify new Map<double, string>([[-0.0, "negative_zero"]]) stores double key -0.0 with has(-0.0) true and get(-0.0) returns "negative_zero"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>([[-0.0, 'negative_zero']]);
      expect(m.has(-0.0)).assertTrue();
      expect(m.get(-0.0)).assertEqual('negative_zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_1700
     * @tc.name mapConstructorPart03Test017
     * @tc.desc Verify new Map<double, string>([[Number.NaN, "nan_val"]]) stores NaN as key with has(NaN) true and get(NaN) returns "nan_val"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>([[Number.NaN, 'nan_val']]);
      expect(m.has(Number.NaN)).assertTrue();
      expect(m.get(Number.NaN)).assertEqual('nan_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_1800
     * @tc.name mapConstructorPart03Test018
     * @tc.desc Verify new Map<double, string>([[Number.POSITIVE_INFINITY, "pos_inf"]]) stores positive infinity as key with has() true and get() returns "pos_inf"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>([[Number.POSITIVE_INFINITY, 'pos_inf']]);
      expect(m.has(Number.POSITIVE_INFINITY)).assertTrue();
      expect(m.get(Number.POSITIVE_INFINITY)).assertEqual('pos_inf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_1900
     * @tc.name mapConstructorPart03Test019
     * @tc.desc Verify new Map<byte, string>([[0 as byte, "byte_zero"]]) stores byte key 0 with has(0 as byte) true and get(0 as byte) returns "byte_zero"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, string> = new Map<byte, string>([[0 as byte, 'byte_zero']]);
      expect(m.has(0 as byte)).assertTrue();
      expect(m.get(0 as byte)).assertEqual('byte_zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_2000
     * @tc.name mapConstructorPart03Test020
     * @tc.desc Verify new Map<byte, string>([[127 as byte, "max_byte"]]) stores the maximum byte key 127 with has() true and get() returns "max_byte"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: byte = 127 as byte;
      const m: Map<byte, string> = new Map<byte, string>([[key, 'max_byte']]);
      expect(m.has(key)).assertTrue();
      expect(m.get(key)).assertEqual('max_byte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_2100
     * @tc.name mapConstructorPart03Test021
     * @tc.desc Verify new Map<byte, string>([[-128 as byte, "min_byte"]]) stores the minimum byte key -128 with has() true and get() returns "min_byte"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: byte = -128 as byte;
      const m: Map<byte, string> = new Map<byte, string>([[key, 'min_byte']]);
      expect(m.has(key)).assertTrue();
      expect(m.get(key)).assertEqual('min_byte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_2200
     * @tc.name mapConstructorPart03Test022
     * @tc.desc Verify new Map<short, string>([[0 as short, "short_zero"]]) stores short key 0 with has(0 as short) true and get(0 as short) returns "short_zero"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>([[0 as short, 'short_zero']]);
      expect(m.has(0 as short)).assertTrue();
      expect(m.get(0 as short)).assertEqual('short_zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_2300
     * @tc.name mapConstructorPart03Test023
     * @tc.desc Verify new Map<short, string>([[32767 as short, "max_short"]]) stores the maximum short key 32767 with has() true and get() returns "max_short"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: short = 32767 as short;
      const m: Map<short, string> = new Map<short, string>([[key, 'max_short']]);
      expect(m.has(key)).assertTrue();
      expect(m.get(key)).assertEqual('max_short');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_2400
     * @tc.name mapConstructorPart03Test024
     * @tc.desc Verify new Map<short, string>([[-32768 as short, "min_short"]]) stores the minimum short key -32768 with has() true and get() returns "min_short"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: short = -32768 as short;
      const m: Map<short, string> = new Map<short, string>([[key, 'min_short']]);
      expect(m.has(key)).assertTrue();
      expect(m.get(key)).assertEqual('min_short');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_2500
     * @tc.name mapConstructorPart03Test025
     * @tc.desc Verify new Map<float, string>([[1.5 as float, "float_val"]]) stores float key 1.5 with has(1.5 as float) true and get(1.5 as float) returns "float_val"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, string> = new Map<float, string>([[1.5 as float, 'float_val']]);
      expect(m.has(1.5 as float)).assertTrue();
      expect(m.get(1.5 as float)).assertEqual('float_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_2600
     * @tc.name mapConstructorPart03Test026
     * @tc.desc Verify new Map<float, string>([[Double.toFloat(Number.NaN), "float_nan"]]) stores NaN float key with has() true and get() returns "float_nan"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: float = Double.toFloat(Number.NaN);
      const m: Map<float, string> = new Map<float, string>([[key, 'float_nan']]);
      expect(m.has(key)).assertTrue();
      expect(m.get(key)).assertEqual('float_nan');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_2700
     * @tc.name mapConstructorPart03Test027
     * @tc.desc Verify new Map<boolean, int>([[true, 1]]) stores boolean key true with has(true) true and get(true) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>([[true, 1]]);
      expect(m.has(true)).assertTrue();
      expect(m.get(true)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_2800
     * @tc.name mapConstructorPart03Test028
     * @tc.desc Verify new Map<boolean, int>([[false, 0]]) stores boolean key false with has(false) true and get(false) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>([[false, 0]]);
      expect(m.has(false)).assertTrue();
      expect(m.get(false)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_2900
     * @tc.name mapConstructorPart03Test029
     * @tc.desc Verify duplicate boolean key true in constructor entries overwrites the first value, size stays 1 and get(true) returns 99
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>([[true, 1], [true, 99]]);
      expect(m.size).assertEqual(1);
      expect(m.get(true)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_3000
     * @tc.name mapConstructorPart03Test030
     * @tc.desc Verify new Map<bigint, string>([[BigInt(0), "bigint_zero"]]) stores bigint key BigInt(0) with has(BigInt(0)) true and get(BigInt(0)) returns "bigint_zero"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<bigint, string> = new Map<bigint, string>([[BigInt(0), 'bigint_zero']]);
      expect(m.has(BigInt(0))).assertTrue();
      expect(m.get(BigInt(0))).assertEqual('bigint_zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_3100
     * @tc.name mapConstructorPart03Test031
     * @tc.desc Verify new Map<bigint, string>([[BigInt(999999999999), "big_bigint"]]) stores the large bigint key with has() true and get() returns "big_bigint"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: bigint = BigInt(999999999999);
      const m: Map<bigint, string> = new Map<bigint, string>([[key, 'big_bigint']]);
      expect(m.has(key)).assertTrue();
      expect(m.get(key)).assertEqual('big_bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_3200
     * @tc.name mapConstructorPart03Test032
     * @tc.desc Verify new Map<char, int>([[c'a', 1]]) stores char key 'a' with has('a') true, get('a') returns 1 and size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<char, int> = new Map<char, int>([[c'a', 1]]);
      expect(m.has(c'a')).assertTrue();
      expect(m.get(c'a')).assertEqual(1);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_3300
     * @tc.name mapConstructorPart03Test033
     * @tc.desc Verify a NUL char key (U+0000) is stored and retrieved via has() and get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch: char = c'\u{0}';
      const m: Map<char, int> = new Map<char, int>([[ch, 0]]);
      expect(m.has(ch)).assertTrue();
      expect(m.get(ch)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_3400
     * @tc.name mapConstructorPart03Test034
     * @tc.desc Verify new Map<Date, string>([[d, "date_val"]]) stores a Date instance as key with has(d) true and get(d) returns "date_val"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(1000, 0, 1);
      const m: Map<Date, string> = new Map<Date, string>([[d, 'date_val']]);
      expect(m.has(d)).assertTrue();
      expect(m.get(d)).assertEqual('date_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_3500
     * @tc.name mapConstructorPart03Test035
     * @tc.desc Verify new Map<RegExp, string>([[r, "regex_val"]]) stores a RegExp instance as key with has(r) true and get(r) returns "regex_val"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: RegExp = new RegExp('abc', 'g');
      const m: Map<RegExp, string> = new Map<RegExp, string>([[r, 'regex_val']]);
      expect(m.has(r)).assertTrue();
      expect(m.get(r)).assertEqual('regex_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_3600
     * @tc.name mapConstructorPart03Test036
     * @tc.desc Verify two RegExp instances with the same pattern "abc" and flags "g" are stored as separate keys, size is 2 and a fresh RegExp with the same pattern is not found
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp('abc', 'g');
      const r2: RegExp = new RegExp('abc', 'g');
      const m: Map<RegExp, string> = new Map<RegExp, string>([[r1, 'first'], [r2, 'second']]);
      expect(m.size).assertEqual(2);
      expect(m.get(r1)).assertEqual('first');
      expect(m.get(r2)).assertEqual('second');
      expect(m.has(r1)).assertTrue();
      expect(m.get(new RegExp('abc', 'g'))).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_3700
     * @tc.name mapConstructorPart03Test037
     * @tc.desc Verify RegExp keys with different patterns "abc"/"g" and "def"/"i" are stored as separate entries and get returns each value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp('abc', 'g');
      const r2: RegExp = new RegExp('def', 'i');
      const m: Map<RegExp, string> = new Map<RegExp, string>([[r1, 'abc'], [r2, 'def']]);
      expect(m.size).assertEqual(2);
      expect(m.get(r1)).assertEqual('abc');
      expect(m.get(r2)).assertEqual('def');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_3800
     * @tc.name mapConstructorPart03Test038
     * @tc.desc Verify new Map<ObjKey, string>([[key, "obj_val"]]) stores an object instance as key with has(key) true and get(key) returns "obj_val"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: ObjKey = { id: 1 } as ObjKey;
      const m: Map<ObjKey, string> = new Map<ObjKey, string>([[key, 'obj_val']]);
      expect(m.has(key)).assertTrue();
      expect(m.get(key)).assertEqual('obj_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_3900
     * @tc.name mapConstructorPart03Test039
     * @tc.desc Verify distinct object instances with equal content are stored as two separate keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key1: ObjKey = { id: 1 } as ObjKey;
      const key2: ObjKey = { id: 1 } as ObjKey;
      const m: Map<ObjKey, string> = new Map<ObjKey, string>([[key1, 'first'], [key2, 'second']]);
      expect(m.size).assertEqual(2);
      expect(m.get(key1)).assertEqual('first');
      expect(m.get(key2)).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_4000
     * @tc.name mapConstructorPart03Test040
     * @tc.desc Verify setting the same object key twice overwrites the value and keeps size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: ObjKey = { id: 1 } as ObjKey;
      const m: Map<ObjKey, string> = new Map<ObjKey, string>([[key, 'first'], [key, 'second']]);
      expect(m.size).assertEqual(1);
      expect(m.get(key)).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_4100
     * @tc.name mapConstructorPart03Test041
     * @tc.desc Verify new Map<Array<int>, string>([[key, "arr_val"]]) stores an Array<int> instance as key with has(key) true and get(key) returns "arr_val"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: Array<int> = [1, 2, 3];
      const m: Map<Array<int>, string> = new Map<Array<int>, string>([[key, 'arr_val']]);
      expect(m.has(key)).assertTrue();
      expect(m.get(key)).assertEqual('arr_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_4200
     * @tc.name mapConstructorPart03Test042
     * @tc.desc Verify distinct arrays with equal elements are stored as two separate keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<int> = [1, 2, 3];
      const arr2: Array<int> = [1, 2, 3];
      const m: Map<Array<int>, string> = new Map<Array<int>, string>([[arr1, 'one'], [arr2, 'two']]);
      expect(m.size).assertEqual(2);
      expect(m.get(arr1)).assertEqual('one');
      expect(m.get(arr2)).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_4300
     * @tc.name mapConstructorPart03Test043
     * @tc.desc Verify new Map<string, Date>([["k", d]]) stores a Date instance as value and get("k") returns the same instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(5000, 0, 1);
      const m: Map<string, Date> = new Map<string, Date>([['k', d]]);
      expect(m.has('k')).assertTrue();
      expect(m.get('k')).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_4400
     * @tc.name mapConstructorPart03Test044
     * @tc.desc Verify two distinct Date values stored under different keys are each retrieved by reference via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(2024, 0, 1);
      const d2: Date = new Date(2024, 0, 1);
      const m: Map<string, Date> = new Map<string, Date>([['a', d1], ['b', d2]]);
      expect(m.get('a')).assertEqual(d1);
      expect(m.get('b')).assertEqual(d2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_4500
     * @tc.name mapConstructorPart03Test045
     * @tc.desc Verify new Map<string, boolean>([["t", true]]) stores boolean value true and get("t") returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>([['t', true]]);
      expect(m.get('t')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_4600
     * @tc.name mapConstructorPart03Test046
     * @tc.desc Verify new Map<string, boolean>([["f", false]]) stores boolean value false and get("f") returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>([['f', false]]);
      expect(m.get('f')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_4700
     * @tc.name mapConstructorPart03Test047
     * @tc.desc Verify new Map<string, string | undefined>([["undef_key", undefined]]) stores an undefined value with has("undef_key") true and get("undef_key") returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | undefined> = new Map<string, string | undefined>([['undef_key', undefined]]);
      expect(m.has('undef_key')).assertTrue();
      expect(m.get('undef_key')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_4800
     * @tc.name mapConstructorPart03Test048
     * @tc.desc Verify an object value is retrieved by reference from the map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: ObjVal = { name: 'test' } as ObjVal;
      const m: Map<string, ObjVal> = new Map<string, ObjVal>([['k', v]]);
      expect(m.get('k')).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_4900
     * @tc.name mapConstructorPart03Test049
     * @tc.desc Verify a nested object value is retrieved and its inner property is accessible
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: NestedObj = { inner: { count: 42 } } as NestedObj;
      const m: Map<string, NestedObj> = new Map<string, NestedObj>([['nest', v]]);
      expect(m.get('nest')!.inner.count).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_5000
     * @tc.name mapConstructorPart03Test050
     * @tc.desc Verify new Map<string, RegExp>([["re", r]]) stores a RegExp instance as value and get("re") returns the same instance by reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: RegExp = new RegExp('pattern', 'g');
      const m: Map<string, RegExp> = new Map<string, RegExp>([['re', r]]);
      expect(m.get('re')).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_5100
     * @tc.name mapConstructorPart03Test051
     * @tc.desc Verify a Map<string, int> instance stored as value is retrieved by reference with get("outer") returning the same instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Map<string, int> = new Map<string, int>([['x', 10]]);
      const m: Map<string, Map<string, int>> = new Map<string, Map<string, int>>([['outer', inner]]);
      expect(m.get('outer')).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_5200
     * @tc.name mapConstructorPart03Test052
     * @tc.desc Verify duplicate keys in constructor entries keep the last value and size counts unique keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['a', 3], ['c', 4]]);
      expect(m.size).assertEqual(3);
      expect(m.get('a')).assertEqual(3);
      expect(m.get('b')).assertEqual(2);
      expect(m.get('c')).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_5300
     * @tc.name mapConstructorPart03Test053
     * @tc.desc Verify has() returns true for every constructor-inserted key "x", "y" and "z"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 1], ['y', 2], ['z', 3]]);
      expect(m.has('x')).assertTrue();
      expect(m.has('y')).assertTrue();
      expect(m.has('z')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_5400
     * @tc.name mapConstructorPart03Test054
     * @tc.desc Verify source array entries are copied at construction so later array mutation does not change the map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<[string, int]> = [['a', 1], ['b', 2]];
      const m: Map<string, int> = new Map<string, int>(arr);
      arr[0] = ['a', 999];
      expect(m.get('a')).assertEqual(1);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_5500
     * @tc.name mapConstructorPart03Test055
     * @tc.desc Verify entries() iterator yields key-value pairs in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['c', 3], ['a', 1], ['b', 2]]);
      const iter: Iterator<[string, int]> = m.entries();
      const first: IteratorResult<[string, int]> = iter.next();
      expect(first.value![0]).assertEqual('c');
      const second: IteratorResult<[string, int]> = iter.next();
      expect(second.value![0]).assertEqual('a');
      const third: IteratorResult<[string, int]> = iter.next();
      expect(third.value![0]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_5600
     * @tc.name mapConstructorPart03Test056
     * @tc.desc Verify a Map built from an Array of int-string pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[int, string]> = [[1, 'one'], [2, 'two']];
      const map: Map<int, string> = new Map<int, string>(fa);
      expect(map.get(1)).assertEqual('one');
      expect(map.get(2)).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_5700
     * @tc.name mapConstructorPart03Test057
     * @tc.desc Verify a Map built from an Array of byte-int pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[byte, int]> = [[10 as byte, 1], [20 as byte, 2]];
      const map: Map<byte, int> = new Map<byte, int>(fa);
      expect(map.get(10 as byte)).assertEqual(1);
      expect(map.get(20 as byte)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_5800
     * @tc.name mapConstructorPart03Test058
     * @tc.desc Verify a Map built from an Array of char-int pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[char, int]> = [[c'A', 1], [c'B', 2]];
      const map: Map<char, int> = new Map<char, int>(fa);
      expect(map.get(c'A')).assertEqual(1);
      expect(map.get(c'B')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_5900
     * @tc.name mapConstructorPart03Test059
     * @tc.desc Verify a Map built from an Array of bigint-int pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[bigint, int]> = [[BigInt(100), 1], [BigInt(200), 2]];
      const map: Map<bigint, int> = new Map<bigint, int>(fa);
      expect(map.get(BigInt(100))).assertEqual(1);
      expect(map.get(BigInt(200))).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_6000
     * @tc.name mapConstructorPart03Test060
     * @tc.desc Verify a Map built from an Array of object-int pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: KeyObj = { id: 1 } as KeyObj;
      const o2: KeyObj = { id: 2 } as KeyObj;
      const fa: Array<[KeyObj, int]> = [[o1, 10], [o2, 20]];
      const map: Map<KeyObj, int> = new Map<KeyObj, int>(fa);
      expect(map.get(o1)).assertEqual(10);
      expect(map.get(o2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_6100
     * @tc.name mapConstructorPart03Test061
     * @tc.desc Verify a Map built from an Array containing a null value stores null and get() returns null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, int | null]> = [['a', 1], ['b', null]];
      const map: Map<string, int | null> = new Map<string, int | null>(fa);
      expect(map.get('a')).assertEqual(1);
      expect(map.get('b')).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_6200
     * @tc.name mapConstructorPart03Test062
     * @tc.desc Verify a 10000-character long string key from an Array is stored and retrieved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'k' + 'x'.repeat(9999);
      const fa: Array<[string, int]> = [[longKey, 1], ['b', 2]];
      const map: Map<string, int> = new Map<string, int>(fa);
      expect(map.get(longKey)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_6300
     * @tc.name mapConstructorPart03Test063
     * @tc.desc Verify a Map built from an Array stores the double key Infinity and get() returns the paired value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[double, string]> = [[Number.POSITIVE_INFINITY, 'inf'], [0, 'zero']];
      const map: Map<double, string> = new Map<double, string>(fa);
      expect(map.get(Number.POSITIVE_INFINITY)).assertEqual('inf');
      expect(map.has(Number.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_6400
     * @tc.name mapConstructorPart03Test064
     * @tc.desc Verify a Map built from an Array stores the double key -Infinity and get() returns the paired value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[double, string]> = [[Number.NEGATIVE_INFINITY, 'ninf'], [0, 'zero']];
      const map: Map<double, string> = new Map<double, string>(fa);
      expect(map.get(Number.NEGATIVE_INFINITY)).assertEqual('ninf');
      expect(map.has(Number.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_6500
     * @tc.name mapConstructorPart03Test065
     * @tc.desc Verify a Map built from an Array treats -0.0 and +0.0 as the same key (SameValueZero) and get() returns the paired value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[double, string]> = [[-0.0, 'nzero'], [1.0, 'one']];
      const map: Map<double, string> = new Map<double, string>(fa);
      expect(map.size).assertEqual(2);
      expect(map.get(-0.0)).assertEqual('nzero');
      expect(map.get(0.0)).assertEqual('nzero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_6600
     * @tc.name mapConstructorPart03Test066
     * @tc.desc Verify a Map built from an Array stores the double value NaN and get() returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, double]> = [['a', Number.NaN], ['b', 1.0]];
      const map: Map<string, double> = new Map<string, double>(fa);
      expect(map.get('a')).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_6700
     * @tc.name mapConstructorPart03Test067
     * @tc.desc Verify a Map built from an Array stores the double value Number.EPSILON and get() returns it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, double]> = [['a', Number.EPSILON], ['b', 1.0]];
      const map: Map<string, double> = new Map<string, double>(fa);
      expect(map.get('a')).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_6800
     * @tc.name mapConstructorPart03Test068
     * @tc.desc Verify a three-entry Array creates a map of size 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, int]> = [['a', 1], ['b', 2], ['c', 3]];
      const map: Map<string, int> = new Map<string, int>(fa);
      expect(map.size).assertEqual(3);
      expect(map.get('a')).assertEqual(1);
      expect(map.get('b')).assertEqual(2);
      expect(map.get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_6900
     * @tc.name mapConstructorPart03Test069
     * @tc.desc Verify duplicate int keys in Array entries overwrite the earlier value and size counts unique keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[int, string]> = [[1, 'first'], [1, 'second'], [2, 'other']];
      const map: Map<int, string> = new Map<int, string>(fa);
      expect(map.get(1)).assertEqual('second');
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_7000
     * @tc.name mapConstructorPart03Test070
     * @tc.desc Verify null can be stored as a map key and retrieved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string | null, int]> = [['a', 1], [null, 2]];
      const map: Map<string | null, int> = new Map<string | null, int>(fa);
      expect(map.get(null)).assertEqual(2);
      expect(map.has(null)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_7100
     * @tc.name mapConstructorPart03Test071
     * @tc.desc Verify Map constructor does not modify the input array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, int]> = [['a', 1], ['b', 2]];
      const map: Map<string, int> = new Map<string, int>(fa);
      expect(fa.length).assertEqual(2);
      expect(fa[0][0]).assertEqual('a');
      expect(fa[0][1]).assertEqual(1);
      expect(fa[1][0]).assertEqual('b');
      expect(fa[1][1]).assertEqual(2);
      expect(map.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_7200
     * @tc.name mapConstructorPart03Test072
     * @tc.desc Verify a Map constructed with bucketsCount=32 is a non-null Map instance with initial size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(32);
      expect(map).not().assertNull();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_7300
     * @tc.name mapConstructorPart03Test073
     * @tc.desc Verify a Map constructed with bucketsCount=0 is a non-null Map instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(0);
      expect(map).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_7400
     * @tc.name mapConstructorPart03Test074
     * @tc.desc Verify a Map constructed with bucketsCount=0 has size 3 after setting three keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(0);
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_7500
     * @tc.name mapConstructorPart03Test075
     * @tc.desc Verify a Map constructed with bucketsCount=-1 is a non-null Map instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(-1);
      expect(map).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_7600
     * @tc.name mapConstructorPart03Test076
     * @tc.desc Verify bucketsCount=int.MAX set throws ArrayIndexOutOfBoundsError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(INT_MAX);
      expect((): void => {
        map.set('maxKey', 999);
      }).assertThrowError('ArrayIndexOutOfBoundsError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_7700
     * @tc.name mapConstructorPart03Test077
     * @tc.desc Verify chained set calls on a Map with bucketsCount=0 return the map itself (this) and add two entries (size 2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(0);
      const ret: Map<string, int> = map.set('a', 1).set('b', 2);
      expect(ret).assertEqual(map);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_7800
     * @tc.name mapConstructorPart03Test078
     * @tc.desc Verify Maps created with no argument or with bucketsCount 16 both start with size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1: Map<string, int> = new Map<string, int>();
      const m5: Map<string, int> = new Map<string, int>(16);
      expect(m1.size).assertEqual(0);
      expect(m5.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_7900
     * @tc.name mapConstructorPart03Test079
     * @tc.desc Verify a Map constructed with bucketsCount passed as an int variable (bc=32) has initial size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bc: int = 32;
      const map: Map<string, int> = new Map<string, int>(bc);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_8000
     * @tc.name mapConstructorPart03Test080
     * @tc.desc Verify a Map constructed with bucketsCount passed as a constant expression (16+16) has initial size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(16 + 16);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_8100
     * @tc.name mapConstructorPart03Test081
     * @tc.desc Verify a Map constructed with bucketsCount=0 has initial size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(0);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_8200
     * @tc.name mapConstructorPart03Test082
     * @tc.desc Verify a Map constructed with bucketsCount=0 reports has("nonexistent") as false for an absent key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(0);
      expect(map.has('nonexistent')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_8300
     * @tc.name mapConstructorPart03Test083
     * @tc.desc Verify a Map constructed with bucketsCount=0 keeps size 1 and get("x") returns the latest value 99 after setting the same key twice
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(0);
      map.set('x', 1);
      map.set('x', 99);
      expect(map.get('x')).assertEqual(99);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_8400
     * @tc.name mapConstructorPart03Test084
     * @tc.desc Verify deleting an existing key from a Map constructed with bucketsCount=0 returns true and reduces size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(0);
      map.set('rem', 1);
      let result: boolean = map.delete('rem');
      expect(result).assertTrue();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_8500
     * @tc.name mapConstructorPart03Test085
     * @tc.desc Verify deleting an absent key from a Map constructed with bucketsCount=0 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(0);
      let result: boolean = map.delete('absent');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_8600
     * @tc.name mapConstructorPart03Test086
     * @tc.desc Verify forEach on a Map constructed with bucketsCount=0 visits both inserted entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(0);
      map.set('p', 1);
      map.set('q', 2);
      let count: int = 0;
      map.forEach((value: int, key: string) => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART03_TEST_8700
     * @tc.name mapConstructorPart03Test087
     * @tc.desc Verify clear on a Map constructed with bucketsCount=0 resets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart03Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(0);
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

  });
}