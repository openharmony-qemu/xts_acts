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

interface SharedItem {
  count: int;
}

enum Color {
  Red = 'RED',
  Blue = 'BLUE',
  Green = 'GREEN',
}

class MyData {
  value: int = 0;
}

export default function recordIndexSetPart04TestTest(): void {
  describe('RecordIndexSetPart04TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_0100
     * @tc.name recordIndexSetPart04Test001
     * @tc.desc Verify $_set nested Record reference then inner $_set visible via outer $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer: Record<string, Record<string, int>> = new Record<string, Record<string, int>>();
      const inner: Record<string, int> = new Record<string, int>();
      inner.$_set('x', 55);
      outer.$_set('outerKey', inner);
      inner.$_set('y', 66);
      let fetched: Record<string, int> = outer.$_get('outerKey')!;
      expect(fetched.$_get('x')).assertEqual(55);
      expect(fetched.$_get('y')).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_0200
     * @tc.name recordIndexSetPart04Test002
     * @tc.desc Verify $_set -0.0 key with long.MIN value then $_get returns long.MIN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, long> = new Record<double, long>();
      const LONG_MIN: long = -9223372036854775807 - 1;
      record.$_set(-0.0, LONG_MIN);
      let result: long | undefined = record.$_get(-0.0);
      expect(result).assertEqual(LONG_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_0300
     * @tc.name recordIndexSetPart04Test003
     * @tc.desc Verify $_set nested Record then overwrite with second Record $_get second
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer: Record<string, Record<string, int>> = new Record<string, Record<string, int>>();
      const inner1: Record<string, int> = new Record<string, int>();
      inner1.$_set('a', 1);
      const inner2: Record<string, int> = new Record<string, int>();
      inner2.$_set('b', 2);
      outer.$_set('nest', inner1);
      outer.$_set('nest', inner2);
      let fetched: Record<string, int> | undefined = outer.$_get('nest');
      expect(fetched).assertEqual(inner2);
      if (fetched !== undefined) {
        expect(fetched.$_get('b')).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_0400
     * @tc.name recordIndexSetPart04Test004
     * @tc.desc Verify $_set() shared Date reference in two Records then mutation visible in both
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record1: Record<string, Date> = new Record<string, Date>();
      const record2: Record<string, Date> = new Record<string, Date>();
      let sharedDate: Date = new Date(2025, 0, 1);
      record1.$_set('d', sharedDate);
      record2.$_set('d', sharedDate);
      sharedDate.setFullYear(2027);
      let dateFromRecord1: Date | undefined = record1.$_get('d');
      let dateFromRecord2: Date | undefined = record2.$_get('d');
      expect(dateFromRecord1).not().assertUndefined();
      expect(dateFromRecord2).not().assertUndefined();
      if (dateFromRecord1 !== undefined && dateFromRecord2 !== undefined) {
        expect(dateFromRecord1.getFullYear()).assertEqual(2027);
        expect(dateFromRecord2.getFullYear()).assertEqual(2027);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_0500
     * @tc.name recordIndexSetPart04Test005
     * @tc.desc Verify $_set() shared object under two keys then mutation via one visible via other
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, SharedItem> = new Record<string, SharedItem>();
      let item: SharedItem = { count: 0 };
      record.$_set('slotA', item);
      record.$_set('slotB', item);
      let viaA: SharedItem = record.$_get('slotA')!;
      viaA.count = 99;
      let viaB: SharedItem = record.$_get('slotB')!;
      expect(viaB).assertEqual(viaA);
      expect(viaB.count).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_0600
     * @tc.name recordIndexSetPart04Test006
     * @tc.desc Verify $_set() copy value from Record A to B then A overwrite B unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const recordA: Record<string, int> = new Record<string, int>();
      const recordB: Record<string, int> = new Record<string, int>();
      recordA.$_set('val', 7);
      let valFromA: int | undefined = recordA.$_get('val');
      if (valFromA !== undefined) {
        recordB.$_set('copied', valFromA);
      }
      recordA.$_set('val', 77);
      let valFromB: int | undefined = recordB.$_get('copied');
      expect(valFromB).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_0700
     * @tc.name recordIndexSetPart04Test007
     * @tc.desc Verify $_set key positional parameter correctness on Record<int,string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, string> = new Record<int, string>();
      record.$_set(100, 'value100');
      expect(record.$_get(100)).assertEqual('value100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_0800
     * @tc.name recordIndexSetPart04Test008
     * @tc.desc Verify $_set value positional parameter correctness on Record<string,boolean>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, boolean> = new Record<string, boolean>();
      record.$_set('flag', true);
      let result: boolean | undefined = record.$_get('flag');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_0900
     * @tc.name recordIndexSetPart04Test009
     * @tc.desc Verify Record<string,int> $_set() CJK string key then $_get() retrieves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('中文键', 99);
      expect(record.$_get('中文键')).assertEqual(99);
      expect(record.has('中文键')).assertTrue();
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_1000
     * @tc.name recordIndexSetPart04Test010
     * @tc.desc Verify Record<string,string> $_set() empty-string key with emoji value retrieves emoji via $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set('', '😀');
      expect(record.$_get('')).assertEqual('😀');
      expect(record.has('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_1100
     * @tc.name recordIndexSetPart04Test011
     * @tc.desc Verify Record<string,int> delete() XSS key then $_set() re-insert retrieves new value via $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('<script>alert(1)</script>', 10);
      record.delete('<script>alert(1)</script>');
      record.$_set('<script>alert(1)</script>', 20);
      expect(record.$_get('<script>alert(1)</script>')).assertEqual(20);
      expect(record.has('<script>alert(1)</script>')).assertTrue();
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_1200
     * @tc.name recordIndexSetPart04Test012
     * @tc.desc Verify Record<string,string> $_set() XSS key with payload value then $_get() returns payload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      const xssPayload: string = '<script>alert(1)</script>';
      record.$_set(xssPayload, '<img src=x onerror=alert(1)>');
      expect(record.$_get(xssPayload)).assertEqual('<img src=x onerror=alert(1)>');
      expect(record.has(xssPayload)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_1300
     * @tc.name recordIndexSetPart04Test013
     * @tc.desc Verify Record<long,string> $_set() overwrite long.MAX key then $_get() returns new string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, string> = new Record<long, string>();
      const longMax: long = 9223372036854775807;
      record.$_set(longMax, 'old');
      record.$_set(longMax, 'new');
      expect(record.$_get(longMax)).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_1400
     * @tc.name recordIndexSetPart04Test014
     * @tc.desc Verify Record<long,int> $_set() long.MAX and long.MIN keys, both independently retrievable via $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, int> = new Record<long, int>();
      const longMax: long = 9223372036854775807;
      const longMin: long = -9223372036854775807 - 1;
      record.$_set(longMax, 1);
      record.$_set(longMin, 2);
      expect(record.$_get(longMax)).assertEqual(1);
      expect(record.$_get(longMin)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_1500
     * @tc.name recordIndexSetPart04Test015
     * @tc.desc Verify Record $_set() string-based enum overwrite key then $_get() returns new value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set(Color.Green, 'first');
      record.$_set(Color.Green, 'second');
      expect(record.$_get(Color.Green)).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_1600
     * @tc.name recordIndexSetPart04Test016
     * @tc.desc Verify Record with string-based enum size after $_set multiple distinct enum keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set(Color.Red, 1);
      record.$_set(Color.Blue, 2);
      expect(record.size).assertEqual(2);
      expect(record.$_get(Color.Red)).assertEqual(1);
      expect(record.$_get(Color.Blue)).assertEqual(2);
      expect(record.has(Color.Red)).assertTrue();
      expect(record.has(Color.Blue)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_1700
     * @tc.name recordIndexSetPart04Test017
     * @tc.desc Verify Record<int,int> $_set() overwrite 0 key retains size=1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, int> = new Record<int, int>();
      record.$_set(0, 1);
      record.$_set(0, 2);
      expect(record.size).assertEqual(1);
      expect(record.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_1800
     * @tc.name recordIndexSetPart04Test018
     * @tc.desc Verify Record<string,Date> $_set() overwrite Date value then $_get() returns new Date
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Date> = new Record<string, Date>();
      const oldDate: Date = new Date(2020, 0, 1);
      const newDate: Date = new Date(2025, 11, 31);
      record.$_set('d', oldDate);
      record.$_set('d', newDate);
      expect(record.$_get('d')).assertEqual(newDate);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_1900
     * @tc.name recordIndexSetPart04Test019
     * @tc.desc Verify Record<int,Date> $_set() Date value with int key then $_get() returns Date reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, Date> = new Record<int, Date>();
      const dateVal: Date = new Date(2024, 5, 10);
      record.$_set(42, dateVal);
      expect(record.$_get(42)).assertEqual(dateVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_2000
     * @tc.name recordIndexSetPart04Test020
     * @tc.desc Verify Record<long,string> $_set() key=long.MIN then $_get() returns string value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, string> = new Record<long, string>();
      const longMin: long = -9223372036854775807 - 1;
      record.$_set(longMin, 'atMinLong');
      expect(record.$_get(longMin)).assertEqual('atMinLong');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_2100
     * @tc.name recordIndexSetPart04Test021
     * @tc.desc Verify Record<long,double> $_set() value=NaN on long key then $_get() isNaN true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, double> = new Record<long, double>();
      record.$_set(Int.toLong(9), Number.NaN);
      const result: double | undefined = record.$_get(Int.toLong(9));
      expect(result).not().assertUndefined();
      expect(isNaN(result!)).assertTrue();
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_2200
     * @tc.name recordIndexSetPart04Test022
     * @tc.desc Verify Record<int,double> $_set() overwrite normal value with NaN on int key then $_get() isNaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, double> = new Record<int, double>();
      record.$_set(7, 100.0);
      record.$_set(7, Number.NaN);
      const result: double | undefined = record.$_get(7);
      expect(result).not().assertUndefined();
      expect(isNaN(result!)).assertTrue();
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_2300
     * @tc.name recordIndexSetPart04Test023
     * @tc.desc Verify Record<string,MyData> $_set() overwrite with different object reference then $_get() returns new ref
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, MyData> = new Record<string, MyData>();
      const obj1: MyData = new MyData();
      obj1.value = 1;
      const obj2: MyData = new MyData();
      obj2.value = 2;
      record.$_set('obj', obj1);
      record.$_set('obj', obj2);
      expect(record.$_get('obj')).assertEqual(obj2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_2400
     * @tc.name recordIndexSetPart04Test024
     * @tc.desc Verify Record<string,int> $_set() overwrite existing key different value, $_get() returns new value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('k', 1);
      record.$_set('k', 99);
      expect(record.$_get('k')).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_2500
     * @tc.name recordIndexSetPart04Test025
     * @tc.desc Verify Record<string,string> $_set() overwrite same key 3 times, size stays 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set('x', 'first');
      record.$_set('x', 'second');
      record.$_set('x', 'third');
      expect(record.$_get('x')).assertEqual('third');
      expect(record.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_2600
     * @tc.name recordIndexSetPart04Test026
     * @tc.desc Verify Record<double,string> $_set() float key then has() true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, string> = new Record<double, string>();
      record.$_set(3.14, 'pi');
      expect(record.has(3.14)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_2700
     * @tc.name recordIndexSetPart04Test027
     * @tc.desc Verify Record<short,int> $_set() key=short.MIN (-32768) then $_get() returns value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<short, int> = new Record<short, int>();
      record.$_set(Int.toShort(-32768), 40);
      expect(record.$_get(Int.toShort(-32768))).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_2800
     * @tc.name recordIndexSetPart04Test028
     * @tc.desc Verify Record<long,Date> $_set() long key with Date value then $_get() returns same reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, Date> = new Record<long, Date>();
      const dateVal: Date = new Date(2025, 3, 20);
      record.$_set(Int.toLong(100), dateVal);
      expect(record.$_get(Int.toLong(100))).assertEqual(dateVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_2900
     * @tc.name recordIndexSetPart04Test029
     * @tc.desc Verify Record<int,Error> $_set() int key with Error value then $_get() returns same reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, Error> = new Record<int, Error>();
      const errVal: Error = new Error('test error');
      record.$_set(1, errVal);
      expect(record.$_get(1)).assertEqual(errVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_3000
     * @tc.name recordIndexSetPart04Test030
     * @tc.desc Verify Record<string,bigint> $_set() string key with bigint value then $_get() returns value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, bigint> = new Record<string, bigint>();
      record.$_set('big', BigInt(9999999999999));
      const result: bigint | undefined = record.$_get('big');
      expect(result).not().assertUndefined();
      expect(result!).assertEqual(BigInt(9999999999999));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_3100
     * @tc.name recordIndexSetPart04Test031
     * @tc.desc Verify Record<string,RegExp> $_set() string key with RegExp value then $_get() returns same reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, RegExp> = new Record<string, RegExp>();
      const re: RegExp = new RegExp('test', 'g');
      record.$_set('pattern', re);
      expect(record.$_get('pattern')).assertEqual(re);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_3200
     * @tc.name recordIndexSetPart04Test032
     * @tc.desc Verify Record<string,Record<string,int>> $_set() nested Record as value then $_get() returns it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Record<string, int>();
      inner.$_set('x', 10);
      const outer = new Record<string, Record<string, int>>();
      outer.$_set('nested', inner);
      const retrieved: Record<string, int> | undefined = outer.$_get('nested');
      expect(retrieved).not().assertUndefined();
      expect(retrieved!.$_get('x')).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_3300
     * @tc.name recordIndexSetPart04Test033
     * @tc.desc Verify $_set same-ms Date twice keeps single entry via keys() order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Date> = new Record<string, Date>();
      let d1: Date = new Date(2025, 0, 1, 0, 0, 0, 0);
      let d2: Date = new Date(2025, 0, 1, 0, 0, 0, 0);
      record.$_set('sameMs', d1);
      record.$_set('sameMs', d2);
      let result: Date | undefined = record.$_get('sameMs');
      expect(result).assertEqual(d2);
      let keyIter: IterableIterator<string> = record.keys();
      let firstKey: string | undefined = keyIter.next().value;
      expect(firstKey).assertEqual('sameMs');
      expect(keyIter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_3400
     * @tc.name recordIndexSetPart04Test034
     * @tc.desc Verify Record<long,int[]> $_set Array value with long key $_get Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<long, int[]> = new Record<long, int[]>();
      let arr: int[] = [127, 0, -1];
      const lkey: long = 9000000000;
      record.$_set(lkey, arr);
      let result: int[] | undefined = record.$_get(lkey);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_3500
     * @tc.name recordIndexSetPart04Test035
     * @tc.desc Verify $_set overwrite value 127 to NaN keeps size unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, double> = new Record<string, double>();
      record.$_set('coverKey', 127);
      let szBefore: int = record.size;
      record.$_set('coverKey', Number.NaN);
      expect(record.size).assertEqual(szBefore);
      let result: double | undefined = record.$_get('coverKey');
      expect(result).not().assertUndefined();
      expect(isNaN(result!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_3600
     * @tc.name recordIndexSetPart04Test036
     * @tc.desc Verify Record $_set V=double overwritten by -Infinity size unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, double> = new Record<string, double>();
      record.$_set('crossCover', 3.14);
      let szBefore: int = record.size;
      record.$_set('crossCover', Number.NEGATIVE_INFINITY);
      expect(record.size).assertEqual(szBefore);
      let result: double | undefined = record.$_get('crossCover');
      expect(result).not().assertUndefined();
      expect(result!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_3700
     * @tc.name recordIndexSetPart04Test037
     * @tc.desc Verify $_set three keys then has missing key returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('\u200b', 1);
      record.$_set('normal', 2);
      record.$_set('', 3);
      expect(record.size).assertEqual(3);
      expect(record.has('\u200b')).assertTrue();
      expect(record.has('normal')).assertTrue();
      expect(record.has('')).assertTrue();
      expect(record.has('nonexistent')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_3800
     * @tc.name recordIndexSetPart04Test038
     * @tc.desc Verify Record<double, Date> $_set K=NaN V=Date $_get returns Date value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<double, Date> = new Record<double, Date>();
      let d: Date = new Date(2025, 6, 8);
      record.$_set(Number.NaN, d);
      let result: Date | undefined = record.$_get(Number.NaN);
      expect(result!).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_3900
     * @tc.name recordIndexSetPart04Test039
     * @tc.desc Verify $_set delete returns true then re-set keeps size 2 with key order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('anchor', 1);
      record.$_set('cycle', 127);
      let deleteResult: boolean = record.delete('cycle');
      expect(deleteResult).assertTrue();
      record.$_set('cycle', 255);
      expect(record.size).assertEqual(2);
      let keyIter: IterableIterator<string> = record.keys();
      let firstKey: string | undefined = keyIter.next().value;
      expect(firstKey).assertEqual('anchor');
      let secondKey: string | undefined = keyIter.next().value;
      expect(secondKey).assertEqual('cycle');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_SET_PART04_TEST_4000
     * @tc.name recordIndexSetPart04Test040
     * @tc.desc Verify Record<int,MyData> $_set() class instance with int key then $_get() returns instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('recordIndexSetPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<int, MyData> = new Record<int, MyData>();
      const obj: MyData = new MyData();
      obj.value = 77;
      record.$_set(1, obj);
      const result: MyData | undefined = record.$_get(1);
      expect(result).not().assertUndefined();
      expect(result!.value).assertEqual(77);
    });
  });
}
