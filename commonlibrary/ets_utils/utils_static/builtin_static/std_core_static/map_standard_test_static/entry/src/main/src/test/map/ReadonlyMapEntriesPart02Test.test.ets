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

export default function readonlyMapEntriesPart02TestTest(): void {
  describe('ReadonlyMapEntriesPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_0100
     * @tc.name readonlyMapEntriesPart02Test001
     * @tc.desc Verify entries() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      const iter: IterableIterator<[string, int]> = map.entries();
      expect(map.size).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_0200
     * @tc.name readonlyMapEntriesPart02Test002
     * @tc.desc Verify typeof entries() 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      const iter: IterableIterator<[string, int]> = map.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_0300
     * @tc.name readonlyMapEntriesPart02Test003
     * @tc.desc Verify entries() $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      const iter: IterableIterator<[string, int]> = map.entries();
      expect(iter.$_iterator() instanceof Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_0400
     * @tc.name readonlyMapEntriesPart02Test004
     * @tc.desc Verify next() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      const result = map.entries().next();
      expect(map.size).assertEqual(1);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_0500
     * @tc.name readonlyMapEntriesPart02Test005
     * @tc.desc Verify next().done 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      const result = map.entries().next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_0600
     * @tc.name readonlyMapEntriesPart02Test006
     * @tc.desc Verify K=string entry typeof 'string'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['hello', 1]]);
      const entry = map.entries().next().value!;
      expect(typeof (entry[0])).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_0700
     * @tc.name readonlyMapEntriesPart02Test007
     * @tc.desc Verify K=int entry typeof 'int'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[42, 'a']]);
      const entry = map.entries().next().value!;
      expect(typeof (entry[0])).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_0800
     * @tc.name readonlyMapEntriesPart02Test008
     * @tc.desc Verify K=boolean entry typeof 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 'a']]);
      const entry = map.entries().next().value!;
      expect(typeof (entry[0])).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_0900
     * @tc.name readonlyMapEntriesPart02Test009
     * @tc.desc Verify K=long entry typeof 'long'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(1), 'a']]);
      const entry = map.entries().next().value!;
      expect(typeof (entry[0])).assertEqual('long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_1000
     * @tc.name readonlyMapEntriesPart02Test010
     * @tc.desc Verify K=double entry typeof 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[3.14, 'pi']]);
      const entry = map.entries().next().value!;
      expect(typeof (entry[0])).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_1100
     * @tc.name readonlyMapEntriesPart02Test011
     * @tc.desc Verify K undefined entry typeof 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | undefined, int> = new Map<string | undefined, int>([[undefined, 1]]);
      const entry = map.entries().next().value!;
      expect(typeof (entry[0])).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_1200
     * @tc.name readonlyMapEntriesPart02Test012
     * @tc.desc Verify Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      const result = map.entries().next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_1300
     * @tc.name readonlyMapEntriesPart02Test013
     * @tc.desc Verify Map next() done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['only', 1]]);
      const result = map.entries().next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_1400
     * @tc.name readonlyMapEntriesPart02Test014
     * @tc.desc Verify Map next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['only', 1]]);
      const entry = map.entries().next().value!;
      expect(entry[0]).assertEqual('only');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_1500
     * @tc.name readonlyMapEntriesPart02Test015
     * @tc.desc Verify Map next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['only', 1]]);
      const entry = map.entries().next().value!;
      expect(entry[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_1600
     * @tc.name readonlyMapEntriesPart02Test016
     * @tc.desc Verify Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['only', 1]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      const result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_1700
     * @tc.name readonlyMapEntriesPart02Test017
     * @tc.desc Verify Map next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['first', 10], ['second', 20]]);
      const entry = map.entries().next().value!;
      expect(entry[0]).assertEqual('first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_1800
     * @tc.name readonlyMapEntriesPart02Test018
     * @tc.desc Verify Map next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['first', 10], ['second', 20]]);
      const entry = map.entries().next().value!;
      expect(entry[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_1900
     * @tc.name readonlyMapEntriesPart02Test019
     * @tc.desc Verify Map next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['first', 10], ['second', 20]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      const entry = iter.next().value!;
      expect(entry[0]).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_2000
     * @tc.name readonlyMapEntriesPart02Test020
     * @tc.desc Verify Map next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['first', 10], ['second', 20]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      const entry = iter.next().value!;
      expect(entry[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_2100
     * @tc.name readonlyMapEntriesPart02Test021
     * @tc.desc Verify Map next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      iter.next();
      const entry = iter.next().value!;
      expect(entry[0]).assertEqual('c');
      expect(entry[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_2200
     * @tc.name readonlyMapEntriesPart02Test022
     * @tc.desc Verify Map next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      iter.next();
      const result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_2300
     * @tc.name readonlyMapEntriesPart02Test023
     * @tc.desc Verify key entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['', 1]]);
      const entry = map.entries().next().value!;
      expect(entry[0]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_2400
     * @tc.name readonlyMapEntriesPart02Test024
     * @tc.desc Verify key emoji entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['😀', 1]]);
      const entry = map.entries().next().value!;
      expect(entry[0]).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_2500
     * @tc.name readonlyMapEntriesPart02Test025
     * @tc.desc Verify key XSS entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['<script>alert(1)</script>', 1]]);
      const entry = map.entries().next().value!;
      expect(entry[0]).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_2600
     * @tc.name readonlyMapEntriesPart02Test026
     * @tc.desc Verify key null entry null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | null, int> = new Map<string | null, int>([[null, 1]]);
      const entry = map.entries().next().value!;
      expect(entry[0]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_2700
     * @tc.name readonlyMapEntriesPart02Test027
     * @tc.desc Verify key undefined entry undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string | undefined, int> = new Map<string | undefined, int>([[undefined, 1]]);
      const entry = map.entries().next().value!;
      expect(entry[0]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_2800
     * @tc.name readonlyMapEntriesPart02Test028
     * @tc.desc Verify value 0 entry 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['k', 0]]);
      const entry = map.entries().next().value!;
      expect(entry[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_2900
     * @tc.name readonlyMapEntriesPart02Test029
     * @tc.desc Verify value 2147483647 entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['k', 2147483647]]);
      const entry = map.entries().next().value!;
      expect(entry[1]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_3000
     * @tc.name readonlyMapEntriesPart02Test030
     * @tc.desc Verify value (-2147483647 - 1) entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['k', -2147483648]]);
      const entry = map.entries().next().value!;
      expect(entry[1]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_3100
     * @tc.name readonlyMapEntriesPart02Test031
     * @tc.desc Verify value NaN entry Number.isNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['k', Number.NaN]]);
      const entry = map.entries().next().value!;
      expect(isNaN(entry[1] as number)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_3200
     * @tc.name readonlyMapEntriesPart02Test032
     * @tc.desc Verify value Number.POSITIVE_INFINITY entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['k', Number.POSITIVE_INFINITY]]);
      const entry = map.entries().next().value!;
      expect(entry[1]).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_3300
     * @tc.name readonlyMapEntriesPart02Test033
     * @tc.desc Verify value Number.NEGATIVE_INFINITY entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, number> = new Map<string, number>([['k', Number.NEGATIVE_INFINITY]]);
      const entry = map.entries().next().value!;
      expect(entry[1]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_3400
     * @tc.name readonlyMapEntriesPart02Test034
     * @tc.desc Verify value null entry null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string | null> = new Map<string, string | null>([['k', null]]);
      const entry = map.entries().next().value!;
      expect(entry[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_3500
     * @tc.name readonlyMapEntriesPart02Test035
     * @tc.desc Verify value undefined entry undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, string | undefined> = new Map<string, string | undefined>([['k', undefined]]);
      const entry = map.entries().next().value!;
      expect(entry[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_3600
     * @tc.name readonlyMapEntriesPart02Test036
     * @tc.desc Verify next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      const firstExhaustedResult = iter.next();
      const secondExhaustedResult = iter.next();
      expect(firstExhaustedResult.done).assertTrue();
      expect(secondExhaustedResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_3700
     * @tc.name readonlyMapEntriesPart02Test037
     * @tc.desc Verify next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      iter.next();
      iter.next();
      const result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_3800
     * @tc.name readonlyMapEntriesPart02Test038
     * @tc.desc Verify Map entries map.size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      const iter: IterableIterator<[string, int]> = map.entries();
      let result = iter.next();
      while (!result.done) {
        count = count + 1;
        result = iter.next();
      }
      expect(count).assertEqual(map.size);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_3900
     * @tc.name readonlyMapEntriesPart02Test039
     * @tc.desc Verify Map entries map.size 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      let result = iter.next();
      while (!result.done) {
        count = count + 1;
        result = iter.next();
      }
      expect(count).assertEqual(map.size);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_4000
     * @tc.name readonlyMapEntriesPart02Test040
     * @tc.desc Verify Map entries map.size 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      let result = iter.next();
      while (!result.done) {
        count = count + 1;
        result = iter.next();
      }
      expect(count).assertEqual(map.size);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_4100
     * @tc.name readonlyMapEntriesPart02Test041
     * @tc.desc Verify entries() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const sizeBefore: int = map.size;
      map.entries();
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_4200
     * @tc.name readonlyMapEntriesPart02Test042
     * @tc.desc Verify entries() Map size 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      map.entries();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_4300
     * @tc.name readonlyMapEntriesPart02Test043
     * @tc.desc Verify entries() Map.get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.entries();
      expect(map.get('a')).assertEqual(1);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_4400
     * @tc.name readonlyMapEntriesPart02Test044
     * @tc.desc Verify entries() Map.has()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      map.entries();
      expect(map.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_4500
     * @tc.name readonlyMapEntriesPart02Test045
     * @tc.desc Verify entries Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const sizeBefore: int = map.size;
      const iter: IterableIterator<[string, int]> = map.entries();
      let result = iter.next();
      while (!result.done) {
        result = iter.next();
      }
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_4600
     * @tc.name readonlyMapEntriesPart02Test046
     * @tc.desc Verify entries Map.get()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      let result = iter.next();
      while (!result.done) {
        result = iter.next();
      }
      expect(map.get('a')).assertEqual(1);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_4700
     * @tc.name readonlyMapEntriesPart02Test047
     * @tc.desc Verify entries Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const sizeBefore: int = map.size;
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      expect(map.size).assertEqual(sizeBefore);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_4800
     * @tc.name readonlyMapEntriesPart02Test048
     * @tc.desc Verify entries() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      for (const entry of map.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_4900
     * @tc.name readonlyMapEntriesPart02Test049
     * @tc.desc Verify for...of Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let executed: boolean = false;
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      for (const entry of map.entries()) {
        executed = true;
      }
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_5000
     * @tc.name readonlyMapEntriesPart02Test050
     * @tc.desc Verify for...of entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keys: string[] = [];
      const map: ReadonlyMap<string, int> = new Map<string, int>([['first', 1], ['second', 2], ['third', 3]]);
      for (const entry of map.entries()) {
        keys.push(entry[0] as string);
      }
      expect(keys[0]).assertEqual('first');
      expect(keys[1]).assertEqual('second');
      expect(keys[2]).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_5100
     * @tc.name readonlyMapEntriesPart02Test051
     * @tc.desc Verify for...of entries map.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 10], ['y', 20], ['z', 30]]);
      for (const entry of map.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(map.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_5200
     * @tc.name readonlyMapEntriesPart02Test052
     * @tc.desc Verify for...of entries entry key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let foundKey: string = '';
      const map: ReadonlyMap<string, int> = new Map<string, int>([['target', 99]]);
      for (const entry of map.entries()) {
        foundKey = entry[0] as string;
      }
      expect(foundKey).assertEqual('target');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_5300
     * @tc.name readonlyMapEntriesPart02Test053
     * @tc.desc Verify for...of entries entry /entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let keys: string[] = [];
      let vals: int[] = [];
      const map: ReadonlyMap<string, int> = new Map<string, int>([['code', 200], ['msg', 404]]);
      for (const entry of map.entries()) {
        keys.push(entry[0] as string);
        vals.push(entry[1] as int);
      }
      expect(keys[0]).assertEqual('code');
      expect(vals[0]).assertEqual(200);
      expect(keys[1]).assertEqual('msg');
      expect(vals[1]).assertEqual(404);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_5400
     * @tc.name readonlyMapEntriesPart02Test054
     * @tc.desc Verify entries() $_iterator() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      const innerIter = iter.$_iterator();
      expect(innerIter).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_5500
     * @tc.name readonlyMapEntriesPart02Test055
     * @tc.desc Verify $_iterator() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      const innerIter = iter.$_iterator();
      let count: int = 0;
      for (const entry of innerIter) {
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_5600
     * @tc.name readonlyMapEntriesPart02Test056
     * @tc.desc Verify entries != iterB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      const iterA: IterableIterator<[string, int]> = map.entries();
      const iterB: IterableIterator<[string, int]> = map.entries();
      expect(iterA).not().assertEqual(iterB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_5700
     * @tc.name readonlyMapEntriesPart02Test057
     * @tc.desc Verify entries iterator == 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iterA: IterableIterator<[string, int]> = map.entries();
      const iterB: IterableIterator<[string, int]> = map.entries();
      iterA.next();
      const entryB = iterB.next().value!;
      expect(entryB[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_5800
     * @tc.name readonlyMapEntriesPart02Test058
     * @tc.desc Verify entries iterator aDone true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iterA: IterableIterator<[string, int]> = map.entries();
      const iterB: IterableIterator<[string, int]> = map.entries();
      let aDone: boolean = false;
      let bDone: boolean = false;
      let result = iterA.next();
      while (!result.done) {
        result = iterA.next();
      }
      aDone = result.done;
      result = iterB.next();
      while (!result.done) {
        result = iterB.next();
      }
      bDone = result.done;
      expect(aDone).assertTrue();
      expect(bDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_5900
     * @tc.name readonlyMapEntriesPart02Test059
     * @tc.desc Verify entries iterator == 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iterA: IterableIterator<[string, int]> = map.entries();
      const iterB: IterableIterator<[string, int]> = map.entries();
      const iterC: IterableIterator<[string, int]> = map.entries();
      const entryA = iterA.next().value!;
      iterB.next();
      const entryC = iterC.next().value!;
      expect(entryA[0]).assertEqual('a');
      expect(entryC[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_6000
     * @tc.name readonlyMapEntriesPart02Test060
     * @tc.desc Verify entries() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: int = 0;
      const map: ReadonlyMap<string, int> = new Map<string, int>([['x', 1], ['y', 2]]);
      for (const entry of map.entries()) {
        sum = sum + (entry[1] as int);
      }
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_6100
     * @tc.name readonlyMapEntriesPart02Test061
     * @tc.desc Verify Map entries() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visited: boolean = false;
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      for (const entry of map.entries()) {
        visited = true;
      }
      expect(visited).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_6200
     * @tc.name readonlyMapEntriesPart02Test062
     * @tc.desc Verify Map entry next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['pair', 42]]);
      const entry = map.entries().next().value!;
      expect(entry[0]).assertEqual('pair');
      expect(entry[1]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_ENTRIES_PART02_TEST_6300
     * @tc.name readonlyMapEntriesPart02Test063
     * @tc.desc Verify Map entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapEntriesPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['alpha', 100], ['beta', 200]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      const entry = iter.next().value!;
      expect(entry[0]).assertEqual('beta');
      expect(entry[1]).assertEqual(200);
    });
  });
}
