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

export default function mapNextPart02TestTest(): void {
  describe('MapNextPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_0100
     * @tc.name mapNextPart02Test001
     * @tc.desc Verify keys next() typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter = map.keys();
      let result = iter.next();
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_0200
     * @tc.name mapNextPart02Test002
     * @tc.desc Verify keys next() done typeof boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter = map.keys();
      let result = iter.next();
      expect(typeof result.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_0300
     * @tc.name mapNextPart02Test003
     * @tc.desc Verify keys K=string next().value typeof string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['hello', 1]]);
      const iter = map.keys();
      let result = iter.next();
      expect(typeof result.value!).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_0400
     * @tc.name mapNextPart02Test004
     * @tc.desc Verify keys K=int next().value typeof int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[42, 'val']]);
      const iter = map.keys();
      let result = iter.next();
      expect(typeof result.value!).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_0500
     * @tc.name mapNextPart02Test005
     * @tc.desc Verify keys K=long next().value typeof long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>([[Int.toLong(1), 'longVal']]);
      const iter = map.keys();
      let result = iter.next();
      expect(typeof result.value!).assertEqual('long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_0600
     * @tc.name mapNextPart02Test006
     * @tc.desc Verify keys K=double next().value typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>([[3.14, 'pi']]);
      const iter = map.keys();
      let result = iter.next();
      expect(typeof result.value!).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_0700
     * @tc.name mapNextPart02Test007
     * @tc.desc Verify entries next().value typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['x', 1]]);
      const iter = map.entries();
      let result = iter.next();
      expect(typeof result.value!).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_0800
     * @tc.name mapNextPart02Test008
     * @tc.desc Verify keys next().value typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter = map.keys();
      iter.next();
      let result = iter.next();
      expect(typeof result.value).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_0900
     * @tc.name mapNextPart02Test009
     * @tc.desc Verify keys K=Date next().value Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(0);
      const map: Map<Date, string> = new Map<Date, string>([[d, 'epoch']]);
      const iter = map.keys();
      let result = iter.next();
      expect(result.value! instanceof Date).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_1000
     * @tc.name mapNextPart02Test010
     * @tc.desc Verify keys K=RegExp next().value RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re: RegExp = new RegExp('abc');
      const map: Map<RegExp, string> = new Map<RegExp, string>([[re, 'match']]);
      const iter = map.keys();
      let result = iter.next();
      expect(result.value! instanceof RegExp).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_1100
     * @tc.name mapNextPart02Test011
     * @tc.desc Verify values V=Date next().value Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(86400000);
      const map: Map<string, Date> = new Map<string, Date>([['day2', d]]);
      const iter = map.values();
      let result = iter.next();
      expect(result.value! instanceof Date).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_1200
     * @tc.name mapNextPart02Test012
     * @tc.desc Verify values V=RegExp next().value RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re: RegExp = new RegExp('xyz', 'i');
      const map: Map<string, RegExp> = new Map<string, RegExp>([['pattern', re]]);
      const iter = map.values();
      let result = iter.next();
      expect(result.value! instanceof RegExp).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_1300
     * @tc.name mapNextPart02Test013
     * @tc.desc Verify Map keys next() done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter = map.keys();
      let result = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_1400
     * @tc.name mapNextPart02Test014
     * @tc.desc Verify Map values next() done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter = map.values();
      let result = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_1500
     * @tc.name mapNextPart02Test015
     * @tc.desc Verify Map entries next() done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter = map.entries();
      let result = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_1600
     * @tc.name mapNextPart02Test016
     * @tc.desc Verify Map keys next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      const iter = map.keys();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_1700
     * @tc.name mapNextPart02Test017
     * @tc.desc Verify Map values next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      const iter = map.values();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_1800
     * @tc.name mapNextPart02Test018
     * @tc.desc Verify Map entries next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      const iter = map.entries();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_1900
     * @tc.name mapNextPart02Test019
     * @tc.desc Verify keys next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter = map.keys();
      iter.next();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_2000
     * @tc.name mapNextPart02Test020
     * @tc.desc Verify values next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter = map.values();
      iter.next();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_2100
     * @tc.name mapNextPart02Test021
     * @tc.desc Verify entries next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter = map.entries();
      iter.next();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_2200
     * @tc.name mapNextPart02Test022
     * @tc.desc Verify keys next().done false next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['only', 1]]);
      const iter = map.keys();
      let r1 = iter.next();
      let r2 = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_2300
     * @tc.name mapNextPart02Test023
     * @tc.desc Verify values next().done false next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['only', 1]]);
      const iter = map.values();
      let r1 = iter.next();
      let r2 = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_2400
     * @tc.name mapNextPart02Test024
     * @tc.desc Verify entries next().done false next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['only', 1]]);
      const iter = map.entries();
      let r1 = iter.next();
      let r2 = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_2500
     * @tc.name mapNextPart02Test025
     * @tc.desc Verify keys next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter = map.keys();
      iter.next();
      iter.next();
      let r3 = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_2600
     * @tc.name mapNextPart02Test026
     * @tc.desc Verify values next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter = map.values();
      iter.next();
      iter.next();
      let r3 = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_2700
     * @tc.name mapNextPart02Test027
     * @tc.desc Verify keys K=string next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['hello', 1]]);
      const iter = map.keys();
      let result = iter.next();
      expect(result.value!).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_2800
     * @tc.name mapNextPart02Test028
     * @tc.desc Verify keys K=int next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[42, 'val']]);
      const iter = map.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_2900
     * @tc.name mapNextPart02Test029
     * @tc.desc Verify keys K=boolean next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>([[true, 'yes']]);
      const iter = map.keys();
      let result = iter.next();
      expect(result.value!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_3000
     * @tc.name mapNextPart02Test030
     * @tc.desc Verify keys K=long next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>([[Int.toLong(1), 'longVal']]);
      const iter = map.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(Int.toLong(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_3100
     * @tc.name mapNextPart02Test031
     * @tc.desc Verify keys K=Date next().value Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(0);
      const map: Map<Date, string> = new Map<Date, string>([[d, 'epoch']]);
      const iter = map.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_3200
     * @tc.name mapNextPart02Test032
     * @tc.desc Verify values V=string next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[1, 'world']]);
      const iter = map.values();
      let result = iter.next();
      expect(result.value!).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_3300
     * @tc.name mapNextPart02Test033
     * @tc.desc Verify values V=int next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['k', 100]]);
      const iter = map.values();
      let result = iter.next();
      expect(result.value!).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_3400
     * @tc.name mapNextPart02Test034
     * @tc.desc Verify values V=boolean next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, boolean> = new Map<string, boolean>([['flag', false]]);
      const iter = map.values();
      let result = iter.next();
      expect(result.value!).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_3500
     * @tc.name mapNextPart02Test035
     * @tc.desc Verify values V=long next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, long> = new Map<string, long>([['big', 9999999999]]);
      const iter = map.values();
      let result = iter.next();
      expect(result.value!).assertEqual(9999999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_3600
     * @tc.name mapNextPart02Test036
     * @tc.desc Verify values V=Date next().value Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(86400000);
      const map: Map<string, Date> = new Map<string, Date>([['day2', d]]);
      const iter = map.values();
      let result = iter.next();
      expect(result.value!).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_3700
     * @tc.name mapNextPart02Test037
     * @tc.desc Verify entries next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['alpha', 10]]);
      const iter = map.entries();
      let result = iter.next();
      expect(result.value![0]).assertEqual('alpha');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_3800
     * @tc.name mapNextPart02Test038
     * @tc.desc Verify entries next().value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['alpha', 10]]);
      const iter = map.entries();
      let result = iter.next();
      expect(result.value![1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_3900
     * @tc.name mapNextPart02Test039
     * @tc.desc Verify keys next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter = map.keys();
      iter.next();
      let result = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_4000
     * @tc.name mapNextPart02Test040
     * @tc.desc Verify values next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter = map.values();
      iter.next();
      let result = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_4100
     * @tc.name mapNextPart02Test041
     * @tc.desc Verify entries next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter = map.entries();
      iter.next();
      let result = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_4200
     * @tc.name mapNextPart02Test042
     * @tc.desc Verify Map keys next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      const iter = map.keys();
      let result = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_4300
     * @tc.name mapNextPart02Test043
     * @tc.desc Verify Map entries next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      const iter = map.entries();
      let result = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_4400
     * @tc.name mapNextPart02Test044
     * @tc.desc Verify entries next().value length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['x', 1]]);
      const iter = map.entries();
      let result = iter.next();
      expect(result.value!.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_4500
     * @tc.name mapNextPart02Test045
     * @tc.desc Verify keys next() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter = map.keys();
      let beforeSize: number = map.size;
      iter.next();
      let afterSize: number = map.size;
      expect(afterSize).assertEqual(beforeSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_4600
     * @tc.name mapNextPart02Test046
     * @tc.desc Verify values next() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter = map.values();
      let beforeSize: number = map.size;
      iter.next();
      let afterSize: number = map.size;
      expect(afterSize).assertEqual(beforeSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_4700
     * @tc.name mapNextPart02Test047
     * @tc.desc Verify entries next() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter = map.entries();
      let beforeSize: number = map.size;
      iter.next();
      let afterSize: number = map.size;
      expect(afterSize).assertEqual(beforeSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_4800
     * @tc.name mapNextPart02Test048
     * @tc.desc Verify keys Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter = map.keys();
      iter.next();
      iter.next();
      iter.next();
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_4900
     * @tc.name mapNextPart02Test049
     * @tc.desc Verify entries Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter = map.entries();
      iter.next();
      iter.next();
      iter.next();
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_5000
     * @tc.name mapNextPart02Test050
     * @tc.desc Verify keys Map has() true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter = map.keys();
      iter.next();
      iter.next();
      expect(map.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_5100
     * @tc.name mapNextPart02Test051
     * @tc.desc Verify values Map get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter = map.values();
      iter.next();
      iter.next();
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_5200
     * @tc.name mapNextPart02Test052
     * @tc.desc Verify entries Map get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter = map.entries();
      iter.next();
      iter.next();
      expect(map.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_5300
     * @tc.name mapNextPart02Test053
     * @tc.desc Verify keys keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter1 = map.keys();
      iter1.next();
      iter1.next();
      const iter2 = map.keys();
      let r = iter2.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_5400
     * @tc.name mapNextPart02Test054
     * @tc.desc Verify values values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter1 = map.values();
      iter1.next();
      iter1.next();
      const iter2 = map.values();
      let r = iter2.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_5500
     * @tc.name mapNextPart02Test055
     * @tc.desc Verify entries entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter1 = map.entries();
      iter1.next();
      iter1.next();
      const iter2 = map.entries();
      let r = iter2.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('a');
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_5600
     * @tc.name mapNextPart02Test056
     * @tc.desc Verify Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iterA = map.keys();
      const iterB = map.keys();
      iterA.next();
      let rB = iterB.next();
      expect(rB.value!).assertEqual('a');
      let rA2 = iterA.next();
      expect(rA2.value!).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART02_TEST_5700
     * @tc.name mapNextPart02Test057
     * @tc.desc Verify Map entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iterA = map.entries();
      const iterB = map.entries();
      iterA.next();
      let rB = iterB.next();
      expect(rB.value![0]).assertEqual('a');
      let rA2 = iterA.next();
      expect(rA2.value![0]).assertEqual('b');
    });

  });
}
