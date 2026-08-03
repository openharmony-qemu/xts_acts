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

interface Item {
  id: int;
  label: string;
}
interface Node {
  val: int;
}
class BoxVal1 {
  content: int = 0;
}
interface Payload {
  code: int;
  data: string;
}
interface KeyId {
  id: int;
}
class KeyToken {
  token: string = '';
}

export default function mapValuesPart01TestTest(): void {
  describe('MapValuesPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_0100
     * @tc.name mapValuesPart01Test001
     * @tc.desc Verify arity=0 Map values, next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<int> = m.values();
      expect(m.size).assertEqual(0);
      expect(iter.next().done).assertTrue();
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_0200
     * @tc.name mapValuesPart01Test002
     * @tc.desc Verify arity=0 Map values, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(7, 'single');
      let iter: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = iter.next();
      expect(r.value!).assertEqual('single');
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_0300
     * @tc.name mapValuesPart01Test003
     * @tc.desc Verify arity=0 Map values, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('p', 10);
      m.set('q', 20);
      m.set('r', 30);
      let iter: IterableIterator<int> = m.values();
      expect(iter.next().value!).assertEqual(10);
      expect(iter.next().value!).assertEqual(20);
      expect(iter.next().value!).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_0400
     * @tc.name mapValuesPart01Test004
     * @tc.desc Verify arity=0 entries Map values, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['u', 40], ['v', 50]]);
      let iter: IterableIterator<int> = m.values();
      expect(iter.next().value!).assertEqual(40);
      expect(iter.next().value!).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_0500
     * @tc.name mapValuesPart01Test005
     * @tc.desc Verify arity=0 set Map values, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('tag', 'old');
      m.set('tag', 'new');
      let iter: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = iter.next();
      expect(r.value!).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_0600
     * @tc.name mapValuesPart01Test006
     * @tc.desc Verify V=string, values string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('k1', 'alpha');
      let iter: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = iter.next();
      expect(r.value!).assertEqual('alpha');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_0700
     * @tc.name mapValuesPart01Test007
     * @tc.desc Verify V=string, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('k1', '');
      let iter: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = iter.next();
      expect(r.value!).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_0800
     * @tc.name mapValuesPart01Test008
     * @tc.desc Verify V=string, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      let zwsp: string = '​';
      m.set('k1', zwsp);
      let iter: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = iter.next();
      expect(r.value!).assertEqual(zwsp);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_0900
     * @tc.name mapValuesPart01Test009
     * @tc.desc Verify V=string Unicode emoji, values emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('k1', '🚀');
      let iter: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = iter.next();
      expect(r.value!).assertEqual('🚀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_1000
     * @tc.name mapValuesPart01Test010
     * @tc.desc Verify V=string XSS, values script
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      let xss: string = '<img src=x onerror=alert(1)>';
      m.set('k1', xss);
      let iter: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = iter.next();
      expect(r.value!).assertEqual(xss);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_1100
     * @tc.name mapValuesPart01Test011
     * @tc.desc Verify V=string, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      let unit: string = 'abcdefghij';
      let longStr: string = '';
      for (let i: int = 0; i < 500; i++) {
        longStr = longStr + unit;
      }
      m.set('k1', longStr);
      let iter: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = iter.next();
      expect(r.value!.length).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_1200
     * @tc.name mapValuesPart01Test012
     * @tc.desc Verify V=int, values int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k1', 73);
      let iter: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = iter.next();
      expect(r.value!).assertEqual(73);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_1300
     * @tc.name mapValuesPart01Test013
     * @tc.desc Verify V=int MAX, values 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k1', 2147483647);
      let iter: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = iter.next();
      expect(r.value!).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_1400
     * @tc.name mapValuesPart01Test014
     * @tc.desc Verify V=int MIN, values -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k1', -2147483648);
      let iter: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = iter.next();
      expect(r.value!).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_1500
     * @tc.name mapValuesPart01Test015
     * @tc.desc Verify V=int, values 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k1', 0);
      let iter: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = iter.next();
      expect(r.value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_1600
     * @tc.name mapValuesPart01Test016
     * @tc.desc Verify V=int, values -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k1', -1);
      let iter: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = iter.next();
      expect(r.value!).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_1700
     * @tc.name mapValuesPart01Test017
     * @tc.desc Verify V=number, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('k1', 2.718281828459045);
      let iter: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = iter.next();
      expect(r.value!).assertEqual(2.718281828459045);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_1800
     * @tc.name mapValuesPart01Test018
     * @tc.desc Verify V=number NaN, values NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('k1', Number.NaN);
      let iter: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = iter.next();
      expect(isNaN(r.value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_1900
     * @tc.name mapValuesPart01Test019
     * @tc.desc Verify V=number, values POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('k1', Number.POSITIVE_INFINITY);
      let iter: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = iter.next();
      expect(r.value!).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_2000
     * @tc.name mapValuesPart01Test020
     * @tc.desc Verify V=number, values NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('k1', Number.NEGATIVE_INFINITY);
      let iter: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = iter.next();
      expect(r.value!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_2100
     * @tc.name mapValuesPart01Test021
     * @tc.desc Verify V=number, values -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('k1', -0.0);
      let iter: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = iter.next();
      expect(1.0 / r.value!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_2200
     * @tc.name mapValuesPart01Test022
     * @tc.desc Verify V=number EPSILON, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('k1', Number.EPSILON);
      let iter: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = iter.next();
      expect(r.value!).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_2300
     * @tc.name mapValuesPart01Test023
     * @tc.desc Verify V=boolean true, values true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>();
      m.set('k1', true);
      let iter: IterableIterator<boolean> = m.values();
      let r: IteratorResult<boolean> = iter.next();
      expect(r.value!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_2400
     * @tc.name mapValuesPart01Test024
     * @tc.desc Verify V=boolean false, values false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>();
      m.set('k1', false);
      let iter: IterableIterator<boolean> = m.values();
      let r: IteratorResult<boolean> = iter.next();
      expect(r.value!).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_2500
     * @tc.name mapValuesPart01Test025
     * @tc.desc Verify V=long, values long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>();
      m.set('k1', Int.toLong(256));
      let iter: IterableIterator<long> = m.values();
      let r: IteratorResult<long> = iter.next();
      expect(r.value!).assertEqual(Int.toLong(256));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_2600
     * @tc.name mapValuesPart01Test026
     * @tc.desc Verify V=long MAX, values 9223372036854775807n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>();
      m.set('k1', 9223372036854775807);
      let iter: IterableIterator<long> = m.values();
      let r: IteratorResult<long> = iter.next();
      expect(r.value!).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_2700
     * @tc.name mapValuesPart01Test027
     * @tc.desc Verify V=long MIN, values -9223372036854775808n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>();
      m.set('k1', (-9223372036854775807 - 1));
      let iter: IterableIterator<long> = m.values();
      let r: IteratorResult<long> = iter.next();
      expect(r.value!).assertEqual((-9223372036854775807 - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_2800
     * @tc.name mapValuesPart01Test028
     * @tc.desc Verify V=long, values 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>();
      m.set('k1', Int.toLong(0));
      let iter: IterableIterator<long> = m.values();
      let r: IteratorResult<long> = iter.next();
      expect(r.value!).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_2900
     * @tc.name mapValuesPart01Test029
     * @tc.desc Verify V=double, values double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      m.set('k1', 1.4142135623730951);
      let iter: IterableIterator<double> = m.values();
      let r: IteratorResult<double> = iter.next();
      expect(r.value!).assertEqual(1.4142135623730951);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_3000
     * @tc.name mapValuesPart01Test030
     * @tc.desc Verify V=double NaN, values double NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      m.set('k1', Number.NaN);
      let iter: IterableIterator<double> = m.values();
      let r: IteratorResult<double> = iter.next();
      expect(isNaN(r.value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_3100
     * @tc.name mapValuesPart01Test031
     * @tc.desc Verify V=double, values double Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      m.set('k1', Number.POSITIVE_INFINITY);
      let iter: IterableIterator<double> = m.values();
      let r: IteratorResult<double> = iter.next();
      expect(r.value!).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_3200
     * @tc.name mapValuesPart01Test032
     * @tc.desc Verify V=double, values double -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      m.set('k1', -Number.POSITIVE_INFINITY);
      let iter: IterableIterator<double> = m.values();
      let r: IteratorResult<double> = iter.next();
      expect(r.value!).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_3300
     * @tc.name mapValuesPart01Test033
     * @tc.desc Verify V=byte, values 0 as byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, byte> = new Map<string, byte>();
      m.set('k1', 0 as byte);
      let iter: IterableIterator<byte> = m.values();
      let r: IteratorResult<byte> = iter.next();
      expect(r.value!).assertEqual(0 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_3400
     * @tc.name mapValuesPart01Test034
     * @tc.desc Verify V=byte MAX, values 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, byte> = new Map<string, byte>();
      m.set('k1', 127 as byte);
      let iter: IterableIterator<byte> = m.values();
      let r: IteratorResult<byte> = iter.next();
      expect(r.value!).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_3500
     * @tc.name mapValuesPart01Test035
     * @tc.desc Verify V=byte MIN, values -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, byte> = new Map<string, byte>();
      m.set('k1', -128 as byte);
      let iter: IterableIterator<byte> = m.values();
      let r: IteratorResult<byte> = iter.next();
      expect(r.value!).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_3600
     * @tc.name mapValuesPart01Test036
     * @tc.desc Verify V=short, values short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, short> = new Map<string, short>();
      m.set('k1', 100 as short);
      let iter: IterableIterator<short> = m.values();
      let r: IteratorResult<short> = iter.next();
      expect(r.value!).assertEqual(100 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_3700
     * @tc.name mapValuesPart01Test037
     * @tc.desc Verify V=short MAX, values 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, short> = new Map<string, short>();
      m.set('k1', 32767 as short);
      let iter: IterableIterator<short> = m.values();
      let r: IteratorResult<short> = iter.next();
      expect(r.value!).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_3800
     * @tc.name mapValuesPart01Test038
     * @tc.desc Verify V=short MIN, values -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, short> = new Map<string, short>();
      m.set('k1', -32768 as short);
      let iter: IterableIterator<short> = m.values();
      let r: IteratorResult<short> = iter.next();
      expect(r.value!).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_3900
     * @tc.name mapValuesPart01Test039
     * @tc.desc Verify V=float NaN, values float NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, float> = new Map<string, float>();
      m.set('k1', Float.NaN);
      let iter: IterableIterator<float> = m.values();
      let r: IteratorResult<float> = iter.next();
      expect(isNaN(r.value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_4000
     * @tc.name mapValuesPart01Test040
     * @tc.desc Verify V=float, values float Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, float> = new Map<string, float>();
      m.set('k1', Float.POSITIVE_INFINITY);
      let iter: IterableIterator<float> = m.values();
      let r: IteratorResult<float> = iter.next();
      expect(r.value!).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_4100
     * @tc.name mapValuesPart01Test041
     * @tc.desc Verify V=float, values float -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, float> = new Map<string, float>();
      m.set('k1', -Float.POSITIVE_INFINITY);
      let iter: IterableIterator<float> = m.values();
      let r: IteratorResult<float> = iter.next();
      expect(r.value!).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_4200
     * @tc.name mapValuesPart01Test042
     * @tc.desc Verify V=float, values float -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, float> = new Map<string, float>();
      m.set('k1', -0.0 as float);
      let iter: IterableIterator<float> = m.values();
      let r: IteratorResult<float> = iter.next();
      let div: float = 1.0 as float / r.value!;
      expect(div).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_4300
     * @tc.name mapValuesPart01Test043
     * @tc.desc Verify V=char ASCII, values char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, char> = new Map<string, char>();
      let cv: char = c'X';
      m.set('k1', cv);
      let iter: IterableIterator<char> = m.values();
      let r: IteratorResult<char> = iter.next();
      expect(r.value!).assertEqual(cv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_4400
     * @tc.name mapValuesPart01Test044
     * @tc.desc Verify V=char Unicode, values char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, char> = new Map<string, char>();
      let cv: char = c'\u5B57';
      m.set('k1', cv);
      let iter: IterableIterator<char> = m.values();
      let r: IteratorResult<char> = iter.next();
      expect(r.value!).assertEqual(cv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_4500
     * @tc.name mapValuesPart01Test045
     * @tc.desc Verify V=bigint, values bigint value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, bigint> = new Map<string, bigint>();
      let bv: bigint = 123456789n;
      m.set('k1', bv);
      let iter: IterableIterator<bigint> = m.values();
      let r: IteratorResult<bigint> = iter.next();
      expect(r.value!).assertEqual(bv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_4600
     * @tc.name mapValuesPart01Test046
     * @tc.desc Verify V=bigint, values MAX_SAFE_INTEGER bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, bigint> = new Map<string, bigint>();
      let bv: bigint = 9223372036854775807n;
      m.set('k1', bv);
      let iter: IterableIterator<bigint> = m.values();
      let r: IteratorResult<bigint> = iter.next();
      expect(r.value!).assertEqual(bv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_4700
     * @tc.name mapValuesPart01Test047
     * @tc.desc Verify V=Date, values Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Date> = new Map<string, Date>();
      let dt: Date = new Date(1710000000000);
      m.set('k1', dt);
      let iter: IterableIterator<Date> = m.values();
      let r: IteratorResult<Date> = iter.next();
      expect(r.value!.getTime()).assertEqual(1710000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_4800
     * @tc.name mapValuesPart01Test048
     * @tc.desc Verify V=Date, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Date> = new Map<string, Date>();
      let d1: Date = new Date(1600000000000);
      let d2: Date = new Date(1600000000000);
      m.set('a', d1);
      m.set('b', d2);
      let iter: IterableIterator<Date> = m.values();
      let r1: IteratorResult<Date> = iter.next();
      let r2: IteratorResult<Date> = iter.next();
      expect(r1.value!).not().assertNull();
      expect(r2.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_4900
     * @tc.name mapValuesPart01Test049
     * @tc.desc Verify V=RegExp, values RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, RegExp> = new Map<string, RegExp>();
      let re: RegExp = new RegExp('sdk', 'i');
      m.set('k1', re);
      let iter: IterableIterator<RegExp> = m.values();
      let r: IteratorResult<RegExp> = iter.next();
      expect(r.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_5000
     * @tc.name mapValuesPart01Test050
     * @tc.desc Verify V=RegExp pattern, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, RegExp> = new Map<string, RegExp>();
      let r1: RegExp = new RegExp('test', 'g');
      let r2: RegExp = new RegExp('test', 'g');
      m.set('x', r1);
      m.set('y', r2);
      let iter: IterableIterator<RegExp> = m.values();
      let firstVal: IteratorResult<RegExp> = iter.next();
      let secondVal: IteratorResult<RegExp> = iter.next();
      expect(firstVal.value!).not().assertNull();
      expect(secondVal.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_5100
     * @tc.name mapValuesPart01Test051
     * @tc.desc Verify V=Error, values Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Error> = new Map<string, Error>();
      let err: Error = new Error('runtime fault');
      m.set('k1', err);
      let iter: IterableIterator<Error> = m.values();
      let r: IteratorResult<Error> = iter.next();
      expect(r.value!.message).assertEqual('runtime fault');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_5200
     * @tc.name mapValuesPart01Test052
     * @tc.desc Verify V=object, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Item> = new Map<string, Item>();
      let obj: Item = { id: 5, label: 'widget' };
      m.set('k1', obj);
      let iter: IterableIterator<Item> = m.values();
      let r: IteratorResult<Item> = iter.next();
      expect(r.value!.id).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_5300
     * @tc.name mapValuesPart01Test053
     * @tc.desc Verify V=object, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Node> = new Map<string, Node>();
      let n1: Node = { val: 1 };
      let n2: Node = { val: 1 };
      m.set('a', n1);
      m.set('b', n2);
      let iter: IterableIterator<Node> = m.values();
      let firstVal: IteratorResult<Node> = iter.next();
      let secondVal: IteratorResult<Node> = iter.next();
      expect(firstVal.value!).not().assertNull();
      expect(secondVal.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_5400
     * @tc.name mapValuesPart01Test054
     * @tc.desc Verify V=class, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, BoxVal1> = new Map<string, BoxVal1>();
      let bx: BoxVal1 = new BoxVal1();
      bx.content = 99;
      m.set('k1', bx);
      let iter: IterableIterator<BoxVal1> = m.values();
      let r: IteratorResult<BoxVal1> = iter.next();
      expect(r.value!.content).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_5500
     * @tc.name mapValuesPart01Test055
     * @tc.desc Verify V=Array, values >]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int[]> = new Map<string, int[]>();
      let arr: int[] = [5, 10, 15];
      m.set('k1', arr);
      let iter: IterableIterator<int[]> = m.values();
      let r: IteratorResult<int[]> = iter.next();
      expect(r.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_5600
     * @tc.name mapValuesPart01Test056
     * @tc.desc Verify V=Array, values >]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string[]> = new Map<string, string[]>();
      let emptyArr: string[] = [];
      m.set('k1', emptyArr);
      let iter: IterableIterator<string[]> = m.values();
      let r: IteratorResult<string[]> = iter.next();
      expect(r.value!.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_5700
     * @tc.name mapValuesPart01Test057
     * @tc.desc Verify V= Map, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Map<int, string>> = new Map<string, Map<int, string>>();
      const inner: Map<int, string> = new Map<int, string>();
      inner.set(8, 'eight');
      m.set('k1', inner);
      const iter: IterableIterator<Map<int, string>> = m.values();
      const r: IteratorResult<Map<int, string>> = iter.next();
      expect(r.value!.get(8)).assertEqual('eight');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_5800
     * @tc.name mapValuesPart01Test058
     * @tc.desc Verify V=Set, values Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Set<string>> = new Map<string, Set<string>>();
      let st: Set<string> = new Set<string>();
      st.add('element');
      m.set('k1', st);
      let iter: IterableIterator<Set<string>> = m.values();
      let r: IteratorResult<Set<string>> = iter.next();
      expect(r.value!.has('element')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_5900
     * @tc.name mapValuesPart01Test059
     * @tc.desc Verify V=TypedArray, values Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Int8Array> = new Map<string, Int8Array>();
      let ta: Int8Array = new Int8Array([-1, 0, 1]);
      m.set('k1', ta);
      let iter: IterableIterator<Int8Array> = m.values();
      let r: IteratorResult<Int8Array> = iter.next();
      expect(r.value![0]).assertEqual(-1 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_6000
     * @tc.name mapValuesPart01Test060
     * @tc.desc Verify V=Record, values Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Record<string, int>> = new Map<string, Record<string, int>>();
      const rec: Record<string, int> = new Record<string, int>();
      rec.set('score', 85);
      m.set('k1', rec);
      const iter: IterableIterator<Record<string, int>> = m.values();
      const r: IteratorResult<Record<string, int>> = iter.next();
      expect(r.value!.get('score')).assertEqual(85);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_6100
     * @tc.name mapValuesPart01Test061
     * @tc.desc Verify V=Promise, values Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Promise<int>> = new Map<string, Promise<int>>();
      let pm: Promise<int> = new Promise<int>((resolve, reject) => { resolve(42); });
      m.set('k1', pm);
      let iter: IterableIterator<Promise<int>> = m.values();
      let r: IteratorResult<Promise<int>> = iter.next();
      expect(r.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_6200
     * @tc.name mapValuesPart01Test062
     * @tc.desc Verify V=WeakMap, values WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, WeakMap<object, string>> = new Map<string, WeakMap<object, string>>();
      const wm: WeakMap<object, string> = new WeakMap<object, string>();
      let wk: object = {};
      wm.set(wk, 'wmval');
      m.set('k1', wm);
      const iter: IterableIterator<WeakMap<object, string>> = m.values();
      const r: IteratorResult<WeakMap<object, string>> = iter.next();
      expect(r.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_6300
     * @tc.name mapValuesPart01Test063
     * @tc.desc Verify V=WeakSet, values WeakSet
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, WeakSet<object>> = new Map<string, WeakSet<object>>();
      let ws: WeakSet<object> = new WeakSet<object>();
      let wo: object = {};
      ws.add(wo);
      m.set('k1', ws);
      let iter: IterableIterator<WeakSet<object>> = m.values();
      let r: IteratorResult<WeakSet<object>> = iter.next();
      expect(r.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_6400
     * @tc.name mapValuesPart01Test064
     * @tc.desc Verify V=JSON, values JSON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Payload> = new Map<string, Payload>();
      let pl: Payload = { code: 200, data: 'ok' };
      m.set('k1', pl);
      let iter: IterableIterator<Payload> = m.values();
      let r: IteratorResult<Payload> = iter.next();
      expect(r.value!.code).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_6500
     * @tc.name mapValuesPart01Test065
     * @tc.desc Verify V null, value null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int | null> = new Map<string, int | null>();
      m.set('k1', null);
      let iter: IterableIterator<int | null> = m.values();
      let r: IteratorResult<int | null> = iter.next();
      expect(r.value).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_6600
     * @tc.name mapValuesPart01Test066
     * @tc.desc Verify V undefined, value undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | undefined> = new Map<string, string | undefined>();
      m.set('k1', undefined);
      let iter: IterableIterator<string | undefined> = m.values();
      let r: IteratorResult<string | undefined> = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_6700
     * @tc.name mapValuesPart01Test067
     * @tc.desc Verify V null, values null null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | null> = new Map<string, string | null>();
      m.set('key_a', 'normal');
      m.set('key_b', null);
      let iter: IterableIterator<string | null> = m.values();
      expect(iter.next().value!).assertEqual('normal');
      expect(iter.next().value).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_6800
     * @tc.name mapValuesPart01Test068
     * @tc.desc Verify V undefined, values undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int | undefined> = new Map<string, int | undefined>();
      m.set('a', undefined);
      m.set('b', 55);
      let iter: IterableIterator<int | undefined> = m.values();
      expect(iter.next().value).assertUndefined();
      expect(iter.next().value!).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_6900
     * @tc.name mapValuesPart01Test069
     * @tc.desc Verify K=int, values int Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(10, 'ten');
      m.set(20, 'twenty');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('ten');
      expect(iter.next().value!).assertEqual('twenty');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_7000
     * @tc.name mapValuesPart01Test070
     * @tc.desc Verify K=number, values number Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>();
      m.set(0.5, 'half');
      m.set(1.5, 'onehalf');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('half');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_7100
     * @tc.name mapValuesPart01Test071
     * @tc.desc Verify K=boolean, values boolean Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, string> = new Map<boolean, string>();
      m.set(false, 'no');
      m.set(true, 'yes');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('no');
      expect(iter.next().value!).assertEqual('yes');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_7200
     * @tc.name mapValuesPart01Test072
     * @tc.desc Verify K=long, values long Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>();
      m.set(Int.toLong(1), 'first');
      m.set(Int.toLong(2), 'second');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_7300
     * @tc.name mapValuesPart01Test073
     * @tc.desc Verify K=double, values double Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, string> = new Map<double, string>();
      m.set(1.1, 'v1');
      m.set(2.2, 'v2');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('v1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_7400
     * @tc.name mapValuesPart01Test074
     * @tc.desc Verify K=byte, values byte Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, string> = new Map<byte, string>();
      m.set(1 as byte, 'b1');
      m.set(2 as byte, 'b2');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('b1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_7500
     * @tc.name mapValuesPart01Test075
     * @tc.desc Verify K=short, values short Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, string> = new Map<short, string>();
      m.set(1 as short, 's1');
      m.set(2 as short, 's2');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('s1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_7600
     * @tc.name mapValuesPart01Test076
     * @tc.desc Verify K=float, values float Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, string> = new Map<float, string>();
      m.set(1.0 as float, 'f1');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('f1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_7700
     * @tc.name mapValuesPart01Test077
     * @tc.desc Verify K=char, values char Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<char, string> = new Map<char, string>();
      m.set(c'K', 'kval');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('kval');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_7800
     * @tc.name mapValuesPart01Test078
     * @tc.desc Verify K=bigint, values bigint Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<bigint, string> = new Map<bigint, string>();
      m.set(500n, 'bigval');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('bigval');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_7900
     * @tc.name mapValuesPart01Test079
     * @tc.desc Verify K=Date, values Date Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<Date, string> = new Map<Date, string>();
      m.set(new Date(1650000000000), 'dval');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('dval');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_8000
     * @tc.name mapValuesPart01Test080
     * @tc.desc Verify K=RegExp, values RegExp Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<RegExp, string> = new Map<RegExp, string>();
      m.set(new RegExp('key', 'm'), 'reval');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('reval');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_8100
     * @tc.name mapValuesPart01Test081
     * @tc.desc Verify K=Error, values Error Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<Error, string> = new Map<Error, string>();
      m.set(new Error('kerr'), 'errval');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('errval');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_8200
     * @tc.name mapValuesPart01Test082
     * @tc.desc Verify K=object, values object Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<KeyId, string> = new Map<KeyId, string>();
      let kid: KeyId = { id: 99 };
      m.set(kid, 'objval');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('objval');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_VALUES_PART01_8300
     * @tc.name mapValuesPart01Test083
     * @tc.desc Verify K=class, values class Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapValuesPart01Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<KeyToken, string> = new Map<KeyToken, string>();
      let kt: KeyToken = new KeyToken();
      kt.token = 'abc';
      m.set(kt, 'tokval');
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('tokval');
    });

  });
}
