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

const longFlagsNone: long = 0;
const longFlagsAll: long = 9223372036854775807;
const longFlags2None: long = 0;
const longFlags2Read: long = 1;
const longFlags2Write: long = 2;

enum Color { RED, GREEN, BLUE }
enum StrLabel { FIRST = 'first', SECOND = 'second' }
enum IntBoundary { ZERO = 0, ONE = 1, NEG_ONE = -1, LARGE = 2147483647, SMALL = -2147483648 }
enum IntColor { RED, GREEN, BLUE }
enum LongFlags: long { NONE = 0, READ = 1, WRITE = 2, EXECUTE = 4 }
const longBoundaryZero: long = 0;
const longBoundaryOne: long = 1;
const longBoundaryNegOne: long = -1;
const longBoundaryMax: long = 9223372036854775807;
const longBoundaryMin: long = (-9223372036854775807 - 1);
enum StrBoundary { HELLO = 'hello', EMPTY = '', EMOJI = '😀', XSS = '<script>alert(1)</script>' }
enum StrI18n { ZH = '中文', JP = '日本語' }
enum StrMusic { MUSIC_SYMBOL = '𝄞' }

export default function recordIndexSetPart01TestTest(): void {
  describe('RecordIndexSetPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_0100
     * @tc.name recordIndexSetPart01Test001
     * @tc.desc Verify $_set 2 K=string, V=int arity=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('key', 42);
      expect(record.$_get('key')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_0200
     * @tc.name recordIndexSetPart01Test002
     * @tc.desc Verify $_set 2 K=int, V=string arity=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(1, 'value');
      expect(record.$_get(1)).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_0300
     * @tc.name recordIndexSetPart01Test003
     * @tc.desc Verify $_set 2 K=number, V=number key arity=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, number> = new Record<number, number>();
      record.$_set(3.14, 2.71);
      expect(record.$_get(3.14)).assertEqual(2.71);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_0400
     * @tc.name recordIndexSetPart01Test004
     * @tc.desc Verify $_set 2 K=int enum, V=int key arity=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<Color, int> = new Record<Color, int>();
      record.$_set(Color.RED, 100);
      expect(record.$_get(Color.RED)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_0500
     * @tc.name recordIndexSetPart01Test005
     * @tc.desc Verify $_set 2 K=long enum, V=long key arity=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, long> = new Record<long, long>();
      record.$_set(longFlagsNone, Int.toLong(0));
      expect(record.$_get(longFlagsNone)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_0600
     * @tc.name recordIndexSetPart01Test006
     * @tc.desc Verify $_set 2 K=string enum, V=string key arity=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<StrLabel, string> = new Record<StrLabel, string>();
      record.$_set(StrLabel.FIRST, 'alpha');
      expect(record.$_get(StrLabel.FIRST)).assertEqual('alpha');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_0700
     * @tc.name recordIndexSetPart01Test007
     * @tc.desc Verify K=string key "" key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('', 1);
      expect(record.$_get('')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_0800
     * @tc.name recordIndexSetPart01Test008
     * @tc.desc Verify K=string key " " key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set(' ', 2);
      expect(record.$_get(' ')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_0900
     * @tc.name recordIndexSetPart01Test009
     * @tc.desc Verify K=string key Unicode emoji" " key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('😀', 3);
      expect(record.$_get('😀')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_1000
     * @tc.name recordIndexSetPart01Test010
     * @tc.desc Verify K=string key " " key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('​', 4);
      expect(record.$_get('​')).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_1100
     * @tc.name recordIndexSetPart01Test011
     * @tc.desc Verify K=string key XSS "<script>alert(1)</script>" key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('<script>alert(1)</script>', 5);
      expect(record.$_get('<script>alert(1)</script>')).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_1200
     * @tc.name recordIndexSetPart01Test012
     * @tc.desc Verify K=string key "\n" key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('line1\nline2', 6);
      expect(record.$_get('line1\nline2')).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_1300
     * @tc.name recordIndexSetPart01Test013
     * @tc.desc Verify K=string key "\t" tab key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('col1\tcol2', 7);
      expect(record.$_get('col1\tcol2')).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_1400
     * @tc.name recordIndexSetPart01Test014
     * @tc.desc Verify K=string key "123" key int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('123', 8);
      expect(record.$_get('123')).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_1500
     * @tc.name recordIndexSetPart01Test015
     * @tc.desc Verify K=string key " foo " key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set(' foo ', 9);
      expect(record.$_get(' foo ')).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_1600
     * @tc.name recordIndexSetPart01Test016
     * @tc.desc Verify K=string key " " CJK key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('中文', 10);
      expect(record.$_get('中文')).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_1700
     * @tc.name recordIndexSetPart01Test017
     * @tc.desc Verify K=string key "a\\b" key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a\\b', 11);
      expect(record.$_get('a\\b')).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_1800
     * @tc.name recordIndexSetPart01Test018
     * @tc.desc Verify K=string key "a\"b" key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a\'b', 12);
      expect(record.$_get('a\'b')).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_1900
     * @tc.name recordIndexSetPart01Test019
     * @tc.desc Verify K=string key null "\0" null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a\0b', 13);
      expect(record.$_get('a\0b')).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_2000
     * @tc.name recordIndexSetPart01Test020
     * @tc.desc Verify K=string key 10000 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      const longKey: string = 'a'.repeat(10000);
      record.$_set(longKey, 999);
      expect(record.$_get(longKey)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_2100
     * @tc.name recordIndexSetPart01Test021
     * @tc.desc Verify K=string key BMP U+1D11E " " key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('𝄞', 14);
      expect(record.$_get('𝄞')).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_2200
     * @tc.name recordIndexSetPart01Test022
     * @tc.desc Verify K=int key=0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(0, 'zero');
      expect(record.$_get(0)).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_2300
     * @tc.name recordIndexSetPart01Test023
     * @tc.desc Verify K=int key=1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(1, 'one');
      expect(record.$_get(1)).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_2400
     * @tc.name recordIndexSetPart01Test024
     * @tc.desc Verify K=int key=-1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(-1, 'neg_one');
      expect(record.$_get(-1)).assertEqual('neg_one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_2500
     * @tc.name recordIndexSetPart01Test025
     * @tc.desc Verify K=int key=2147483647 2147483647 int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(2147483647, 'max');
      expect(record.$_get(2147483647)).assertEqual('max');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_2600
     * @tc.name recordIndexSetPart01Test026
     * @tc.desc Verify K=int key=(-2147483647 - 1) -2147483648 int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(-2147483648, 'min');
      expect(record.$_get(-2147483648)).assertEqual('min');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_2700
     * @tc.name recordIndexSetPart01Test027
     * @tc.desc Verify K=int key=42 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(42, 'answer');
      expect(record.$_get(42)).assertEqual('answer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_2800
     * @tc.name recordIndexSetPart01Test028
     * @tc.desc Verify K=int key=-100 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(-100, 'neg_hundred');
      expect(record.$_get(-100)).assertEqual('neg_hundred');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_2900
     * @tc.name recordIndexSetPart01Test029
     * @tc.desc Verify K=int key=2147483646 2147483647-1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(2147483646, 'near_max');
      expect(record.$_get(2147483646)).assertEqual('near_max');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_3000
     * @tc.name recordIndexSetPart01Test030
     * @tc.desc Verify K=int key=-2147483647 (-2147483647 - 1)+1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(-2147483647, 'near_min');
      expect(record.$_get(-2147483647)).assertEqual('near_min');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_3100
     * @tc.name recordIndexSetPart01Test031
     * @tc.desc Verify K=int key 2 65536 2 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(65536, 'power_of_two');
      expect(record.$_get(65536)).assertEqual('power_of_two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_3200
     * @tc.name recordIndexSetPart01Test032
     * @tc.desc Verify K=int key 999983 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(999983, 'prime');
      expect(record.$_get(999983)).assertEqual('prime');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_3300
     * @tc.name recordIndexSetPart01Test033
     * @tc.desc Verify K=number key=0.0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, int> = new Record<number, int>();
      record.$_set(0.0, 1);
      expect(record.$_get(0.0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_3400
     * @tc.name recordIndexSetPart01Test034
     * @tc.desc Verify K=number key=-0.0 key SameValueZero -0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, int> = new Record<number, int>();
      record.$_set(-0.0, 2);
      const viaPositive: int | undefined = record.$_get(0.0);
      expect(viaPositive).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_3500
     * @tc.name recordIndexSetPart01Test035
     * @tc.desc Verify K=number key=1.5 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, int> = new Record<number, int>();
      record.$_set(1.5, 3);
      expect(record.$_get(1.5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_3600
     * @tc.name recordIndexSetPart01Test036
     * @tc.desc Verify K=number key=NaN NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, int> = new Record<number, int>();
      record.$_set(Number.NaN, 4);
      const nanResult: int | undefined = record.$_get(Number.NaN);
      expect(nanResult).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_3700
     * @tc.name recordIndexSetPart01Test037
     * @tc.desc Verify K=number key=Number.POSITIVE_INFINITY key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, int> = new Record<number, int>();
      record.$_set(Number.POSITIVE_INFINITY, 5);
      expect(record.$_get(Number.POSITIVE_INFINITY)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_3800
     * @tc.name recordIndexSetPart01Test038
     * @tc.desc Verify K=number key=Number.NEGATIVE_INFINITY key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, int> = new Record<number, int>();
      record.$_set(Number.NEGATIVE_INFINITY, 6);
      expect(record.$_get(Number.NEGATIVE_INFINITY)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_3900
     * @tc.name recordIndexSetPart01Test039
     * @tc.desc Verify K=number key=Number.EPSILON key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, int> = new Record<number, int>();
      record.$_set(Number.EPSILON, 7);
      expect(record.$_get(Number.EPSILON)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_4000
     * @tc.name recordIndexSetPart01Test040
     * @tc.desc Verify K=number key=0.1 key 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, int> = new Record<number, int>();
      record.$_set(0.1, 8);
      expect(record.$_get(0.1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_4100
     * @tc.name recordIndexSetPart01Test041
     * @tc.desc Verify K=number key=-3.14 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, int> = new Record<number, int>();
      record.$_set(-3.14, 9);
      expect(record.$_get(-3.14)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_4200
     * @tc.name recordIndexSetPart01Test042
     * @tc.desc Verify K=number key=Number.MAX_VALUE key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, int> = new Record<number, int>();
      record.$_set(Number.MAX_VALUE, 10);
      expect(record.$_get(Number.MAX_VALUE)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_4300
     * @tc.name recordIndexSetPart01Test043
     * @tc.desc Verify K=number key=Number.MIN_VALUE key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, int> = new Record<number, int>();
      record.$_set(Number.MIN_VALUE, 11);
      expect(record.$_get(Number.MIN_VALUE)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_4400
     * @tc.name recordIndexSetPart01Test044
     * @tc.desc Verify K=number key=1e10 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, int> = new Record<number, int>();
      record.$_set(1e10, 12);
      expect(record.$_get(1e10)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_4500
     * @tc.name recordIndexSetPart01Test045
     * @tc.desc Verify K int key= ZERO 0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<IntBoundary, string> = new Record<IntBoundary, string>();
      record.$_set(IntBoundary.ZERO, 'zero_val');
      expect(record.$_get(IntBoundary.ZERO)).assertEqual('zero_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_4600
     * @tc.name recordIndexSetPart01Test046
     * @tc.desc Verify K int key= ONE 1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<IntBoundary, string> = new Record<IntBoundary, string>();
      record.$_set(IntBoundary.ONE, 'one_val');
      expect(record.$_get(IntBoundary.ONE)).assertEqual('one_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_4700
     * @tc.name recordIndexSetPart01Test047
     * @tc.desc Verify K int key= NEG_ONE -1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<IntBoundary, string> = new Record<IntBoundary, string>();
      record.$_set(IntBoundary.NEG_ONE, 'neg_one_val');
      expect(record.$_get(IntBoundary.NEG_ONE)).assertEqual('neg_one_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_4800
     * @tc.name recordIndexSetPart01Test048
     * @tc.desc Verify K int key= LARGE 2147483647 int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<IntBoundary, string> = new Record<IntBoundary, string>();
      record.$_set(IntBoundary.LARGE, 'large_val');
      expect(record.$_get(IntBoundary.LARGE)).assertEqual('large_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_4900
     * @tc.name recordIndexSetPart01Test049
     * @tc.desc Verify K int key= SMALL (-2147483647 - 1) int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<IntBoundary, string> = new Record<IntBoundary, string>();
      record.$_set(IntBoundary.SMALL, 'small_val');
      expect(record.$_get(IntBoundary.SMALL)).assertEqual('small_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_5000
     * @tc.name recordIndexSetPart01Test050
     * @tc.desc Verify K int 0 key=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<IntColor, int> = new Record<IntColor, int>();
      record.$_set(IntColor.RED, 10);
      expect(record.$_get(IntColor.RED)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_5100
     * @tc.name recordIndexSetPart01Test051
     * @tc.desc Verify K int 0 key=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<IntColor, int> = new Record<IntColor, int>();
      record.$_set(IntColor.GREEN, 20);
      expect(record.$_get(IntColor.GREEN)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_5200
     * @tc.name recordIndexSetPart01Test052
     * @tc.desc Verify K int 0 key=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<IntColor, int> = new Record<IntColor, int>();
      record.$_set(IntColor.BLUE, 30);
      expect(record.$_get(IntColor.BLUE)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_5300
     * @tc.name recordIndexSetPart01Test053
     * @tc.desc Verify K long key= ZERO 0n key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, string> = new Record<long, string>();
      record.$_set(longBoundaryZero, 'long_zero');
      expect(record.$_get(longBoundaryZero)).assertEqual('long_zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_5400
     * @tc.name recordIndexSetPart01Test054
     * @tc.desc Verify K long key= ONE 1n key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, string> = new Record<long, string>();
      record.$_set(longBoundaryOne, 'long_one');
      expect(record.$_get(longBoundaryOne)).assertEqual('long_one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_5500
     * @tc.name recordIndexSetPart01Test055
     * @tc.desc Verify K long key= NEG_ONE -1n key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, string> = new Record<long, string>();
      record.$_set(longBoundaryNegOne, 'long_neg_one');
      expect(record.$_get(longBoundaryNegOne)).assertEqual('long_neg_one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_5600
     * @tc.name recordIndexSetPart01Test056
     * @tc.desc Verify K long key= MAX long.MAX long key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, string> = new Record<long, string>();
      record.$_set(longBoundaryMax, 'long_max');
      expect(record.$_get(longBoundaryMax)).assertEqual('long_max');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_5700
     * @tc.name recordIndexSetPart01Test057
     * @tc.desc Verify K long key= MIN long.MIN long key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, string> = new Record<long, string>();
      record.$_set(longBoundaryMin, 'long_min');
      expect(record.$_get(longBoundaryMin)).assertEqual('long_min');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_5800
     * @tc.name recordIndexSetPart01Test058
     * @tc.desc Verify K long key= 0n NONE long int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, int> = new Record<long, int>();
      record.$_set(longFlags2None, 0);
      expect(record.$_get(longFlags2None)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_5900
     * @tc.name recordIndexSetPart01Test059
     * @tc.desc Verify K string key= HELLO "hello" key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<StrBoundary, int> = new Record<StrBoundary, int>();
      record.$_set(StrBoundary.HELLO, 1);
      expect(record.$_get(StrBoundary.HELLO)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_6000
     * @tc.name recordIndexSetPart01Test060
     * @tc.desc Verify K string key= EMPTY "" key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<StrBoundary, int> = new Record<StrBoundary, int>();
      record.$_set(StrBoundary.EMPTY, 2);
      expect(record.$_get(StrBoundary.EMPTY)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_6100
     * @tc.name recordIndexSetPart01Test061
     * @tc.desc Verify K string key= EMOJI " " emoji key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<StrBoundary, int> = new Record<StrBoundary, int>();
      record.$_set(StrBoundary.EMOJI, 3);
      expect(record.$_get(StrBoundary.EMOJI)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_6200
     * @tc.name recordIndexSetPart01Test062
     * @tc.desc Verify K string key= XSS "<script>alert(1)</script>" key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<StrBoundary, int> = new Record<StrBoundary, int>();
      record.$_set(StrBoundary.XSS, 4);
      expect(record.$_get(StrBoundary.XSS)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_6300
     * @tc.name recordIndexSetPart01Test063
     * @tc.desc Verify K string key= Unicode CJK key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<StrI18n, int> = new Record<StrI18n, int>();
      record.$_set(StrI18n.ZH, 5);
      expect(record.$_get(StrI18n.ZH)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_6400
     * @tc.name recordIndexSetPart01Test064
     * @tc.desc Verify K string key= BMP key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<StrMusic, int> = new Record<StrMusic, int>();
      record.$_set(StrMusic.MUSIC_SYMBOL, 6);
      expect(record.$_get(StrMusic.MUSIC_SYMBOL)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_6500
     * @tc.name recordIndexSetPart01Test065
     * @tc.desc Verify $_set -0.0 key $_get(0.0) SameValueZero -0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(-0.0, 'negative_zero');
      expect(record.$_get(0.0)).assertEqual('negative_zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_6600
     * @tc.name recordIndexSetPart01Test066
     * @tc.desc Verify $_set 2147483647 key $_set key value key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(2147483647, 'first');
      record.$_set(2147483647, 'second');
      expect(record.$_get(2147483647)).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_6700
     * @tc.name recordIndexSetPart01Test067
     * @tc.desc Verify $_set (-2147483647 - 1) key $_set key value key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(-2147483648, 'first');
      record.$_set(-2147483648, 'second');
      expect(record.$_get(-2147483648)).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_6800
     * @tc.name recordIndexSetPart01Test068
     * @tc.desc Verify $_set Number.POSITIVE_INFINITY key $_set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(Number.POSITIVE_INFINITY, 'before');
      record.$_set(Number.POSITIVE_INFINITY, 'after');
      expect(record.$_get(Number.POSITIVE_INFINITY)).assertEqual('after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_6900
     * @tc.name recordIndexSetPart01Test069
     * @tc.desc Verify $_set long.MAX key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, int> = new Record<long, int>();
      record.$_set(longBoundaryMax, 777);
      expect(record.$_get(longBoundaryMax)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_7000
     * @tc.name recordIndexSetPart01Test070
     * @tc.desc Verify $_set key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      expect(record.$_get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_7100
     * @tc.name recordIndexSetPart01Test071
     * @tc.desc Verify $_set key size 0 1 key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      expect(record.size).assertEqual(0);
      record.$_set('newKey', 42);
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_7200
     * @tc.name recordIndexSetPart01Test072
     * @tc.desc Verify $_set key size size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('dupKey', 10);
      const sizeBefore: int = record.size;
      record.$_set('dupKey', 20);
      expect(record.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_7300
     * @tc.name recordIndexSetPart01Test073
     * @tc.desc Verify $_set Record has true key has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('hasKey', 55);
      expect(record.has('hasKey')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_7400
     * @tc.name recordIndexSetPart01Test074
     * @tc.desc Verify $_set key forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('first', 1);
      record.$_set('second', 2);
      record.$_set('third', 3);
      const keys: string[] = [];
      record.forEach((value: int, key: string) => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('first');
      expect(keys[1]).assertEqual('second');
      expect(keys[2]).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_7500
     * @tc.name recordIndexSetPart01Test075
     * @tc.desc Verify Record LongFlags enum key $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<LongFlags, string> = new Record<LongFlags, string>();
      record.$_set(LongFlags.READ, 'readable');
      record.$_set(LongFlags.WRITE, 'writable');
      expect(record.$_get(LongFlags.READ)).assertEqual('readable');
      expect(record.$_get(LongFlags.WRITE)).assertEqual('writable');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_7600
     * @tc.name recordIndexSetPart01Test076
     * @tc.desc Verify Record LongFlags enum key update $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<LongFlags, int> = new Record<LongFlags, int>();
      record.$_set(LongFlags.NONE, 0);
      record.$_set(LongFlags.NONE, 99);
      expect(record.$_get(LongFlags.NONE)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART01_7700
     * @tc.name recordIndexSetPart01Test077
     * @tc.desc Verify Record LongFlags enum key $_set has forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<LongFlags, boolean> = new Record<LongFlags, boolean>();
      record.$_set(LongFlags.READ, true);
      record.$_set(LongFlags.EXECUTE, false);
      expect(record.has(LongFlags.READ)).assertTrue();
      expect(record.has(LongFlags.WRITE)).assertFalse();
      expect(record.$_get(LongFlags.EXECUTE)).assertFalse();
    });

  });
}
