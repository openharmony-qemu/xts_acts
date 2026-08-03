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

class Tag { id: number = 0; }
interface BoxIfc3 { label: string; size: number; }
interface Eq { a: number; b: number; }

export default function mapKeysPart03TestTest(): void {
  describe('MapKeysPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_0100
     * @tc.name mapKeysPart03Test001
     * @tc.desc Verify delete key key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k1', 1], ['k2', 2], ['k3', 3]]);
      let iter: IterableIterator<string> = m.keys();
      m.delete('k1');
      let count: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(2 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_0200
     * @tc.name mapKeysPart03Test002
     * @tc.desc Verify delete key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<string> = m.keys();
      m.delete('b');
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      expect(r1.value!).assertEqual('a');
      expect(r2.value!).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_0300
     * @tc.name mapKeysPart03Test003
     * @tc.desc Verify delete key key next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['x', 1], ['y', 2], ['z', 3]]);
      let iter: IterableIterator<string> = m.keys();
      m.delete('z');
      iter.next();
      iter.next();
      let r3: IteratorResult<string> = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_0400
     * @tc.name mapKeysPart03Test004
     * @tc.desc Verify delete key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['p1', 1], ['p2', 2], ['p3', 3], ['p4', 4]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      iter.next();
      m.delete('p1');
      let r3: IteratorResult<string> = iter.next();
      let r4: IteratorResult<string> = iter.next();
      expect(r3.value!).assertEqual('p3');
      expect(r4.value!).assertEqual('p4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_0500
     * @tc.name mapKeysPart03Test005
     * @tc.desc Verify delete key next() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['d1', 1], ['d2', 2], ['d3', 3]]);
      let iter: IterableIterator<string> = m.keys();
      let first: IteratorResult<string> = iter.next();
      m.delete('d2');
      let second: IteratorResult<string> = iter.next();
      expect(first.value!).assertEqual('d1');
      expect(second.value!).assertEqual('d3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_0600
     * @tc.name mapKeysPart03Test006
     * @tc.desc Verify delete key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['nx', 1], ['ny', 2]]);
      let iter: IterableIterator<string> = m.keys();
      let deleted: boolean = m.delete('zz');
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      expect(deleted).assertFalse();
      expect(r1.value!).assertEqual('nx');
      expect(r2.value!).assertEqual('ny');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_0700
     * @tc.name mapKeysPart03Test007
     * @tc.desc Verify delete key next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['sole', 1]]);
      let iter: IterableIterator<string> = m.keys();
      m.delete('sole');
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_0800
     * @tc.name mapKeysPart03Test008
     * @tc.desc Verify size=2 Map delete key delete key next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['dA', 1], ['dB', 2]]);
      let iter: IterableIterator<string> = m.keys();
      m.delete('dA');
      m.delete('dB');
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_0900
     * @tc.name mapKeysPart03Test009
     * @tc.desc Verify clear Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['ca', 1], ['cb', 2], ['cc', 3]]);
      let iter: IterableIterator<string> = m.keys();
      m.clear();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_1000
     * @tc.name mapKeysPart03Test010
     * @tc.desc Verify 1 clear Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['ca1', 1], ['ca2', 2], ['ca3', 3]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      m.clear();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_1100
     * @tc.name mapKeysPart03Test011
     * @tc.desc Verify clear Map next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['oldA', 1], ['oldB', 2]]);
      m.clear();
      let iter: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_1200
     * @tc.name mapKeysPart03Test012
     * @tc.desc Verify Map clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['m1', 1], ['m2', 2]]);
      m.clear();
      m.clear();
      let iter: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_1300
     * @tc.name mapKeysPart03Test013
     * @tc.desc Verify clear set key set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['orig', 1]]);
      let iter: IterableIterator<string> = m.keys();
      m.clear();
      m.set('newAdded', 1);
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_1400
     * @tc.name mapKeysPart03Test014
     * @tc.desc Verify Map clear set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      m.clear();
      m.set('late', 1);
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_1500
     * @tc.name mapKeysPart03Test015
     * @tc.desc Verify keys iterator false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['initial', 1]]);
      let iter: IterableIterator<string> = m.keys();
      m.set('added', 2);
      let r1: IteratorResult<string> = iter.next();
      expect(r1.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_1600
     * @tc.name mapKeysPart03Test016
     * @tc.desc Verify 1 set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['f1', 1], ['f2', 2]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      m.set('f3', 3);
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_1700
     * @tc.name mapKeysPart03Test017
     * @tc.desc Verify Map set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      m.set('postSet', 1);
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_1800
     * @tc.name mapKeysPart03Test018
     * @tc.desc Verify Map set key done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['done', 1]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      let beforeAdd: boolean = iter.next().done;
      m.set('afterDone', 2);
      let afterAdd: boolean = iter.next().done;
      expect(beforeAdd).assertTrue();
      expect(afterAdd).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_1900
     * @tc.name mapKeysPart03Test019
     * @tc.desc Verify key set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['origKey', 1]]);
      let oldIter: IterableIterator<string> = m.keys();
      m.delete('origKey');
      m.set('freshKey', 2);
      let oldR: IteratorResult<string> = oldIter.next();
      let newIter: IterableIterator<string> = m.keys();
      let newR: IteratorResult<string> = newIter.next();
      expect(oldR.done).assertFalse();
      expect(newR.value!).assertEqual('freshKey');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_2000
     * @tc.name mapKeysPart03Test020
     * @tc.desc Verify keys iterator false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['base', 0]]);
      let iter: IterableIterator<string> = m.keys();
      m.set('n1', 1);
      m.set('n2', 2);
      m.set('n3', 3);
      let r1: IteratorResult<string> = iter.next();
      expect(r1.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_2100
     * @tc.name mapKeysPart03Test021
     * @tc.desc Verify set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter: IterableIterator<string> = m.keys();
      m.set('b', 999);
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      let r3: IteratorResult<string> = iter.next();
      expect(r1.value!).assertEqual('a');
      expect(r2.value!).assertEqual('b');
      expect(r3.value!).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_2200
     * @tc.name mapKeysPart03Test022
     * @tc.desc Verify keys iterator == 's2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['s1', 1], ['s2', 2], ['s3', 3]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      m.set('s3', 300);
      let r2: IteratorResult<string> = iter.next();
      let r3: IteratorResult<string> = iter.next();
      expect(r2.value!).assertEqual('s2');
      expect(r3.value!).assertEqual('s3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_2300
     * @tc.name mapKeysPart03Test023
     * @tc.desc Verify set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['past', 1], ['curr', 2], ['futr', 3]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      m.set('past', 100);
      let r2: IteratorResult<string> = iter.next();
      let r3: IteratorResult<string> = iter.next();
      expect(r2.value!).assertEqual('curr');
      expect(r3.value!).assertEqual('futr');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_2400
     * @tc.name mapKeysPart03Test024
     * @tc.desc Verify set key delete key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['t1', 1], ['t2', 2], ['t3', 3]]);
      let iter: IterableIterator<string> = m.keys();
      m.set('t2', 200);
      m.delete('t2');
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      expect(r1.value!).assertEqual('t1');
      expect(r2.value!).assertEqual('t3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_2500
     * @tc.name mapKeysPart03Test025
     * @tc.desc Verify set key 1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['oneOnly', 1]]);
      let iter: IterableIterator<string> = m.keys();
      m.set('oneOnly', 999);
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      expect(r1.value!).assertEqual('oneOnly');
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_2600
     * @tc.name mapKeysPart03Test026
     * @tc.desc Verify delete key set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['k1', 1], ['k2', 2], ['k3', 3]]);
      let iter: IterableIterator<string> = m.keys();
      m.delete('k2');
      m.set('k2', 22);
      let count: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(3 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_2700
     * @tc.name mapKeysPart03Test027
     * @tc.desc Verify delete key set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['alpha', 1], ['beta', 2]]);
      let iter: IterableIterator<string> = m.keys();
      m.delete('alpha');
      m.set('gamma', 3);
      let count: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(2 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_2800
     * @tc.name mapKeysPart03Test028
     * @tc.desc Verify delete key set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['old1', 1], ['old2', 2]]);
      let iter: IterableIterator<string> = m.keys();
      m.delete('old1');
      m.delete('old2');
      m.set('new1', 10);
      m.set('new2', 20);
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_2900
     * @tc.name mapKeysPart03Test029
     * @tc.desc Verify set delete key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['baseKey', 1]]);
      let iter: IterableIterator<string> = m.keys();
      m.set('baseKey', 10);
      m.delete('baseKey');
      m.set('baseKey', 100);
      let r1: IteratorResult<string> = iter.next();
      expect(r1.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_3000
     * @tc.name mapKeysPart03Test030
     * @tc.desc Verify set key delete set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['core', 1]]);
      let iter: IterableIterator<string> = m.keys();
      m.set('temp', 2);
      m.delete('temp');
      m.set('final', 3);
      let r1: IteratorResult<string> = iter.next();
      expect(r1.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_3100
     * @tc.name mapKeysPart03Test031
     * @tc.desc Verify size=0 Map next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      let iter: IterableIterator<int> = m.keys();
      let r: IteratorResult<int> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_3200
     * @tc.name mapKeysPart03Test032
     * @tc.desc Verify size=0 Map next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      let iter: IterableIterator<number> = m.keys();
      let r: IteratorResult<number> = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_3300
     * @tc.name mapKeysPart03Test033
     * @tc.desc Verify 3 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['single', 1]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_3400
     * @tc.name mapKeysPart03Test034
     * @tc.desc Verify 10 next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(1 as int, 10);
      let iter: IterableIterator<int> = m.keys();
      iter.next();
      let allDone: boolean = true;
      for (let i: int = 0; i < 10; i++) {
        if (!iter.next().done) { allDone = false; }
      }
      expect(allDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_3500
     * @tc.name mapKeysPart03Test035
     * @tc.desc Verify value undefined 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['v', 1]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      let r3: IteratorResult<string> = iter.next();
      expect(r1.value).assertUndefined();
      expect(r2.value).assertUndefined();
      expect(r3.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_3600
     * @tc.name mapKeysPart03Test036
     * @tc.desc Verify Map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_3700
     * @tc.name mapKeysPart03Test037
     * @tc.desc Verify next function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['fn', 1]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      iter.next();
      expect(typeof iter.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_3800
     * @tc.name mapKeysPart03Test038
     * @tc.desc Verify N Map N next() done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['w', 1], ['x', 2], ['y', 3], ['z', 4]]);
      let iter: IterableIterator<string> = m.keys();
      let allNotDone: boolean = true;
      for (let i: int = 0; i < 4; i++) {
        if (iter.next().done) { allNotDone = false; }
      }
      expect(allNotDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_3900
     * @tc.name mapKeysPart03Test039
     * @tc.desc Verify Map null key null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | null, int> = new Map<string | null, int>();
      m.set(null, 1);
      let iter: IterableIterator<string | null> = m.keys();
      let r: IteratorResult<string | null> = iter.next();
      expect(r.done).assertFalse();
      expect(r.value).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_4000
     * @tc.name mapKeysPart03Test040
     * @tc.desc Verify Map undefined key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | undefined, int> = new Map<string | undefined, int>();
      m.set(undefined, 1);
      let iter: IterableIterator<string | undefined> = m.keys();
      let r: IteratorResult<string | undefined> = iter.next();
      expect(r.done).assertFalse();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_4100
     * @tc.name mapKeysPart03Test041
     * @tc.desc Verify Map null string key null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | null, int> = new Map<string | null, int>();
      m.set('normal', 1);
      m.set(null, 2);
      m.set('another', 3);
      let iter: IterableIterator<string | null> = m.keys();
      let r1: IteratorResult<string | null> = iter.next();
      let r2: IteratorResult<string | null> = iter.next();
      expect(r1.value!).assertEqual('normal');
      expect(r2.value).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_4200
     * @tc.name mapKeysPart03Test042
     * @tc.desc Verify Map undefined value key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | undefined, int> = new Map<string | undefined, int>();
      m.set(undefined, 1);
      m.set('defined', 2);
      let iter: IterableIterator<string | undefined> = m.keys();
      let r1: IteratorResult<string | undefined> = iter.next();
      let r2: IteratorResult<string | undefined> = iter.next();
      expect(r1.value).assertUndefined();
      expect(r2.value!).assertEqual('defined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_4300
     * @tc.name mapKeysPart03Test043
     * @tc.desc Verify Map NaN number key NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(Number.NaN, 1);
      let iter: IterableIterator<number> = m.keys();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_4400
     * @tc.name mapKeysPart03Test044
     * @tc.desc Verify Map NaN number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(Number.NaN, 1);
      m.set(100.0, 2);
      let iter: IterableIterator<number> = m.keys();
      let r1: IteratorResult<number> = iter.next();
      let r2: IteratorResult<number> = iter.next();
      let r3: IteratorResult<number> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_4500
     * @tc.name mapKeysPart03Test045
     * @tc.desc Verify Map Number.POSITIVE_INFINITY key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(Number.POSITIVE_INFINITY, 1);
      let iter: IterableIterator<number> = m.keys();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_4600
     * @tc.name mapKeysPart03Test046
     * @tc.desc Verify Map Number.NEGATIVE_INFINITY key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(Number.NEGATIVE_INFINITY, 1);
      let iter: IterableIterator<number> = m.keys();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_4700
     * @tc.name mapKeysPart03Test047
     * @tc.desc Verify Map -0.0 number key close
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(-0.0, 1);
      let iter: IterableIterator<number> = m.keys();
      let r: IteratorResult<number> = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_4800
     * @tc.name mapKeysPart03Test048
     * @tc.desc Verify size=0 Map for...of keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<string> = m.keys();
      let executed: boolean = false;
      for (const key of iter) {
        executed = true;
      }
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_4900
     * @tc.name mapKeysPart03Test049
     * @tc.desc Verify size=1 Map for...of keys 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['one', 1]]);
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      for (const key of iter) {
        count = (count as int) + 1 as int;
      }
      expect(count).assertEqual(1 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_5000
     * @tc.name mapKeysPart03Test050
     * @tc.desc Verify size=1 Map 1 next()2 done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(5 as int, 50);
      let iter: IterableIterator<int> = m.keys();
      let r1: IteratorResult<int> = iter.next();
      let r2: IteratorResult<int> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_5100
     * @tc.name mapKeysPart03Test051
     * @tc.desc Verify set key size =1 1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('same', 1);
      m.set('same', 2);
      m.set('same', 3);
      let iter: IterableIterator<string> = m.keys();
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_5200
     * @tc.name mapKeysPart03Test052
     * @tc.desc Verify entries key , ] size=1 1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['dupK', 1], ['dupK', 2], ['dupK', 3]]);
      let iter: IterableIterator<string> = m.keys();
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_5300
     * @tc.name mapKeysPart03Test053
     * @tc.desc Verify clear set key size=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['old', 1], ['older', 2]]);
      m.clear();
      m.set('new', 3);
      let iter: IterableIterator<string> = m.keys();
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      expect(r1.value!).assertEqual('new');
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_5400
     * @tc.name mapKeysPart03Test054
     * @tc.desc Verify delete key Map for...of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['del1', 1], ['del2', 2]]);
      m.delete('del1');
      m.delete('del2');
      let iter: IterableIterator<string> = m.keys();
      let hit: boolean = false;
      for (const key of iter) {
        hit = true;
      }
      expect(hit).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_5500
     * @tc.name mapKeysPart03Test055
     * @tc.desc Verify boolean Map true false key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(true, 1);
      m.set(false, 0);
      let iter: IterableIterator<boolean> = m.keys();
      let r1: IteratorResult<boolean> = iter.next();
      let r2: IteratorResult<boolean> = iter.next();
      let r3: IteratorResult<boolean> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_5600
     * @tc.name mapKeysPart03Test056
     * @tc.desc Verify Map null size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>(null);
      let iter: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_5700
     * @tc.name mapKeysPart03Test057
     * @tc.desc Verify Map size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [];
      const m: Map<string, int> = new Map<string, int>(entries);
      let iter: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_5800
     * @tc.name mapKeysPart03Test058
     * @tc.desc Verify for...of break break next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['first', 1], ['second', 2], ['third', 3]]);
      let iter: IterableIterator<string> = m.keys();
      for (const key of iter) {
        if (key === 'second') {
          break;
        }
      }
      let r: IteratorResult<string> = iter.next();
      expect(r.value!).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_5900
     * @tc.name mapKeysPart03Test059
     * @tc.desc Verify for...of next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['item1', 1], ['item2', 2]]);
      let iter: IterableIterator<string> = m.keys();
      for (const key of iter) {
      }
      let r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_6000
     * @tc.name mapKeysPart03Test060
     * @tc.desc Verify for...of keys next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      let iter: IterableIterator<int> = m.keys();
      let flag: boolean = false;
      for (const key of iter) {
        flag = true;
      }
      expect(flag).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_6100
     * @tc.name mapKeysPart03Test061
     * @tc.desc Verify for...of keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['A', 1], ['B', 2]]);
      let iter1: IterableIterator<string> = m.keys();
      for (const key of iter1) {
      }
      let iter2: IterableIterator<string> = m.keys();
      let r: IteratorResult<string> = iter2.next();
      expect(r.value!).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_6200
     * @tc.name mapKeysPart03Test062
     * @tc.desc Verify for...of Map clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['cx', 1], ['cy', 2], ['cz', 3]]);
      let iter: IterableIterator<string> = m.keys();
      let count: int = 0;
      for (const key of iter) {
        count = (count as int) + 1 as int;
        m.clear();
      }
      expect(count).assertEqual(1 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_6300
     * @tc.name mapKeysPart03Test063
     * @tc.desc Verify keys == 2 as int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['out', 1], ['in', 2]]);
      let outerIter: IterableIterator<string> = m.keys();
      let outerCount: int = 0;
      for (const outerKey of outerIter) {
        outerCount = (outerCount as int) + 1 as int;
        let innerIter: IterableIterator<string> = m.keys();
        let innerCount: int = 0;
        for (const innerKey of innerIter) {
          innerCount = (innerCount as int) + 1 as int;
        }
        expect(innerCount).assertEqual(2 as int);
      }
      expect(outerCount).assertEqual(2 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_6400
     * @tc.name mapKeysPart03Test064
     * @tc.desc Verify for...of clear Map 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['pre', 1], ['post', 2]]);
      m.clear();
      let iter: IterableIterator<string> = m.keys();
      let touched: boolean = false;
      for (const key of iter) {
        touched = true;
      }
      expect(touched).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_6500
     * @tc.name mapKeysPart03Test065
     * @tc.desc Verify for...of const int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(100 as int, 1);
      m.set(200 as int, 2);
      let iter: IterableIterator<int> = m.keys();
      let sum: int = 0;
      for (const key of iter) {
        sum = (sum as int) + key;
      }
      expect(sum).assertEqual(300 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_6600
     * @tc.name mapKeysPart03Test066
     * @tc.desc Verify for...of delete key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['s1', 1], ['s2', 2], ['s3', 3]]);
      let iter: IterableIterator<string> = m.keys();
      let keys: string[] = [];
      for (const key of iter) {
        keys.push(key);
        if (key === 's1') {
          m.delete('s2');
        }
      }
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_6700
     * @tc.name mapKeysPart03Test067
     * @tc.desc Verify Date key next().value set Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date();
      const m: Map<Date, int> = new Map<Date, int>();
      m.set(d, 1);
      let iter: IterableIterator<Date> = m.keys();
      let r: IteratorResult<Date> = iter.next();
      expect(r.value!).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_6800
     * @tc.name mapKeysPart03Test068
     * @tc.desc Verify RegExp key next().value set RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('^test$', 'i');
      const m: Map<RegExp, int> = new Map<RegExp, int>();
      m.set(re, 1);
      let iter: IterableIterator<RegExp> = m.keys();
      let r: IteratorResult<RegExp> = iter.next();
      expect(r.value!).assertEqual(re);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_6900
     * @tc.name mapKeysPart03Test069
     * @tc.desc Verify class key next().value set class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: Tag = new Tag();
      t.id = 99;
      const m: Map<Tag, int> = new Map<Tag, int>();
      m.set(t, 1);
      let iter: IterableIterator<Tag> = m.keys();
      let r: IteratorResult<Tag> = iter.next();
      expect(r.value!).assertEqual(t);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_7000
     * @tc.name mapKeysPart03Test070
     * @tc.desc Verify Array key next().value set Array , int>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [7, 8, 9];
      const m: Map<int[], int> = new Map<int[], int>();
      m.set(arr, 1);
      let iter: IterableIterator<int[]> = m.keys();
      let r: IteratorResult<int[]> = iter.next();
      expect(r.value!).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_7100
     * @tc.name mapKeysPart03Test071
     * @tc.desc Verify object(interface) key next().value set object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: BoxIfc3 = { label: 'big', size: 10 };
      const m: Map<BoxIfc3, int> = new Map<BoxIfc3, int>();
      m.set(b, 1);
      let iter: IterableIterator<BoxIfc3> = m.keys();
      let r: IteratorResult<BoxIfc3> = iter.next();
      expect(r.value!).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_7200
     * @tc.name mapKeysPart03Test072
     * @tc.desc Verify object Map 2 key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Eq = { a: 1, b: 2 };
      let e2: Eq = { a: 1, b: 2 };
      const m: Map<Eq, int> = new Map<Eq, int>();
      m.set(e1, 10);
      m.set(e2, 20);
      let iter: IterableIterator<Eq> = m.keys();
      let r1: IteratorResult<Eq> = iter.next();
      let r2: IteratorResult<Eq> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_7300
     * @tc.name mapKeysPart03Test073
     * @tc.desc Verify Date Map key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let da: Date = new Date();
      let db: Date = new Date();
      const m: Map<Date, int> = new Map<Date, int>();
      m.set(da, 1);
      m.set(db, 2);
      let iter: IterableIterator<Date> = m.keys();
      let r1: IteratorResult<Date> = iter.next();
      let r2: IteratorResult<Date> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_7400
     * @tc.name mapKeysPart03Test074
     * @tc.desc Verify pattern RegExp Map key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rA: RegExp = new RegExp('match', 'g');
      let rB: RegExp = new RegExp('match', 'g');
      const m: Map<RegExp, int> = new Map<RegExp, int>();
      m.set(rA, 1);
      m.set(rB, 2);
      let iter: IterableIterator<RegExp> = m.keys();
      let r1: IteratorResult<RegExp> = iter.next();
      let r2: IteratorResult<RegExp> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_7500
     * @tc.name mapKeysPart03Test075
     * @tc.desc Verify key delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dRef: Date = new Date();
      const m: Map<Date, int> = new Map<Date, int>();
      m.set(dRef, 100);
      m.delete(dRef);
      let iter: IterableIterator<Date> = m.keys();
      let r: IteratorResult<Date> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_7600
     * @tc.name mapKeysPart03Test076
     * @tc.desc Verify Error key next().value set Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('oops');
      const m: Map<Error, int> = new Map<Error, int>();
      m.set(err, 1);
      let iter: IterableIterator<Error> = m.keys();
      let r: IteratorResult<Error> = iter.next();
      expect(r.value!).assertEqual(err);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_7700
     * @tc.name mapKeysPart03Test077
     * @tc.desc Verify Map key next().value set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Map<string, int> = new Map<string, int>([['ik', 1]]);
      const m: Map<Map<string, int>, int> = new Map<Map<string, int>, int>();
      m.set(inner, 1);
      const iter: IterableIterator<Map<string, int>> = m.keys();
      const r: IteratorResult<Map<string, int>> = iter.next();
      expect(r.value!).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_7800
     * @tc.name mapKeysPart03Test078
     * @tc.desc Verify Set key next().value set Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>([1 as int, 2 as int]);
      const m: Map<Set<int>, int> = new Map<Set<int>, int>();
      m.set(s, 1);
      let iter: IterableIterator<Set<int>> = m.keys();
      let r: IteratorResult<Set<int>> = iter.next();
      expect(r.value!).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_7900
     * @tc.name mapKeysPart03Test079
     * @tc.desc Verify Map A B A B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['init', 1]]);
      let iterA: IterableIterator<string> = m.keys();
      m.set('added', 2);
      m.delete('init');
      let iterB: IterableIterator<string> = m.keys();
      let rB: IteratorResult<string> = iterB.next();
      expect(rB.value!).assertEqual('added');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_8000
     * @tc.name mapKeysPart03Test080
     * @tc.desc Verify Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['oldA', 1], ['oldB', 2]]);
      let iter: IterableIterator<string> = m.keys();
      m.delete('oldA');
      m.set('newC', 3);
      expect(m.size).assertEqual(2 as int);
      let count: int = 0;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(2 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_8100
     * @tc.name mapKeysPart03Test081
     * @tc.desc Verify keys iterator false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['legacy1', 1], ['legacy2', 2]]);
      let iter: IterableIterator<string> = m.keys();
      m.clear();
      m.set('modern1', 10);
      m.set('modern2', 20);
      let r1: IteratorResult<string> = iter.next();
      let r2: IteratorResult<string> = iter.next();
      let r3: IteratorResult<string> = iter.next();
      expect(r1.done).assertFalse();
      expect(r2.done).assertFalse();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_8200
     * @tc.name mapKeysPart03Test082
     * @tc.desc Verify keys() ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['id', 1]]);
      let a: IterableIterator<string> = m.keys();
      let b: IterableIterator<string> = m.keys();
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART03_8300
     * @tc.name mapKeysPart03Test083
     * @tc.desc Verify Map set +delete key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['r1', 1], ['r2', 2], ['r3', 3], ['r4', 4]]);
      let iter: IterableIterator<string> = m.keys();
      iter.next();
      m.set('r2', 200);
      m.delete('r3');
      let count: int = 1;
      let r: IteratorResult<string> = iter.next();
      while (!r.done) {
        count = (count as int) + 1 as int;
        r = iter.next();
      }
      expect(count).assertEqual(3 as int);
    });

  });
}
