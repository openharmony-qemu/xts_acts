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

export default function readonlyMapValuesPart03TestTest(): void {
  describe('ReadonlyMapValuesPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_0100
     * @tc.name readonlyMapValuesPart03Test001
     * @tc.desc Verify V=boolean Map next() {done:true}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, boolean> = new Map<string, boolean>([['k', true]]);
      let it: IterableIterator<boolean> = m.values();
      it.next();
      let r: IteratorResult<boolean> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_0200
     * @tc.name readonlyMapValuesPart03Test002
     * @tc.desc Verify V=number Map next() {done:true}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['k', 3.14]]);
      let it: IterableIterator<number> = m.values();
      it.next();
      let r: IteratorResult<number> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_0300
     * @tc.name readonlyMapValuesPart03Test003
     * @tc.desc Verify V=string next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'original']]);
      let it: IterableIterator<string> = m.values();
      it.next();
      let r1: IteratorResult<string> = it.next();
      let r2: IteratorResult<string> = it.next();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_0400
     * @tc.name readonlyMapValuesPart03Test004
     * @tc.desc Verify V=int next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 100]]);
      let it: IterableIterator<int> = m.values();
      it.next();
      let r1: IteratorResult<int> = it.next();
      let r2: IteratorResult<int> = it.next();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_0500
     * @tc.name readonlyMapValuesPart03Test005
     * @tc.desc Verify V=string Map next() done=true next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>();
      let it: IterableIterator<string> = m.values();
      let r0: IteratorResult<string> = it.next();
      expect(r0.done).assertTrue();
      let r1: IteratorResult<string> = it.next();
      expect(r1.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_0600
     * @tc.name readonlyMapValuesPart03Test006
     * @tc.desc Verify V=int Map next() done=true next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let it: IterableIterator<int> = m.values();
      let r0: IteratorResult<int> = it.next();
      expect(r0.done).assertTrue();
      let r1: IteratorResult<int> = it.next();
      expect(r1.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_0700
     * @tc.name readonlyMapValuesPart03Test007
     * @tc.desc Verify V=number Map next() done=true next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>();
      let it: IterableIterator<number> = m.values();
      let r0: IteratorResult<number> = it.next();
      expect(r0.done).assertTrue();
      let r1: IteratorResult<number> = it.next();
      expect(r1.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_0800
     * @tc.name readonlyMapValuesPart03Test008
     * @tc.desc Verify V=string Map next()value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>();
      let it: IterableIterator<string> = m.values();
      it.next();
      let r: IteratorResult<string> = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_0900
     * @tc.name readonlyMapValuesPart03Test009
     * @tc.desc Verify V=int Map next()value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let it: IterableIterator<int> = m.values();
      it.next();
      let r: IteratorResult<int> = it.next();
      expect(r.value).assertUndefined();
    });














    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_1000
     * @tc.name readonlyMapValuesPart03Test010
     * @tc.desc Verify V=long Map values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, long> = new Map<string, long>();
      let it: IterableIterator<long> = m.values();
      let r: IteratorResult<long> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_1100
     * @tc.name readonlyMapValuesPart03Test011
     * @tc.desc Verify V=double Map values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, double> = new Map<string, double>();
      let it: IterableIterator<double> = m.values();
      let r: IteratorResult<double> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_1200
     * @tc.name readonlyMapValuesPart03Test012
     * @tc.desc Verify V=boolean Map values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, boolean> = new Map<string, boolean>();
      let it: IterableIterator<boolean> = m.values();
      let r: IteratorResult<boolean> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_1300
     * @tc.name readonlyMapValuesPart03Test013
     * @tc.desc Verify V=float Map values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, float> = new Map<string, float>();
      let it: IterableIterator<float> = m.values();
      let r: IteratorResult<float> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_1400
     * @tc.name readonlyMapValuesPart03Test014
     * @tc.desc Verify V=Date Map values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, Date> = new Map<string, Date>();
      let it: IterableIterator<Date> = m.values();
      let r: IteratorResult<Date> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_1500
     * @tc.name readonlyMapValuesPart03Test015
     * @tc.desc Verify V=RegExp Map values() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, RegExp> = new Map<string, RegExp>();
      let it: IterableIterator<RegExp> = m.values();
      let r: IteratorResult<RegExp> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_1600
     * @tc.name readonlyMapValuesPart03Test016
     * @tc.desc Verify Map values() next() done=true value=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>();
      let it: IterableIterator<string> = m.values();
      let r1: IteratorResult<string> = it.next();
      let r2: IteratorResult<string> = it.next();
      let r3: IteratorResult<string> = it.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
      expect(r3.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_1700
     * @tc.name readonlyMapValuesPart03Test017
     * @tc.desc Verify V=null Map values() next() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string | null> = new Map<string, string | null>([['k', null]]);
      let it: IterableIterator<string | null> = m.values();
      let r: IteratorResult<string | null> = it.next();
      expect(r.value).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_1800
     * @tc.name readonlyMapValuesPart03Test018
     * @tc.desc Verify V=undefined Map values() next() undefined done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string | undefined> = new Map<string, string | undefined>([['k', undefined]]);
      let it: IterableIterator<string | undefined> = m.values();
      let r: IteratorResult<string | undefined> = it.next();
      expect(r.value).assertUndefined();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_1900
     * @tc.name readonlyMapValuesPart03Test019
     * @tc.desc Verify V=NaN(number) Map values() next() NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['k', Number.NaN]]);
      let it: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = it.next();
      expect(isNaN(r.value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_2000
     * @tc.name readonlyMapValuesPart03Test020
     * @tc.desc Verify V=Infinity(number) Map values() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['k', Number.POSITIVE_INFINITY]]);
      let it: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = it.next();
      expect(r.value!).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_2100
     * @tc.name readonlyMapValuesPart03Test021
     * @tc.desc Verify V=-Infinity(number) Map values() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['k', Number.NEGATIVE_INFINITY]]);
      let it: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = it.next();
      expect(r.value!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_2200
     * @tc.name readonlyMapValuesPart03Test022
     * @tc.desc Verify V=0(int) Map values() next() 0 done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 0]]);
      let it: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = it.next();
      expect(r.value!).assertEqual(0);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_2300
     * @tc.name readonlyMapValuesPart03Test023
     * @tc.desc Verify V=false(boolean) Map values() next() false done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, boolean> = new Map<string, boolean>([['k', false]]);
      let it: IterableIterator<boolean> = m.values();
      let r: IteratorResult<boolean> = it.next();
      expect(r.value!).assertFalse();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_2400
     * @tc.name readonlyMapValuesPart03Test024
     * @tc.desc Verify value string Map values() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['a', 'dup'], ['b', 'dup'], ['c', 'dup']]);
      let it: IterableIterator<string> = m.values();
      expect(it.next().value!).assertEqual('dup');
      expect(it.next().value!).assertEqual('dup');
      expect(it.next().value!).assertEqual('dup');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_2500
     * @tc.name readonlyMapValuesPart03Test025
     * @tc.desc Verify value null Map values() next() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string | null> = new Map<string, string | null>([['a', null], ['b', null], ['c', null]]);
      let it: IterableIterator<string | null> = m.values();
      expect(it.next().value).assertNull();
      expect(it.next().value).assertNull();
      expect(it.next().value).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_2600
     * @tc.name readonlyMapValuesPart03Test026
     * @tc.desc Verify value undefined Map values() next() undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string | undefined> = new Map<string, string | undefined>([['a', undefined], ['b', undefined]]);
      let it: IterableIterator<string | undefined> = m.values();
      let r1: IteratorResult<string | undefined> = it.next();
      let r2: IteratorResult<string | undefined> = it.next();
      expect(r1.value).assertUndefined();
      expect(r1.done).assertFalse();
      expect(r2.value).assertUndefined();
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_2700
     * @tc.name readonlyMapValuesPart03Test027
     * @tc.desc Verify value NaN Map values() next() NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['a', Number.NaN], ['b', Number.NaN], ['c', Number.NaN]]);
      let it: IterableIterator<number> = m.values();
      expect(isNaN(it.next().value!)).assertTrue();
      expect(isNaN(it.next().value!)).assertTrue();
      expect(isNaN(it.next().value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_2800
     * @tc.name readonlyMapValuesPart03Test028
     * @tc.desc Verify value true Map values() next() true done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, boolean> = new Map<string, boolean>([['a', true], ['b', true]]);
      let it: IterableIterator<boolean> = m.values();
      expect(it.next().value!).assertTrue();
      expect(it.next().value!).assertTrue();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_2900
     * @tc.name readonlyMapValuesPart03Test029
     * @tc.desc Verify value Date Map values() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dt: Date = new Date(1700000000000);
      const m: ReadonlyMap<string, Date> = new Map<string, Date>([['a', dt], ['b', dt]]);
      let it: IterableIterator<Date> = m.values();
      let firstValue: Date = it.next().value!;
      let secondValue: Date = it.next().value!;
      let sameRef: boolean = firstValue === secondValue;
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_3000
     * @tc.name readonlyMapValuesPart03Test030
     * @tc.desc Verify value RegExp Map values() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('abc', 'g');
      const m: ReadonlyMap<string, RegExp> = new Map<string, RegExp>([['a', re], ['b', re]]);
      let it: IterableIterator<RegExp> = m.values();
      let firstValue: RegExp = it.next().value!;
      let secondValue: RegExp = it.next().value!;
      let sameRef: boolean = firstValue === secondValue;
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_3100
     * @tc.name readonlyMapValuesPart03Test031
     * @tc.desc Verify value Array Map values() next() >]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      const m: ReadonlyMap<string, int[]> = new Map<string, int[]>([['a', arr], ['b', arr]]);
      let it: IterableIterator<int[]> = m.values();
      let firstValue: int[] = it.next().value!;
      let secondValue: int[] = it.next().value!;
      let sameRef: boolean = firstValue === secondValue;
      expect(sameRef).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_3200
     * @tc.name readonlyMapValuesPart03Test032
     * @tc.desc Verify Symbol.iterator values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'v']]);
      let it1: IterableIterator<string> = m.values();
      let it2: IterableIterator<string> = m.values();
      it1.next();
      expect(it1.next().done).assertTrue();
      expect(it2.next().value!).assertEqual('v');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_3300
     * @tc.name readonlyMapValuesPart03Test033
     * @tc.desc Verify V=string IteratorResult.done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'v']]);
      let it: IterableIterator<string> = m.values();
      it.next();
      let r: IteratorResult<string> = it.next();
      expect(r.done).assertTrue();
      let r2: IteratorResult<string> = it.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_3400
     * @tc.name readonlyMapValuesPart03Test034
     * @tc.desc Verify V=int IteratorResult.done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 1]]);
      let it: IterableIterator<int> = m.values();
      it.next();
      let r: IteratorResult<int> = it.next();
      expect(r.done).assertTrue();
      let r2: IteratorResult<int> = it.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_3500
     * @tc.name readonlyMapValuesPart03Test035
     * @tc.desc Verify IteratorResult done value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'hello']]);
      let it: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = it.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_3600
     * @tc.name readonlyMapValuesPart03Test036
     * @tc.desc Verify IteratorResult done=true value=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 42]]);
      let it: IterableIterator<int> = m.values();
      it.next();
      let r: IteratorResult<int> = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_3700
     * @tc.name readonlyMapValuesPart03Test037
     * @tc.desc Verify K=string value null Map values() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string | null> = new Map<string, string | null>([['a', null], ['b', null]]);
      let it: IterableIterator<string | null> = m.values();
      let r1: IteratorResult<string | null> = it.next();
      let r2: IteratorResult<string | null> = it.next();
      expect(r1.value).assertNull();
      expect(r2.value).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_3800
     * @tc.name readonlyMapValuesPart03Test038
     * @tc.desc Verify K=int value undefined Map values() undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string | undefined> = new Map<int, string | undefined>([[1, undefined], [2, undefined]]);
      let it: IterableIterator<string | undefined> = m.values();
      let r1: IteratorResult<string | undefined> = it.next();
      let r2: IteratorResult<string | undefined> = it.next();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_3900
     * @tc.name readonlyMapValuesPart03Test039
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'only']]);
      for (let v of m.values()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_4000
     * @tc.name readonlyMapValuesPart03Test040
     * @tc.desc Verify K=int Map for...of values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: string[] = [];
      const m: ReadonlyMap<int, string> = new Map<int, string>([[10, 'ten'], [20, 'twenty'], [30, 'thirty']]);
      for (let v of m.values()) {
        collected.push(v);
      }
      expect(collected[0]).assertEqual('ten');
      expect(collected[2]).assertEqual('thirty');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_4100
     * @tc.name readonlyMapValuesPart03Test041
     * @tc.desc Verify K=boolean Map for...of values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const m: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 't'], [false, 'f']]);
      for (let v of m.values()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_4200
     * @tc.name readonlyMapValuesPart03Test042
     * @tc.desc Verify K=number Map for...of values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: string[] = [];
      const m: ReadonlyMap<number, string> = new Map<number, string>([[1.1, 'a'], [2.2, 'b'], [3.3, 'c']]);
      for (let v of m.values()) {
        collected.push(v);
      }
      expect(collected[0]).assertEqual('a');
      expect(collected[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART03_TEST_4300
     * @tc.name readonlyMapValuesPart03Test043
     * @tc.desc Verify K=long Map for...of values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: string[] = [];
      const m: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(1), 'one'], [Int.toLong(2), 'two']]);
      for (let v of m.values()) {
        collected.push(v);
      }
      expect(collected[0]).assertEqual('one');
      expect(collected[1]).assertEqual('two');
    });

  });
}
