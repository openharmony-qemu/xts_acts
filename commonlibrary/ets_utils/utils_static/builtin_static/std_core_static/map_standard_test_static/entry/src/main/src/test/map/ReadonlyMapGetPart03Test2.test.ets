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
}

interface ObjKey4 {
  name: string;
}

interface Tag {
  label: string;
}

export default function readonlyMapGetPart03TestTest(): void {
  describe('ReadonlyMapGetPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_0100
     * @tc.name readonlyMapGetPart03Test001
     * @tc.desc Verify get() with int key -1 returns stored value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[-1, 'overflowVal']]);
      let result: string | undefined = map.get(-1);
      expect(result).assertEqual('overflowVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_0200
     * @tc.name readonlyMapGetPart03Test002
     * @tc.desc Verify get() with short.MAX key returns stored value 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, int> = new Map<short, int>([[Int.toShort(32767), 42]]);
      let result: int | undefined = map.get(Int.toShort(32767));
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_0300
     * @tc.name readonlyMapGetPart03Test003
     * @tc.desc Verify get() with float -0.0 key returns stored value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, string> = new Map<float, string>([[Double.toFloat(-0.0), 'negZero']]);
      let result: string | undefined = map.get(Double.toFloat(-0.0));
      expect(result).assertEqual('negZero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_0400
     * @tc.name readonlyMapGetPart03Test004
     * @tc.desc Verify key=0 set get(-1) undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[0, 'zero']]);
      let result: string | undefined = map.get(-1);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_0500
     * @tc.name readonlyMapGetPart03Test005
     * @tc.desc Verify short.MAX key V=string get(32767 as short) string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[Int.toShort(32767), 'shortMax']]);
      let result: string | undefined = map.get(Int.toShort(32767));
      expect(result).assertEqual('shortMax');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_0600
     * @tc.name readonlyMapGetPart03Test006
     * @tc.desc Verify 32767 as short key V=boolean get boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, boolean> = new Map<short, boolean>([[Int.toShort(32767), true]]);
      let result: boolean | undefined = map.get(Int.toShort(32767));
      expect(result!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_0700
     * @tc.name readonlyMapGetPart03Test007
     * @tc.desc Verify get(32767 as short) Map undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, int> = new Map<short, int>();
      let result: int | undefined = map.get(Int.toShort(32767));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_0800
     * @tc.name readonlyMapGetPart03Test008
     * @tc.desc Verify get() with short keys 32767 and 0 returns stored values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([
        [Int.toShort(32767), 'max'],
        [Int.toShort(0), 'zero'],
      ]);
      let maxShortValue: string | undefined = map.get(Int.toShort(32767));
      let zeroShortValue: string | undefined = map.get(Int.toShort(0));
      expect(maxShortValue).assertEqual('max');
      expect(zeroShortValue).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_0900
     * @tc.name readonlyMapGetPart03Test009
     * @tc.desc Verify float -0.0 key V=int get(-0.0 as float)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, int> = new Map<float, int>([[Double.toFloat(-0.0), 42]]);
      let result: int | undefined = map.get(Double.toFloat(-0.0));
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_1000
     * @tc.name readonlyMapGetPart03Test010
     * @tc.desc Verify float -0.0 get(+0.0 as float) SameValueZero: -0===+0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, int> = new Map<float, int>([[Double.toFloat(-0.0), 55]]);
      let result: int | undefined = map.get(Double.toFloat(0.0));
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_1100
     * @tc.name readonlyMapGetPart03Test011
     * @tc.desc Verify set() -0.0 and +0.0 keys collapse size 1 get() same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, int> = new Map<float, int>([
        [Double.toFloat(-0.0), 1],
        [Double.toFloat(0.0), 2],
      ]);
      let sz: int = map.size;
      expect(sz).assertEqual(1);
      expect(map.get(Double.toFloat(0.0))).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_1200
     * @tc.name readonlyMapGetPart03Test012
     * @tc.desc Verify float 1.0 get(-0.0 as float)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, string> = new Map<float, string>([[Double.toFloat(1.0), 'one']]);
      let result: string | undefined = map.get(Double.toFloat(-0.0));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_1300
     * @tc.name readonlyMapGetPart03Test013
     * @tc.desc Verify float -0.0 key V=boolean get boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, boolean> = new Map<float, boolean>([[Double.toFloat(-0.0), false]]);
      let hasNegZeroKey: boolean = map.has(Double.toFloat(-0.0));
      expect(hasNegZeroKey).assertTrue();
      let result: boolean | undefined = map.get(Double.toFloat(-0.0));
      expect(result!).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_1400
     * @tc.name readonlyMapGetPart03Test014
     * @tc.desc Verify set() key with undefined value then get() undefined and has() true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string | undefined> = new Map<string, string | undefined>([
        ['defined', undefined],
      ]);
      let val: string | undefined = map.get('defined');
      let found: boolean = map.has('defined');
      expect(val).assertUndefined();
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_1500
     * @tc.name readonlyMapGetPart03Test015
     * @tc.desc Verify key get undefined has false key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['exists', 1]]);
      let val: int | undefined = map.get('missing');
      let found: boolean = map.has('missing');
      expect(val).assertUndefined();
      expect(found).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_1600
     * @tc.name readonlyMapGetPart03Test016
     * @tc.desc Verify set(key, null) get null undefined has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string | null> = new Map<string, string | null>([['nullKey', null]]);
      let val: string | null | undefined = map.get('nullKey');
      let found: boolean = map.has('nullKey');
      expect(val).assertNull();
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_1700
     * @tc.name readonlyMapGetPart03Test017
     * @tc.desc Verify int key undefined V get undefined has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, int | undefined> = new Map<int, int | undefined>([[999, undefined]]);
      let val: int | undefined = map.get(999);
      let found: boolean = map.has(999);
      expect(val).assertUndefined();
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_1800
     * @tc.name readonlyMapGetPart03Test018
     * @tc.desc Verify new Map<string,int>() set key get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('a', 1);
      let result: int | undefined = map.get('a');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_1900
     * @tc.name readonlyMapGetPart03Test019
     * @tc.desc Verify new Map<string,int>() key get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('dup', 1);
      src.set('dup', 999);
      let result: int | undefined = map.get('dup');
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_2000
     * @tc.name readonlyMapGetPart03Test020
     * @tc.desc Verify new Map<string,string>() set key get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, string> = new Map<string, string>();
      const map: ReadonlyMap<string, string> = src;
      src.set('k1', 'v1');
      src.set('k2', 'v2');
      src.set('k3', 'v3');
      expect(map.get('k1')).assertEqual('v1');
      expect(map.get('k2')).assertEqual('v2');
      expect(map.get('k3')).assertEqual('v3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_2100
     * @tc.name readonlyMapGetPart03Test021
     * @tc.desc Verify get with same-ms different Date reference returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1700000000000);
      let d2: Date = new Date(1700000000000);
      const map: ReadonlyMap<Date, int> = new Map<Date, int>([[d1, 1]]);
      let result: int | undefined = map.get(d2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_2200
     * @tc.name readonlyMapGetPart03Test022
     * @tc.desc Verify get with equal-content different object returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: ObjKey = { id: 1 };
      let o2: ObjKey = { id: 1 };
      const map: ReadonlyMap<ObjKey, int> = new Map<ObjKey, int>([[o1, 10]]);
      let result: int | undefined = map.get(o2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_2300
     * @tc.name readonlyMapGetPart03Test023
     * @tc.desc Verify get with equal-content different Array returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: int[] = [1, 2, 3];
      let arr2: int[] = [1, 2, 3];
      const map: ReadonlyMap<int[], int> = new Map<int[], int>([[arr1, 50]]);
      let result: int | undefined = map.get(arr2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_2400
     * @tc.name readonlyMapGetPart03Test024
     * @tc.desc Verify true V=string get(true) string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 'truthy']]);
      let result: string | undefined = map.get(true);
      expect(result).assertEqual('truthy');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_2500
     * @tc.name readonlyMapGetPart03Test025
     * @tc.desc Verify get() missing boolean false key returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, int> = new Map<boolean, int>([[true, 1]]);
      let result: int | undefined = map.get(false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_2600
     * @tc.name readonlyMapGetPart03Test026
     * @tc.desc Verify emoji key set and get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['😀', 100]]);
      let result: int | undefined = map.get('😀');
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_2700
     * @tc.name readonlyMapGetPart03Test027
     * @tc.desc Verify emoji key set get different emoji undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['😀', 1]]);
      let result: int | undefined = map.get('😂');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_2800
     * @tc.name readonlyMapGetPart03Test028
     * @tc.desc Verify CJK Japanese key set and get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string> = new Map<string, string>([['日本語', 'japanese']]);
      let result: string | undefined = map.get('日本語');
      expect(result).assertEqual('japanese');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_2900
     * @tc.name readonlyMapGetPart03Test029
     * @tc.desc Verify mixed Unicode emoji CJK string key get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string> = new Map<string, string>([['hello😀日本語', 'mixed']]);
      let result: string | undefined = map.get('hello😀日本語');
      expect(result).assertEqual('mixed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_3000
     * @tc.name readonlyMapGetPart03Test030
     * @tc.desc Verify new Map() duplicate key dedupes size and get() last value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([
        ['x', 1],
        ['y', 2],
        ['x', 3],
      ]);
      expect(map.size).assertEqual(2);
      expect(map.get('x')).assertEqual(3);
      expect(map.get('y')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_3100
     * @tc.name readonlyMapGetPart03Test031
     * @tc.desc Verify new Map with duplicate keys get uniq returns 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([
        ['dup', 1],
        ['uniq', 5],
        ['dup', 99],
      ]);
      let result: int | undefined = map.get('uniq');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_3200
     * @tc.name readonlyMapGetPart03Test032
     * @tc.desc Verify Map size=0 get string key undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      expect(map.size).assertEqual(0);
      let result: int | undefined = map.get('anything');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_3300
     * @tc.name readonlyMapGetPart03Test033
     * @tc.desc Verify set int key MAX get string value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>();
      const map: ReadonlyMap<int, string> = src;
      src.set(2147483647, 'max_val');
      let result: string | undefined = map.get(2147483647);
      expect(result).assertEqual('max_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_3400
     * @tc.name readonlyMapGetPart03Test034
     * @tc.desc Verify set long key MAX get int value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<long, int> = new Map<long, int>();
      const map: ReadonlyMap<long, int> = src;
      const lKey: long = 9223372036854775807;
      src.set(lKey, 100);
      let result: int | undefined = map.get(lKey);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_3500
     * @tc.name readonlyMapGetPart03Test035
     * @tc.desc Verify set double key NaN get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<double, string> = new Map<double, string>();
      const map: ReadonlyMap<double, string> = src;
      src.set(Number.NaN, 'nan_val');
      let result: string | undefined = map.get(Number.NaN);
      expect(result).assertEqual('nan_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_3600
     * @tc.name readonlyMapGetPart03Test036
     * @tc.desc Verify RegExp key set get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<RegExp, int> = new Map<RegExp, int>();
      const map: ReadonlyMap<RegExp, int> = src;
      let r: RegExp = new RegExp('test', 'g');
      src.set(r, 900);
      let result: int | undefined = map.get(r);
      expect(result).assertEqual(900);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_3700
     * @tc.name readonlyMapGetPart03Test037
     * @tc.desc Verify ReadonlyMap alias set() overwrite keeps size and get() returns new value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>();
      const map: ReadonlyMap<int, string> = src;
      src.set(42, 'old');
      let szBefore: int = map.size;
      src.set(42, 'new');
      let szAfter: int = map.size;
      expect(szAfter).assertEqual(szBefore);
      expect(map.get(42)).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_3800
     * @tc.name readonlyMapGetPart03Test038
     * @tc.desc Verify Date key overwrite v1 v2 then get returns v2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<Date, string> = new Map<Date, string>();
      const map: ReadonlyMap<Date, string> = src;
      let d: Date = new Date(5000);
      src.set(d, 'v1');
      src.set(d, 'v2');
      let result: string | undefined = map.get(d);
      expect(result).assertEqual('v2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_3900
     * @tc.name readonlyMapGetPart03Test039
     * @tc.desc Verify emoji Unicode string key overwrite get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('😀', 10);
      src.set('😀', 20);
      let result: int | undefined = map.get('😀');
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_4000
     * @tc.name readonlyMapGetPart03Test040
     * @tc.desc Verify delete string key get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('target', 777);
      let deleted: boolean = src.delete('target');
      expect(deleted).assertTrue();
      let result: int | undefined = map.get('target');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_4100
     * @tc.name readonlyMapGetPart03Test041
     * @tc.desc Verify delete int key get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>();
      const map: ReadonlyMap<int, string> = src;
      src.set(99, 'ninety_nine');
      src.delete(99);
      let result: string | undefined = map.get(99);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_4200
     * @tc.name readonlyMapGetPart03Test042
     * @tc.desc Verify delete long key get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<long, int> = new Map<long, int>();
      const map: ReadonlyMap<long, int> = src;
      src.set(Int.toLong(100), 100);
      src.delete(Int.toLong(100));
      let result: int | undefined = map.get(Int.toLong(100));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_4300
     * @tc.name readonlyMapGetPart03Test043
     * @tc.desc Verify delete boolean key get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<boolean, int> = new Map<boolean, int>();
      const map: ReadonlyMap<boolean, int> = src;
      src.set(false, 0);
      src.delete(false);
      let result: int | undefined = map.get(false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_4400
     * @tc.name readonlyMapGetPart03Test044
     * @tc.desc Verify delete key get undefined size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('only', 1);
      let szBefore: int = map.size;
      let deleted: boolean = src.delete('ghost');
      expect(deleted).assertFalse();
      expect(map.size).assertEqual(szBefore);
      let result: int | undefined = map.get('ghost');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_4500
     * @tc.name readonlyMapGetPart03Test045
     * @tc.desc Verify delete Date key get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<Date, int> = new Map<Date, int>();
      const map: ReadonlyMap<Date, int> = src;
      let d: Date = new Date(3000);
      src.set(d, 300);
      src.delete(d);
      let result: int | undefined = map.get(d);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_4600
     * @tc.name readonlyMapGetPart03Test046
     * @tc.desc Verify clear size 0 get key undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>();
      const map: ReadonlyMap<int, string> = src;
      src.set(1, 'a');
      src.set(2, 'b');
      src.clear();
      expect(map.size).assertEqual(0);
      expect(map.get(1)).assertUndefined();
      expect(map.get(2)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_4700
     * @tc.name readonlyMapGetPart03Test047
     * @tc.desc Verify get missing key keeps size unchanged and returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('a', 1);
      let v: int | undefined = map.get('missing');
      expect(v).assertUndefined();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_4800
     * @tc.name readonlyMapGetPart03Test048
     * @tc.desc Verify get missing key keeps has false and returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      let v: int | undefined = map.get('absent');
      expect(v).assertUndefined();
      expect(map.has('absent')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_4900
     * @tc.name readonlyMapGetPart03Test049
     * @tc.desc Verify get returns both key values and keys() order preserved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('first', 1);
      src.set('second', 2);
      let iter: IterableIterator<string> = map.keys();
      let vFirst: int | undefined = map.get('first');
      let vSecond: int | undefined = map.get('second');
      let nextResult: IteratorResult<string> = iter.next();
      expect(nextResult.value).assertEqual('first');
      expect(vFirst).assertEqual(1);
      expect(vSecond).assertEqual(2);
      let nextResult2: IteratorResult<string> = iter.next();
      let secondKey: string | undefined = nextResult2.value;
      expect(secondKey).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_5000
     * @tc.name readonlyMapGetPart03Test050
     * @tc.desc Verify has true string key get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('valid', 55);
      expect(map.has('valid')).assertTrue();
      let v: int | undefined = map.get('valid');
      expect(v).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_5100
     * @tc.name readonlyMapGetPart03Test051
     * @tc.desc Verify has true int key get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>();
      const map: ReadonlyMap<int, string> = src;
      src.set(123, 'exists');
      expect(map.has(123)).assertTrue();
      let v: string | undefined = map.get(123);
      expect(v).assertEqual('exists');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_5200
     * @tc.name readonlyMapGetPart03Test052
     * @tc.desc Verify has true long key get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<long, int> = new Map<long, int>();
      const map: ReadonlyMap<long, int> = src;
      src.set(Int.toLong(999), 999);
      expect(map.has(Int.toLong(999))).assertTrue();
      let v: int | undefined = map.get(Int.toLong(999));
      expect(v).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_5300
     * @tc.name readonlyMapGetPart03Test053
     * @tc.desc Verify has false key get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('present', 1);
      expect(map.has('absent')).assertFalse();
      let v: int | undefined = map.get('absent');
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_5400
     * @tc.name readonlyMapGetPart03Test054
     * @tc.desc Verify RegExp key delete get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<RegExp, int> = new Map<RegExp, int>();
      const map: ReadonlyMap<RegExp, int> = src;
      let r: RegExp = new RegExp('del', 'g');
      src.set(r, 77);
      src.delete(r);
      let result: int | undefined = map.get(r);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_5500
     * @tc.name readonlyMapGetPart03Test055
     * @tc.desc Verify object key delete get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<ObjKey4, int> = new Map<ObjKey4, int>();
      const map: ReadonlyMap<ObjKey4, int> = src;
      let obj: ObjKey4 = { name: 'target' };
      src.set(obj, 50);
      src.delete(obj);
      let result: int | undefined = map.get(obj);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_5600
     * @tc.name readonlyMapGetPart03Test056
     * @tc.desc Verify empty-string key V=int get('') returns 999
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('', 999);
      let result: int | undefined = map.get('');
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_5700
     * @tc.name readonlyMapGetPart03Test057
     * @tc.desc Verify empty-string and ZWSP keys distinct get returns each
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsp: string = '\u200b';
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('', 10);
      src.set(zwsp, 20);
      let emptyKeyValue: int | undefined = map.get('');
      let zwspKeyValue: int | undefined = map.get(zwsp);
      expect(emptyKeyValue!).assertEqual(10);
      expect(zwspKeyValue!).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_5800
     * @tc.name readonlyMapGetPart03Test058
     * @tc.desc Verify float NaN key absent from Map get undefined and has false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<float, string> = new Map<float, string>();
      const map: ReadonlyMap<float, string> = src;
      src.set(Double.toFloat(1.0), 'one');
      src.set(Double.toFloat(2.0), 'two');
      let result: string | undefined = map.get(Double.toFloat(Number.NaN));
      expect(result).assertUndefined();
      let nanPresent: boolean = map.has(Double.toFloat(Number.NaN));
      expect(nanPresent).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_5900
     * @tc.name readonlyMapGetPart03Test059
     * @tc.desc Verify double key=Infinity V=string get string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<double, string> = new Map<double, string>();
      const map: ReadonlyMap<double, string> = src;
      src.set(Number.POSITIVE_INFINITY, 'posInf');
      let result: string | undefined = map.get(Number.POSITIVE_INFINITY);
      expect(result).assertEqual('posInf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_6000
     * @tc.name readonlyMapGetPart03Test060
     * @tc.desc Verify double key=Infinity Map double key=-Infinity get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<double, string> = new Map<double, string>();
      const map: ReadonlyMap<double, string> = src;
      src.set(-Number.POSITIVE_INFINITY, 'negInf');
      let result: string | undefined = map.get(Number.POSITIVE_INFINITY);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_6100
     * @tc.name readonlyMapGetPart03Test061
     * @tc.desc Verify object key V=Array<int> get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<Tag, Array<int>> = new Map<Tag, Array<int>>();
      const map: ReadonlyMap<Tag, Array<int>> = src;
      let obj: Tag = { label: 'arr' };
      let arr: int[] = [1, 2, 3];
      src.set(obj, arr);
      let result: Array<int> | undefined = map.get(obj);
      expect(result!.length).assertEqual(3);
      expect(result![0]).assertEqual(1);
      expect(result![1]).assertEqual(2);
      expect(result![2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_6200
     * @tc.name readonlyMapGetPart03Test062
     * @tc.desc Verify entries() iteration yields key-value pairs apple/1 banana/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([
        ['apple', 1],
        ['banana', 2],
      ]);
      let keys: string[] = [];
      let vals: int[] = [];
      let eit: IterableIterator<[string, int]> = map.entries();
      let item: IteratorResult<[string, int]> = eit.next();
      let guard: int = 0;
      while (!item.done) {
        let pair: [string, int] = item.value!;
        keys.push(pair[0]);
        vals.push(pair[1]);
        item = eit.next();
        guard++;
        if (guard > 2) {
          break;
        }
      }
      expect(keys.length).assertEqual(2);
      expect(map.get(keys[0])).assertEqual(vals[0]);
      expect(map.get(keys[1])).assertEqual(vals[1]);
      expect(keys[0]).assertEqual('apple');
      expect(vals[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_6300
     * @tc.name readonlyMapGetPart03Test063
     * @tc.desc Verify emoji key V=double get double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, double> = new Map<string, double>();
      const map: ReadonlyMap<string, double> = src;
      src.set('😀', -0.0);
      let result: double | undefined = map.get('😀');
      expect(1.0 / result!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_6400
     * @tc.name readonlyMapGetPart03Test064
     * @tc.desc Verify double key=Infinity double key=-Infinity get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<double, int> = new Map<double, int>();
      const map: ReadonlyMap<double, int> = src;
      src.set(Number.POSITIVE_INFINITY, 1);
      src.set(-Number.POSITIVE_INFINITY, -1);
      let posInfValue: int | undefined = map.get(Number.POSITIVE_INFINITY);
      let negInfValue: int | undefined = map.get(-Number.POSITIVE_INFINITY);
      expect(posInfValue!).assertEqual(1);
      expect(negInfValue!).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_6500
     * @tc.name readonlyMapGetPart03Test065
     * @tc.desc Verify entries key get entry value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('m', 5);
      src.set('n', 6);
      let iter: IterableIterator<[string, int]> = map.entries();
      let entry: IteratorResult<[string, int]> = iter.next();
      let guard: int = 0;
      while (!entry.done) {
        let pair: [string, int] | undefined = entry.value;
        if (pair !== undefined) {
          let v: int | undefined = map.get(pair[0]);
          expect(v).assertEqual(pair[1]);
        }
        entry = iter.next();
        guard++;
        if (guard > 2) {
          break;
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_6600
     * @tc.name readonlyMapGetPart03Test066
     * @tc.desc Verify long key -1 long key 1 get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<long, int> = new Map<long, int>();
      const map: ReadonlyMap<long, int> = src;
      src.set(Int.toLong(-1), 100);
      src.set(Int.toLong(1), 200);
      let minusOneValue: int | undefined = map.get(Int.toLong(-1));
      let plusOneValue: int | undefined = map.get(Int.toLong(1));
      expect(minusOneValue!).assertEqual(100);
      expect(plusOneValue!).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_6700
     * @tc.name readonlyMapGetPart03Test067
     * @tc.desc Verify keys() iteration then get() returns each stored value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('p', 10);
      src.set('q', 20);
      src.set('r', 30);
      let iter: IterableIterator<string> = map.keys();
      let entry: IteratorResult<string> = iter.next();
      let guard: int = 0;
      while (!entry.done) {
        const kv = entry.value;
        let v: int | undefined = kv !== undefined ? map.get(kv) : undefined;
        let expectedVal: int = 0;
        if (kv === 'p') {
          expectedVal = 10;
        } else if (kv === 'q') {
          expectedVal = 20;
        } else {
          expectedVal = 30;
        }
        expect(v).assertEqual(expectedVal);
        entry = iter.next();
        guard++;
        if (guard > 3) {
          break;
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_6800
     * @tc.name readonlyMapGetPart03Test068
     * @tc.desc Verify forEach get other key returns its value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('alpha', 1);
      src.set('beta', 2);
      map.forEach((value: int, key: string): void => {
        let other: string = key === 'alpha' ? 'beta' : 'alpha';
        let v: int | undefined = map.get(other);
        expect(v).assertEqual(other === 'alpha' ? 1 : 2);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_6900
     * @tc.name readonlyMapGetPart03Test069
     * @tc.desc Verify long key -1 V=string get string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<long, string> = new Map<long, string>();
      const map: ReadonlyMap<long, string> = src;
      src.set(Int.toLong(-1), 'longNegOne');
      let result: string | undefined = map.get(Int.toLong(-1));
      expect(result).assertEqual('longNegOne');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_7000
     * @tc.name readonlyMapGetPart03Test070
     * @tc.desc Verify distinct Array references as keys size 2 get() each
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: int[] = [1, 2, 3];
      let arr2: int[] = [1, 2, 3];
      const map: ReadonlyMap<int[], int> = new Map<int[], int>([
        [arr1, 10],
        [arr2, 20],
      ]);
      expect(map.size).assertEqual(2);
      expect(map.get(arr1)).assertEqual(10);
      expect(map.get(arr2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_7100
     * @tc.name readonlyMapGetPart03Test071
     * @tc.desc Verify ReadonlyMap alias clear() then set() get() returns new value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, string> = new Map<string, string>([['rebirth', 'old']]);
      const map: ReadonlyMap<string, string> = src;
      src.clear();
      src.set('rebirth', 'new');
      let result: string | undefined = map.get('rebirth');
      expect(result).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_7200
     * @tc.name readonlyMapGetPart03Test072
     * @tc.desc Verify set short key MIN get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<short, string> = new Map<short, string>();
      const map: ReadonlyMap<short, string> = src;
      src.set(-32768, 'short_min');
      let result: string | undefined = map.get(-32768);
      expect(result).assertEqual('short_min');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_7300
     * @tc.name readonlyMapGetPart03Test073
     * @tc.desc Verify get(key, def) with existing key returns stored value and type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['x', 127]]);
      const map: ReadonlyMap<string, int> = src;
      let result: int = map.get('x', 0);
      let valueTypeName: string = typeof result;
      let expectedTypeName: string = 'int';
      expect(valueTypeName).assertEqual(expectedTypeName);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_GET_PART03_TEST_7400
     * @tc.name readonlyMapGetPart03Test074
     * @tc.desc Verify get(key, def) with missing key returns default value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapGetPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('present', 5);
      let result: int = map.get('missing', 42);
      expect(result).assertEqual(42);
      let presentValue: int = map.get('present', 42);
      expect(presentValue).assertEqual(5);
    });
  });
}
