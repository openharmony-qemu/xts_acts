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

enum StrColor { RED = 'red', GREEN = 'green', BLUE = 'blue' }
enum StrColor2 { RED = 'red', GREEN = 'green' }

enum Color { RED, GREEN, BLUE }
const longFlagNone: long = 0;
const longFlagActive: long = 1;
const longFlagInactive: long = 2;
interface DateObj { time: number }
enum LargeEnum { A = 0, B = 100, C = 1000 }
enum Flags { NONE = 0, READ = 1, WRITE = 2 }
const longRangeMin: long = -1000;
const longRangeZero: long = 0;
const longRangeMax: long = 1000;
enum StrKey { DASH = 'my-key', DOT = 'my.key', UNDER = 'my_key' }

export default function recordIndexGetPart03TestTest(): void {
  describe('RecordIndexGetPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_0100
     * @tc.name recordIndexGetPart03Test001
     * @tc.desc Verify Record K=string $_get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      let result: int | undefined = r.$_get('anykey');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_0200
     * @tc.name recordIndexGetPart03Test002
     * @tc.desc Verify Record K=string $_get "" undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      let result: int | undefined = r.$_get('');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_0300
     * @tc.name recordIndexGetPart03Test003
     * @tc.desc Verify Record K=string $_get emoji key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      let result: int | undefined = r.$_get('😀');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_0400
     * @tc.name recordIndexGetPart03Test004
     * @tc.desc Verify Record K=string $_get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      let longKey: string = 'x'.repeat(10000);
      let result: int | undefined = r.$_get(longKey);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_0500
     * @tc.name recordIndexGetPart03Test005
     * @tc.desc Verify Record K=int $_get(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      let result: string | undefined = r.$_get(0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_0600
     * @tc.name recordIndexGetPart03Test006
     * @tc.desc Verify Record K=int $_get(-1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      let result: string | undefined = r.$_get(-1);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_0700
     * @tc.name recordIndexGetPart03Test007
     * @tc.desc Verify Record K=int $_get(2147483647) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      let result: string | undefined = r.$_get(2147483647);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_0800
     * @tc.name recordIndexGetPart03Test008
     * @tc.desc Verify Record K=int $_get((-2147483647 - 1)) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      let result: string | undefined = r.$_get(-2147483648);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_0900
     * @tc.name recordIndexGetPart03Test009
     * @tc.desc Verify Record K=number $_get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      let result: int | undefined = r.$_get(3.14);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_1000
     * @tc.name recordIndexGetPart03Test010
     * @tc.desc Verify Record K=number $_get(NaN) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      let result: int | undefined = r.$_get(Number.NaN);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_1100
     * @tc.name recordIndexGetPart03Test011
     * @tc.desc Verify Record K=number $_get(Infinity) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      let result: int | undefined = r.$_get(Number.POSITIVE_INFINITY);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_1200
     * @tc.name recordIndexGetPart03Test012
     * @tc.desc Verify Record K=number $_get(-Infinity) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      let result: int | undefined = r.$_get(Number.NEGATIVE_INFINITY);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_1300
     * @tc.name recordIndexGetPart03Test013
     * @tc.desc Verify Record K=number $_get(-0.0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      let result: int | undefined = r.$_get(-0.0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_1400
     * @tc.name recordIndexGetPart03Test014
     * @tc.desc Verify Record K= int $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<Color, string> = new Record<Color, string>();
      let result: string | undefined = r.$_get(Color.RED);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_1500
     * @tc.name recordIndexGetPart03Test015
     * @tc.desc Verify Record K= long $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<long, int> = new Record<long, int>();
      let result: int | undefined = r.$_get(longFlagActive);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_1600
     * @tc.name recordIndexGetPart03Test016
     * @tc.desc Verify Record K= string $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<StrColor, string> = new Record<StrColor, string>();
      let result: string | undefined = r.$_get(StrColor.BLUE);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_1700
     * @tc.name recordIndexGetPart03Test017
     * @tc.desc Verify Record K=string V=Date $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, DateObj> = new Record<string, DateObj>();
      let result: DateObj | undefined = r.$_get('missing');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_1800
     * @tc.name recordIndexGetPart03Test018
     * @tc.desc Verify Record K=int V null $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string | null> = new Record<int, string | null>();
      let result: string | null | undefined = r.$_get(42);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_1900
     * @tc.name recordIndexGetPart03Test019
     * @tc.desc Verify K=string Record(a 1) $_get("b") undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 1);
      let result: int | undefined = r.$_get('b');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_2000
     * @tc.name recordIndexGetPart03Test020
     * @tc.desc Verify K=string Record(a 1) $_get "" undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 1);
      let result: int | undefined = r.$_get('');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_2100
     * @tc.name recordIndexGetPart03Test021
     * @tc.desc Verify K=string Record(a 1) $_get emoji undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 1);
      let result: int | undefined = r.$_get('😀');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_2200
     * @tc.name recordIndexGetPart03Test022
     * @tc.desc Verify K=string Record(a 1) $_get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 1);
      let longKey: string = 'x'.repeat(5000);
      let result: int | undefined = r.$_get(longKey);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_2300
     * @tc.name recordIndexGetPart03Test023
     * @tc.desc Verify K=int Record(0 "zero") $_get(-1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(0, 'zero');
      let result: string | undefined = r.$_get(-1);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_2400
     * @tc.name recordIndexGetPart03Test024
     * @tc.desc Verify K=int Record(0 "zero") $_get(1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(0, 'zero');
      let result: string | undefined = r.$_get(1);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_2500
     * @tc.name recordIndexGetPart03Test025
     * @tc.desc Verify K=int Record(0 "zero") $_get(2147483647) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(0, 'zero');
      let result: string | undefined = r.$_get(2147483647);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_2600
     * @tc.name recordIndexGetPart03Test026
     * @tc.desc Verify K=int Record(0 "zero") $_get((-2147483647 - 1)) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(0, 'zero');
      let result: string | undefined = r.$_get(-2147483648);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_2700
     * @tc.name recordIndexGetPart03Test027
     * @tc.desc Verify K=number Record(1.0 100) $_get(2.0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(1.0, 100);
      let result: int | undefined = r.$_get(2.0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_2800
     * @tc.name recordIndexGetPart03Test028
     * @tc.desc Verify K=number Record(1.0 100) $_get(NaN) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(1.0, 100);
      let result: int | undefined = r.$_get(Number.NaN);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_2900
     * @tc.name recordIndexGetPart03Test029
     * @tc.desc Verify K=number Record(1.0 100) $_get(Infinity) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(1.0, 100);
      let result: int | undefined = r.$_get(Number.POSITIVE_INFINITY);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_3000
     * @tc.name recordIndexGetPart03Test030
     * @tc.desc Verify K=number Record(1.0 100) $_get(-0.0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(1.0, 100);
      let result: int | undefined = r.$_get(-0.0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_3100
     * @tc.name recordIndexGetPart03Test031
     * @tc.desc Verify K= int Record(RED "r") $_get(BLUE) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<Color, string> = new Record<Color, string>();
      r.$_set(Color.RED, 'r');
      let result: string | undefined = r.$_get(Color.BLUE);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_3200
     * @tc.name recordIndexGetPart03Test032
     * @tc.desc Verify K= long Record $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<long, int> = new Record<long, int>();
      r.$_set(longFlagActive, 10);
      let result: int | undefined = r.$_get(longFlagInactive);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_3300
     * @tc.name recordIndexGetPart03Test033
     * @tc.desc Verify K= string Record $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<StrColor, string> = new Record<StrColor, string>();
      r.$_set(StrColor.RED, 'rouge');
      let result: string | undefined = r.$_get(StrColor.GREEN);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_3400
     * @tc.name recordIndexGetPart03Test034
     * @tc.desc Verify K=string Record $_get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('Key', 1);
      let result: int | undefined = r.$_get('key');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_3500
     * @tc.name recordIndexGetPart03Test035
     * @tc.desc Verify K=string key V 99 $_get 1 key 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 99);
      r.$_set('b', 99);
      r.$_set('c', 99);
      let result: int | undefined = r.$_get('a');
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_3600
     * @tc.name recordIndexGetPart03Test036
     * @tc.desc Verify K=string key V 99 $_get 2 key 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 99);
      r.$_set('b', 99);
      r.$_set('c', 99);
      let result: int | undefined = r.$_get('b');
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_3700
     * @tc.name recordIndexGetPart03Test037
     * @tc.desc Verify K=string key V 99 $_get 3 key 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 99);
      r.$_set('b', 99);
      r.$_set('c', 99);
      let result: int | undefined = r.$_get('c');
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_3800
     * @tc.name recordIndexGetPart03Test038
     * @tc.desc Verify K=string V Record $_get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 99);
      r.$_set('b', 99);
      r.$_set('c', 99);
      let result: int | undefined = r.$_get('d');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_3900
     * @tc.name recordIndexGetPart03Test039
     * @tc.desc Verify K=int key V true $_get 1 key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, boolean> = new Record<int, boolean>();
      r.$_set(0, true);
      r.$_set(1, true);
      r.$_set(-1, true);
      let result: boolean | undefined = r.$_get(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_4000
     * @tc.name recordIndexGetPart03Test040
     * @tc.desc Verify K=int V Record $_get key(2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, boolean> = new Record<int, boolean>();
      r.$_set(0, true);
      r.$_set(1, true);
      r.$_set(-1, true);
      let result: boolean | undefined = r.$_get(2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_4100
     * @tc.name recordIndexGetPart03Test041
     * @tc.desc Verify K=number key V "same" $_get 1 float key "same"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, string> = new Record<number, string>();
      r.$_set(1.0, 'same');
      r.$_set(2.0, 'same');
      r.$_set(3.0, 'same');
      let result: string | undefined = r.$_get(1.0);
      expect(result).assertEqual('same');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_4200
     * @tc.name recordIndexGetPart03Test042
     * @tc.desc Verify K=number V Record $_get float key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, string> = new Record<number, string>();
      r.$_set(1.0, 'same');
      r.$_set(2.0, 'same');
      r.$_set(3.0, 'same');
      let result: string | undefined = r.$_get(4.0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_4300
     * @tc.name recordIndexGetPart03Test043
     * @tc.desc Verify K=string key "" $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('', 777);
      let result: int | undefined = r.$_get('');
      expect(result).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_4400
     * @tc.name recordIndexGetPart03Test044
     * @tc.desc Verify K=string key emoji $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('😀', 888);
      let result: int | undefined = r.$_get('😀');
      expect(result).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_4500
     * @tc.name recordIndexGetPart03Test045
     * @tc.desc Verify K=string key XSS $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('<script>alert(1)</script>', 111);
      let result: int | undefined = r.$_get('<script>alert(1)</script>');
      expect(result).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_4600
     * @tc.name recordIndexGetPart03Test046
     * @tc.desc Verify K=string key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('​', 222);
      let result: int | undefined = r.$_get('​');
      expect(result).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_4700
     * @tc.name recordIndexGetPart03Test047
     * @tc.desc Verify K=int key MAX $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(2147483647, 'maxVal');
      let result: string | undefined = r.$_get(2147483647);
      expect(result).assertEqual('maxVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_4800
     * @tc.name recordIndexGetPart03Test048
     * @tc.desc Verify K=int key MIN $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(-2147483648, 'minVal');
      let result: string | undefined = r.$_get(-2147483648);
      expect(result).assertEqual('minVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_4900
     * @tc.name recordIndexGetPart03Test049
     * @tc.desc Verify K=int key -1 $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(-1, 'negOne');
      let result: string | undefined = r.$_get(-1);
      expect(result).assertEqual('negOne');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_5000
     * @tc.name recordIndexGetPart03Test050
     * @tc.desc Verify K=number key NaN $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(Number.NaN, 42);
      let result: int | undefined = r.$_get(Number.NaN);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_5100
     * @tc.name recordIndexGetPart03Test051
     * @tc.desc Verify K=number key Infinity $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(Number.POSITIVE_INFINITY, 999);
      let result: int | undefined = r.$_get(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_5200
     * @tc.name recordIndexGetPart03Test052
     * @tc.desc Verify K=number key -Infinity $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(Number.NEGATIVE_INFINITY, -999);
      let result: int | undefined = r.$_get(Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(-999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_5300
     * @tc.name recordIndexGetPart03Test053
     * @tc.desc Verify K=number key -0.0 $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, string> = new Record<number, string>();
      r.$_set(-0.0, 'negZero');
      let result: string | undefined = r.$_get(-0.0);
      expect(result).assertEqual('negZero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_5400
     * @tc.name recordIndexGetPart03Test054
     * @tc.desc Verify K= int $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<Color, string> = new Record<Color, string>();
      r.$_set(Color.BLUE, 'blue');
      let result: string | undefined = r.$_get(Color.BLUE);
      expect(result).assertEqual('blue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_5500
     * @tc.name recordIndexGetPart03Test055
     * @tc.desc Verify K=string Record key $_get "" undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('hello', 1);
      r.$_set('world', 2);
      let result: int | undefined = r.$_get('');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_5600
     * @tc.name recordIndexGetPart03Test056
     * @tc.desc Verify K=string Record key $_get emoji undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('hello', 1);
      r.$_set('world', 2);
      let result: int | undefined = r.$_get('😀');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_5700
     * @tc.name recordIndexGetPart03Test057
     * @tc.desc Verify K=string Record key $_get XSS undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('hello', 1);
      let result: int | undefined = r.$_get('<script>alert(1)</script>');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_5800
     * @tc.name recordIndexGetPart03Test058
     * @tc.desc Verify K=int Record MAX $_get(2147483647) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(0, 'a');
      r.$_set(1, 'b');
      let result: string | undefined = r.$_get(2147483647);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_5900
     * @tc.name recordIndexGetPart03Test059
     * @tc.desc Verify K=int Record MIN $_get((-2147483647 - 1)) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(0, 'a');
      r.$_set(1, 'b');
      let result: string | undefined = r.$_get(-2147483648);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_6000
     * @tc.name recordIndexGetPart03Test060
     * @tc.desc Verify K=number Record NaN $_get(NaN) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(1.0, 10);
      r.$_set(2.0, 20);
      let result: int | undefined = r.$_get(Number.NaN);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_6100
     * @tc.name recordIndexGetPart03Test061
     * @tc.desc Verify K=number Record Infinity $_get(Infinity) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(1.0, 10);
      r.$_set(2.0, 20);
      let result: int | undefined = r.$_get(Number.POSITIVE_INFINITY);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_6200
     * @tc.name recordIndexGetPart03Test062
     * @tc.desc Verify K=number Record -Infinity $_get(-Infinity) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(1.0, 10);
      let result: int | undefined = r.$_get(Number.NEGATIVE_INFINITY);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_6300
     * @tc.name recordIndexGetPart03Test063
     * @tc.desc Verify K=number Record -0.0 $_get(-0.0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(1.0, 10);
      let result: int | undefined = r.$_get(-0.0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_6400
     * @tc.name recordIndexGetPart03Test064
     * @tc.desc Verify K= int Record RED/GREEN $_get(BLUE) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<Color, string> = new Record<Color, string>();
      r.$_set(Color.RED, 'r');
      r.$_set(Color.GREEN, 'g');
      let result: string | undefined = r.$_get(Color.BLUE);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_6500
     * @tc.name recordIndexGetPart03Test065
     * @tc.desc Verify K=int Record 0x7FFFFFFE $_get(0x7FFFFFFE) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(0, 'zero');
      let result: string | undefined = r.$_get(0x7FFFFFFE as int);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_6600
     * @tc.name recordIndexGetPart03Test066
     * @tc.desc Verify K=string Record key $_get 10000 key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 1);
      let longKey: string = 'x'.repeat(10000);
      let result: int | undefined = r.$_get(longKey);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_6700
     * @tc.name recordIndexGetPart03Test067
     * @tc.desc Verify V undefined key undefined $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int | undefined> = new Record<string, int | undefined>();
      r.$_set('exists', undefined);
      let result: int | undefined = r.$_get('exists');
      expect(r.has('exists')).assertTrue();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_6800
     * @tc.name recordIndexGetPart03Test068
     * @tc.desc Verify V undefined key $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int | undefined> = new Record<string, int | undefined>();
      r.$_set('exists', undefined);
      let result: int | undefined = r.$_get('missing');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_6900
     * @tc.name recordIndexGetPart03Test069
     * @tc.desc Verify V=string|null key null $_get null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string | null> = new Record<int, string | null>();
      r.$_set(0, null);
      let result: string | null | undefined = r.$_get(0);
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_7000
     * @tc.name recordIndexGetPart03Test070
     * @tc.desc Verify V=string|null key $_get undefined null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string | null> = new Record<int, string | null>();
      r.$_set(0, null);
      let result: string | null | undefined = r.$_get(1);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_7100
     * @tc.name recordIndexGetPart03Test071
     * @tc.desc Verify V=boolean|undefined key false $_get false undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, boolean | undefined> = new Record<string, boolean | undefined>();
      r.$_set('flag', false);
      let result: boolean | undefined = r.$_get('flag');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_7200
     * @tc.name recordIndexGetPart03Test072
     * @tc.desc Verify V=boolean|undefined key $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, boolean | undefined> = new Record<string, boolean | undefined>();
      r.$_set('flag', false);
      let result: boolean | undefined = r.$_get('nope');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_7300
     * @tc.name recordIndexGetPart03Test073
     * @tc.desc Verify K=string key $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 1);
      r.$_set('a', 99);
      let result: int | undefined = r.$_get('a');
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_7400
     * @tc.name recordIndexGetPart03Test074
     * @tc.desc Verify K=int key $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(0, 'first');
      r.$_set(0, 'second');
      r.$_set(0, 'third');
      let result: string | undefined = r.$_get(0);
      expect(result).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_7500
     * @tc.name recordIndexGetPart03Test075
     * @tc.desc Verify K=number float key $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(3.14, 100);
      r.$_set(3.14, 200);
      let result: int | undefined = r.$_get(3.14);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_7600
     * @tc.name recordIndexGetPart03Test076
     * @tc.desc Verify K= string key $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<StrColor2, string> = new Record<StrColor2, string>();
      r.$_set(StrColor2.RED, 'old');
      r.$_set(StrColor2.RED, 'new');
      let result: string | undefined = r.$_get(StrColor2.RED);
      expect(result).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_7700
     * @tc.name recordIndexGetPart03Test077
     * @tc.desc Verify K=string key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 1);
      r.$_set('b', 2);
      r.$_set('a', 10);
      let resultB: int | undefined = r.$_get('b');
      expect(resultB).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_7800
     * @tc.name recordIndexGetPart03Test078
     * @tc.desc Verify K=int key MAX $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(2147483647, 'old');
      r.$_set(2147483647, 'newMax');
      let result: string | undefined = r.$_get(2147483647);
      expect(result).assertEqual('newMax');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_7900
     * @tc.name recordIndexGetPart03Test079
     * @tc.desc Verify K=number key=NaN $_get(NaN) NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(Number.NaN, 999);
      let result: int | undefined = r.$_get(Number.NaN);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_8000
     * @tc.name recordIndexGetPart03Test080
     * @tc.desc Verify K=number key=0.0 key=-0.0 $_get(0.0) 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, string> = new Record<number, string>();
      r.$_set(0.0, 'positiveZero');
      r.$_set(-0.0, 'negativeZero');
      let result: string | undefined = r.$_get(0.0);
      expect(result).assertEqual('negativeZero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_8100
     * @tc.name recordIndexGetPart03Test081
     * @tc.desc Verify K=number key=-0.0 $_get(-0.0) -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, string> = new Record<number, string>();
      r.$_set(0.0, 'positiveZero');
      r.$_set(-0.0, 'negativeZero');
      let result: string | undefined = r.$_get(-0.0);
      expect(result).assertEqual('negativeZero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_8200
     * @tc.name recordIndexGetPart03Test082
     * @tc.desc Verify K=number key=Number.EPSILON $_get(Number.EPSILON)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(Number.EPSILON, 1);
      let result: int | undefined = r.$_get(Number.EPSILON);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_8300
     * @tc.name recordIndexGetPart03Test083
     * @tc.desc Verify K=number key=Number.MAX_SAFE_INTEGER+1 $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, string> = new Record<number, string>();
      let key: number = 9007199254740992 as number;
      r.$_set(key, 'largeFloat');
      let result: string | undefined = r.$_get(key);
      expect(result).assertEqual('largeFloat');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_8400
     * @tc.name recordIndexGetPart03Test084
     * @tc.desc Verify K=number key $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(0.123456789, 42);
      let result: int | undefined = r.$_get(0.123456789);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_8500
     * @tc.name recordIndexGetPart03Test085
     * @tc.desc Verify K=string 5 Record 2 $_get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('k1', 10);
      r.$_set('k2', 20);
      r.$_set('k3', 30);
      r.$_set('k4', 40);
      r.$_set('k5', 50);
      let r1: int | undefined = r.$_get('k3');
      let r2: int | undefined = r.$_get('k3');
      expect(r1).assertEqual(30);
      expect(r2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_8600
     * @tc.name recordIndexGetPart03Test086
     * @tc.desc Verify K=int 5 Record $_get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string> = new Record<int, string>();
      r.$_set(10, 'ten');
      r.$_set(20, 'twenty');
      r.$_set(30, 'thirty');
      r.$_set(40, 'forty');
      r.$_set(50, 'fifty');
      const result: string | undefined = r.$_get(20);
      expect(result).assertEqual('twenty');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_8700
     * @tc.name recordIndexGetPart03Test087
     * @tc.desc Verify K=number 5 Record $_get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<number, int> = new Record<number, int>();
      r.$_set(1.1, 11);
      r.$_set(2.2, 22);
      r.$_set(3.3, 33);
      r.$_set(4.4, 44);
      r.$_set(5.5, 55);
      const result: int | undefined = r.$_get(Number.NaN);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_8800
     * @tc.name recordIndexGetPart03Test088
     * @tc.desc Verify K=string 2 key V=0 $_get 1 key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('alpha', 0);
      r.$_set('beta', 0);
      let result: int | undefined = r.$_get('alpha');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_8900
     * @tc.name recordIndexGetPart03Test089
     * @tc.desc Verify K=string V=0 $_get 2 key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('alpha', 0);
      r.$_set('beta', 0);
      let result: int | undefined = r.$_get('beta');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_9000
     * @tc.name recordIndexGetPart03Test090
     * @tc.desc Verify K=int 2 key V=null $_get 1 key null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string | null> = new Record<int, string | null>();
      r.$_set(100, null);
      r.$_set(200, null);
      let result: string | null | undefined = r.$_get(100);
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_9100
     * @tc.name recordIndexGetPart03Test091
     * @tc.desc Verify K=int 2 key V=null $_get 300 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<int, string | null> = new Record<int, string | null>();
      r.$_set(100, null);
      r.$_set(200, null);
      let result: string | null | undefined = r.$_get(300);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_9200
     * @tc.name recordIndexGetPart03Test092
     * @tc.desc Verify K= int $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<LargeEnum, string> = new Record<LargeEnum, string>();
      r.$_set(LargeEnum.C, 'last');
      let result: string | undefined = r.$_get(LargeEnum.C);
      expect(result).assertEqual('last');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_9300
     * @tc.name recordIndexGetPart03Test093
     * @tc.desc Verify K= int $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<LargeEnum, string> = new Record<LargeEnum, string>();
      r.$_set(LargeEnum.A, 'first');
      let result: string | undefined = r.$_get(LargeEnum.B);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_9400
     * @tc.name recordIndexGetPart03Test094
     * @tc.desc Verify K= int $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<Flags, string> = new Record<Flags, string>();
      r.$_set(Flags.NONE, 'none');
      r.$_set(Flags.READ, 'read');
      r.$_set(Flags.WRITE, 'write');
      const result: string | undefined = r.$_get(Flags.NONE);
      expect(result).assertEqual('none');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_9500
     * @tc.name recordIndexGetPart03Test095
     * @tc.desc Verify K= long $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<long, int> = new Record<long, int>();
      r.$_set(longRangeZero, 0);
      r.$_set(longRangeMax, 1000);
      const result: int | undefined = r.$_get(longRangeMin);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_9600
     * @tc.name recordIndexGetPart03Test096
     * @tc.desc Verify K= string $_get V
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<StrKey, int> = new Record<StrKey, int>();
      r.$_set(StrKey.DASH, 10);
      r.$_set(StrKey.DOT, 20);
      let result: int | undefined = r.$_get(StrKey.DASH);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART03_9700
     * @tc.name recordIndexGetPart03Test097
     * @tc.desc Verify K= string $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart03Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<StrKey, int> = new Record<StrKey, int>();
      r.$_set(StrKey.DASH, 10);
      let result: int | undefined = r.$_get(StrKey.UNDER);
      expect(result).assertUndefined();
    });

  });
}
