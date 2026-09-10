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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface ObjKey {
  id: int;
  name: string;
}

interface ObjKey4 {
  id: int;
  tag: string;
}

export default function readonlyMapHasPart03TestTest(): void {
  describe('ReadonlyMapHasPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_0100
     * @tc.name readonlyMapHasPart03Test001
     * @tc.desc Verify K=string hello key has true and absent key has false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['hello', 1]]);
      expect(map.has('hello')).assertTrue();
      expect(map.has('absent')).assertFalse();
      expect(map.get('hello')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_0200
     * @tc.name readonlyMapHasPart03Test002
     * @tc.desc Verify K=int Map has int key true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[42, 'val']]);
      expect(map.has(42)).assertTrue();
      expect(map.has(41)).assertFalse();
      expect(map.get(42)).assertEqual('val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_0300
     * @tc.name readonlyMapHasPart03Test003
     * @tc.desc Verify K=long Map has long key true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, int> = new Map<long, int>([[Int.toLong(100), 1]]);
      expect(map.has(Int.toLong(100))).assertTrue();
      expect(map.has(Int.toLong(99))).assertFalse();
      expect(map.get(Int.toLong(100))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_0400
     * @tc.name readonlyMapHasPart03Test004
     * @tc.desc Verify K=double Map has double key true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, int> = new Map<double, int>([[1.5, 1]]);
      expect(map.has(1.5)).assertTrue();
      expect(map.has(2.5)).assertFalse();
      expect(map.get(1.5)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_0500
     * @tc.name readonlyMapHasPart03Test005
     * @tc.desc Verify K=Date Map has Date key true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: Date = new Date(2000);
      const map: ReadonlyMap<Date, int> = new Map<Date, int>([[key, 1]]);
      expect(map.has(key)).assertTrue();
      expect(map.has(new Date(3000))).assertFalse();
      expect(map.get(key)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_0600
     * @tc.name readonlyMapHasPart03Test006
     * @tc.desc Verify K=RegExp Map has RegExp key true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: RegExp = new RegExp('pattern', 'i');
      const map: ReadonlyMap<RegExp, int> = new Map<RegExp, int>([[key, 1]]);
      expect(map.has(key)).assertTrue();
      const absentR: RegExp = new RegExp('other', 'i');
      expect(map.has(absentR)).assertFalse();
      expect(map.get(key)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_0700
     * @tc.name readonlyMapHasPart03Test007
     * @tc.desc Verify K=object Map has key true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: ObjKey = { id: 1, name: 'test' };
      const map: ReadonlyMap<ObjKey, int> = new Map<ObjKey, int>([[key, 1]]);
      expect(map.has(key)).assertTrue();
      const absentO: ObjKey = { id: 2, name: 'absent' };
      expect(map.has(absentO)).assertFalse();
      expect(map.get(key)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_0800
     * @tc.name readonlyMapHasPart03Test008
     * @tc.desc Verify K=int Map 200 keys has first and last key true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: [int, int][] = [];
      for (let i = 0; i < 200; i++) {
        entries.push([i, i]);
      }
      const map: ReadonlyMap<int, int> = new Map<int, int>(entries);
      expect(map.has(0)).assertTrue();
      expect(map.has(199)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_0900
     * @tc.name readonlyMapHasPart03Test009
     * @tc.desc Verify K=int Map has int key false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: [int, int][] = [];
      for (let i = 0; i < 200; i++) {
        entries.push([i, i]);
      }
      const map: ReadonlyMap<int, int> = new Map<int, int>(entries);
      expect(map.has(9999)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_1000
     * @tc.name readonlyMapHasPart03Test010
     * @tc.desc Verify K=string 200 keys has key_50 true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: [string, int][] = [];
      for (let i = 0; i < 200; i++) {
        entries.push(['key_' + i.toString(), i]);
      }
      const map: ReadonlyMap<string, int> = new Map<string, int>(entries);
      expect(map.has('key_50')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_1100
     * @tc.name readonlyMapHasPart03Test011
     * @tc.desc Verify K=string 200 keys has nonexistent false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: [string, int][] = [];
      for (let i = 0; i < 200; i++) {
        entries.push(['key_' + i.toString(), i]);
      }
      const map: ReadonlyMap<string, int> = new Map<string, int>(entries);
      expect(map.has('nonexistent')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_1200
     * @tc.name readonlyMapHasPart03Test012
     * @tc.desc Verify K=Date Date-keyed Map has key true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Date = new Date(5000);
      const entries: [Date, int][] = [];
      for (let i = 0; i < 200; i++) {
        entries.push([new Date(i * 1000), i]);
      }
      entries.push([target, 999]);
      const map: ReadonlyMap<Date, int> = new Map<Date, int>(entries);
      expect(map.has(target)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_1300
     * @tc.name readonlyMapHasPart03Test013
     * @tc.desc Verify K=Date Date-keyed Map has Date key false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: [Date, int][] = [];
      for (let i = 0; i < 200; i++) {
        entries.push([new Date(i * 1000), i]);
      }
      const map: ReadonlyMap<Date, int> = new Map<Date, int>(entries);
      expect(map.has(new Date(999999))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_1400
     * @tc.name readonlyMapHasPart03Test014
     * @tc.desc Verify ReadonlyMap has() true with preset string key, false on empty map, true with preset re-added key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['x', 1]]);
      const map: ReadonlyMap<string, int> = src;
      expect(map.has('x')).assertTrue();
      src.delete('x');
      expect(map.has('x')).assertFalse();
      src.set('x', 2);
      expect(map.has('x')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_1500
     * @tc.name readonlyMapHasPart03Test015
     * @tc.desc Verify K=string ReadonlyMap with key 'k' has key true size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['k', 999]]);
      expect(map.has('k')).assertTrue();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_1600
     * @tc.name readonlyMapHasPart03Test016
     * @tc.desc Verify K=double has(NaN) NaN key Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, int> = new Map<double, int>([[Number.NaN, 1]]);
      let result: boolean = map.has(Number.NaN);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_1700
     * @tc.name readonlyMapHasPart03Test017
     * @tc.desc Verify K=double has(+0.0) -0.0 key Map SameValueZero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, int> = new Map<double, int>([[-0.0, 1]]);
      let result: boolean = map.has(+0.0);
      expect(result).assertTrue();
      const map2: ReadonlyMap<double, int> = new Map<double, int>([[+0.0, 1]]);
      let negZeroFound: boolean = map2.has(-0.0);
      expect(negZeroFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_1800
     * @tc.name readonlyMapHasPart03Test018
     * @tc.desc Verify K=double has(Infinity) Infinity key Map true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, int> = new Map<double, int>([[Number.POSITIVE_INFINITY, 1]]);
      expect(map.has(Number.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_1900
     * @tc.name readonlyMapHasPart03Test019
     * @tc.desc Verify K=double has(-Infinity) -Infinity key Map true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, int> = new Map<double, int>([[-Number.POSITIVE_INFINITY, 1]]);
      expect(map.has(-Number.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_2000
     * @tc.name readonlyMapHasPart03Test020
     * @tc.desc Verify K=double has(Infinity) -Infinity key Map false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, int> = new Map<double, int>([[-Number.POSITIVE_INFINITY, 1]]);
      expect(map.has(Number.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_2100
     * @tc.name readonlyMapHasPart03Test021
     * @tc.desc Verify K=double has(Number.EPSILON) Number.EPSILON key Map true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, int> = new Map<double, int>([[Number.EPSILON, 1]]);
      expect(map.has(Number.EPSILON)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_2200
     * @tc.name readonlyMapHasPart03Test022
     * @tc.desc Verify K=Array(int[]) key has false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key1: int[] = [1, 2, 3];
      let key2: int[] = [1, 2, 3];
      const map: ReadonlyMap<int[], int> = new Map<int[], int>([[key1, 1]]);
      expect(map.has(key2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_2300
     * @tc.name readonlyMapHasPart03Test023
     * @tc.desc Verify int[] key has() true by reference identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: int[] = [1, 2, 3];
      const map: ReadonlyMap<int[], int> = new Map<int[], int>([[key, 1]]);
      expect(map.has(key)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_2400
     * @tc.name readonlyMapHasPart03Test024
     * @tc.desc Verify has() null and undefined keys in union key type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string | null | undefined, int> = new Map<string | null | undefined, int>();
      const map: ReadonlyMap<string | null | undefined, int> = src;
      src.set(null, 1);
      src.set(undefined, 2);
      expect(map.has(null)).assertTrue();
      expect(map.has(undefined)).assertTrue();
      expect(map.has('absent')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_2500
     * @tc.name readonlyMapHasPart03Test025
     * @tc.desc Verify empty ReadonlyMap has() false size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      let result: boolean = map.has('a');
      expect(result).assertFalse();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_2600
     * @tc.name readonlyMapHasPart03Test026
     * @tc.desc Verify K=string ReadonlyMap without key has() false, remaining keys true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([
        ['a', 1],
        ['c', 3],
      ]);
      expect(map.has('a')).assertTrue();
      expect(map.has('b')).assertFalse();
      expect(map.has('c')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_2700
     * @tc.name readonlyMapHasPart03Test027
     * @tc.desc Verify K=string ReadonlyMap has() true with empty key, false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mapWithEmptyKey: ReadonlyMap<string, int> = new Map<string, int>([['', 100]]);
      expect(mapWithEmptyKey.has('')).assertTrue();
      const mapWithoutEmptyKey: ReadonlyMap<string, int> = new Map<string, int>();
      expect(mapWithoutEmptyKey.has('')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_2800
     * @tc.name readonlyMapHasPart03Test028
     * @tc.desc Verify K=string ReadonlyMap with Unicode emoji key has() true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['😀', 999]]);
      expect(map.has('😀')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_2900
     * @tc.name readonlyMapHasPart03Test029
     * @tc.desc Verify K=string ReadonlyMap has() true with long key, false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'a';
      for (let i: int = 0; i < 5000; i++) {
        longKey += 'b';
      }
      const mapWithKey: ReadonlyMap<string, int> = new Map<string, int>([[longKey, 1]]);
      expect(mapWithKey.has(longKey)).assertTrue();
      const mapWithoutKey: ReadonlyMap<string, int> = new Map<string, int>();
      expect(mapWithoutKey.has(longKey)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_3000
     * @tc.name readonlyMapHasPart03Test030
     * @tc.desc Verify K=int ReadonlyMap with key -1 has() true size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[-1, 'overwritten']]);
      expect(map.has(-1)).assertTrue();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_3100
     * @tc.name readonlyMapHasPart03Test031
     * @tc.desc Verify K=int ReadonlyMap has() true with int.MIN key, false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mapWithKey: ReadonlyMap<int, string> = new Map<int, string>([[-2147483648, 'min']]);
      expect(mapWithKey.has(-2147483648)).assertTrue();
      const mapWithoutKey: ReadonlyMap<int, string> = new Map<int, string>();
      expect(mapWithoutKey.has(-2147483648)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_3200
     * @tc.name readonlyMapHasPart03Test032
     * @tc.desc Verify K=int ReadonlyMap without key 20 has() false, remaining keys true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([
        [10, 'ten'],
        [30, 'thirty'],
      ]);
      expect(map.has(10)).assertTrue();
      expect(map.has(20)).assertFalse();
      expect(map.has(30)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_3300
     * @tc.name readonlyMapHasPart03Test033
     * @tc.desc Verify K=long ReadonlyMap has() true with key Int.toLong(0), false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mapWithKey: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(0), 'zero']]);
      expect(mapWithKey.has(Int.toLong(0))).assertTrue();
      const mapWithoutKey: ReadonlyMap<long, string> = new Map<long, string>();
      expect(mapWithoutKey.has(Int.toLong(0))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_3400
     * @tc.name readonlyMapHasPart03Test034
     * @tc.desc Verify K=long ReadonlyMap with key Int.toLong(-1) has() true size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(-1), 'overwritten']]);
      expect(map.has(Int.toLong(-1))).assertTrue();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_3500
     * @tc.name readonlyMapHasPart03Test035
     * @tc.desc Verify K=long ReadonlyMap has() true with long.MAX key, false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lKey: long = 9223372036854775807;
      const mapWithKey: ReadonlyMap<long, string> = new Map<long, string>([[lKey, 'max']]);
      expect(mapWithKey.has(lKey)).assertTrue();
      const mapWithoutKey: ReadonlyMap<long, string> = new Map<long, string>();
      expect(mapWithoutKey.has(lKey)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_3600
     * @tc.name readonlyMapHasPart03Test036
     * @tc.desc Verify K=Date ReadonlyMap with Date key has() true size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(5000);
      const map: ReadonlyMap<Date, string> = new Map<Date, string>([[d, 'second']]);
      expect(map.has(d)).assertTrue();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_3700
     * @tc.name readonlyMapHasPart03Test037
     * @tc.desc Verify K=Date ReadonlyMap has() false for equal-value Date ref, empty map false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(5000);
      const d2: Date = new Date(5000);
      const mapWithKey: ReadonlyMap<Date, string> = new Map<Date, string>([[d1, 'date']]);
      expect(mapWithKey.has(d2)).assertFalse();
      const mapEmpty: ReadonlyMap<Date, string> = new Map<Date, string>();
      expect(mapEmpty.has(d1)).assertFalse();
      expect(mapEmpty.has(d2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_3800
     * @tc.name readonlyMapHasPart03Test038
     * @tc.desc Verify K=RegExp ReadonlyMap with RegExp key has() true size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: RegExp = new RegExp('abc', 'g');
      const map: ReadonlyMap<RegExp, string> = new Map<RegExp, string>([[r, 'v2']]);
      expect(map.has(r)).assertTrue();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_3900
     * @tc.name readonlyMapHasPart03Test039
     * @tc.desc Verify K=float ReadonlyMap with -Infinity has() true, +Infinity false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, string> =
        new Map<float, string>([[Double.toFloat(Number.NEGATIVE_INFINITY), 'neg']]);
      expect(map.has(Double.toFloat(Number.POSITIVE_INFINITY))).assertFalse();
      expect(map.has(Double.toFloat(Number.NEGATIVE_INFINITY))).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_4000
     * @tc.name readonlyMapHasPart03Test040
     * @tc.desc Verify K=byte ReadonlyMap has() true with byte.MAX key, false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mapWithKey: ReadonlyMap<byte, string> = new Map<byte, string>([[127, 'max']]);
      expect(mapWithKey.has(127)).assertTrue();
      const mapWithoutKey: ReadonlyMap<byte, string> = new Map<byte, string>();
      expect(mapWithoutKey.has(127)).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_4100
     * @tc.name readonlyMapHasPart03Test041
     * @tc.desc Verify K=short ReadonlyMap has() true with short.MAX key, false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mapWithKey: ReadonlyMap<short, string> = new Map<short, string>([[32767, 'max']]);
      expect(mapWithKey.has(32767)).assertTrue();
      const mapWithoutKey: ReadonlyMap<short, string> = new Map<short, string>();
      expect(mapWithoutKey.has(32767)).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_4200
     * @tc.name readonlyMapHasPart03Test042
     * @tc.desc Verify K=short ReadonlyMap with short.MIN key has() true size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[-32768, 'overwritten']]);
      expect(map.has(-32768)).assertTrue();
      expect(map.size).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_4300
     * @tc.name readonlyMapHasPart03Test043
     * @tc.desc Verify K=char ReadonlyMap has() true with 'A' key, false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mapWithKey: ReadonlyMap<char, string> = new Map<char, string>([[c'A', 'alpha char']]);
      expect(mapWithKey.has(c'A')).assertTrue();
      const mapWithoutKey: ReadonlyMap<char, string> = new Map<char, string>();
      expect(mapWithoutKey.has(c'A')).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_4400
     * @tc.name readonlyMapHasPart03Test044
     * @tc.desc Verify constructor duplicate key last-wins has() true get() 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['dup', 1], ['dup', 2]]);
      expect(map.has('dup')).assertTrue();
      expect(map.get('dup')).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_4500
     * @tc.name readonlyMapHasPart03Test045
     * @tc.desc Verify empty Map from [] has() false and get() undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([]);
      expect(map.has('any')).assertFalse();
      expect(map.get('any')).assertUndefined();
      expect(map.size).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_4600
     * @tc.name readonlyMapHasPart03Test046
     * @tc.desc Verify new ReadonlyMap<int,string> with keys has() true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[1, 'one'], [2, 'two'], [3, 'three']]);
      expect(map.has(1)).assertTrue();
      expect(map.has(2)).assertTrue();
      expect(map.has(3)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_4700
     * @tc.name readonlyMapHasPart03Test047
     * @tc.desc Verify int.MAX key int.MIN key has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[2147483647, 'max'], [-2147483648, 'min']]);
      expect(map.has(2147483647)).assertTrue();
      expect(map.has(-2147483648)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_4800
     * @tc.name readonlyMapHasPart03Test048
     * @tc.desc Verify ReadonlyMap with int.MIN key has() true, int.MAX false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[-2147483648, 'min']]);
      expect(map.has(2147483647)).assertFalse();
      expect(map.has(-2147483648)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_4900
     * @tc.name readonlyMapHasPart03Test049
     * @tc.desc Verify empty ReadonlyMap<int,int> has() false for int keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, int> = new Map<int, int>();
      expect(map.has(0)).assertFalse();
      expect(map.has(-1)).assertFalse();
      expect(map.has(2147483647)).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_5000
     * @tc.name readonlyMapHasPart03Test050
     * @tc.desc Verify nested if has(a) then has(b) both true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let innerChecked: boolean = false;
      if (map.has('a')) {
        if (map.has('b')) {
          innerChecked = true;
        }
      }
      expect(innerChecked).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_5100
     * @tc.name readonlyMapHasPart03Test051
     * @tc.desc Verify K=byte V=long ReadonlyMap with key 127 has() true, key 0 false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<byte, long> = new Map<byte, long>([[127, Int.toLong(127)]]);
      expect(map.has(0)).assertFalse();
      expect(map.has(127)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_5200
     * @tc.name readonlyMapHasPart03Test052
     * @tc.desc Verify K=char V=float empty ReadonlyMap has() false for 'X'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<char, float> = new Map<char, float>();
      expect(map.has(c'X')).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_5300
     * @tc.name readonlyMapHasPart03Test053
     * @tc.desc Verify K=object ReadonlyMap has() true with key ref, false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ObjKey4 = { id: 1, tag: 'alpha' };
      const mapWithKey: ReadonlyMap<ObjKey4, string> = new Map<ObjKey4, string>([[obj, 'obj val']]);
      expect(mapWithKey.has(obj)).assertTrue();
      const mapWithoutKey: ReadonlyMap<ObjKey4, string> = new Map<ObjKey4, string>();
      expect(mapWithoutKey.has(obj)).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_5400
     * @tc.name readonlyMapHasPart03Test054
     * @tc.desc Verify K=object ReadonlyMap with obj2 key has() true, obj1 false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ObjKey4 = { id: 1, tag: 'a' };
      const obj2: ObjKey4 = { id: 1, tag: 'a' };
      const map: ReadonlyMap<ObjKey4, string> = new Map<ObjKey4, string>([[obj2, 'second']]);
      expect(map.has(obj1)).assertFalse();
      expect(map.has(obj2)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_5500
     * @tc.name readonlyMapHasPart03Test055
     * @tc.desc Verify K=float ReadonlyMap has() true with Infinity key, false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mapWithKey: ReadonlyMap<float, string> =
        new Map<float, string>([[Double.toFloat(Number.POSITIVE_INFINITY), 'inf']]);
      expect(mapWithKey.has(Double.toFloat(Number.POSITIVE_INFINITY))).assertTrue();
      const mapWithoutKey: ReadonlyMap<float, string> = new Map<float, string>();
      expect(mapWithoutKey.has(Double.toFloat(Number.POSITIVE_INFINITY))).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_5600
     * @tc.name readonlyMapHasPart03Test056
     * @tc.desc Verify K=float ReadonlyMap has() true with NaN key, false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mapWithKey: ReadonlyMap<float, string> = new Map<float, string>([[Double.toFloat(Number.NaN), 'nan']]);
      expect(mapWithKey.has(Double.toFloat(Number.NaN))).assertTrue();
      const mapWithoutKey: ReadonlyMap<float, string> = new Map<float, string>();
      expect(mapWithoutKey.has(Double.toFloat(Number.NaN))).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_5700
     * @tc.name readonlyMapHasPart03Test057
     * @tc.desc Verify K=char ReadonlyMap with 'z' key has() true size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<char, string> = new Map<char, string>([[c'z', 'second']]);
      expect(map.has(c'z')).assertTrue();
      expect(map.size).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_5800
     * @tc.name readonlyMapHasPart03Test058
     * @tc.desc Verify has() false key get() undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      let missingKey: boolean = map.has('noKey');
      expect(missingKey).assertFalse();
      let val: int | undefined = map.get('noKey');
      expect(val).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_5900
     * @tc.name readonlyMapHasPart03Test059
     * @tc.desc Verify delete() nonexistent key returns false and has() false on ReadonlyMap view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1]]);
      const map: ReadonlyMap<string, int> = src;
      let noSuchKeyHas: boolean = map.has('noSuchKey');
      expect(noSuchKeyHas).assertFalse();
      let hasA: boolean = map.has('a');
      expect(hasA).assertTrue();
      let deleteResult: boolean = src.delete('noSuchKey');
      expect(deleteResult).assertFalse();
      let sizeAfterDelete: int = map.size;
      expect(sizeAfterDelete).assertEqual(1);
      let stillNoSuchKey: boolean = map.has('noSuchKey');
      expect(stillNoSuchKey).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_6000
     * @tc.name readonlyMapHasPart03Test060
     * @tc.desc Verify has() true for present keys in 100-entry map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: [int, int][] = [];
      for (let i: int = 0; i < 100; i++) {
        entries.push([i, i * 10]);
      }
      const map: ReadonlyMap<int, int> = new Map<int, int>(entries);
      for (let i: int = 0; i < 100; i++) {
        expect(map.has(i)).assertTrue();
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_6100
     * @tc.name readonlyMapHasPart03Test061
     * @tc.desc Verify ReadonlyMap with odd keys has() even=false odd=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: [int, int][] = [];
      for (let i: int = 0; i < 100; i++) {
        if (i % 2 !== 0) {
          entries.push([i, i]);
        }
      }
      const map: ReadonlyMap<int, int> = new Map<int, int>(entries);
      for (let i: int = 0; i < 100; i++) {
        if (i % 2 === 0) {
          expect(map.has(i)).assertFalse();
        } else {
          expect(map.has(i)).assertTrue();
        }
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_6200
     * @tc.name readonlyMapHasPart03Test062
     * @tc.desc Verify forEach() callback has() true for every visited key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['', 3]]);
      map.forEach((value: int, key: string) => {
        expect(map.has(key)).assertTrue();
      });
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_6300
     * @tc.name readonlyMapHasPart03Test063
     * @tc.desc Verify forEach() callback collects all keys x y z
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 10], ['y', 20], ['z', 30]]);
      let collected: string[] = [];
      map.forEach((value: int, key: string) => {
        collected.push(key);
      });
      for (let i: int = 0; i < collected.length; i++) {
        expect(map.has(collected[i])).assertTrue();
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_6400
     * @tc.name readonlyMapHasPart03Test064
     * @tc.desc Verify forEach() shared key has() true across two maps
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapA: ReadonlyMap<string, int> = new Map<string, int>([['shared', 1], ['onlyA', 2]]);
      let mapB: ReadonlyMap<string, int> = new Map<string, int>([['shared', 99], ['onlyB', 3]]);
      let sharedFound: boolean = false;
      mapA.forEach((value: int, key: string) => {
        if (mapB.has(key)) {
          sharedFound = true;
        }
      });
      expect(sharedFound).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_6500
     * @tc.name readonlyMapHasPart03Test065
     * @tc.desc Verify ReadonlyMap has() false for all keys after underlying Map clear
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['', 3]]);
      const map: ReadonlyMap<string, int> = src;
      expect(map.has('a')).assertTrue();
      expect(map.has('b')).assertTrue();
      expect(map.has('')).assertTrue();
      src.clear();
      expect(map.has('a')).assertFalse();
      expect(map.has('b')).assertFalse();
      expect(map.has('')).assertFalse();
      expect(map.size).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_6600
     * @tc.name readonlyMapHasPart03Test066
     * @tc.desc Verify has get has true get undefined has false get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['exists', 42]]);
      let existsKey: boolean = map.has('exists');
      expect(existsKey).assertTrue();
      let val: int | undefined = map.get('exists');
      expect(val).assertEqual(42);
      let absentKey: boolean = map.has('absent');
      expect(absentKey).assertFalse();
      let missingVal: int | undefined = map.get('absent');
      expect(missingVal).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_6700
     * @tc.name readonlyMapHasPart03Test067
     * @tc.desc Verify K=int V=boolean ReadonlyMap with key 1 has() true, key 0 false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, boolean> = new Map<int, boolean>([[1, false]]);
      expect(map.has(0)).assertFalse();
      expect(map.has(1)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_6800
     * @tc.name readonlyMapHasPart03Test068
     * @tc.desc Verify K=short V=double ReadonlyMap with key -1 value 3.14 has() true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, double> = new Map<short, double>([[-1, 3.14]]);
      expect(map.has(-1)).assertTrue();
      expect(map.get(-1)).assertEqual(3.14);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_6900
     * @tc.name readonlyMapHasPart03Test069
     * @tc.desc Verify K=float V=boolean ReadonlyMap has() true with key, false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mapWithKey: ReadonlyMap<float, boolean> = new Map<float, boolean>([[Double.toFloat(3.14), true]]);
      expect(mapWithKey.has(Double.toFloat(3.14))).assertTrue();
      const mapWithoutKey: ReadonlyMap<float, boolean> = new Map<float, boolean>();
      expect(mapWithoutKey.has(Double.toFloat(3.14))).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_7000
     * @tc.name readonlyMapHasPart03Test070
     * @tc.desc Verify K=string V=Date ReadonlyMap has() true with key, false without
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(500);
      const mapWithKey: ReadonlyMap<string, Date> = new Map<string, Date>([['d', d]]);
      expect(mapWithKey.has('d')).assertTrue();
      const mapWithoutKey: ReadonlyMap<string, Date> = new Map<string, Date>();
      expect(mapWithoutKey.has('d')).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART03_TEST_7100
     * @tc.name readonlyMapHasPart03Test071
     * @tc.desc Verify has() true for all five preset int keys 1..5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> =
        new Map<int, string>([[1, 'one'], [2, 'two'], [3, 'three'], [4, 'four'], [5, 'five']]);
      for (let i: int = 1; i <= 5; i++) {
        expect(map.has(i)).assertTrue();
      }
    });
  });
}
