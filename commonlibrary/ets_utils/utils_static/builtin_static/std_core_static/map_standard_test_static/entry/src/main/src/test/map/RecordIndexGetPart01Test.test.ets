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

enum Direction { UP = 'UP', DOWN = 'DOWN', LEFT = 'LEFT', RIGHT = 'RIGHT' }
enum Direction2 { UP = 'UP', DOWN = 'DOWN' }

enum Color { RED, GREEN, BLUE }
enum Status { OK = 200, NOT_FOUND = 404, ERROR = 500 }
enum Delta { NEG = -5, ZERO = 0, POS = 5 }
enum LargeVal { BIG = 2147483646 }
const bigRangeSmall: long = 1;
const bigRangeLarge: long = 9223372036854775806;
const signedLongNeg: long = -100;
const signedLongPos: long = 100;
const longZeroZero: long = 0;
const longZeroOne: long = 1;
enum SpecialKey { TAB = '\t', NEWLINE = '\n', EMPTY = '' }
enum EmojiKey { SMILE = '😀', HEART = '❤️' }

export default function recordIndexGetPart01TestTest(): void {
  describe('RecordIndexGetPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_0100
     * @tc.name recordIndexGetPart01Test001
     * @tc.desc Verify 1 key string key V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('alpha', 100);
      let r: int | undefined = record.$_get('alpha');
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_0200
     * @tc.name recordIndexGetPart01Test002
     * @tc.desc Verify 1 key string key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      let r: int | undefined = record.$_get('beta');
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_0300
     * @tc.name recordIndexGetPart01Test003
     * @tc.desc Verify "" key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('', 42);
      let r: int | undefined = record.$_get('');
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_0400
     * @tc.name recordIndexGetPart01Test004
     * @tc.desc Verify "" key $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      let r: int | undefined = record.$_get('');
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_0500
     * @tc.name recordIndexGetPart01Test005
     * @tc.desc Verify "a" key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 99);
      let r: int | undefined = record.$_get('a');
      expect(r).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_0600
     * @tc.name recordIndexGetPart01Test006
     * @tc.desc Verify Unicode emoji " " key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set('😀', 'emoji_value');
      let r: string | undefined = record.$_get('😀');
      expect(r).assertEqual('emoji_value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_0700
     * @tc.name recordIndexGetPart01Test007
     * @tc.desc Verify Unicode emoji " " key $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      let r: int | undefined = record.$_get('😀');
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_0800
     * @tc.name recordIndexGetPart01Test008
     * @tc.desc Verify " " key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('​', 7);
      let r: int | undefined = record.$_get('​');
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_0900
     * @tc.name recordIndexGetPart01Test009
     * @tc.desc Verify XSS "<script>alert(1)</script>" key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('<script>alert(1)</script>', 999);
      let r: int | undefined = record.$_get('<script>alert(1)</script>');
      expect(r).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_1000
     * @tc.name recordIndexGetPart01Test010
     * @tc.desc Verify 10000 key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'k';
      for (let i = 0; i < 9999; i++) {
        longKey = longKey + 'x';
      }
      const record: Record<string, int> = new Record<string, int>();
      record.$_set(longKey, 1);
      let r: int | undefined = record.$_get(longKey);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_1100
     * @tc.name recordIndexGetPart01Test011
     * @tc.desc Verify 10000 key $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'k';
      for (let i = 0; i < 9999; i++) {
        longKey = longKey + 'x';
      }
      const record: Record<string, int> = new Record<string, int>();
      let r: int | undefined = record.$_get(longKey);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_1200
     * @tc.name recordIndexGetPart01Test012
     * @tc.desc Verify "\n" key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('line1\nline2', 50);
      let r: int | undefined = record.$_get('line1\nline2');
      expect(r).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_1300
     * @tc.name recordIndexGetPart01Test013
     * @tc.desc Verify "\t" key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('col1\tcol2', 30);
      let r: int | undefined = record.$_get('col1\tcol2');
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_1400
     * @tc.name recordIndexGetPart01Test014
     * @tc.desc Verify "\0" key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('before\0after', 88);
      let r: int | undefined = record.$_get('before\0after');
      expect(r).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_1500
     * @tc.name recordIndexGetPart01Test015
     * @tc.desc Verify key Map "ABC" $_get("abc") undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('ABC', 200);
      let r: int | undefined = record.$_get('abc');
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_1600
     * @tc.name recordIndexGetPart01Test016
     * @tc.desc Verify key Map "key" $_get(" key") undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('key', 300);
      let r: int | undefined = record.$_get(' key');
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_1700
     * @tc.name recordIndexGetPart01Test017
     * @tc.desc Verify key Map "key" $_get("key ") undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('key', 400);
      let r: int | undefined = record.$_get('key ');
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_1800
     * @tc.name recordIndexGetPart01Test018
     * @tc.desc Verify Unicode key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('😀', 55);
      let r: int | undefined = record.$_get('😀');
      expect(r).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_1900
     * @tc.name recordIndexGetPart01Test019
     * @tc.desc Verify "123" key $_get V int 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('123', 77);
      let r: int | undefined = record.$_get('123');
      expect(r).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_2000
     * @tc.name recordIndexGetPart01Test020
     * @tc.desc Verify Unicode + emoji key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('hello你好😀world', 66);
      let r: int | undefined = record.$_get('hello你好😀world');
      expect(r).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_2100
     * @tc.name recordIndexGetPart01Test021
     * @tc.desc Verify set key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('dup', 1);
      record.$_set('dup', 2);
      let r: int | undefined = record.$_get('dup');
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_2200
     * @tc.name recordIndexGetPart01Test022
     * @tc.desc Verify ".+*?^$()|\\" key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('.+*?^$()[]{}|\\', 44);
      let r: int | undefined = record.$_get('.+*?^$()[]{}|\\');
      expect(r).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_2300
     * @tc.name recordIndexGetPart01Test023
     * @tc.desc Verify "undefined" key $_get V undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('undefined', 999);
      let r: int | undefined = record.$_get('undefined');
      expect(r).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_2400
     * @tc.name recordIndexGetPart01Test024
     * @tc.desc Verify "null" key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('null', 500);
      let r: int | undefined = record.$_get('null');
      expect(r).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_2500
     * @tc.name recordIndexGetPart01Test025
     * @tc.desc Verify key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('ＡＢＣ', 33);
      let r: int | undefined = record.$_get('ＡＢＣ');
      expect(r).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_2600
     * @tc.name recordIndexGetPart01Test026
     * @tc.desc Verify key $_get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('ＡＢＣ', 33);
      let r: int | undefined = record.$_get('ABC');
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_2700
     * @tc.name recordIndexGetPart01Test027
     * @tc.desc Verify int key = 0 $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(0, 'zero_val');
      let r: string | undefined = record.$_get(0);
      expect(r).assertEqual('zero_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_2800
     * @tc.name recordIndexGetPart01Test028
     * @tc.desc Verify int key = 0 $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      let r: string | undefined = record.$_get(0);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_2900
     * @tc.name recordIndexGetPart01Test029
     * @tc.desc Verify int key = 1 $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(1, 'one_val');
      let r: string | undefined = record.$_get(1);
      expect(r).assertEqual('one_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_3000
     * @tc.name recordIndexGetPart01Test030
     * @tc.desc Verify int key = -1 $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(-1, 'neg_one_val');
      let r: string | undefined = record.$_get(-1);
      expect(r).assertEqual('neg_one_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_3100
     * @tc.name recordIndexGetPart01Test031
     * @tc.desc Verify int key = -1 $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      let r: string | undefined = record.$_get(-1);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_3200
     * @tc.name recordIndexGetPart01Test032
     * @tc.desc Verify int key = int.MAX_VALUE (2147483647) $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(2147483647, 999);
      let r: int | undefined = record.$_get(2147483647);
      expect(r).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_3300
     * @tc.name recordIndexGetPart01Test033
     * @tc.desc Verify int key = int.MAX_VALUE (2147483647) $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      let r: int | undefined = record.$_get(2147483647);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_3400
     * @tc.name recordIndexGetPart01Test034
     * @tc.desc Verify int key = int.MIN_VALUE (-2147483648) $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(-2147483648, 888);
      let r: int | undefined = record.$_get(-2147483648);
      expect(r).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_3500
     * @tc.name recordIndexGetPart01Test035
     * @tc.desc Verify int key = int.MIN_VALUE (-2147483648) $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      let r: int | undefined = record.$_get(-2147483648);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_3600
     * @tc.name recordIndexGetPart01Test036
     * @tc.desc Verify int key 65536 $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(65536, 'large_pos');
      let r: string | undefined = record.$_get(65536);
      expect(r).assertEqual('large_pos');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_3700
     * @tc.name recordIndexGetPart01Test037
     * @tc.desc Verify int key -65536 $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(-65536, 'large_neg');
      let r: string | undefined = record.$_get(-65536);
      expect(r).assertEqual('large_neg');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_3800
     * @tc.name recordIndexGetPart01Test038
     * @tc.desc Verify int key 9999 $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      let r: string | undefined = record.$_get(9999);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_3900
     * @tc.name recordIndexGetPart01Test039
     * @tc.desc Verify number key = 0.0 $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(0.0, 'zero_float');
      let r: string | undefined = record.$_get(0.0);
      expect(r).assertEqual('zero_float');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_4000
     * @tc.name recordIndexGetPart01Test040
     * @tc.desc Verify number key = -0.0 $_get V -0.0 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(-0.0, 'neg_zero');
      let r: string | undefined = record.$_get(-0.0);
      expect(r).assertEqual('neg_zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_4100
     * @tc.name recordIndexGetPart01Test041
     * @tc.desc Verify number key = 0.0 -0.0 0.0 -0.0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(0.0, 'zero_float');
      let r: string | undefined = record.$_get(-0.0);
      expect(r).assertEqual('zero_float');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_4200
     * @tc.name recordIndexGetPart01Test042
     * @tc.desc Verify number key = NaN $_get undefined NaN !== NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      let r: string | undefined = record.$_get(Number.NaN);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_4300
     * @tc.name recordIndexGetPart01Test043
     * @tc.desc Verify number key = NaN key set $_get(NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(Number.NaN, 'nan_val');
      let r: string | undefined = record.$_get(Number.NaN);
      expect(r).assertEqual('nan_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_4400
     * @tc.name recordIndexGetPart01Test044
     * @tc.desc Verify number key = Number.POSITIVE_INFINITY $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(Number.POSITIVE_INFINITY, 'pos_inf');
      let r: string | undefined = record.$_get(Number.POSITIVE_INFINITY);
      expect(r).assertEqual('pos_inf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_4500
     * @tc.name recordIndexGetPart01Test045
     * @tc.desc Verify number key = Number.NEGATIVE_INFINITY $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(Number.NEGATIVE_INFINITY, 'neg_inf');
      let r: string | undefined = record.$_get(Number.NEGATIVE_INFINITY);
      expect(r).assertEqual('neg_inf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_4600
     * @tc.name recordIndexGetPart01Test046
     * @tc.desc Verify number key = Number.EPSILON $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(Number.EPSILON, 'epsilon');
      let r: string | undefined = record.$_get(Number.EPSILON);
      expect(r).assertEqual('epsilon');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_4700
     * @tc.name recordIndexGetPart01Test047
     * @tc.desc Verify number key = 0.1 + 0.2 0.30000000000000004 $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      let floatKey: number = 0.1 + 0.2;
      record.$_set(floatKey, 'precision');
      let r: string | undefined = record.$_get(floatKey);
      expect(r).assertEqual('precision');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_4800
     * @tc.name recordIndexGetPart01Test048
     * @tc.desc Verify number key = 0.1 + 0.2 set 0.3 undefined IEEE 754
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      let floatKey: number = 0.1 + 0.2;
      record.$_set(floatKey, 'precision');
      let r: string | undefined = record.$_get(0.3);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_4900
     * @tc.name recordIndexGetPart01Test049
     * @tc.desc Verify number key = 1.5 $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(1.5, 'one_point_five');
      let r: string | undefined = record.$_get(1.5);
      expect(r).assertEqual('one_point_five');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_5000
     * @tc.name recordIndexGetPart01Test050
     * @tc.desc Verify number key = 1.0 $_get int 1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(1.0, 'float_one');
      let r: string | undefined = record.$_get(1.0);
      expect(r).assertEqual('float_one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_5100
     * @tc.name recordIndexGetPart01Test051
     * @tc.desc Verify number key = Number.MAX_VALUE $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(Number.MAX_VALUE, 'max_val');
      let r: string | undefined = record.$_get(Number.MAX_VALUE);
      expect(r).assertEqual('max_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_5200
     * @tc.name recordIndexGetPart01Test052
     * @tc.desc Verify number key = Number.MIN_VALUE $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      record.$_set(Number.MIN_VALUE, 'min_val');
      let r: string | undefined = record.$_get(Number.MIN_VALUE);
      expect(r).assertEqual('min_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_5300
     * @tc.name recordIndexGetPart01Test053
     * @tc.desc Verify number key 3.14 $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      let r: string | undefined = record.$_get(3.14);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_5400
     * @tc.name recordIndexGetPart01Test054
     * @tc.desc Verify number key = Number.NEGATIVE_INFINITY $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<number, string> = new Record<number, string>();
      let r: string | undefined = record.$_get(Number.NEGATIVE_INFINITY);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_5500
     * @tc.name recordIndexGetPart01Test055
     * @tc.desc Verify int key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<Color, string> = new Record<Color, string>();
      record.$_set(Color.RED, 'red_val');
      let r: string | undefined = record.$_get(Color.RED);
      expect(r).assertEqual('red_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_5600
     * @tc.name recordIndexGetPart01Test056
     * @tc.desc Verify int key $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<Color, string> = new Record<Color, string>();
      record.$_set(Color.RED, 'red_val');
      let r: string | undefined = record.$_get(Color.GREEN);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_5700
     * @tc.name recordIndexGetPart01Test057
     * @tc.desc Verify int key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<Color, string> = new Record<Color, string>();
      record.$_set(Color.BLUE, 'blue_val');
      let r: string | undefined = record.$_get(Color.BLUE);
      expect(r).assertEqual('blue_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_5800
     * @tc.name recordIndexGetPart01Test058
     * @tc.desc Verify int key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<Status, int> = new Record<Status, int>();
      record.$_set(Status.NOT_FOUND, 404);
      let r: int | undefined = record.$_get(Status.NOT_FOUND);
      expect(r).assertEqual(404);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_5900
     * @tc.name recordIndexGetPart01Test059
     * @tc.desc Verify int key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<Delta, string> = new Record<Delta, string>();
      record.$_set(Delta.NEG, 'negative');
      let r: string | undefined = record.$_get(Delta.NEG);
      expect(r).assertEqual('negative');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_6000
     * @tc.name recordIndexGetPart01Test060
     * @tc.desc Verify int key $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<Delta, string> = new Record<Delta, string>();
      record.$_set(Delta.NEG, 'negative');
      let r: string | undefined = record.$_get(Delta.POS);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_6100
     * @tc.name recordIndexGetPart01Test061
     * @tc.desc Verify int $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<Color, int> = new Record<Color, int>();
      record.$_set(Color.RED, 1);
      record.$_set(Color.RED, 100);
      let r: int | undefined = record.$_get(Color.RED);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_6200
     * @tc.name recordIndexGetPart01Test062
     * @tc.desc Verify int 2147483647 key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<LargeVal, string> = new Record<LargeVal, string>();
      record.$_set(LargeVal.BIG, 'near_max');
      let r: string | undefined = record.$_get(LargeVal.BIG);
      expect(r).assertEqual('near_max');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_6300
     * @tc.name recordIndexGetPart01Test063
     * @tc.desc Verify long key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, string> = new Record<long, string>();
      record.$_set(bigRangeSmall, 'small_long');
      let r: string | undefined = record.$_get(bigRangeSmall);
      expect(r).assertEqual('small_long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_6400
     * @tc.name recordIndexGetPart01Test064
     * @tc.desc Verify long key $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, string> = new Record<long, string>();
      record.$_set(bigRangeSmall, 'small_long');
      let r: string | undefined = record.$_get(bigRangeLarge);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_6500
     * @tc.name recordIndexGetPart01Test065
     * @tc.desc Verify long long.MAX key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, int> = new Record<long, int>();
      record.$_set(bigRangeLarge, 777);
      let r: int | undefined = record.$_get(bigRangeLarge);
      expect(r).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_6600
     * @tc.name recordIndexGetPart01Test066
     * @tc.desc Verify long key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, string> = new Record<long, string>();
      record.$_set(signedLongNeg, 'neg_long');
      let r: string | undefined = record.$_get(signedLongNeg);
      expect(r).assertEqual('neg_long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_6700
     * @tc.name recordIndexGetPart01Test067
     * @tc.desc Verify long key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, string> = new Record<long, string>();
      record.$_set(longZeroZero, 'long_zero');
      let r: string | undefined = record.$_get(longZeroZero);
      expect(r).assertEqual('long_zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_6800
     * @tc.name recordIndexGetPart01Test068
     * @tc.desc Verify string key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<Direction, int> = new Record<Direction, int>();
      record.$_set(Direction.UP, 1);
      let r: int | undefined = record.$_get(Direction.UP);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_6900
     * @tc.name recordIndexGetPart01Test069
     * @tc.desc Verify string key $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<Direction, int> = new Record<Direction, int>();
      record.$_set(Direction.UP, 1);
      let r: int | undefined = record.$_get(Direction.DOWN);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_7000
     * @tc.name recordIndexGetPart01Test070
     * @tc.desc Verify string key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<SpecialKey, int> = new Record<SpecialKey, int>();
      record.$_set(SpecialKey.TAB, 9);
      let r: int | undefined = record.$_get(SpecialKey.TAB);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_7100
     * @tc.name recordIndexGetPart01Test071
     * @tc.desc Verify string key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<SpecialKey, int> = new Record<SpecialKey, int>();
      record.$_set(SpecialKey.EMPTY, 0);
      let r: int | undefined = record.$_get(SpecialKey.EMPTY);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_7200
     * @tc.name recordIndexGetPart01Test072
     * @tc.desc Verify string $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<Direction2, string> = new Record<Direction2, string>();
      record.$_set(Direction2.UP, 'first');
      record.$_set(Direction2.UP, 'second');
      let r: string | undefined = record.$_get(Direction2.UP);
      expect(r).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_7300
     * @tc.name recordIndexGetPart01Test073
     * @tc.desc Verify string Unicode emoji key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<EmojiKey, int> = new Record<EmojiKey, int>();
      record.$_set(EmojiKey.SMILE, 100);
      let r: int | undefined = record.$_get(EmojiKey.SMILE);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_7400
     * @tc.name recordIndexGetPart01Test074
     * @tc.desc Verify V = int key $_get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('k', 42);
      let r: int | undefined = record.$_get('k');
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_7500
     * @tc.name recordIndexGetPart01Test075
     * @tc.desc Verify V = string key $_get string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set('k', 'hello');
      let r: string | undefined = record.$_get('k');
      expect(r).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_7600
     * @tc.name recordIndexGetPart01Test076
     * @tc.desc Verify V = Date key $_get Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(1700000000000);
      const record: Record<string, Date> = new Record<string, Date>();
      record.$_set('k', d);
      let r: Date | undefined = record.$_get('k');
      expect(r! .getTime()).assertEqual(1700000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_7700
     * @tc.name recordIndexGetPart01Test077
     * @tc.desc Verify V = null null key $_get null key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string | null> = new Record<string, string | null>();
      record.$_set('k', null);
      let r: string | null | undefined = record.$_get('k');
      expect(r).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_7800
     * @tc.name recordIndexGetPart01Test078
     * @tc.desc Verify V = undefined undefined key $_get undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string | undefined> = new Record<string, string | undefined>();
      record.$_set('k', undefined);
      let r: string | undefined = record.$_get('k');
      expect(record.has('k')).assertTrue();
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_7900
     * @tc.name recordIndexGetPart01Test079
     * @tc.desc Verify V = boolean key $_get boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, boolean> = new Record<int, boolean>();
      record.$_set(1, true);
      let r: boolean | undefined = record.$_get(1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_8000
     * @tc.name recordIndexGetPart01Test080
     * @tc.desc Verify V = boolean false key $_get boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, boolean> = new Record<int, boolean>();
      record.$_set(1, false);
      let r: boolean | undefined = record.$_get(1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_8100
     * @tc.name recordIndexGetPart01Test081
     * @tc.desc Verify V = number key $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, number> = new Record<string, number>();
      record.$_set('pi', 3.1415926535);
      let r: number | undefined = record.$_get('pi');
      expect(r).assertEqual(3.1415926535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_8200
     * @tc.name recordIndexGetPart01Test082
     * @tc.desc Verify V = long key $_get long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, long> = new Record<string, long>();
      record.$_set('big', 9007199254740991);
      let r: long | undefined = record.$_get('big');
      expect(r).assertEqual(9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART01_8300
     * @tc.name recordIndexGetPart01Test083
     * @tc.desc Verify V = double key $_get double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart01Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, double> = new Record<string, double>();
      record.$_set('d', Number.EPSILON);
      let r: double | undefined = record.$_get('d');
      expect(r).assertEqual(Number.EPSILON);
    });

  });
}
