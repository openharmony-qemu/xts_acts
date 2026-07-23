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

interface OKey { tag: number; desc: string; }
class CKey { id: number = 0; }
interface PKey { x: number; y: number; }
class BKey { name: string = ''; }
interface DKey { a: number; b: string; }
class EKey { uid: number = 0; }

export default function mapKeysPart02TestTest(): void {
  describe('MapKeysPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_0100
     * @tc.name mapKeysPart02Test001
     * @tc.desc Verify K=string keys() typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('alpha', 10);
      let iter: IterableIterator<string> = m.keys();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_0200
     * @tc.name mapKeysPart02Test002
     * @tc.desc Verify keys() null K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('notNull', 1);
      let iter: IterableIterator<string> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual('notNull');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_0300
     * @tc.name mapKeysPart02Test003
     * @tc.desc Verify keys() null K=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(0 as int, 'zero');
      let iter: IterableIterator<int> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(0 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_0400
     * @tc.name mapKeysPart02Test004
     * @tc.desc Verify Map keys() null K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      expect(m.size).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_0500
     * @tc.name mapKeysPart02Test005
     * @tc.desc Verify Map keys() null K=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>();
      let iter: IterableIterator<number> = m.keys();
      expect(m.size).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_0600
     * @tc.name mapKeysPart02Test006
     * @tc.desc Verify K=string typeof iter.next function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 1]]);
      let iter: IterableIterator<string> = m.keys();
      expect(typeof iter.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_0700
     * @tc.name mapKeysPart02Test007
     * @tc.desc Verify Map next() done typeof boolean K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('first', 1);
      let iter: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iter.next();
      expect(typeof r.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_0800
     * @tc.name mapKeysPart02Test008
     * @tc.desc Verify Map next().done false K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('one', 1);
      let iter: IterableIterator<string> = m.keys();
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_0900
     * @tc.name mapKeysPart02Test009
     * @tc.desc Verify Map next().done false K=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(33 as int, 'v');
      let iter: IterableIterator<int> = m.keys();
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_1000
     * @tc.name mapKeysPart02Test010
     * @tc.desc Verify next().done true K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['only', 1]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_1100
     * @tc.name mapKeysPart02Test011
     * @tc.desc Verify next().done true K=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(8.8, 1);
      let iter: IterableIterator<number> = m.keys();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_1200
     * @tc.name mapKeysPart02Test012
     * @tc.desc Verify Map next().done true K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_1300
     * @tc.name mapKeysPart02Test013
     * @tc.desc Verify Map next().done true K=boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      let iter: IterableIterator<boolean> = m.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_1400
     * @tc.name mapKeysPart02Test014
     * @tc.desc Verify 3 next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['item', 1]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_1500
     * @tc.name mapKeysPart02Test015
     * @tc.desc Verify K=string next().value typeof string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('hello', 1);
      let iter: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iter.next();
      expect(typeof r.value!).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_1600
     * @tc.name mapKeysPart02Test016
     * @tc.desc Verify K=int next().value typeof int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(42 as int, 'answer');
      let iter: IterableIterator<int> = m.keys();
      let r: IteratorResult<int> = iter.next();
      expect(typeof r.value!).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_1700
     * @tc.name mapKeysPart02Test017
     * @tc.desc Verify K=number next().value typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(3.14, 1);
      let iter: IterableIterator<number> = m.keys();
      let r: IteratorResult<number> = iter.next();
      expect(typeof r.value!).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_1800
     * @tc.name mapKeysPart02Test018
     * @tc.desc Verify K=long next().value typeof long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>();
      m.set(Int.toLong(999), 'big');
      let iter: IterableIterator<long> = m.keys();
      let r: IteratorResult<long> = iter.next();
      expect(typeof r.value!).assertEqual('long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_1900
     * @tc.name mapKeysPart02Test019
     * @tc.desc Verify K=byte next().value typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, string> = new Map<byte, string>();
      m.set(64 as byte, 'sixty');
      let iter: IterableIterator<byte> = m.keys();
      let r: IteratorResult<byte> = iter.next();
      expect(typeof r.value!).assertEqual('byte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_2000
     * @tc.name mapKeysPart02Test020
     * @tc.desc Verify K=short next().value typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, int> = new Map<short, int>();
      m.set(5000 as short, 5);
      let iter: IterableIterator<short> = m.keys();
      let r: IteratorResult<short> = iter.next();
      expect(typeof r.value!).assertEqual('short');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_2100
     * @tc.name mapKeysPart02Test021
     * @tc.desc Verify K=float next().value typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, string> = new Map<float, string>();
      m.set(3.75e0 as float, 'pi');
      let iter: IterableIterator<float> = m.keys();
      let r: IteratorResult<float> = iter.next();
      expect(typeof r.value!).assertEqual('float');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_2200
     * @tc.name mapKeysPart02Test022
     * @tc.desc Verify K=char next().value typeof string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<char, int> = new Map<char, int>();
      m.set(c'Z', 90);
      let iter: IterableIterator<char> = m.keys();
      let r: IteratorResult<char> = iter.next();
      expect(typeof r.value!).assertEqual('char');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_2300
     * @tc.name mapKeysPart02Test023
     * @tc.desc Verify K=bigint next().value typeof bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<bigint, int> = new Map<bigint, int>();
      m.set(1234567890n, 1);
      let iter: IterableIterator<bigint> = m.keys();
      let r: IteratorResult<bigint> = iter.next();
      expect(typeof r.value!).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_2400
     * @tc.name mapKeysPart02Test024
     * @tc.desc Verify K=Date next().value typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(2026, 6, 1);
      const m: Map<Date, int> = new Map<Date, int>();
      m.set(d, 1);
      let iter: IterableIterator<Date> = m.keys();
      let r: IteratorResult<Date> = iter.next();
      expect(typeof r.value!).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_2500
     * @tc.name mapKeysPart02Test025
     * @tc.desc Verify K=string next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('', 0);
      let iter: IterableIterator<string> = m.keys();
      expect(iter.next().value!).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_2600
     * @tc.name mapKeysPart02Test026
     * @tc.desc Verify K=string next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('​', 1);
      let iter: IterableIterator<string> = m.keys();
      expect(iter.next().value!).assertEqual('​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_2700
     * @tc.name mapKeysPart02Test027
     * @tc.desc Verify K=string emoji next().value emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('\u{1F600}', 100);
      let iter: IterableIterator<string> = m.keys();
      expect(iter.next().value!).assertEqual('\u{1F600}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_2800
     * @tc.name mapKeysPart02Test028
     * @tc.desc Verify K=string (10000 ) next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'k'.repeat(10000);
      const m: Map<string, int> = new Map<string, int>();
      m.set(longKey, 1);
      let iter: IterableIterator<string> = m.keys();
      expect(iter.next().value!).assertEqual(longKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_2900
     * @tc.name mapKeysPart02Test029
     * @tc.desc Verify K=int MAX(2147483647) next().value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(2147483647 as int, 'max');
      let iter: IterableIterator<int> = m.keys();
      expect(iter.next().value!).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_3000
     * @tc.name mapKeysPart02Test030
     * @tc.desc Verify K=int MIN(-2147483648) next().value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(-2147483648 as int, 'min');
      let iter: IterableIterator<int> = m.keys();
      expect(iter.next().value!).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_3100
     * @tc.name mapKeysPart02Test031
     * @tc.desc Verify K=int 0 next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(0 as int, 'zero');
      let iter: IterableIterator<int> = m.keys();
      expect(iter.next().value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_3200
     * @tc.name mapKeysPart02Test032
     * @tc.desc Verify K=boolean true next().value true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(true, 1);
      let iter: IterableIterator<boolean> = m.keys();
      expect(iter.next().value!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_3300
     * @tc.name mapKeysPart02Test033
     * @tc.desc Verify K=boolean false next().value false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(false, 0);
      let iter: IterableIterator<boolean> = m.keys();
      expect(iter.next().value!).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_3400
     * @tc.name mapKeysPart02Test034
     * @tc.desc Verify K=number NaN next().value isNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(Number.NaN, 1);
      let iter: IterableIterator<number> = m.keys();
      let val: number = iter.next().value!;
      expect(isNaN(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_3500
     * @tc.name mapKeysPart02Test035
     * @tc.desc Verify K=number next().value Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(Number.POSITIVE_INFINITY, 1);
      let iter: IterableIterator<number> = m.keys();
      let val: number = iter.next().value!;
      expect(val).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_3600
     * @tc.name mapKeysPart02Test036
     * @tc.desc Verify K=long MAX next().value 9223372036854775807n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>();
      m.set(9223372036854775807, 'Lmax');
      let iter: IterableIterator<long> = m.keys();
      expect(iter.next().value!).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_3700
     * @tc.name mapKeysPart02Test037
     * @tc.desc Verify K=Date next().value Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keyDate: Date = new Date(2026, 6, 8);
      const m: Map<Date, int> = new Map<Date, int>();
      m.set(keyDate, 1);
      let iter: IterableIterator<Date> = m.keys();
      let yielded: Date = iter.next().value!;
      expect(yielded).assertEqual(keyDate);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_3800
     * @tc.name mapKeysPart02Test038
     * @tc.desc Verify K=RegExp next().value RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keyRe: RegExp = new RegExp('^abc$', 'i');
      const m: Map<RegExp, int> = new Map<RegExp, int>();
      m.set(keyRe, 1);
      let iter: IterableIterator<RegExp> = m.keys();
      let yielded: RegExp = iter.next().value!;
      expect(yielded).assertEqual(keyRe);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_3900
     * @tc.name mapKeysPart02Test039
     * @tc.desc Verify K=object(interface) next().value object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dk: DKey = { a: 5, b: 'five' };
      const m: Map<DKey, int> = new Map<DKey, int>();
      m.set(dk, 1);
      let iter: IterableIterator<DKey> = m.keys();
      let yielded: DKey = iter.next().value!;
      expect(yielded).assertEqual(dk);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_4000
     * @tc.name mapKeysPart02Test040
     * @tc.desc Verify K=class next().value class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ek: EKey = new EKey();
      ek.uid = 111;
      const m: Map<EKey, int> = new Map<EKey, int>();
      m.set(ek, 1);
      let iter: IterableIterator<EKey> = m.keys();
      let yielded: EKey = iter.next().value!;
      expect(yielded).assertEqual(ek);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_4100
     * @tc.name mapKeysPart02Test041
     * @tc.desc Verify Map next().value undefined K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['only', 1]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_4200
     * @tc.name mapKeysPart02Test042
     * @tc.desc Verify Map next().value undefined K=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(99 as int, 'val');
      let iter: IterableIterator<int> = m.keys();
      iter.next();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_4300
     * @tc.name mapKeysPart02Test043
     * @tc.desc Verify Map next().value undefined K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_4400
     * @tc.name mapKeysPart02Test044
     * @tc.desc Verify Map next().value undefined K=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>();
      let iter: IterableIterator<number> = m.keys();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_4500
     * @tc.name mapKeysPart02Test045
     * @tc.desc Verify next().value undefined K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 1]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertUndefined();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_4600
     * @tc.name mapKeysPart02Test046
     * @tc.desc Verify Map(size=0) keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(0 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_4700
     * @tc.name mapKeysPart02Test047
     * @tc.desc Verify Map(size=1) keys() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(1 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_4800
     * @tc.name mapKeysPart02Test048
     * @tc.desc Verify Map(size=2) keys() 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('p', 1);
      m.set('q', 2);
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(2 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_4900
     * @tc.name mapKeysPart02Test049
     * @tc.desc Verify Map(size=3) keys() 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('x', 1);
      m.set('y', 2);
      m.set('z', 3);
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(3 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_5000
     * @tc.name mapKeysPart02Test050
     * @tc.desc Verify Map(size=5) keys() 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a1', 1);
      m.set('a2', 2);
      m.set('a3', 3);
      m.set('a4', 4);
      m.set('a5', 5);
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(5 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_5100
     * @tc.name mapKeysPart02Test051
     * @tc.desc Verify m.size size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('s1', 1);
      m.set('s2', 2);
      m.set('s3', 3);
      m.set('s4', 4);
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(m.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_5200
     * @tc.name mapKeysPart02Test052
     * @tc.desc Verify delete keys() size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('d1', 1);
      m.set('d2', 2);
      m.set('d3', 3);
      m.delete('d2');
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(2 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_5300
     * @tc.name mapKeysPart02Test053
     * @tc.desc Verify clear() keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      m.clear();
      let iter: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_5400
     * @tc.name mapKeysPart02Test054
     * @tc.desc Verify set key 1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('dup', 1);
      m.set('dup', 2);
      m.set('dup', 3);
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(1 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_5500
     * @tc.name mapKeysPart02Test055
     * @tc.desc Verify 50 Map keys() 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      for (let i = 0; i < 50; i++) {
        m.set(i as int, i as int);
      }
      let iter: IterableIterator<int> = m.keys();
      let count: int = 0;
      let r: IteratorResult<int> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(50 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_5600
     * @tc.name mapKeysPart02Test056
     * @tc.desc Verify Map keys() size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_5700
     * @tc.name mapKeysPart02Test057
     * @tc.desc Verify Map keys() size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('single', 100);
      let iter: IterableIterator<string> = m.keys();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_5800
     * @tc.name mapKeysPart02Test058
     * @tc.desc Verify Map keys() size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k1', 1);
      m.set('k2', 2);
      m.set('k3', 3);
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      while (iter.next().done === false) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_5900
     * @tc.name mapKeysPart02Test059
     * @tc.desc Verify Map keys() has() key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('alpha', 10);
      m.set('beta', 20);
      let iter: IterableIterator<string> = m.keys();
      expect(m.has('alpha')).assertTrue();
      expect(m.has('beta')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_6000
     * @tc.name mapKeysPart02Test060
     * @tc.desc Verify Map keys() get() key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('val1', 111);
      m.set('val2', 222);
      let iter: IterableIterator<string> = m.keys();
      expect(m.get('val1')).assertEqual(111);
      expect(m.get('val2')).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_6100
     * @tc.name mapKeysPart02Test061
     * @tc.desc Verify keys() Map get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('mid', 50);
      let iter: IterableIterator<string> = m.keys();
      let firstKey: string = iter.next().value!;
      expect(m.get('mid')).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_6200
     * @tc.name mapKeysPart02Test062
     * @tc.desc Verify keys() Map has() true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('after', 999);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      iter.next();
      expect(m.has('after')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_6300
     * @tc.name mapKeysPart02Test063
     * @tc.desc Verify keys() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('h1', 1);
      m.set('h2', 2);
      m.set('h3', 3);
      m.set('h4', 4);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      iter.next();
      expect(m.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_6400
     * @tc.name mapKeysPart02Test064
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('stable', 42);
      let iter1: IterableIterator<string> = m.keys();
      let iter2: IterableIterator<string> = m.keys();
      let iter3: IterableIterator<string> = m.keys();
      expect(m.size).assertEqual(1);
      expect(m.get('stable')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_6500
     * @tc.name mapKeysPart02Test065
     * @tc.desc Verify keys() partially consumed Map delete()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('removable', 5);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      let deleted: boolean = m.delete('removable');
      expect(deleted).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_6600
     * @tc.name mapKeysPart02Test066
     * @tc.desc Verify keys() Map set() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['existing', 1]]);
      let iter: IterableIterator<string> = m.keys();
      m.set('newOne', 2);
      expect(m.size).assertEqual(2);
      expect(m.get('newOne')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_6700
     * @tc.name mapKeysPart02Test067
     * @tc.desc Verify keys() Map clear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter: IterableIterator<string> = m.keys();
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART02_6800
     * @tc.name mapKeysPart02Test068
     * @tc.desc Verify 5 Map 5 next()done false 6 done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('e1', 1);
      m.set('e2', 2);
      m.set('e3', 3);
      m.set('e4', 4);
      m.set('e5', 5);
      let iter: IterableIterator<string> = m.keys();
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      let r3: IteratorResult<string> = iter.next();
      let r4: IteratorResult<string> = iter.next();
      let r5: IteratorResult<string> = iter.next();
      let r6: IteratorResult<string> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
      expect(r3.done).assertFalse();
      expect(r4.done).assertFalse();
      expect(r5.done).assertFalse();
      expect(r6.done).assertTrue();
    });

  });
}
