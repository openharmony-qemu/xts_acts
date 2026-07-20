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

export default function mapNextPart03TestTest(): void {
  describe('MapNextPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_0100
     * @tc.name mapNextPart03Test001
     * @tc.desc Verify K=string Map keys() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_0200
     * @tc.name mapNextPart03Test002
     * @tc.desc Verify K=int Map keys() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      let iter: IterableIterator<int> = m.keys();
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_0300
     * @tc.name mapNextPart03Test003
     * @tc.desc Verify K=string Map keys next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['only', 1]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_0400
     * @tc.name mapNextPart03Test004
     * @tc.desc Verify K=int Map keys next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[42, 'x']]);
      let iter: IterableIterator<int> = m.keys();
      iter.next();
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_0500
     * @tc.name mapNextPart03Test005
     * @tc.desc Verify K=string Map keys next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      iter.next();
      iter.next();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_0600
     * @tc.name mapNextPart03Test006
     * @tc.desc Verify K=string keys next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['solo', 99]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_0700
     * @tc.name mapNextPart03Test007
     * @tc.desc Verify K=int keys next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>([[1, 10]]);
      let iter: IterableIterator<int> = m.keys();
      iter.next();
      let r: IteratorResult<int> = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_0800
     * @tc.name mapNextPart03Test008
     * @tc.desc Verify K=string keys 3 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['p', 1], ['q', 2]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      iter.next();
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      let r3: IteratorResult<string> = iter.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_0900
     * @tc.name mapNextPart03Test009
     * @tc.desc Verify K=string keys 10 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 1], ['y', 2]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      iter.next();
      let allDone: boolean = true;
      for (let i: int = 0; i < 10; i++) {
        if (iter.next().done !== true) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_1000
     * @tc.name mapNextPart03Test010
     * @tc.desc Verify K=string keys 5 6 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k1', 1], ['k2', 2], ['k3', 3], ['k4', 4], ['k5', 5]]);
      let iter: IterableIterator<string> = m.keys();
      for (let i: int = 0; i < 5; i++) {
        iter.next();
      }
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_1100
     * @tc.name mapNextPart03Test011
     * @tc.desc Verify K=string Map keys 5 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      let allDone: boolean = true;
      for (let i: int = 0; i < 5; i++) {
        if (iter.next().done !== true) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_1200
     * @tc.name mapNextPart03Test012
     * @tc.desc Verify V=string Map values() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      let iter: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_1300
     * @tc.name mapNextPart03Test013
     * @tc.desc Verify V=int Map values() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_1400
     * @tc.name mapNextPart03Test014
     * @tc.desc Verify V=string Map values next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['k', 'v']]);
      let iter: IterableIterator<string> = m.values();
      iter.next();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_1500
     * @tc.name mapNextPart03Test015
     * @tc.desc Verify V=int Map values next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 42]]);
      let iter: IterableIterator<int> = m.values();
      iter.next();
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_1600
     * @tc.name mapNextPart03Test016
     * @tc.desc Verify V=string Map values next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['a', 'x'], ['b', 'y'], ['c', 'z']]);
      let iter: IterableIterator<string> = m.values();
      iter.next();
      iter.next();
      iter.next();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_1700
     * @tc.name mapNextPart03Test017
     * @tc.desc Verify V=string values next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['k', 'original']]);
      let iter: IterableIterator<string> = m.values();
      iter.next();
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_1800
     * @tc.name mapNextPart03Test018
     * @tc.desc Verify V=int values next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k', 100]]);
      let iter: IterableIterator<int> = m.values();
      iter.next();
      let r: IteratorResult<int> = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_1900
     * @tc.name mapNextPart03Test019
     * @tc.desc Verify V=string values 5 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['a', 'x'], ['b', 'y']]);
      let iter: IterableIterator<string> = m.values();
      iter.next();
      iter.next();
      let allDone: boolean = true;
      for (let i: int = 0; i < 5; i++) {
        if (iter.next().done !== true) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_2000
     * @tc.name mapNextPart03Test020
     * @tc.desc Verify V=string values 10 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['u', 'a'], ['v', 'b']]);
      let iter: IterableIterator<string> = m.values();
      iter.next();
      iter.next();
      let allDone: boolean = true;
      for (let i: int = 0; i < 10; i++) {
        if (iter.next().done !== true) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_2100
     * @tc.name mapNextPart03Test021
     * @tc.desc Verify V=number Map values 5 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      let iter: IterableIterator<number> = m.values();
      let allDone: boolean = true;
      for (let i: int = 0; i < 5; i++) {
        if (iter.next().done !== true) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_2200
     * @tc.name mapNextPart03Test022
     * @tc.desc Verify entries Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_2300
     * @tc.name mapNextPart03Test023
     * @tc.desc Verify entries Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['only', 1]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      iter.next();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_2400
     * @tc.name mapNextPart03Test024
     * @tc.desc Verify entries Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      iter.next();
      iter.next();
      iter.next();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_2500
     * @tc.name mapNextPart03Test025
     * @tc.desc Verify entries next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['item', 55]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      iter.next();
      let r1: IteratorResult<[string, int]> = iter.next();
      let r2: IteratorResult<[string, int]> = iter.next();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_2600
     * @tc.name mapNextPart03Test026
     * @tc.desc Verify entries 3 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['p', 1], ['q', 2]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      iter.next();
      iter.next();
      let r1: IteratorResult<[string, int]> = iter.next();
      let r2: IteratorResult<[string, int]> = iter.next();
      let r3: IteratorResult<[string, int]> = iter.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_2700
     * @tc.name mapNextPart03Test027
     * @tc.desc Verify entries 10 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      iter.next();
      iter.next();
      let allDone: boolean = true;
      for (let i: int = 0; i < 10; i++) {
        if (iter.next().done !== true) {
          allDone = false;
        }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_2800
     * @tc.name mapNextPart03Test028
     * @tc.desc Verify entries 4 5 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3], ['d', 4]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      for (let i: int = 0; i < 4; i++) {
        iter.next();
      }
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_2900
     * @tc.name mapNextPart03Test029
     * @tc.desc Verify entries Map for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let entered: boolean = false;
      for (let entry of m.entries()) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_3000
     * @tc.name mapNextPart03Test030
     * @tc.desc Verify entries Map for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['solo', 1]]);
      let count: int = 0;
      for (let entry of m.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_3100
     * @tc.name mapNextPart03Test031
     * @tc.desc Verify null Map values() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>(null);
      let iter: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_3200
     * @tc.name mapNextPart03Test032
     * @tc.desc Verify null Map entries() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>(null);
      let iter: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_3300
     * @tc.name mapNextPart03Test033
     * @tc.desc Verify Map values() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([]);
      let iter: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_3400
     * @tc.name mapNextPart03Test034
     * @tc.desc Verify set clear keys() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('tmp', 99);
      m.clear();
      let iter: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_3500
     * @tc.name mapNextPart03Test035
     * @tc.desc Verify set delete entries() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      m.delete('a');
      m.delete('b');
      m.delete('c');
      let iter: IterableIterator<[string, int]> = m.entries();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_3600
     * @tc.name mapNextPart03Test036
     * @tc.desc Verify set delete keys() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 1], ['y', 2]]);
      m.delete('x');
      m.delete('y');
      let iter: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_3700
     * @tc.name mapNextPart03Test037
     * @tc.desc Verify set clear values() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      m.clear();
      let iter: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_3800
     * @tc.name mapNextPart03Test038
     * @tc.desc Verify K=number Map keys next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>([[3.14, 1]]);
      let iter: IterableIterator<number> = m.keys();
      iter.next();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_3900
     * @tc.name mapNextPart03Test039
     * @tc.desc Verify K=boolean Map keys next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>([[true, 1]]);
      let iter: IterableIterator<boolean> = m.keys();
      iter.next();
      let r: IteratorResult<boolean> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_4000
     * @tc.name mapNextPart03Test040
     * @tc.desc Verify K=double Map keys next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>([[1.5, 1]]);
      let iter: IterableIterator<double> = m.keys();
      iter.next();
      let r: IteratorResult<double> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_4100
     * @tc.name mapNextPart03Test041
     * @tc.desc Verify V=boolean Map values next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>([['k', false]]);
      let iter: IterableIterator<boolean> = m.values();
      iter.next();
      let r: IteratorResult<boolean> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_4200
     * @tc.name mapNextPart03Test042
     * @tc.desc Verify V=number Map values next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>([['k', 3.14]]);
      let iter: IterableIterator<number> = m.values();
      iter.next();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_4300
     * @tc.name mapNextPart03Test043
     * @tc.desc Verify V=long Map entries next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, long> = new Map<string, long>([['k', Int.toLong(100)]]);
      let iter: IterableIterator<[string, long]> = m.entries();
      iter.next();
      let r: IteratorResult<[string, long]> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_4400
     * @tc.name mapNextPart03Test044
     * @tc.desc Verify value=NaN values next() done=false value NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('nan', Number.NaN);
      let iter: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
      let valIsNaN: boolean = isNaN(r.value!);
      expect(valIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_4500
     * @tc.name mapNextPart03Test045
     * @tc.desc Verify value=NaN values next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>([['nan', Number.NaN]]);
      let iter: IterableIterator<number> = m.values();
      iter.next();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_4600
     * @tc.name mapNextPart03Test046
     * @tc.desc Verify value=Infinity values next() done=false value Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('inf', Number.POSITIVE_INFINITY);
      let iter: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_4700
     * @tc.name mapNextPart03Test047
     * @tc.desc Verify value=-Infinity values next() done=false value -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('ninf', Number.NEGATIVE_INFINITY);
      let iter: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_4800
     * @tc.name mapNextPart03Test048
     * @tc.desc Verify value=-Infinity values next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>([['ninf', Number.NEGATIVE_INFINITY]]);
      let iter: IterableIterator<number> = m.values();
      iter.next();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_4900
     * @tc.name mapNextPart03Test049
     * @tc.desc Verify value=Number.EPSILON values next() done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('eps', Number.EPSILON);
      let iter: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_5000
     * @tc.name mapNextPart03Test050
     * @tc.desc Verify value=-0.0 values next() done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('nz', -0.0);
      let iter: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_5100
     * @tc.name mapNextPart03Test051
     * @tc.desc Verify value=0 values next() done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['zero', 0]]);
      let iter: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_5200
     * @tc.name mapNextPart03Test052
     * @tc.desc Verify key=NaN keys next() done=false value NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>();
      m.set(Number.NaN, 'nan_key');
      let iter: IterableIterator<number> = m.keys();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
      let keyIsNaN: boolean = isNaN(r.value!);
      expect(keyIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_5300
     * @tc.name mapNextPart03Test053
     * @tc.desc Verify key=Infinity keys next() done=false value Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>();
      m.set(Number.POSITIVE_INFINITY, 'inf_key');
      let iter: IterableIterator<number> = m.keys();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_5400
     * @tc.name mapNextPart03Test054
     * @tc.desc Verify key=-Infinity keys next() done=false value -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>();
      m.set(Number.NEGATIVE_INFINITY, 'ninf_key');
      let iter: IterableIterator<number> = m.keys();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_5500
     * @tc.name mapNextPart03Test055
     * @tc.desc Verify key=-0.0 keys next() done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>();
      m.set(-0.0, 'neg_zero_key');
      let iter: IterableIterator<number> = m.keys();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_5600
     * @tc.name mapNextPart03Test056
     * @tc.desc Verify key=-Infinity keys next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, string> = new Map<number, string>([[Number.NEGATIVE_INFINITY, 'v']]);
      let iter: IterableIterator<number> = m.keys();
      iter.next();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_5700
     * @tc.name mapNextPart03Test057
     * @tc.desc Verify value=0 Map values 4 next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 0], ['b', 0], ['c', 0]]);
      let iter: IterableIterator<int> = m.values();
      iter.next();
      iter.next();
      iter.next();
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_5800
     * @tc.name mapNextPart03Test058
     * @tc.desc Verify value="" Map values 4 next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['x', ''], ['y', ''], ['z', '']]);
      let iter: IterableIterator<string> = m.values();
      iter.next();
      iter.next();
      iter.next();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_5900
     * @tc.name mapNextPart03Test059
     * @tc.desc Verify value=true Map values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, boolean> = new Map<string, boolean>([['a', true], ['b', true]]);
      let iter: IterableIterator<boolean> = m.values();
      let r1: IteratorResult<boolean> = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value!).assertTrue();
      let r2: IteratorResult<boolean> = iter.next();
      expect(r2.done).assertFalse();
      expect(r2.value!).assertTrue();
      let r3: IteratorResult<boolean> = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_6000
     * @tc.name mapNextPart03Test060
     * @tc.desc Verify value=false Map values 5 next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, boolean> = new Map<int, boolean>([[1, false], [2, false], [3, false], [4, false]]);
      let iter: IterableIterator<boolean> = m.values();
      for (let i: int = 0; i < 4; i++) {
        iter.next();
      }
      let r: IteratorResult<boolean> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_6100
     * @tc.name mapNextPart03Test061
     * @tc.desc Verify value entries N+1 next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>([['k1', 'dup'], ['k2', 'dup'], ['k3', 'dup']]);
      let iter: IterableIterator<[string, string]> = m.entries();
      iter.next();
      iter.next();
      iter.next();
      let r: IteratorResult<[string, string]> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_6200
     * @tc.name mapNextPart03Test062
     * @tc.desc Verify value int entries for-of size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 0], ['b', 0], ['c', 0], ['d', 0]]);
      let count: int = 0;
      for (let entry of m.entries()) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_6300
     * @tc.name mapNextPart03Test063
     * @tc.desc Verify keys delete key next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<string> = m.keys();
      let r1: IteratorResult<string> = iter.next();
      m.delete('a');
      let r2: IteratorResult<string> = iter.next();
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_6400
     * @tc.name mapNextPart03Test064
     * @tc.desc Verify keys delete key next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      m.delete('c');
      let remaining: string[] = [];
      for (let i: int = 0; i < 2; i++) {
        let r: IteratorResult<string> = iter.next();
        if (!r.done) {
          remaining.push(r.value!);
        }
      }
      let allDefined: boolean = remaining.length > 0;
      expect(allDefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_6500
     * @tc.name mapNextPart03Test065
     * @tc.desc Verify values add key next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<int> = m.values();
      iter.next();
      m.set('new', 99);
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_6600
     * @tc.name mapNextPart03Test066
     * @tc.desc Verify values set key next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter: IterableIterator<int> = m.values();
      iter.next();
      m.set('b', 999);
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_6700
     * @tc.name mapNextPart03Test067
     * @tc.desc Verify entries clear next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      iter.next();
      m.clear();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_6800
     * @tc.name mapNextPart03Test068
     * @tc.desc Verify entries delete key next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      iter.next();
      m.delete('b');
      m.delete('c');
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_6900
     * @tc.name mapNextPart03Test069
     * @tc.desc Verify keys clear next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 1], ['y', 2]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      m.clear();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_7000
     * @tc.name mapNextPart03Test070
     * @tc.desc Verify values clear next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<int> = m.values();
      iter.next();
      m.clear();
      let r1: IteratorResult<int> = iter.next();
      let r2: IteratorResult<int> = iter.next();
      let r3: IteratorResult<int> = iter.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_7100
     * @tc.name mapNextPart03Test071
     * @tc.desc Verify Map keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter1: IterableIterator<string> = m.keys();
      let iter2: IterableIterator<string> = m.keys();
      let r1: IteratorResult<string> = iter1.next();
      let r2: IteratorResult<string> = iter2.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
      expect(r1.value!).assertEqual('a');
      expect(r2.value!).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_7200
     * @tc.name mapNextPart03Test072
     * @tc.desc Verify Map values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter1: IterableIterator<int> = m.values();
      let iter2: IterableIterator<int> = m.values();
      iter1.next();
      iter1.next();
      let r1: IteratorResult<int> = iter1.next();
      let r2: IteratorResult<int> = iter2.next();
      expect(r1.value!).assertEqual(3);
      expect(r2.value!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_7300
     * @tc.name mapNextPart03Test073
     * @tc.desc Verify Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      let iter1: IterableIterator<[string, int]> = m.entries();
      let iter2: IterableIterator<[string, int]> = m.entries();
      iter1.next();
      let r1: IteratorResult<[string, int]> = iter2.next();
      let r2: IteratorResult<[string, int]> = iter2.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_7400
     * @tc.name mapNextPart03Test074
     * @tc.desc Verify keys iterator false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['p', 1], ['q', 2]]);
      let iterOld: IterableIterator<string> = m.keys();
      iterOld.next();
      iterOld.next();
      iterOld.next();
      let iterNew: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iterNew.next();
      expect(r.done).assertFalse();
      expect(r.value!).assertEqual('p');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_7500
     * @tc.name mapNextPart03Test075
     * @tc.desc Verify Map delete next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter: IterableIterator<[string, int]> = m.entries();
      m.delete('a');
      m.delete('b');
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NEXT_PART03_TEST_7600
     * @tc.name mapNextPart03Test076
     * @tc.desc Verify keys iterator hasElements true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapNextPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['orig', 1]]);
      let iter: IterableIterator<string> = m.keys();
      m.set('added', 2);
      let total: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        total++;
        r = iter.next();
      }
      let hasElements: boolean = total >= 1;
      expect(hasElements).assertTrue();
    });

  });
}
