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

interface DateEntry { key: string; value: Date; }

export default function readonlyMapValuesPart02TestTest(): void {
  describe('ReadonlyMapValuesPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_0100
     * @tc.name readonlyMapValuesPart02Test001
     * @tc.desc Verify V=string Map values() typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>();
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_0200
     * @tc.name readonlyMapValuesPart02Test002
     * @tc.desc Verify V=string values() next typeof function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'v']]);
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value).assertEqual('v');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_0300
     * @tc.name readonlyMapValuesPart02Test003
     * @tc.desc Verify V=string next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'v']]);
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_0400
     * @tc.name readonlyMapValuesPart02Test004
     * @tc.desc Verify V=int next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 1]]);
      let iter: IterableIterator<int> = m.values();
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_0500
     * @tc.name readonlyMapValuesPart02Test005
     * @tc.desc Verify V=boolean next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, boolean> = new Map<string, boolean>([['k', true]]);
      let iter: IterableIterator<boolean> = m.values();
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_0600
     * @tc.name readonlyMapValuesPart02Test006
     * @tc.desc Verify V=string next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'v']]);
      let iter: IterableIterator<string> = m.values();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_0700
     * @tc.name readonlyMapValuesPart02Test007
     * @tc.desc Verify V=int next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 1]]);
      let iter: IterableIterator<int> = m.values();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_0800
     * @tc.name readonlyMapValuesPart02Test008
     * @tc.desc Verify V=string next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'v']]);
      let iter: IterableIterator<string> = m.values();
      iter.next();
      let result: IteratorResult<string> = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_0900
     * @tc.name readonlyMapValuesPart02Test009
     * @tc.desc Verify V=int next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 1]]);
      let iter: IterableIterator<int> = m.values();
      iter.next();
      let result: IteratorResult<int> = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_1000
     * @tc.name readonlyMapValuesPart02Test010
     * @tc.desc Verify Map(V=string) next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>();
      let iter: IterableIterator<string> = m.values();
      let result: IteratorResult<string> = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_1100
     * @tc.name readonlyMapValuesPart02Test011
     * @tc.desc Verify Map(V=int) next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let iter: IterableIterator<int> = m.values();
      let result: IteratorResult<int> = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_1200
     * @tc.name readonlyMapValuesPart02Test012
     * @tc.desc Verify V=boolean next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, boolean> = new Map<string, boolean>([['k', true]]);
      let iter: IterableIterator<boolean> = m.values();
      expect(iter.next().value!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_1300
     * @tc.name readonlyMapValuesPart02Test013
     * @tc.desc Verify V=number next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['k', 3.14]]);
      let iter: IterableIterator<number> = m.values();
      expect(iter.next().value!).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_1400
     * @tc.name readonlyMapValuesPart02Test014
     * @tc.desc Verify V=long next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, long> = new Map<string, long>([['k', 9223372036854775807]]);
      let iter: IterableIterator<long> = m.values();
      expect(iter.next().value!).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_1500
     * @tc.name readonlyMapValuesPart02Test015
     * @tc.desc Verify V=double next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, double> = new Map<string, double>([['k', 2.718281828459045]]);
      let iter: IterableIterator<double> = m.values();
      expect(iter.next().value!).assertEqual(2.718281828459045);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_1600
     * @tc.name readonlyMapValuesPart02Test016
     * @tc.desc Verify V=Date next() Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dt: Date = new Date(1700000000000);
      const m: ReadonlyMap<string, Date> = new Map<string, Date>([['k', dt]]);
      let iter: IterableIterator<Date> = m.values();
      let result: Date = iter.next().value!;
      let eq: boolean = result.getTime() === dt.getTime();
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_1700
     * @tc.name readonlyMapValuesPart02Test017
     * @tc.desc Verify V=RegExp next() RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('abc', 'g');
      const m: ReadonlyMap<string, RegExp> = new Map<string, RegExp>([['k', re]]);
      let iter: IterableIterator<RegExp> = m.values();
      let result: RegExp = iter.next().value!;
      let eq: boolean = result.source === re.source;
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_1800
     * @tc.name readonlyMapValuesPart02Test018
     * @tc.desc Verify V=-0.0 next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['k', -0.0]]);
      let iter: IterableIterator<number> = m.values();
      let v: number = iter.next().value!;
      let isNegZero: boolean = (1.0 / v) === Number.NEGATIVE_INFINITY;
      expect(isNegZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_1900
     * @tc.name readonlyMapValuesPart02Test019
     * @tc.desc Verify V=string 1 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['a', 'first'], ['b', 'second'], ['c', 'third']]);
      let iter: IterableIterator<string> = m.values();
      expect(iter.next().value!).assertEqual('first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_2000
     * @tc.name readonlyMapValuesPart02Test020
     * @tc.desc Verify V=int 2 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 10], ['b', 20], ['c', 30]]);
      let iter: IterableIterator<int> = m.values();
      iter.next();
      expect(iter.next().value!).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_2100
     * @tc.name readonlyMapValuesPart02Test021
     * @tc.desc Verify V=string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['x', 'alpha'], ['y', 'beta'], ['z', 'gamma']]);
      let iter: IterableIterator<string> = m.values();
      iter.next();
      iter.next();
      expect(iter.next().value!).assertEqual('gamma');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_2200
     * @tc.name readonlyMapValuesPart02Test022
     * @tc.desc Verify V=int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<int> = m.values();
      let results: int[] = [iter.next().value!, iter.next().value!, iter.next().value!];
      expect(results[0]).assertEqual(1);
      expect(results[1]).assertEqual(2);
      expect(results[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_2300
     * @tc.name readonlyMapValuesPart02Test023
     * @tc.desc Verify set key values() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 1], ['k', 99]]);
      let iter: IterableIterator<int> = m.values();
      expect(iter.next().value!).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_2400
     * @tc.name readonlyMapValuesPart02Test024
     * @tc.desc Verify key value values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 7], ['b', 7], ['c', 7]]);
      let iter: IterableIterator<int> = m.values();
      expect(iter.next().value!).assertEqual(7);
      expect(iter.next().value!).assertEqual(7);
      expect(iter.next().value!).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_2500
     * @tc.name readonlyMapValuesPart02Test025
     * @tc.desc Verify Map(V=string) values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>();
      let iter: IterableIterator<string> = m.values();
      let count: int = 0;
      let result: IteratorResult<string> = iter.next();
      while (!result.done) {
        count++;
        result = iter.next();
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_2600
     * @tc.name readonlyMapValuesPart02Test026
     * @tc.desc Verify Map(V=int) values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let iter: IterableIterator<int> = m.values();
      let count: int = 0;
      let result: IteratorResult<int> = iter.next();
      while (!result.done) {
        count++;
        result = iter.next();
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_2700
     * @tc.name readonlyMapValuesPart02Test027
     * @tc.desc Verify Map(V=string) values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'v']]);
      let iter: IterableIterator<string> = m.values();
      let count: int = 0;
      let result: IteratorResult<string> = iter.next();
      while (!result.done) {
        count++;
        result = iter.next();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_2800
     * @tc.name readonlyMapValuesPart02Test028
     * @tc.desc Verify Map(V=int) values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 1]]);
      let iter: IterableIterator<int> = m.values();
      let count: int = 0;
      let result: IteratorResult<int> = iter.next();
      while (!result.done) {
        count++;
        result = iter.next();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_2900
     * @tc.name readonlyMapValuesPart02Test029
     * @tc.desc Verify Map(V=string) values() map.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['a', 'x'], ['b', 'y'], ['c', 'z']]);
      let iter: IterableIterator<string> = m.values();
      let count: int = 0;
      let result: IteratorResult<string> = iter.next();
      while (!result.done) {
        count++;
        result = iter.next();
      }
      expect(count).assertEqual(m.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_3000
     * @tc.name readonlyMapValuesPart02Test030
     * @tc.desc Verify Map(V=int) values() map.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3], ['d', 4]]);
      let iter: IterableIterator<int> = m.values();
      let count: int = 0;
      let result: IteratorResult<int> = iter.next();
      while (!result.done) {
        count++;
        result = iter.next();
      }
      expect(count).assertEqual(m.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_3100
     * @tc.name readonlyMapValuesPart02Test031
     * @tc.desc Verify set key values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['a', 10]]);
      let iter: IterableIterator<int> = m.values();
      let count: int = 0;
      let result: IteratorResult<int> = iter.next();
      while (!result.done) {
        count++;
        result = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_3200
     * @tc.name readonlyMapValuesPart02Test032
     * @tc.desc Verify set key values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<int> = m.values();
      let count: int = 0;
      let result: IteratorResult<int> = iter.next();
      while (!result.done) {
        count++;
        result = iter.next();
      }
      expect(count).assertEqual(3);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_3300
     * @tc.name readonlyMapValuesPart02Test033
     * @tc.desc Verify for...of values() map.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      for (let v of m.values()) {
        count++;
      }
      expect(count).assertEqual(m.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_3400
     * @tc.name readonlyMapValuesPart02Test034
     * @tc.desc Verify V=string values() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'v']]);
      let sizeBefore: int = m.size;
      let iter: IterableIterator<string> = m.values();
      expect(m.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_3500
     * @tc.name readonlyMapValuesPart02Test035
     * @tc.desc Verify V=int values() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 1]]);
      let sizeBefore: int = m.size;
      let iter: IterableIterator<int> = m.values();
      expect(m.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_3600
     * @tc.name readonlyMapValuesPart02Test036
     * @tc.desc Verify V=string values() Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'v']]);
      let iter: IterableIterator<string> = m.values();
      expect(m.has('k')).assertTrue();
      expect(m.get('k')).assertEqual('v');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_3700
     * @tc.name readonlyMapValuesPart02Test037
     * @tc.desc Verify V=int values() Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 1]]);
      let iter: IterableIterator<int> = m.values();
      expect(m.has('k')).assertTrue();
      expect(m.get('k')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_3800
     * @tc.name readonlyMapValuesPart02Test038
     * @tc.desc Verify V=string Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['a', 'x'], ['b', 'y']]);
      let sizeBefore: int = m.size;
      let iter: IterableIterator<string> = m.values();
      iter.next();
      iter.next();
      expect(m.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_3900
     * @tc.name readonlyMapValuesPart02Test039
     * @tc.desc Verify V=int Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let sizeBefore: int = m.size;
      let iter: IterableIterator<int> = m.values();
      iter.next();
      iter.next();
      iter.next();
      expect(m.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_4000
     * @tc.name readonlyMapValuesPart02Test040
     * @tc.desc Verify V=string Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['a', 'x'], ['b', 'y']]);
      let iter: IterableIterator<string> = m.values();
      iter.next();
      iter.next();
      expect(m.get('a')).assertEqual('x');
      expect(m.get('b')).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_4100
     * @tc.name readonlyMapValuesPart02Test041
     * @tc.desc Verify V=int Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<int> = m.values();
      iter.next();
      expect(m.get('b')).assertEqual(2);
      expect(m.get('c')).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_4200
     * @tc.name readonlyMapValuesPart02Test042
     * @tc.desc Verify values() Map get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'v']]);
      let iter: IterableIterator<string> = m.values();
      expect(m.get('k')).assertEqual('v');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_4300
     * @tc.name readonlyMapValuesPart02Test043
     * @tc.desc Verify values() Map has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 1]]);
      let iter: IterableIterator<int> = m.values();
      expect(m.has('k')).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_4400
     * @tc.name readonlyMapValuesPart02Test044
     * @tc.desc Verify values iterator notSameRef true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let iter1: IterableIterator<int> = m.values();
      let iter2: IterableIterator<int> = m.values();
      let notSameRef: boolean = iter1 !== iter2;
      expect(notSameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_4500
     * @tc.name readonlyMapValuesPart02Test045
     * @tc.desc Verify values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter1: IterableIterator<int> = m.values();
      let iter2: IterableIterator<int> = m.values();
      expect(iter1.next().value!).assertEqual(1);
      expect(iter2.next().value!).assertEqual(1);
      expect(iter2.next().value!).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_4600
     * @tc.name readonlyMapValuesPart02Test046
     * @tc.desc Verify values K=string V=string iterator == seq2[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['x', 'a'], ['y', 'b'], ['z', 'c']]);
      let iter1: IterableIterator<string> = m.values();
      let iter2: IterableIterator<string> = m.values();
      let seq1: string[] = [iter1.next().value!, iter1.next().value!, iter1.next().value!];
      let seq2: string[] = [iter2.next().value!, iter2.next().value!, iter2.next().value!];
      expect(seq1[0]).assertEqual(seq2[0]);
      expect(seq1[1]).assertEqual(seq2[1]);
      expect(seq1[2]).assertEqual(seq2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_4700
     * @tc.name readonlyMapValuesPart02Test047
     * @tc.desc Verify values iterator done1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter1: IterableIterator<int> = m.values();
      let iter2: IterableIterator<int> = m.values();
      iter1.next();
      iter1.next();
      let done1: boolean = iter1.next().done;
      let done2: boolean = iter2.next().done;
      expect(done1).assertTrue();
      expect(done2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_4800
     * @tc.name readonlyMapValuesPart02Test048
     * @tc.desc Verify values() keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let vIter: IterableIterator<int> = m.values();
      let kIter: IterableIterator<string> = m.keys();
      expect(vIter.next().value!).assertEqual(1);
      expect(kIter.next().value!).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_4900
     * @tc.name readonlyMapValuesPart02Test049
     * @tc.desc Verify values() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let vIter: IterableIterator<int> = m.values();
      let eIter: IterableIterator<[string, int]> = m.entries();
      let entry: [string, int] = eIter.next().value!;
      let val: int = vIter.next().value!;
      expect(entry[1]).assertEqual(1);
      expect(val).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_5000
     * @tc.name readonlyMapValuesPart02Test050
     * @tc.desc Verify for...of values() V=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: string[] = [];
      const m: ReadonlyMap<string, string> = new Map<string, string>([['a', 'x'], ['b', 'y']]);
      for (let v of m.values()) {
        collected.push(v);
      }
      expect(collected[0]).assertEqual('x');
      expect(collected[1]).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART02_TEST_5100
     * @tc.name readonlyMapValuesPart02Test051
     * @tc.desc Verify for...of values() V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: int[] = [];
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      for (let v of m.values()) {
        collected.push(v);
      }
      expect(collected[0]).assertEqual(1);
      expect(collected[2]).assertEqual(3);
    });

  });
}
