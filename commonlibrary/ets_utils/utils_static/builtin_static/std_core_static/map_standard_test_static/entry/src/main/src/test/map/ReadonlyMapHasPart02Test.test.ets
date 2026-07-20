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

class KeyObj { id: int = 0; }
class KeyObj2 { id: int = 0; }
class KeyObj3 { id: int = 0; }
class KeyObj4 { id: int = 0; }

export default function readonlyMapHasPart02TestTest(): void {
  describe('ReadonlyMapHasPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_0100
     * @tc.name readonlyMapHasPart02Test001
     * @tc.desc Verify typeof has 'boolean' string K
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['hello', 1]]);
      let result: boolean = map.has('hello');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_0200
     * @tc.name readonlyMapHasPart02Test002
     * @tc.desc Verify XSS key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['<script>alert(1)</script>', 1]]);
      let result: boolean = map.has('<script>alert(1)</script>');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_0300
     * @tc.name readonlyMapHasPart02Test003
     * @tc.desc Verify (10000 )key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'a'.repeat(10000);
      const map: ReadonlyMap<string, int> = new Map<string, int>([[longKey, 1]]);
      let result: boolean = map.has(longKey);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_0400
     * @tc.name readonlyMapHasPart02Test004
     * @tc.desc Verify long key 0 has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[0, 'zero']]);
      let result: boolean = map.has(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_0500
     * @tc.name readonlyMapHasPart02Test005
     * @tc.desc Verify boolean true key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, int> = new Map<boolean, int>([[true, 1]]);
      let result: boolean = map.has(true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_0600
     * @tc.name readonlyMapHasPart02Test006
     * @tc.desc Verify boolean false key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, int> = new Map<boolean, int>([[false, 1]]);
      let result: boolean = map.has(false);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_0700
     * @tc.name readonlyMapHasPart02Test007
     * @tc.desc Verify double key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[3.14, 'pi']]);
      let result: boolean = map.has(3.14);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_0800
     * @tc.name readonlyMapHasPart02Test008
     * @tc.desc Verify double NaN key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[Double.NaN, 'nan']]);
      let result: boolean = map.has(Double.NaN);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_0900
     * @tc.name readonlyMapHasPart02Test009
     * @tc.desc Verify double Infinity key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[Double.POSITIVE_INFINITY, 'inf']]);
      let result: boolean = map.has(Double.POSITIVE_INFINITY);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_1000
     * @tc.name readonlyMapHasPart02Test010
     * @tc.desc Verify double -Infinity key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[Double.NEGATIVE_INFINITY, 'ninf']]);
      let result: boolean = map.has(Double.NEGATIVE_INFINITY);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_1100
     * @tc.name readonlyMapHasPart02Test011
     * @tc.desc Verify double -0.0 key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[-0.0, 'negZero']]);
      let result: boolean = map.has(-0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_1200
     * @tc.name readonlyMapHasPart02Test012
     * @tc.desc Verify Date key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date();
      const map: ReadonlyMap<Date, int> = new Map<Date, int>([[d, 1]]);
      let result: boolean = map.has(d);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_1300
     * @tc.name readonlyMapHasPart02Test013
     * @tc.desc Verify RegExp key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: RegExp = new RegExp('abc', 'g');
      const map: ReadonlyMap<RegExp, int> = new Map<RegExp, int>([[r, 1]]);
      let result: boolean = map.has(r);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_1400
     * @tc.name readonlyMapHasPart02Test014
     * @tc.desc Verify object key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: KeyObj2 = new KeyObj2();
      o.id = 1;
      const map: ReadonlyMap<KeyObj2, int> = new Map<KeyObj2, int>([[o, 1]]);
      let result: boolean = map.has(o);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_1500
     * @tc.name readonlyMapHasPart02Test015
     * @tc.desc Verify byte.MAX(127) key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<byte, string> = new Map<byte, string>([[127 as byte, 'max']]);
      let result: boolean = map.has(127 as byte);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_1600
     * @tc.name readonlyMapHasPart02Test016
     * @tc.desc Verify byte.MIN(-128) key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<byte, string> = new Map<byte, string>([[-128 as byte, 'min']]);
      let result: boolean = map.has(-128 as byte);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_1700
     * @tc.name readonlyMapHasPart02Test017
     * @tc.desc Verify short.MAX(32767) key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[32767 as short, 'max']]);
      let result: boolean = map.has(32767 as short);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_1800
     * @tc.name readonlyMapHasPart02Test018
     * @tc.desc Verify short.MIN(-32768) key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[-32768 as short, 'min']]);
      let result: boolean = map.has(-32768 as short);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_1900
     * @tc.name readonlyMapHasPart02Test019
     * @tc.desc Verify float NaN key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, string> = new Map<float, string>([[Float.NaN, 'nan']]);
      let result: boolean = map.has(Float.NaN);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_2000
     * @tc.name readonlyMapHasPart02Test020
     * @tc.desc Verify float Infinity key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, string> = new Map<float, string>([[Float.POSITIVE_INFINITY, 'inf']]);
      let result: boolean = map.has(Float.POSITIVE_INFINITY);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_2100
     * @tc.name readonlyMapHasPart02Test021
     * @tc.desc Verify null key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null, int> = new Map<string | null, int>([[null, 1]]);
      let result: boolean = map.has(null);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_2200
     * @tc.name readonlyMapHasPart02Test022
     * @tc.desc Verify undefined key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | undefined, int> = new Map<string | undefined, int>([[undefined, 1]]);
      let result: boolean = map.has(undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_2300
     * @tc.name readonlyMapHasPart02Test023
     * @tc.desc Verify number key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[2.718, 'e']]);
      let result: boolean = map.has(2.718);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_2400
     * @tc.name readonlyMapHasPart02Test024
     * @tc.desc Verify int key Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[1, 'val']]);
      let result: boolean = map.has(999);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_2500
     * @tc.name readonlyMapHasPart02Test025
     * @tc.desc Verify long key Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[1, 'val']]);
      let result: boolean = map.has(999);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_2600
     * @tc.name readonlyMapHasPart02Test026
     * @tc.desc Verify boolean key Map true false has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, int> = new Map<boolean, int>([[true, 1]]);
      let result: boolean = map.has(false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_2700
     * @tc.name readonlyMapHasPart02Test027
     * @tc.desc Verify double key Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[1.0, 'val']]);
      let result: boolean = map.has(3.14);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_2800
     * @tc.name readonlyMapHasPart02Test028
     * @tc.desc Verify double NaN Map NaN SameValueZero has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[1.0, 'val']]);
      let result: boolean = map.has(Double.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_2900
     * @tc.name readonlyMapHasPart02Test029
     * @tc.desc Verify Date key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date();
      let d2: Date = new Date(d1.getTime());
      const map: ReadonlyMap<Date, int> = new Map<Date, int>([[d1, 1]]);
      let result: boolean = map.has(d2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_3000
     * @tc.name readonlyMapHasPart02Test030
     * @tc.desc Verify RegExp pattern key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: RegExp = new RegExp('abc', 'g');
      let r2: RegExp = new RegExp('abc', 'g');
      const map: ReadonlyMap<RegExp, int> = new Map<RegExp, int>([[r1, 1]]);
      let result: boolean = map.has(r2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_3100
     * @tc.name readonlyMapHasPart02Test031
     * @tc.desc Verify object key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: KeyObj3 = new KeyObj3();
      o1.id = 1;
      let o2: KeyObj3 = new KeyObj3();
      o2.id = 1;
      const map: ReadonlyMap<KeyObj3, int> = new Map<KeyObj3, int>([[o1, 1]]);
      let result: boolean = map.has(o2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_3200
     * @tc.name readonlyMapHasPart02Test032
     * @tc.desc Verify null key Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null, int> = new Map<string | null, int>([['a', 1]]);
      let result: boolean = map.has(null);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_3300
     * @tc.name readonlyMapHasPart02Test033
     * @tc.desc Verify undefined key Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | undefined, int> = new Map<string | undefined, int>([['a', 1]]);
      let result: boolean = map.has(undefined);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_3400
     * @tc.name readonlyMapHasPart02Test034
     * @tc.desc Verify float NaN Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, string> = new Map<float, string>([[1.0 as float, 'val']]);
      let result: boolean = map.has(Float.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_3500
     * @tc.name readonlyMapHasPart02Test035
     * @tc.desc Verify byte key Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<byte, string> = new Map<byte, string>([[10 as byte, 'val']]);
      let result: boolean = map.has(99 as byte);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_3600
     * @tc.name readonlyMapHasPart02Test036
     * @tc.desc Verify short key Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[100 as short, 'val']]);
      let result: boolean = map.has(999 as short);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_3700
     * @tc.name readonlyMapHasPart02Test037
     * @tc.desc Verify Map key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      let result: boolean = map.has('anykey');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_3800
     * @tc.name readonlyMapHasPart02Test038
     * @tc.desc Verify has(existingKey) Map size string K
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let sizeBefore: number = map.size;
      map.has('a');
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_3900
     * @tc.name readonlyMapHasPart02Test039
     * @tc.desc Verify has(nonExistingKey) Map size string K
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let sizeBefore: number = map.size;
      map.has('nonexist');
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_4000
     * @tc.name readonlyMapHasPart02Test040
     * @tc.desc Verify has(existingKey) Map size int K
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[1, 'a'], [2, 'b']]);
      let sizeBefore: number = map.size;
      map.has(1);
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_4100
     * @tc.name readonlyMapHasPart02Test041
     * @tc.desc Verify has(existingKey) Map size Date K
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date();
      const map: ReadonlyMap<Date, int> = new Map<Date, int>([[d, 1]]);
      let sizeBefore: number = map.size;
      map.has(d);
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_4200
     * @tc.name readonlyMapHasPart02Test042
     * @tc.desc Verify has(existingKey) Map size object K
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: KeyObj4 = new KeyObj4();
      o.id = 1;
      const map: ReadonlyMap<KeyObj4, int> = new Map<KeyObj4, int>([[o, 1]]);
      let sizeBefore: number = map.size;
      map.has(o);
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_4300
     * @tc.name readonlyMapHasPart02Test043
     * @tc.desc Verify Map has size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      map.has('anykey');
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_4400
     * @tc.name readonlyMapHasPart02Test044
     * @tc.desc Verify has(existingKey) get key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 42]]);
      const result: boolean = map.has('a');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_4500
     * @tc.name readonlyMapHasPart02Test045
     * @tc.desc Verify has(nonExistingKey) get key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 42]]);
      map.has('nonexist');
      let val: int | undefined = map.get('a');
      expect(val).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_4600
     * @tc.name readonlyMapHasPart02Test046
     * @tc.desc Verify has(existingKey) forEach entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.has('a');
      let count: int = 0;
      map.forEach((value: int, key: string): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_4700
     * @tc.name readonlyMapHasPart02Test047
     * @tc.desc Verify has(nonExistingKey) forEach entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.has('nonexist');
      let count: int = 0;
      map.forEach((value: int, key: string): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_4800
     * @tc.name readonlyMapHasPart02Test048
     * @tc.desc Verify has does not affect forEach insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.has('b');
      let keys: string[] = [];
      map.forEach((value: int, key: string): void => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
      expect(keys[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_4900
     * @tc.name readonlyMapHasPart02Test049
     * @tc.desc Verify has nonExistingKey does not affect forEach order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 1], ['y', 2], ['z', 3]]);
      map.has('nonexist');
      let keys: string[] = [];
      map.forEach((value: int, key: string): void => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('x');
      expect(keys[1]).assertEqual('y');
      expect(keys[2]).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_5000
     * @tc.name readonlyMapHasPart02Test050
     * @tc.desc Verify existing key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let r1: boolean = map.has('a');
      let r2: boolean = map.has('a');
      let r3: boolean = map.has('a');
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_5100
     * @tc.name readonlyMapHasPart02Test051
     * @tc.desc Verify nonExisting key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let r1: boolean = map.has('nonexist');
      let r2: boolean = map.has('nonexist');
      let r3: boolean = map.has('nonexist');
      expect(r1).assertFalse();
      expect(r2).assertFalse();
      expect(r3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_5200
     * @tc.name readonlyMapHasPart02Test052
     * @tc.desc Verify nonExisting key has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let r1: boolean = map.has('x');
      let r2: boolean = map.has('y');
      let r3: boolean = map.has('z');
      expect(r1).assertFalse();
      expect(r2).assertFalse();
      expect(r3).assertFalse();
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_5300
     * @tc.name readonlyMapHasPart02Test053
     * @tc.desc Verify has if key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entered: boolean = false;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      if (map.has('a')) {
        entered = true;
      }
      expect(entered).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_5400
     * @tc.name readonlyMapHasPart02Test054
     * @tc.desc Verify has if key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entered: boolean = false;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      if (map.has('nonexist')) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_5500
     * @tc.name readonlyMapHasPart02Test055
     * @tc.desc Verify has (!) key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let notExists: boolean = !map.has('nonexist');
      expect(notExists).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_5600
     * @tc.name readonlyMapHasPart02Test056
     * @tc.desc Verify has (&&)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let bothExist: boolean = map.has('a') && map.has('b');
      expect(bothExist).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_5700
     * @tc.name readonlyMapHasPart02Test057
     * @tc.desc Verify has (||)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let eitherExists: boolean = map.has('a') || map.has('nonexist');
      expect(eitherExists).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_5800
     * @tc.name readonlyMapHasPart02Test058
     * @tc.desc Verify has(key) get(key)!!=undefined existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 42]]);
      let hasResult: boolean = map.has('a');
      let getResult: int | undefined = map.get('a');
      expect(hasResult).assertEqual(getResult !== undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_5900
     * @tc.name readonlyMapHasPart02Test059
     * @tc.desc Verify has(key) get(key)!==undefined non-existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 42]]);
      let hasResult: boolean = map.has('nonexist');
      let getResult: int | undefined = map.get('nonexist');
      expect(hasResult).assertEqual(getResult !== undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART02_TEST_6000
     * @tc.name readonlyMapHasPart02Test060
     * @tc.desc Verify set key has true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['a', 100]]);
      let hasResult: boolean = map.has('a');
      expect(hasResult).assertTrue();
      let val: int | undefined = map.get('a');
      expect(val).assertEqual(100);
    });

  });
}
