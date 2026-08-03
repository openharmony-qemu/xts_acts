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

export default function mapNextPart01TestTest(): void {
  describe('MapNextPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_0100
     * @tc.name mapNextPart01Test001
     * @tc.desc Verify next() 0 Map keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      const iter: IterableIterator<string> = map.keys();
      const result: IteratorResult<string> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_0200
     * @tc.name mapNextPart01Test002
     * @tc.desc Verify next() 0 Map values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      const iter: IterableIterator<int> = map.values();
      const result: IteratorResult<int> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_0300
     * @tc.name mapNextPart01Test003
     * @tc.desc Verify next() 0 Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      const iter: IterableIterator<[string, int]> = map.entries();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_0400
     * @tc.name mapNextPart01Test004
     * @tc.desc Verify next() 0 Map keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter: IterableIterator<string> = map.keys();
      const result: IteratorResult<string> = iter.next();
      expect(result.done).assertFalse();
      expect(result.value!).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_0500
     * @tc.name mapNextPart01Test005
     * @tc.desc Verify next() 0 Map values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter: IterableIterator<int> = map.values();
      const result: IteratorResult<int> = iter.next();
      expect(result.done).assertFalse();
      expect(result.value!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_0600
     * @tc.name mapNextPart01Test006
     * @tc.desc Verify next() 0 Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_0700
     * @tc.name mapNextPart01Test007
     * @tc.desc Verify next() 0 Map keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      const iter: IterableIterator<string> = map.keys();
      const result: IteratorResult<string> = iter.next();
      expect(result.done).assertFalse();
      expect(result.value!).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_0800
     * @tc.name mapNextPart01Test008
     * @tc.desc Verify next() 0 Map values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      const iter: IterableIterator<int> = map.values();
      const result: IteratorResult<int> = iter.next();
      expect(result.done).assertFalse();
      expect(result.value!).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_0900
     * @tc.name mapNextPart01Test009
     * @tc.desc Verify next() 0 Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_1000
     * @tc.name mapNextPart01Test010
     * @tc.desc Verify next() 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter: IterableIterator<string> = map.keys();
      iter.next();
      const result: IteratorResult<string> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_1100
     * @tc.name mapNextPart01Test011
     * @tc.desc Verify next() 0 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter: IterableIterator<int> = map.values();
      iter.next();
      const result: IteratorResult<int> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_1200
     * @tc.name mapNextPart01Test012
     * @tc.desc Verify next() 0 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_1300
     * @tc.name mapNextPart01Test013
     * @tc.desc Verify keys next() Map string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['first', 100], ['second', 200]]);
      const iter: IterableIterator<string> = map.keys();
      const result: IteratorResult<string> = iter.next();
      expect(result.value!).assertEqual('first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_1400
     * @tc.name mapNextPart01Test014
     * @tc.desc Verify keys next() (-2147483647 - 1) key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[(-2147483647 - 1), 'min']]);
      const iter: IterableIterator<int> = map.keys();
      const result: IteratorResult<int> = iter.next();
      expect(result.value!).assertEqual((-2147483647 - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_1500
     * @tc.name mapNextPart01Test015
     * @tc.desc Verify keys next() 2147483647 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[2147483647, 'max']]);
      const iter: IterableIterator<int> = map.keys();
      const result: IteratorResult<int> = iter.next();
      expect(result.value!).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_1600
     * @tc.name mapNextPart01Test016
     * @tc.desc Verify keys next() int 0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[0, 'zero']]);
      const iter: IterableIterator<int> = map.keys();
      const result: IteratorResult<int> = iter.next();
      expect(result.value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_1700
     * @tc.name mapNextPart01Test017
     * @tc.desc Verify keys next() int -1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[-1, 'negative']]);
      const iter: IterableIterator<int> = map.keys();
      const result: IteratorResult<int> = iter.next();
      expect(result.value!).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_1800
     * @tc.name mapNextPart01Test018
     * @tc.desc Verify keys next() boolean true key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>([[true, 1], [false, 0]]);
      const iter: IterableIterator<boolean> = map.keys();
      const result: IteratorResult<boolean> = iter.next();
      expect(result.value!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_1900
     * @tc.name mapNextPart01Test019
     * @tc.desc Verify keys next() boolean false key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>([[false, 0], [true, 1]]);
      const iter: IterableIterator<boolean> = map.keys();
      const result: IteratorResult<boolean> = iter.next();
      expect(result.value!).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_2000
     * @tc.name mapNextPart01Test020
     * @tc.desc Verify keys next() number NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>([[Number.NaN, 1]]);
      const iter: IterableIterator<number> = map.keys();
      const result: IteratorResult<number> = iter.next();
      expect(result.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_2100
     * @tc.name mapNextPart01Test021
     * @tc.desc Verify keys next() number Infinity key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>([[Number.POSITIVE_INFINITY, 1]]);
      const iter: IterableIterator<number> = map.keys();
      const result: IteratorResult<number> = iter.next();
      expect(result.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_2200
     * @tc.name mapNextPart01Test022
     * @tc.desc Verify keys next() number -Infinity key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>([[Number.NEGATIVE_INFINITY, 1]]);
      const iter: IterableIterator<number> = map.keys();
      const result: IteratorResult<number> = iter.next();
      expect(result.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_2300
     * @tc.name mapNextPart01Test023
     * @tc.desc Verify keys next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['', 0], ['b', 1]]);
      const iter: IterableIterator<string> = map.keys();
      const result: IteratorResult<string> = iter.next();
      expect(result.value!).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_2400
     * @tc.name mapNextPart01Test024
     * @tc.desc Verify keys next() Unicode emoji key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['😀', 1], ['b', 2]]);
      const iter: IterableIterator<string> = map.keys();
      const result: IteratorResult<string> = iter.next();
      expect(result.value!).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_2500
     * @tc.name mapNextPart01Test025
     * @tc.desc Verify keys next() XSS key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['<script>alert(1)</script>', 1]]);
      const iter: IterableIterator<string> = map.keys();
      const result: IteratorResult<string> = iter.next();
      expect(result.value!).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_2600
     * @tc.name mapNextPart01Test026
     * @tc.desc Verify keys next() 10000 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'x'.repeat(10000);
      const map: Map<string, int> = new Map<string, int>([[longKey, 1]]);
      const iter: IterableIterator<string> = map.keys();
      const result: IteratorResult<string> = iter.next();
      expect(result.value!).assertEqual(longKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_2700
     * @tc.name mapNextPart01Test027
     * @tc.desc Verify keys next() null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string | null, int> = new Map<string | null, int>();
      map.set(null, 1);
      const iter: IterableIterator<string | null> = map.keys();
      const result: IteratorResult<string | null> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_2800
     * @tc.name mapNextPart01Test028
     * @tc.desc Verify keys next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['​', 1], ['b', 2]]);
      const iter: IterableIterator<string> = map.keys();
      const result: IteratorResult<string> = iter.next();
      expect(result.value!).assertEqual('​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_2900
     * @tc.name mapNextPart01Test029
     * @tc.desc Verify keys key next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.set('b', 20);
      const iter: IterableIterator<string> = map.keys();
      iter.next();
      const result: IteratorResult<string> = iter.next();
      expect(result.value!).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_3000
     * @tc.name mapNextPart01Test030
     * @tc.desc Verify keys size=2 next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter: IterableIterator<string> = map.keys();
      iter.next();
      iter.next();
      const result: IteratorResult<string> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_3100
     * @tc.name mapNextPart01Test031
     * @tc.desc Verify values next() Map int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 100], ['b', 200]]);
      const iter: IterableIterator<int> = map.values();
      const result: IteratorResult<int> = iter.next();
      expect(result.value!).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_3200
     * @tc.name mapNextPart01Test032
     * @tc.desc Verify values next() 2147483647 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 2147483647]]);
      const iter: IterableIterator<int> = map.values();
      const result: IteratorResult<int> = iter.next();
      expect(result.value!).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_3300
     * @tc.name mapNextPart01Test033
     * @tc.desc Verify values next() (-2147483647 - 1) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', (-2147483647 - 1)]]);
      const iter: IterableIterator<int> = map.values();
      const result: IteratorResult<int> = iter.next();
      expect(result.value!).assertEqual((-2147483647 - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_3400
     * @tc.name mapNextPart01Test034
     * @tc.desc Verify values next() int 0 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 0]]);
      const iter: IterableIterator<int> = map.values();
      const result: IteratorResult<int> = iter.next();
      expect(result.value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_3500
     * @tc.name mapNextPart01Test035
     * @tc.desc Verify values next() int -1 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', -1]]);
      const iter: IterableIterator<int> = map.values();
      const result: IteratorResult<int> = iter.next();
      expect(result.value!).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_3600
     * @tc.name mapNextPart01Test036
     * @tc.desc Verify values next() number NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>([['a', Number.NaN]]);
      const iter: IterableIterator<number> = map.values();
      const result: IteratorResult<number> = iter.next();
      expect(result.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_3700
     * @tc.name mapNextPart01Test037
     * @tc.desc Verify values next() number Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>([['a', Number.POSITIVE_INFINITY]]);
      const iter: IterableIterator<number> = map.values();
      const result: IteratorResult<number> = iter.next();
      expect(result.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_3800
     * @tc.name mapNextPart01Test038
     * @tc.desc Verify values next() number -Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>([['a', Number.NEGATIVE_INFINITY]]);
      const iter: IterableIterator<number> = map.values();
      const result: IteratorResult<number> = iter.next();
      expect(result.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_3900
     * @tc.name mapNextPart01Test039
     * @tc.desc Verify values next() boolean true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, boolean> = new Map<string, boolean>([['a', true], ['b', false]]);
      const iter: IterableIterator<boolean> = map.values();
      const result: IteratorResult<boolean> = iter.next();
      expect(result.value!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_4000
     * @tc.name mapNextPart01Test040
     * @tc.desc Verify values next() boolean false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, boolean> = new Map<string, boolean>([['a', false], ['b', true]]);
      const iter: IterableIterator<boolean> = map.values();
      const result: IteratorResult<boolean> = iter.next();
      expect(result.value!).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_4100
     * @tc.name mapNextPart01Test041
     * @tc.desc Verify values next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[1, ''], [2, 'b']]);
      const iter: IterableIterator<string> = map.values();
      const result: IteratorResult<string> = iter.next();
      expect(result.value!).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_4200
     * @tc.name mapNextPart01Test042
     * @tc.desc Verify values next() Unicode emoji value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[1, '😀'], [2, 'b']]);
      const iter: IterableIterator<string> = map.values();
      const result: IteratorResult<string> = iter.next();
      expect(result.value!).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_4300
     * @tc.name mapNextPart01Test043
     * @tc.desc Verify values next() XSS value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[1, '<script>alert(1)</script>']]);
      const iter: IterableIterator<string> = map.values();
      const result: IteratorResult<string> = iter.next();
      expect(result.value!).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_4400
     * @tc.name mapNextPart01Test044
     * @tc.desc Verify values next() 10000 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longVal: string = 'y'.repeat(10000);
      const map: Map<int, string> = new Map<int, string>([[1, longVal]]);
      const iter: IterableIterator<string> = map.values();
      const result: IteratorResult<string> = iter.next();
      expect(result.value!).assertEqual(longVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_4500
     * @tc.name mapNextPart01Test045
     * @tc.desc Verify values next() null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int | null> = new Map<string, int | null>();
      map.set('a', null);
      const iter: IterableIterator<int | null> = map.values();
      const result: IteratorResult<int | null> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_4600
     * @tc.name mapNextPart01Test046
     * @tc.desc Verify values next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[1, '​'], [2, 'b']]);
      const iter: IterableIterator<string> = map.values();
      const result: IteratorResult<string> = iter.next();
      expect(result.value!).assertEqual('​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_4700
     * @tc.name mapNextPart01Test047
     * @tc.desc Verify values set value next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.set('a', 999);
      const iter: IterableIterator<int> = map.values();
      const result: IteratorResult<int> = iter.next();
      expect(result.value!).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_4800
     * @tc.name mapNextPart01Test048
     * @tc.desc Verify values size=3 next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const iter: IterableIterator<int> = map.values();
      iter.next();
      iter.next();
      iter.next();
      const result: IteratorResult<int> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_4900
     * @tc.name mapNextPart01Test049
     * @tc.desc Verify entries next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['first', 100], ['second', 200]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_5000
     * @tc.name mapNextPart01Test050
     * @tc.desc Verify entries next() (-2147483647 - 1) key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[(-2147483647 - 1), 'min']]);
      const iter: IterableIterator<[int, string]> = map.entries();
      const result: IteratorResult<[int, string]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_5100
     * @tc.name mapNextPart01Test051
     * @tc.desc Verify entries next() 2147483647 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[2147483647, 'max']]);
      const iter: IterableIterator<[int, string]> = map.entries();
      const result: IteratorResult<[int, string]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_5200
     * @tc.name mapNextPart01Test052
     * @tc.desc Verify entries next() int 0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[0, 'zero'], [1, 'one']]);
      const iter: IterableIterator<[int, string]> = map.entries();
      const result: IteratorResult<[int, string]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_5300
     * @tc.name mapNextPart01Test053
     * @tc.desc Verify entries next() boolean key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>([[true, 1], [false, 0]]);
      const iter: IterableIterator<[boolean, int]> = map.entries();
      const result: IteratorResult<[boolean, int]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_5400
     * @tc.name mapNextPart01Test054
     * @tc.desc Verify entries next() NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>([[Number.NaN, 1], [2, 2]]);
      const iter: IterableIterator<[number, int]> = map.entries();
      const result: IteratorResult<[number, int]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_5500
     * @tc.name mapNextPart01Test055
     * @tc.desc Verify entries next() Infinity key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, int> = new Map<number, int>([[Number.POSITIVE_INFINITY, 1]]);
      const iter: IterableIterator<[number, int]> = map.entries();
      const result: IteratorResult<[number, int]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_5600
     * @tc.name mapNextPart01Test056
     * @tc.desc Verify entries next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['', 0], ['b', 1]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_5700
     * @tc.name mapNextPart01Test057
     * @tc.desc Verify entries next() Unicode emoji value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>([['a', '😀'], ['b', 'x']]);
      const iter: IterableIterator<[string, string]> = map.entries();
      const result: IteratorResult<[string, string]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_5800
     * @tc.name mapNextPart01Test058
     * @tc.desc Verify entries next() null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int | null> = new Map<string, int | null>();
      map.set('a', null);
      const iter: IterableIterator<[string, int | null]> = map.entries();
      const result: IteratorResult<[string, int | null]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_5900
     * @tc.name mapNextPart01Test059
     * @tc.desc Verify entries key next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['a', 2], ['b', 3]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_6000
     * @tc.name mapNextPart01Test060
     * @tc.desc Verify entries set key next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.set('b', 200);
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_6100
     * @tc.name mapNextPart01Test061
     * @tc.desc Verify entries size=3 next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      iter.next();
      iter.next();
      iter.next();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_6200
     * @tc.name mapNextPart01Test062
     * @tc.desc Verify entries key next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['​', 1], ['b', 2]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_6300
     * @tc.name mapNextPart01Test063
     * @tc.desc Verify entries value next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longVal: string = 'z'.repeat(10000);
      const map: Map<int, string> = new Map<int, string>([[1, longVal]]);
      const iter: IterableIterator<[int, string]> = map.entries();
      const result: IteratorResult<[int, string]> = iter.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART01_TEST_6400
     * @tc.name mapNextPart01Test064
     * @tc.desc Verify entries Map next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('c', 3);
      map.set('a', 1);
      map.set('b', 2);
      const iter: IterableIterator<[string, int]> = map.entries();
      const r1: IteratorResult<[string, int]> = iter.next();
      const r2: IteratorResult<[string, int]> = iter.next();
      const r3: IteratorResult<[string, int]> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
      expect(r3.done).assertFalse();
    });

  });
}
