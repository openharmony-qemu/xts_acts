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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

enum SizeLong {
  SMALL = 0,
  MEDIUM = 5000,
  LARGE = 10000,
}

enum StatusStr2 {
  EMPTY = '',
  ACTIVE = 'active',
}

enum Kind {
  A = 1,
}

interface ItemData {
  id: int;
  label: string;
}

export default function recordIndexSetPart03TestTest(): void {
  describe('RecordIndexSetPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_0100
     * @tc.name recordIndexSetPart03Test001
     * @tc.desc Verify $_set int key 127 (byte.MAX) with value 999 then $_get returns 999
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(127, 999);
      let result: int | undefined = record.$_get(127);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_0200
     * @tc.name recordIndexSetPart03Test002
     * @tc.desc Verify $_set int key -128 (byte.MIN) then $_get returns 888
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(-128, 888);
      expect(record.has(-128)).assertTrue();
      let result: int | undefined = record.$_get(-128);
      expect(result).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_0300
     * @tc.name recordIndexSetPart03Test003
     * @tc.desc Verify K=int $_set key=int.MAX then $_get returns value and size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(2147483647, 777);
      let result: int | undefined = record.$_get(2147483647);
      expect(result).assertEqual(777);
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_0400
     * @tc.name recordIndexSetPart03Test004
     * @tc.desc Verify $_set double key Number.POSITIVE_INFINITY then $_get returns 111
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, int> = new Record<double, int>();
      record.$_set(Number.POSITIVE_INFINITY, 111);
      let result: int | undefined = record.$_get(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_0500
     * @tc.name recordIndexSetPart03Test005
     * @tc.desc Verify $_set -0.0 and 0.0 keys collapse to one entry with 444
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, int> = new Record<double, int>();
      record.$_set(-0.0, 333);
      record.$_set(0.0, 444);
      let resultNeg: int | undefined = record.$_get(-0.0);
      let resultPos: int | undefined = record.$_get(0.0);
      let recordSize: int = record.size;
      let expectedSize: int = 1;
      expect(recordSize).assertEqual(expectedSize);
      expect(resultNeg).assertEqual(444);
      expect(resultPos).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_0600
     * @tc.name recordIndexSetPart03Test006
     * @tc.desc Verify $_set double key Number.EPSILON then $_get returns 555
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, int> = new Record<double, int>();
      record.$_set(Number.EPSILON, 555);
      let result: int | undefined = record.$_get(Number.EPSILON);
      expect(result).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_0700
     * @tc.name recordIndexSetPart03Test007
     * @tc.desc Verify $_set empty-string key '' then $_get returns value and size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('', 111);
      record.$_set('other', 222);
      let result: int | undefined = record.$_get('');
      expect(result).assertEqual(111);
      expect(record.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_0800
     * @tc.name recordIndexSetPart03Test008
     * @tc.desc Verify K=string $_set key=Unicode emoji then has() true and $_get returns 77
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('😀', 77);
      expect(record.has('😀')).assertTrue();
      let result: int | undefined = record.$_get('😀');
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_0900
     * @tc.name recordIndexSetPart03Test009
     * @tc.desc Verify $_set XSS string key twice then $_get returns last value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      let xssKey: string = '<script>alert(1)</script>';
      record.$_set(xssKey, 555);
      record.$_set(xssKey, 777);
      let result: int | undefined = record.$_get(xssKey);
      expect(result).assertEqual(777);
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_1000
     * @tc.name recordIndexSetPart03Test010
     * @tc.desc Verify $_set 10000-char key then $_get returns 999
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      let longKey: string = 'a'.repeat(10000);
      record.$_set(longKey, 999);
      let result: int | undefined = record.$_get(longKey);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_1100
     * @tc.name recordIndexSetPart03Test011
     * @tc.desc Verify $_set() SizeLong enum MEDIUM key (int base) overwrite then $_get() last value size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(SizeLong.MEDIUM, 1);
      record.$_set(SizeLong.MEDIUM, 100);
      let result: int | undefined = record.$_get(SizeLong.MEDIUM);
      expect(result).assertEqual(100);
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_1200
     * @tc.name recordIndexSetPart03Test012
     * @tc.desc Verify $_set() StatusStr2 enum keys (string base) then $_get() values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set(StatusStr2.EMPTY, 0);
      record.$_set(StatusStr2.ACTIVE, 1);
      let resultEmpty: int | undefined = record.$_get(StatusStr2.EMPTY);
      let resultActive: int | undefined = record.$_get(StatusStr2.ACTIVE);
      expect(resultEmpty).assertEqual(0);
      expect(resultActive).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_1300
     * @tc.name recordIndexSetPart03Test013
     * @tc.desc Verify V=string Unicode emoji $_set value $_get returns emoji
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set('emojiVal', '😀');
      let result: string | undefined = record.$_get('emojiVal');
      expect(result).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_1400
     * @tc.name recordIndexSetPart03Test014
     * @tc.desc Verify V=string|null, $_set null value null $_get null size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string | null> = new Record<string, string | null>();
      record.$_set('key', 'original');
      record.$_set('key', null);
      let result: string | null | undefined = record.$_get('key');
      expect(result).assertNull();
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_1500
     * @tc.name recordIndexSetPart03Test015
     * @tc.desc Verify V=string|null, $_set null Record key $_get null size=1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string | null> = new Record<string, string | null>();
      record.$_set('nullKey', null);
      let result: string | null | undefined = record.$_get('nullKey');
      expect(result).assertNull();
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_1600
     * @tc.name recordIndexSetPart03Test016
     * @tc.desc Verify V=string|null, $_set null then $_set restored, $_get returns restored
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string | null> = new Record<string, string | null>();
      record.$_set('key', null);
      record.$_set('key', 'restored');
      let result: string | null | undefined = record.$_get('key');
      expect(result).assertEqual('restored');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_1700
     * @tc.name recordIndexSetPart03Test017
     * @tc.desc Verify V=int|null, $_set null value $_get null has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int | null> = new Record<string, int | null>();
      record.$_set('intNullKey', null);
      expect(record.has('intNullKey')).assertTrue();
      let result: int | null | undefined = record.$_get('intNullKey');
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_1800
     * @tc.name recordIndexSetPart03Test018
     * @tc.desc Verify V=string|undefined, $_set undefined value $_get undefined size=1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string | undefined> = new Record<string, string | undefined>();
      record.$_set('undefKey', undefined);
      expect(record.has('undefKey')).assertTrue();
      let result: string | undefined = record.$_get('undefKey');
      expect(result).assertUndefined();
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_1900
     * @tc.name recordIndexSetPart03Test019
     * @tc.desc Verify $_set undefined value overwrites original then size 1 $_get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string | undefined> = new Record<string, string | undefined>();
      record.$_set('key', 'original');
      record.$_set('key', undefined);
      let result: string | undefined = record.$_get('key');
      expect(result).assertUndefined();
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_2000
     * @tc.name recordIndexSetPart03Test020
     * @tc.desc Verify V=string|undefined, $_set undefined then $_set definedAgain, $_get definedAgain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string | undefined> = new Record<string, string | undefined>();
      record.$_set('key', undefined);
      record.$_set('key', 'definedAgain');
      let result: string | undefined = record.$_get('key');
      expect(result).assertEqual('definedAgain');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_2100
     * @tc.name recordIndexSetPart03Test021
     * @tc.desc Verify V=int|undefined $_set undefined value has true get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int | undefined> = new Record<string, int | undefined>();
      record.$_set('existsUndef', undefined);
      expect(record.has('existsUndef')).assertTrue();
      let result: int | undefined = record.$_get('existsUndef');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_2200
     * @tc.name recordIndexSetPart03Test022
     * @tc.desc Verify V=Date $_set Date value $_get returns same reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Date> = new Record<string, Date>();
      let d: Date = new Date(2024, 0, 1);
      record.$_set('dateKey', d);
      let result: Date | undefined = record.$_get('dateKey');
      expect(result).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_2300
     * @tc.name recordIndexSetPart03Test023
     * @tc.desc Verify Record $_set Date value mutation propagates (reference semantics)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Date> = new Record<string, Date>();
      let d: Date = new Date(2024, 5, 15);
      record.$_set('dateKey', d);
      d.setFullYear(2025);
      let result: Date = record.$_get('dateKey')!;
      expect(result.getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_2400
     * @tc.name recordIndexSetPart03Test024
     * @tc.desc Verify V=int[], $_set Array value $_get Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int[]> = new Record<string, int[]>();
      let arr: int[] = [1, 2, 3];
      record.$_set('arrKey', arr);
      let result: int[] | undefined = record.$_get('arrKey');
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_2500
     * @tc.name recordIndexSetPart03Test025
     * @tc.desc Verify Record $_set Array value mutation propagates (reference semantics)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int[]> = new Record<string, int[]>();
      let arr: int[] = [10, 20, 30];
      record.$_set('arrKey', arr);
      arr[1] = 999;
      let result: int[] = record.$_get('arrKey')!;
      expect(result[1]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_2600
     * @tc.name recordIndexSetPart03Test026
     * @tc.desc Verify Record size=0 $_set key size=1, has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      expect(record.size).assertEqual(0);
      record.$_set('onlyKey', 42);
      expect(record.size).assertEqual(1);
      expect(record.has('onlyKey')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_2700
     * @tc.name recordIndexSetPart03Test027
     * @tc.desc Verify $_set same key same value twice then size equals 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(1, 'same');
      record.$_set(1, 'same');
      expect(record.size).assertEqual(1);
      let result: string | undefined = record.$_get(1);
      expect(result).assertEqual('same');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_2800
     * @tc.name recordIndexSetPart03Test028
     * @tc.desc Verify $_set three string keys a b c each value 42 then size 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 42);
      record.$_set('b', 42);
      record.$_set('c', 42);
      expect(record.size).assertEqual(3);
      expect(record.$_get('a')).assertEqual(42);
      expect(record.$_get('b')).assertEqual(42);
      expect(record.$_get('c')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_2900
     * @tc.name recordIndexSetPart03Test029
     * @tc.desc Verify $_set() NaN key three times overwrites to last value 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, int> = new Record<double, int>();
      record.$_set(Number.NaN, 1);
      record.$_set(Number.NaN, 2);
      record.$_set(Number.NaN, 3);
      let result: int | undefined = record.$_get(Number.NaN);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_3000
     * @tc.name recordIndexSetPart03Test030
     * @tc.desc Verify $_set NaN key and 0.0 key coexist as two entries size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, int> = new Record<double, int>();
      record.$_set(Number.NaN, 111);
      record.$_set(0.0, 222);
      expect(record.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_3100
     * @tc.name recordIndexSetPart03Test031
     * @tc.desc Verify Record<double,double> $_set 42 then overwrite NaN $_get is NaN size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, double> = new Record<double, double>();
      record.$_set(2.5, 42);
      record.$_set(2.5, Number.NaN);
      let result: double = record.$_get(2.5)!;
      let resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_3200
     * @tc.name recordIndexSetPart03Test032
     * @tc.desc Verify $_set 99 int keys -49..49 then size equals 99
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      for (let i = -49; i < 50; i++) {
        record.$_set(i, i);
      }
      expect(record.size).assertEqual(99);
      expect(record.has(-49)).assertTrue();
      expect(record.has(49)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_3300
     * @tc.name recordIndexSetPart03Test033
     * @tc.desc Verify K=string '' $_set then delete then $_get undefined size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set('', 'emptyVal');
      record.delete('');
      let result: string | undefined = record.$_get('');
      expect(result).assertUndefined();
      expect(record.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_3400
     * @tc.name recordIndexSetPart03Test034
     * @tc.desc Verify Record<K=int base of Kind enum, V=int> $_set $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(Kind.A, 100);
      let result: int | undefined = record.$_get(Kind.A);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_3500
     * @tc.name recordIndexSetPart03Test035
     * @tc.desc Verify K=string, V=long $_set(long.MAX value) size=0, size=1, $_get long.MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, long> = new Record<string, long>();
      expect(record.size).assertEqual(0);
      const LONG_MAX: long = 9223372036854775807;
      record.$_set('lmaxKey', LONG_MAX);
      expect(record.size).assertEqual(1);
      let result: long | undefined = record.$_get('lmaxKey');
      expect(result).assertEqual(LONG_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_3600
     * @tc.name recordIndexSetPart03Test036
     * @tc.desc Verify K=double, V=string $_set(-Infinity double key) size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, string> = new Record<double, string>();
      let szBefore: int = record.size;
      record.$_set(-Number.POSITIVE_INFINITY, 'negInfKey');
      let szAfter: int = record.size;
      expect(szAfter).assertEqual(szBefore + 1);
      let result: string | undefined = record.$_get(-Number.POSITIVE_INFINITY);
      expect(result).assertEqual('negInfKey');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_3700
     * @tc.name recordIndexSetPart03Test037
     * @tc.desc Verify K=string, V=Array<string> $_set $_get undefined, $_set Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Array<string>> = new Record<string, Array<string>>();
      let before: Array<string> | undefined = record.$_get('arrKey');
      expect(before).assertUndefined();
      let arr: Array<string> = ['x', 'y', 'z'];
      record.$_set('arrKey', arr);
      let after: Array<string> | undefined = record.$_get('arrKey');
      expect(after).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_3800
     * @tc.name recordIndexSetPart03Test038
     * @tc.desc Verify $_set() new int key increments size from 2 to 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, long> = new Record<int, long>();
      record.$_set(1, Int.toLong(10));
      record.$_set(2, Int.toLong(20));
      let szBefore: int = record.size;
      record.$_set(3, Int.toLong(30));
      let szAfter: int = record.size;
      expect(szAfter).assertEqual(szBefore + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_3900
     * @tc.name recordIndexSetPart03Test039
     * @tc.desc Verify K=int V=double $_set key and keys() iteration finds key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, double> = new Record<int, double>();
      record.$_set(99, 9.9);
      let found: boolean = false;
      let kit: IterableIterator<int> = record.keys();
      let item: IteratorResult<int> = kit.next();
      while (!item.done) {
        if (item.value === 99) {
          found = true;
        }
        item = kit.next();
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_4000
     * @tc.name recordIndexSetPart03Test040
     * @tc.desc Verify K=int, V=int $_set(int.MIN key, int.MAX value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      expect(record.has(-2147483648)).assertFalse();
      record.$_set(-2147483648, 2147483647);
      expect(record.has(-2147483648)).assertTrue();
      let val: int | undefined = record.$_get(-2147483648);
      expect(val).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_4100
     * @tc.name recordIndexSetPart03Test041
     * @tc.desc Verify $_set() short.MAX key with Array reference then mutation visible via $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<short, Array<int>> = new Record<short, Array<int>>();
      let arr: Array<int> = [5, 10, 15];
      record.$_set(Int.toShort(32767), arr);
      expect(record.$_get(Int.toShort(32767)) === arr).assertTrue();
      arr[1] = 888;
      let result: Array<int> = record.$_get(Int.toShort(32767))!;
      expect(result[1]).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_4200
     * @tc.name recordIndexSetPart03Test042
     * @tc.desc Verify $_set Set reference then added element visible via $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Set<int>> = new Record<string, Set<int>>();
      let s: Set<int> = new Set<int>();
      s.add(100);
      record.$_set('sharedSet', s);
      s.add(200);
      let result: Set<int> = record.$_get('sharedSet')!;
      expect(result.has(200)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_4300
     * @tc.name recordIndexSetPart03Test043
     * @tc.desc Verify $_set nested Map reference then inner mutation visible via $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Map<string, int>> = new Record<string, Map<string, int>>();
      let inner: Map<string, int> = new Map<string, int>();
      inner.set('a', 1);
      record.$_set('nested', inner);
      inner.set('b', 2);
      let result: Map<string, int> = record.$_get('nested')!;
      expect(result.has('b')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_4400
     * @tc.name recordIndexSetPart03Test044
     * @tc.desc Verify $_set() object reference stored reflects mutation via $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, ItemData> = new Record<string, ItemData>();
      let item: ItemData = { id: 1, label: 'original' };
      record.$_set('itemRef', item);
      item.label = 'modified';
      let result: ItemData = record.$_get('itemRef')!;
      expect(result.label).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_4500
     * @tc.name recordIndexSetPart03Test045
     * @tc.desc Verify $_set shared Array under two keys mutation visible in both
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Array<int>> = new Record<string, Array<int>>();
      let shared: Array<int> = [1, 2, 3];
      record.$_set('a', shared);
      record.$_set('b', shared);
      let viaA: Array<int> = record.$_get('a')!;
      viaA[0] = 999;
      let viaB: Array<int> = record.$_get('b')!;
      expect(viaB[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_4600
     * @tc.name recordIndexSetPart03Test046
     * @tc.desc Verify $_set() int 0 and 1 keys stored, forEach visits both entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(0, 1);
      record.$_set(1, 2);
      expect(record.size).assertEqual(2);
      let sum: int = 0;
      record.forEach((value: int, key: int): void => {
        sum = sum + value;
      });
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_4700
     * @tc.name recordIndexSetPart03Test047
     * @tc.desc Verify $_set long.MAX then overwrite to long.MIN then $_get returns long.MIN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, long> = new Record<string, long>();
      const LONG_MAX: long = 9223372036854775807;
      const LONG_MIN: long = -9223372036854775807 - 1;
      record.$_set('rangeKey', LONG_MAX);
      record.$_set('rangeKey', LONG_MIN);
      let result: long | undefined = record.$_get('rangeKey');
      expect(result).assertEqual(LONG_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_4800
     * @tc.name recordIndexSetPart03Test048
     * @tc.desc Verify $_set three int keys 501 502 503 incl long.MIN value then $_get each
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, long> = new Record<int, long>();
      const LONG_MIN: long = -9223372036854775807 - 1;
      record.$_set(501, Int.toLong(501));
      record.$_set(502, LONG_MIN);
      record.$_set(503, Int.toLong(503));
      expect(record.$_get(501)).assertEqual(Int.toLong(501));
      expect(record.$_get(502)).assertEqual(LONG_MIN);
      expect(record.$_get(503)).assertEqual(Int.toLong(503));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_4900
     * @tc.name recordIndexSetPart03Test049
     * @tc.desc Verify $_set NaN key with float value then $_get returns float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, double> = new Record<double, double>();
      record.$_set(Number.NaN, 3.75);
      expect(record.$_get(Number.NaN)).assertEqual(3.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_5000
     * @tc.name recordIndexSetPart03Test050
     * @tc.desc Verify empty Record forEach callback not invoked then $_set key size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      let callbackCalled: boolean = false;
      record.forEach((value: int, key: string): void => {
        callbackCalled = true;
      });
      expect(callbackCalled).assertFalse();
      record.$_set('after', 1);
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_5100
     * @tc.name recordIndexSetPart03Test051
     * @tc.desc Verify $_set() Number.MAX_VALUE then $_get() returns MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, double> = new Record<string, double>();
      record.$_set('maxNumVal', Number.MAX_VALUE);
      let result: double | undefined = record.$_get('maxNumVal');
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_5200
     * @tc.name recordIndexSetPart03Test052
     * @tc.desc Verify K=byte key=byte.MAX(127) $_set then $_get returns boolean value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<byte, boolean> = new Record<byte, boolean>();
      record.$_set(Int.toByte(127), true);
      expect(record.has(Int.toByte(127))).assertTrue();
      let result: boolean | undefined = record.$_get(Int.toByte(127));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_5300
     * @tc.name recordIndexSetPart03Test053
     * @tc.desc Verify K=long key=long.MAX $_set then $_get returns string value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, string> = new Record<long, string>();
      const LONG_MAX: long = 9223372036854775807;
      record.$_set(LONG_MAX, 'atMax');
      let result: string | undefined = record.$_get(LONG_MAX);
      expect(result).assertEqual('atMax');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_5400
     * @tc.name recordIndexSetPart03Test054
     * @tc.desc Verify entries() returns all key-value pairs inserted by $_set in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.$_set('b', 2);
      let entryKeys: string[] = [];
      let entryValues: int[] = [];
      let eit: IterableIterator<[string, int]> = record.entries();
      let eitem: IteratorResult<[string, int]> = eit.next();
      while (!eitem.done) {
        let pairDefined: boolean = eitem.value !== undefined;
        expect(pairDefined).assertTrue();
        let pair: [string, int] = eitem.value!;
        entryKeys.push(pair[0]);
        entryValues.push(pair[1]);
        eitem = eit.next();
      }
      expect(entryKeys.length).assertEqual(2);
      expect(entryKeys[0]).assertEqual('a');
      expect(entryValues[0]).assertEqual(1);
      expect(entryKeys[1]).assertEqual('b');
      expect(entryValues[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_5500
     * @tc.name recordIndexSetPart03Test055
     * @tc.desc Verify $_set() then forEach visits all 5 string keys and yields exact key-value pairs in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('k1', 10);
      record.$_set('k2', 20);
      record.$_set('k3', 30);
      record.$_set('k4', 40);
      record.$_set('k5', 50);
      let keys: string[] = [];
      let values: int[] = [];
      record.forEach((value: int, key: string): void => {
        keys.push(key);
        values.push(value);
      });
      expect(keys.length).assertEqual(5);
      expect(keys[0]).assertEqual('k1');
      expect(keys[1]).assertEqual('k2');
      expect(keys[2]).assertEqual('k3');
      expect(keys[3]).assertEqual('k4');
      expect(keys[4]).assertEqual('k5');
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
      expect(values[3]).assertEqual(40);
      expect(values[4]).assertEqual(50);
      expect(record.size).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_5600
     * @tc.name recordIndexSetPart03Test056
     * @tc.desc Verify $_set then forEach count grows after adding second key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('first', 1);
      let firstCount: int = 0;
      let firstSeen: int = -1;
      record.forEach((value: int, key: string): void => {
        if (key === 'first') {
          firstSeen = value;
        }
        firstCount++;
      });
      expect(firstSeen).assertEqual(1);
      expect(firstCount).assertEqual(1);
      record.$_set('second', 2);
      let secondCount: int = 0;
      let secondSeen: int = -1;
      record.forEach((value: int, key: string): void => {
        if (key === 'second') {
          secondSeen = value;
        }
        secondCount++;
      });
      expect(secondSeen).assertEqual(2);
      expect(secondCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_5700
     * @tc.name recordIndexSetPart03Test057
     * @tc.desc Verify $_set() -0.0 value then $_get() preserves -0.0 (1/v=-Inf)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, double> = new Record<string, double>();
      record.$_set('negZeroVal', -0.0);
      let result: double = record.$_get('negZeroVal')!;
      expect(1.0 / result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_5800
     * @tc.name recordIndexSetPart03Test058
     * @tc.desc Verify $_set 10000-char value then $_get returns same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      let longVal: string = '';
      for (let i = 0; i < 10000; i++) {
        longVal = longVal + 'b';
      }
      record.$_set('longValKey', longVal);
      let result: string | undefined = record.$_get('longValKey');
      expect(result).assertEqual(longVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_5900
     * @tc.name recordIndexSetPart03Test059
     * @tc.desc Verify V=Date $_set Date, rebind local ref, Record $_get retains original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Date> = new Record<string, Date>();
      let d: Date = new Date(1717171717171);
      record.$_set('heldRef', d);
      d = new Date(0);
      let result: Date = record.$_get('heldRef')!;
      expect(result.getTime()).assertEqual(1717171717171.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_6000
     * @tc.name recordIndexSetPart03Test060
     * @tc.desc Verify $_set new key size increments and get returns value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('original', 1);
      let sizeBefore: int = record.size;
      record.$_set('fresh', 55);
      expect(record.has('fresh')).assertTrue();
      expect(record.size).assertEqual(sizeBefore + 1);
      expect(record.$_get('fresh')).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART03_TEST_6100
     * @tc.name recordIndexSetPart03Test061
     * @tc.desc Verify $_set() NaN key and NaN value then $_get() returns NaN (isNaN true)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, double> = new Record<double, double>();
      record.$_set(Number.NaN, Number.NaN);
      let result: double = record.$_get(Number.NaN)!;
      expect(isNaN(result)).assertTrue();
    });
  });
}
