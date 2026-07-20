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

export default function recordIndexGetPart02TestTest(): void {
  describe('RecordIndexGetPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_0100
     * @tc.name recordIndexGetPart02Test001
     * @tc.desc Verify Map<string, string> $_get key typeof string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set('k', 'v');
      let v = record.$_get('k');
      expect(typeof v).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_0200
     * @tc.name recordIndexGetPart02Test002
     * @tc.desc Verify Map<string, int> $_get key typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('k', 1);
      let v = record.$_get('k');
      expect(typeof v).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_0300
     * @tc.name recordIndexGetPart02Test003
     * @tc.desc Verify Map<string, number> $_get key typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, number> = new Record<string, number>();
      record.$_set('k', 3.14);
      let v = record.$_get('k');
      expect(typeof v).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_0400
     * @tc.name recordIndexGetPart02Test004
     * @tc.desc Verify Map<string, boolean> $_get key typeof boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, boolean> = new Record<string, boolean>();
      record.$_set('k', true);
      let v = record.$_get('k');
      expect(typeof v).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_0500
     * @tc.name recordIndexGetPart02Test005
     * @tc.desc Verify Map<string, bigint> $_get key typeof bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, bigint> = new Record<string, bigint>();
      record.$_set('k', 100n);
      let v = record.$_get('k');
      expect(typeof v).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_0600
     * @tc.name recordIndexGetPart02Test006
     * @tc.desc Verify Map<string, byte> $_get key typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, byte> = new Record<string, byte>();
      record.$_set('k', 64 as byte);
      let v = record.$_get('k');
      expect(typeof v).assertEqual('byte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_0700
     * @tc.name recordIndexGetPart02Test007
     * @tc.desc Verify Map<string, short> $_get key typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, short> = new Record<string, short>();
      record.$_set('k', 100 as short);
      let v = record.$_get('k');
      expect(typeof v).assertEqual('short');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_0800
     * @tc.name recordIndexGetPart02Test008
     * @tc.desc Verify Map<string, float> $_get key typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, float> = new Record<string, float>();
      record.$_set('k', 1.0);
      let v = record.$_get('k');
      expect(typeof v).assertEqual('float');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_0900
     * @tc.name recordIndexGetPart02Test009
     * @tc.desc Verify Map<string, Date> $_get key typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Date> = new Record<string, Date>();
      let d: Date = new Date();
      record.$_set('k', d);
      let v = record.$_get('k');
      expect(typeof v).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_1000
     * @tc.name recordIndexGetPart02Test010
     * @tc.desc Verify Map<string, string> $_get key typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set('a', 'x');
      let v = record.$_get('missing');
      expect(typeof v).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_1100
     * @tc.name recordIndexGetPart02Test011
     * @tc.desc Verify Map<string, Date> $_get Date instanceof Date true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Date> = new Record<string, Date>();
      let d: Date = new Date();
      record.$_set('k', d);
      let v = record.$_get('k');
      expect(v instanceof Date).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_1200
     * @tc.name recordIndexGetPart02Test012
     * @tc.desc Verify Map<string, Error> $_get Error instanceof Error true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Error> = new Record<string, Error>();
      let e: Error = new Error('err');
      record.$_set('k', e);
      let v = record.$_get('k');
      expect((v as Error).message).assertEqual('err');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_1300
     * @tc.name recordIndexGetPart02Test013
     * @tc.desc Verify Map<string, int> $_get int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('k', 0);
      let v = record.$_get('k');
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_1400
     * @tc.name recordIndexGetPart02Test014
     * @tc.desc Verify Map<string, int> $_get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('k', 2147483647 as int);
      let v = record.$_get('k');
      expect(v).assertEqual(2147483647 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_1500
     * @tc.name recordIndexGetPart02Test015
     * @tc.desc Verify Map<string, int> $_get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('k', -2147483648);
      let v = record.$_get('k');
      expect(v).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_1600
     * @tc.name recordIndexGetPart02Test016
     * @tc.desc Verify Map<string, int> $_get int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('k', -1);
      let v = record.$_get('k');
      expect(v).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_1700
     * @tc.name recordIndexGetPart02Test017
     * @tc.desc Verify Map<string, int> $_get int 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('k', 1);
      let v = record.$_get('k');
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_1800
     * @tc.name recordIndexGetPart02Test018
     * @tc.desc Verify Map<string, string> $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set('k', 'hello');
      let v = record.$_get('k');
      expect(v).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_1900
     * @tc.name recordIndexGetPart02Test019
     * @tc.desc Verify Map<string, string> $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set('k', '');
      let v = record.$_get('k');
      expect(v).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_2000
     * @tc.name recordIndexGetPart02Test020
     * @tc.desc Verify Map<string, string> $_get Unicode emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set('k', '😀');
      let v = record.$_get('k');
      expect(v).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_2100
     * @tc.name recordIndexGetPart02Test021
     * @tc.desc Verify Map<string, string> $_get XSS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      record.$_set('k', '<script>alert(1)</script>');
      let v = record.$_get('k');
      expect(v).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_2200
     * @tc.name recordIndexGetPart02Test022
     * @tc.desc Verify Map<string, string> $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = new Record<string, string>();
      let zwsp: string = '​';
      record.$_set('k', zwsp);
      let v = record.$_get('k');
      expect(v).assertEqual(zwsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_2300
     * @tc.name recordIndexGetPart02Test023
     * @tc.desc Verify Map<string, number> $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, number> = new Record<string, number>();
      record.$_set('k', 3.14);
      let v = record.$_get('k');
      expect(v).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_2400
     * @tc.name recordIndexGetPart02Test024
     * @tc.desc Verify Map<string, number> $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, number> = new Record<string, number>();
      record.$_set('k', Number.POSITIVE_INFINITY);
      let v = record.$_get('k');
      expect(v).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_2500
     * @tc.name recordIndexGetPart02Test025
     * @tc.desc Verify Map<string, number> $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, number> = new Record<string, number>();
      record.$_set('k', Number.NEGATIVE_INFINITY);
      let v = record.$_get('k');
      expect(v).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_2600
     * @tc.name recordIndexGetPart02Test026
     * @tc.desc Verify Map<string, boolean> $_get true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, boolean> = new Record<string, boolean>();
      record.$_set('k', true);
      let v = record.$_get('k');
      expect(v).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_2700
     * @tc.name recordIndexGetPart02Test027
     * @tc.desc Verify Map<string, boolean> $_get false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, boolean> = new Record<string, boolean>();
      record.$_set('k', false);
      let v = record.$_get('k');
      expect(v).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_2800
     * @tc.name recordIndexGetPart02Test028
     * @tc.desc Verify Map<string, bigint> $_get long 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, bigint> = new Record<string, bigint>();
      record.$_set('k', 0n);
      let v = record.$_get('k');
      expect(v).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_2900
     * @tc.name recordIndexGetPart02Test029
     * @tc.desc Verify Map<string, bigint> $_get long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, bigint> = new Record<string, bigint>();
      record.$_set('k', 9223372036854775807n);
      let v = record.$_get('k');
      expect(v).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_3000
     * @tc.name recordIndexGetPart02Test030
     * @tc.desc Verify Map<string, bigint> $_get long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, bigint> = new Record<string, bigint>();
      record.$_set('k', -9223372036854775808n);
      let v = record.$_get('k');
      expect(v).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_3100
     * @tc.name recordIndexGetPart02Test031
     * @tc.desc Verify Map<string, double> $_get double 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, double> = new Record<string, double>();
      record.$_set('k', 0.0);
      let v = record.$_get('k');
      expect(v).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_3200
     * @tc.name recordIndexGetPart02Test032
     * @tc.desc Verify Map<string, double> $_get double EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, double> = new Record<string, double>();
      record.$_set('k', Number.EPSILON);
      let v = record.$_get('k');
      expect(v).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_3300
     * @tc.name recordIndexGetPart02Test033
     * @tc.desc Verify Map<string, double> $_get double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, double> = new Record<string, double>();
      record.$_set('k', Number.POSITIVE_INFINITY);
      let v = record.$_get('k');
      expect(v).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_3400
     * @tc.name recordIndexGetPart02Test034
     * @tc.desc Verify Map<string, byte> $_get byte 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, byte> = new Record<string, byte>();
      record.$_set('k', 0 as byte);
      let v = record.$_get('k');
      expect(v).assertEqual(0 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_3500
     * @tc.name recordIndexGetPart02Test035
     * @tc.desc Verify Map<string, byte> $_get byte 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, byte> = new Record<string, byte>();
      record.$_set('k', 127 as byte);
      let v = record.$_get('k');
      expect(v).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_3600
     * @tc.name recordIndexGetPart02Test036
     * @tc.desc Verify Map<string, byte> $_get byte -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, byte> = new Record<string, byte>();
      record.$_set('k', -128 as byte);
      let v = record.$_get('k');
      expect(v).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_3700
     * @tc.name recordIndexGetPart02Test037
     * @tc.desc Verify Map<string, short> $_get short 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, short> = new Record<string, short>();
      record.$_set('k', 0 as short);
      let v = record.$_get('k');
      expect(v).assertEqual(0 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_3800
     * @tc.name recordIndexGetPart02Test038
     * @tc.desc Verify Map<string, short> $_get short 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, short> = new Record<string, short>();
      record.$_set('k', 32767 as short);
      let v = record.$_get('k');
      expect(v).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_3900
     * @tc.name recordIndexGetPart02Test039
     * @tc.desc Verify Map<string, float> $_get float 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, float> = new Record<string, float>();
      let f: float = 0.0 as float;
      record.$_set('k', f);
      let v = record.$_get('k');
      expect(v).assertEqual(f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_4000
     * @tc.name recordIndexGetPart02Test040
     * @tc.desc Verify Map<string, float> $_get float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, float> = new Record<string, float>();
      let f: float = Float.POSITIVE_INFINITY;
      record.$_set('k', f);
      let v = record.$_get('k');
      expect(v).assertEqual(f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_4100
     * @tc.name recordIndexGetPart02Test041
     * @tc.desc Verify Map<string, bigint> $_get bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, bigint> = new Record<string, bigint>();
      let b: bigint = 9223372036854775807n;
      record.$_set('k', b);
      let v = record.$_get('k');
      expect(v).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_4200
     * @tc.name recordIndexGetPart02Test042
     * @tc.desc Verify Map<string, Date> $_get set Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Date> = new Record<string, Date>();
      let d: Date = new Date();
      record.$_set('k', d);
      let v = record.$_get('k');
      expect(v).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_4300
     * @tc.name recordIndexGetPart02Test043
     * @tc.desc Verify Map<string, RegExp> $_get set RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, RegExp> = new Record<string, RegExp>();
      let r: RegExp = new RegExp('abc', 'g');
      record.$_set('k', r);
      let v = record.$_get('k');
      expect(v).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_4400
     * @tc.name recordIndexGetPart02Test044
     * @tc.desc Verify Map<string, Error> $_get set Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Error> = new Record<string, Error>();
      let e: Error = new Error('test');
      record.$_set('k', e);
      let v = record.$_get('k');
      expect(v).assertEqual(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_4500
     * @tc.name recordIndexGetPart02Test045
     * @tc.desc Verify Map<string, Map<string, int>> $_get Map set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Map<string, int>> = new Record<string, Map<string, int>>();
      const inner: Map<string, int> = new Map<string, int>();
      inner.set('x', 1);
      record.$_set('k', inner);
      let v = record.$_get('k');
      expect(v).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_4600
     * @tc.name recordIndexGetPart02Test046
     * @tc.desc Verify Map<string, Set<int>> $_get Set set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Set<int>> = new Record<string, Set<int>>();
      let s: Set<int> = new Set<int>();
      s.add(42);
      record.$_set('k', s);
      let v = record.$_get('k');
      expect(v).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_4700
     * @tc.name recordIndexGetPart02Test047
     * @tc.desc Verify Map<string, int > $_get Array set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int[]> = new Record<string, int[]>();
      let a: int[] = [1, 2, 3];
      record.$_set('k', a);
      let v = record.$_get('k');
      expect(v).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_4800
     * @tc.name recordIndexGetPart02Test048
     * @tc.desc Verify Record V null union $_get null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string | null> = new Record<string, string | null>();
      record.$_set('k', null);
      let v = record.$_get('k');
      expect(v).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_4900
     * @tc.name recordIndexGetPart02Test049
     * @tc.desc Verify Record V undefined union $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string | undefined> = new Record<string, string | undefined>();
      record.$_set('k', undefined);
      let v = record.$_get('k');
      expect(record.has('k')).assertTrue();
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_5000
     * @tc.name recordIndexGetPart02Test050
     * @tc.desc Verify Map<string, int | null> $_get key $_get null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int | null> = new Record<string, int | null>();
      record.$_set('a', null);
      const existingValue: int | null | undefined = record.$_get('a');
      expect(existingValue).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_5100
     * @tc.name recordIndexGetPart02Test051
     * @tc.desc Verify $_get key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.$_set('b', 2);
      let sizeBefore: int = record.size;
      let v = record.$_get('a');
      expect(record.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_5200
     * @tc.name recordIndexGetPart02Test052
     * @tc.desc Verify $_get key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      let sizeBefore: int = record.size;
      let v = record.$_get('missing');
      expect(record.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_5300
     * @tc.name recordIndexGetPart02Test053
     * @tc.desc Verify Record $_get key size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      let v = record.$_get('any');
      expect(record.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_5400
     * @tc.name recordIndexGetPart02Test054
     * @tc.desc Verify $_get key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.$_set('b', 2);
      record.$_set('c', 3);
      let sizeBefore: int = record.size;
      let va = record.$_get('a');
      let vb = record.$_get('b');
      let vc = record.$_get('c');
      expect(record.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_5500
     * @tc.name recordIndexGetPart02Test055
     * @tc.desc Verify set $_get key size set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      let sizeAfterSet: int = record.size;
      let v = record.$_get('a');
      expect(record.size).assertEqual(sizeAfterSet);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_5600
     * @tc.name recordIndexGetPart02Test056
     * @tc.desc Verify delete $_get key size delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.$_set('b', 2);
      record.delete('a');
      let sizeAfterDelete: int = record.size;
      let v = record.$_get('a');
      expect(record.size).assertEqual(sizeAfterDelete);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_5700
     * @tc.name recordIndexGetPart02Test057
     * @tc.desc Verify clear $_get size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.clear();
      let v = record.$_get('a');
      expect(record.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_5800
     * @tc.name recordIndexGetPart02Test058
     * @tc.desc Verify $_get entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.$_set('b', 2);
      let before: string = record.toString();
      let v = record.$_get('a');
      let after: string = record.toString();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_5900
     * @tc.name recordIndexGetPart02Test059
     * @tc.desc Verify $_get key entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      let before: string = record.toString();
      let v = record.$_get('missing');
      let after: string = record.toString();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_6000
     * @tc.name recordIndexGetPart02Test060
     * @tc.desc Verify $_get has key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.$_set('b', 2);
      let v = record.$_get('a');
      expect(record.has('a')).assertTrue();
      expect(record.has('b')).assertTrue();
      expect(record.has('c')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_6100
     * @tc.name recordIndexGetPart02Test061
     * @tc.desc Verify $_get key has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      let v = record.$_get('missing');
      expect(record.has('missing')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_6200
     * @tc.name recordIndexGetPart02Test062
     * @tc.desc Verify $_get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 42);
      let firstValue = record.$_get('a');
      let secondValue = record.$_get('a');
      expect(firstValue).assertEqual(42);
      expect(secondValue).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_6300
     * @tc.name recordIndexGetPart02Test063
     * @tc.desc Verify $_get key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      let firstValue = record.$_get('x');
      let secondValue = record.$_get('x');
      expect(firstValue).assertUndefined();
      expect(secondValue).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_6400
     * @tc.name recordIndexGetPart02Test064
     * @tc.desc Verify $_get key forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.$_set('b', 2);
      let va = record.$_get('a');
      let vb = record.$_get('b');
      let count: int = 0;
      record.forEach((value: int, key: string): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_6500
     * @tc.name recordIndexGetPart02Test065
     * @tc.desc Verify $_get keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.$_set('b', 2);
      let v = record.$_get('a');
      let keyCount: int = 0;
      let keysIter = record.keys();
      let nextResult = keysIter.next();
      while (!nextResult.done) {
        keyCount++;
        nextResult = keysIter.next();
      }
      expect(keyCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_6600
     * @tc.name recordIndexGetPart02Test066
     * @tc.desc Verify $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.$_set('b', 2);
      let v = record.$_get('a');
      let valCount: int = 0;
      let valsIter = record.values();
      let nextResult = valsIter.next();
      while (!nextResult.done) {
        valCount++;
        nextResult = valsIter.next();
      }
      expect(valCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_6700
     * @tc.name recordIndexGetPart02Test067
     * @tc.desc Verify $_get key forEach entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('x', 10);
      let v = record.$_get('missing');
      let count: int = 0;
      record.forEach((value: int, key: string): void => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_6800
     * @tc.name recordIndexGetPart02Test068
     * @tc.desc Verify clear $_get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('a', 1);
      record.clear();
      let v = record.$_get('a');
      let sizeAfter: int = record.size;
      expect(v).assertUndefined();
      expect(sizeAfter).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_6900
     * @tc.name recordIndexGetPart02Test069
     * @tc.desc Verify $_get size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('k', 1);
      let sizeOld: int = record.size;
      record.$_set('k', 2);
      let v = record.$_get('k');
      expect(v).assertEqual(2);
      expect(record.size).assertEqual(sizeOld);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RECORD_INDEX_GET_PART02_7000
     * @tc.name recordIndexGetPart02Test070
     * @tc.desc Verify $_get set set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('recordIndexGetPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, int> = new Record<string, int>();
      record.$_set('k', 1);
      record.$_set('k', 2);
      const currentValue: int | undefined = record.$_get('k');
      expect(currentValue).assertEqual(2);
    });

  });
}
