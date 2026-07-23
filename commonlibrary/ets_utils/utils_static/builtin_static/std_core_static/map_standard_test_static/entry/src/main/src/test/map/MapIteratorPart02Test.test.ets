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

export default function mapIteratorPart02TestTest(): void {
  describe('MapIteratorPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_0100
     * @tc.name mapIteratorPart02Test001
     * @tc.desc Verify keys $_iterator() typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter = map.keys();
      let ret = iter.$_iterator();
      expect(typeof ret).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_0200
     * @tc.name mapIteratorPart02Test002
     * @tc.desc Verify keys $_iterator() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[1, 'one']]);
      let iter = map.keys();
      let ret = iter.$_iterator();
      expect(ret).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_0300
     * @tc.name mapIteratorPart02Test003
     * @tc.desc Verify values $_iterator() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[5, 'five']]);
      let iter = map.values();
      let ret = iter.$_iterator();
      expect(ret).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_0400
     * @tc.name mapIteratorPart02Test004
     * @tc.desc Verify entries $_iterator() null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[7, 'seven']]);
      let iter = map.entries();
      let ret = iter.$_iterator();
      expect(ret).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_0500
     * @tc.name mapIteratorPart02Test005
     * @tc.desc Verify keys $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter = map.keys();
      let ret = iter.$_iterator();
      expect(ret).assertEqual(iter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_0600
     * @tc.name mapIteratorPart02Test006
     * @tc.desc Verify values $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['p', 10], ['q', 20]]);
      let iter = map.values();
      let ret = iter.$_iterator();
      expect(ret).assertEqual(iter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_0700
     * @tc.name mapIteratorPart02Test007
     * @tc.desc Verify entries $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['m', 100], ['n', 200]]);
      let iter = map.entries();
      let ret = iter.$_iterator();
      expect(ret).assertEqual(iter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_0800
     * @tc.name mapIteratorPart02Test008
     * @tc.desc Verify keys $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['z', 0]]);
      let iter = map.keys();
      let ret1 = iter.$_iterator();
      let ret2 = iter.$_iterator();
      expect(ret1).assertEqual(ret2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_0900
     * @tc.name mapIteratorPart02Test009
     * @tc.desc Verify values $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['u', 30]]);
      let iter = map.values();
      let ret1 = iter.$_iterator();
      let ret2 = iter.$_iterator();
      expect(ret1).assertEqual(ret2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_1000
     * @tc.name mapIteratorPart02Test010
     * @tc.desc Verify entries $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['v', 40]]);
      let iter = map.entries();
      let ret1 = iter.$_iterator();
      let ret2 = iter.$_iterator();
      expect(ret1).assertEqual(ret2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_1100
     * @tc.name mapIteratorPart02Test011
     * @tc.desc Verify Map<string, int> 2 keys for...of 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_1200
     * @tc.name mapIteratorPart02Test012
     * @tc.desc Verify Map<string, int> keys for...of key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['alpha', 1], ['beta', 2]]);
      let iter = map.keys();
      let keys: string[] = [];
      for (const key of iter) {
        keys.push(key);
      }
      expect(keys[0]).assertEqual('alpha');
      expect(keys[1]).assertEqual('beta');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_1300
     * @tc.name mapIteratorPart02Test013
     * @tc.desc Verify Map<string, int> keys for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['first', 1], ['second', 2], ['third', 3]]);
      let iter = map.keys();
      let order: string[] = [];
      for (const key of iter) {
        order.push(key);
      }
      expect(order[0]).assertEqual('first');
      expect(order[1]).assertEqual('second');
      expect(order[2]).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_1400
     * @tc.name mapIteratorPart02Test014
     * @tc.desc Verify Map<int, string> keys for...of int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[10, 'a'], [20, 'b']]);
      let iter = map.keys();
      let keys: int[] = [];
      for (const key of iter) {
        keys.push(key);
      }
      expect(keys[0]).assertEqual(10);
      expect(keys[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_1500
     * @tc.name mapIteratorPart02Test015
     * @tc.desc Verify Map<number, string> keys for...of number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>([[1.5, 'x'], [3.14, 'y']]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
        expect(typeof key).assertEqual('number');
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_1600
     * @tc.name mapIteratorPart02Test016
     * @tc.desc Verify Map<boolean, string> keys for...of boolean key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>([[true, 't'], [false, 'f']]);
      let iter = map.keys();
      let bkeys: boolean[] = [];
      for (const key of iter) {
        bkeys.push(key);
      }
      expect(bkeys[0]).assertTrue();
      expect(bkeys[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_1700
     * @tc.name mapIteratorPart02Test017
     * @tc.desc Verify Map<bigint, string> keys for...of long key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, string> = new Map<bigint, string>([[1n, 'one'], [2n, 'two']]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
        expect(key).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_1800
     * @tc.name mapIteratorPart02Test018
     * @tc.desc Verify Map<double, string> keys for...of double key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>([[1.1, 'a'], [2.2, 'b']]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
        expect(key).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_1900
     * @tc.name mapIteratorPart02Test019
     * @tc.desc Verify Map<byte, string> keys for...of byte key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>([[1 as byte, 'a'], [2 as byte, 'b']]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
        expect(key).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_2000
     * @tc.name mapIteratorPart02Test020
     * @tc.desc Verify Map<short, string> keys for...of short key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>([[100 as short, 'x'], [200 as short, 'y']]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
        expect(key).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_2100
     * @tc.name mapIteratorPart02Test021
     * @tc.desc Verify Map<float, string> keys for...of float key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>([[1.0 as float, 'u'], [2.0 as float, 'v']]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
        expect(key).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_2200
     * @tc.name mapIteratorPart02Test022
     * @tc.desc Verify Map<char, string> keys for...of char key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<char, string> = new Map<char, string>([[c'A', 'apple'], [c'B', 'banana']]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
        expect(key).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_2300
     * @tc.name mapIteratorPart02Test023
     * @tc.desc Verify Map keys for...of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['only', 1]]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
        expect(key).assertEqual('only');
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_2400
     * @tc.name mapIteratorPart02Test024
     * @tc.desc Verify Map keys for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let iter = map.keys();
      let entered = false;
      for (const key of iter) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_2500
     * @tc.name mapIteratorPart02Test025
     * @tc.desc Verify keys for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      let iter = map.keys();
      iter.next();
      let entered = false;
      for (const key of iter) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_2600
     * @tc.name mapIteratorPart02Test026
     * @tc.desc Verify keys for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter = map.keys();
      iter.next();
      let keys: string[] = [];
      for (const key of iter) {
        keys.push(key);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('b');
      expect(keys[1]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_2700
     * @tc.name mapIteratorPart02Test027
     * @tc.desc Verify keys for...of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3], ['d', 4]]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
        if (count === 2) {
          break;
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_2800
     * @tc.name mapIteratorPart02Test028
     * @tc.desc Verify Map<string, int> 5 keys for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3], ['d', 4], ['e', 5]]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_2900
     * @tc.name mapIteratorPart02Test029
     * @tc.desc Verify Map<string, int> 2 values for...of 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 100], ['b', 200]]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_3000
     * @tc.name mapIteratorPart02Test030
     * @tc.desc Verify Map<string, int> values for...of value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      let iter = map.values();
      let vals: int[] = [];
      for (const val of iter) {
        vals.push(val);
      }
      expect(vals[0]).assertEqual(10);
      expect(vals[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_3100
     * @tc.name mapIteratorPart02Test031
     * @tc.desc Verify Map<string, int> values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['p', 1], ['q', 2], ['r', 3]]);
      let iter = map.values();
      let order: int[] = [];
      for (const val of iter) {
        order.push(val);
      }
      expect(order[0]).assertEqual(1);
      expect(order[1]).assertEqual(2);
      expect(order[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_3200
     * @tc.name mapIteratorPart02Test032
     * @tc.desc Verify Map<string, number> values for...of number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>([['a', 1.5], ['b', 3.14]]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
        expect(val).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_3300
     * @tc.name mapIteratorPart02Test033
     * @tc.desc Verify Map<string, boolean> values for...of boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, boolean> = new Map<string, boolean>([['a', true], ['b', false]]);
      let iter = map.values();
      let bvals: boolean[] = [];
      for (const val of iter) {
        bvals.push(val);
      }
      expect(bvals[0]).assertTrue();
      expect(bvals[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_3400
     * @tc.name mapIteratorPart02Test034
     * @tc.desc Verify Map<string, string> values for...of string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>([['k1', 'v1'], ['k2', 'v2']]);
      let iter = map.values();
      let svals: string[] = [];
      for (const val of iter) {
        svals.push(val);
      }
      expect(svals[0]).assertEqual('v1');
      expect(svals[1]).assertEqual('v2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_3500
     * @tc.name mapIteratorPart02Test035
     * @tc.desc Verify Map<string, bigint> values for...of long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, bigint> = new Map<string, bigint>([['a', 100n], ['b', 200n]]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
        expect(val).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_3600
     * @tc.name mapIteratorPart02Test036
     * @tc.desc Verify Map<string, double> values for...of double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, double> = new Map<string, double>([['x', 1.1], ['y', 2.2]]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
        expect(val).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_3700
     * @tc.name mapIteratorPart02Test037
     * @tc.desc Verify Map<string, byte> values for...of byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, byte> = new Map<string, byte>([['a', 10 as byte], ['b', 20 as byte]]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
        expect(val).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_3800
     * @tc.name mapIteratorPart02Test038
     * @tc.desc Verify Map<string, short> values for...of short value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, short> = new Map<string, short>([['p', 100 as short], ['q', 200 as short]]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
        expect(val).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_3900
     * @tc.name mapIteratorPart02Test039
     * @tc.desc Verify Map<string, float> values for...of float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, float> = new Map<string, float>([['u', 1.0 as float], ['v', 2.0 as float]]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
        expect(val).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_4000
     * @tc.name mapIteratorPart02Test040
     * @tc.desc Verify Map<string, char> values for...of char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, char> = new Map<string, char>([['x', c'C'], ['y', c'D']]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
        expect(val).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_4100
     * @tc.name mapIteratorPart02Test041
     * @tc.desc Verify Map values for...of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['sole', 42]]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
        expect(val).assertEqual(42);
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_4200
     * @tc.name mapIteratorPart02Test042
     * @tc.desc Verify Map values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let iter = map.values();
      let entered = false;
      for (const val of iter) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_4300
     * @tc.name mapIteratorPart02Test043
     * @tc.desc Verify values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 999]]);
      let iter = map.values();
      iter.next();
      let entered = false;
      for (const val of iter) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_4400
     * @tc.name mapIteratorPart02Test044
     * @tc.desc Verify values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let iter = map.values();
      iter.next();
      let vals: int[] = [];
      for (const val of iter) {
        vals.push(val);
      }
      expect(vals.length).assertEqual(2);
      expect(vals[0]).assertEqual(2);
      expect(vals[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_4500
     * @tc.name mapIteratorPart02Test045
     * @tc.desc Verify values for...of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3], ['d', 4]]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
        if (count === 3) {
          break;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_4600
     * @tc.name mapIteratorPart02Test046
     * @tc.desc Verify Map<int, string> 5 values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[1, 'a'], [2, 'b'], [3, 'c'], [4, 'd'], [5, 'e']]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_4700
     * @tc.name mapIteratorPart02Test047
     * @tc.desc Verify Map<string, int> entries for...of size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter = map.entries();
      let count = 0;
      for (const entry of iter) {
        count++;
      }
      expect(count).assertEqual(map.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_4800
     * @tc.name mapIteratorPart02Test048
     * @tc.desc Verify Map<string, int> entries for...of entry null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['k1', 100], ['k2', 200], ['k3', 300]]);
      let iter = map.entries();
      for (const entry of iter) {
        expect(entry).not().assertNull();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_4900
     * @tc.name mapIteratorPart02Test049
     * @tc.desc Verify Map<string, int> entries for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['one', 1], ['two', 2], ['three', 3]]);
      let iter = map.entries();
      let count = 0;
      let entries: Object[] = [];
      for (const entry of iter) {
        entries.push(entry);
        count++;
      }
      expect(count).assertEqual(3);
      expect(entries[0]).not().assertNull();
      expect(entries[1]).not().assertNull();
      expect(entries[2]).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_5000
     * @tc.name mapIteratorPart02Test050
     * @tc.desc Verify Map<int, string> entries for...of entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[10, 'x'], [20, 'y'], [30, 'z']]);
      let iter = map.entries();
      let count = 0;
      for (const entry of iter) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_5100
     * @tc.name mapIteratorPart02Test051
     * @tc.desc Verify Map<number, boolean> entries for...of entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, boolean> = new Map<number, boolean>([[1.1, true], [2.2, false]]);
      let iter = map.entries();
      let count = 0;
      for (const entry of iter) {
        count++;
        expect(entry).not().assertNull();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_5200
     * @tc.name mapIteratorPart02Test052
     * @tc.desc Verify Map entries for...of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['single', 99]]);
      let iter = map.entries();
      let count = 0;
      for (const entry of iter) {
        count++;
        expect(entry).not().assertNull();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_5300
     * @tc.name mapIteratorPart02Test053
     * @tc.desc Verify Map entries for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let iter = map.entries();
      let entered = false;
      for (const entry of iter) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_5400
     * @tc.name mapIteratorPart02Test054
     * @tc.desc Verify entries for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let iter = map.entries();
      iter.next();
      iter.next();
      let entered = false;
      for (const entry of iter) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_5500
     * @tc.name mapIteratorPart02Test055
     * @tc.desc Verify entries for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3], ['d', 4]]);
      let iter = map.entries();
      iter.next();
      iter.next();
      let count = 0;
      for (const entry of iter) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_5600
     * @tc.name mapIteratorPart02Test056
     * @tc.desc Verify entries for...of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3], ['d', 4]]);
      let iter = map.entries();
      let count = 0;
      for (const entry of iter) {
        count++;
        if (count === 2) {
          break;
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_5700
     * @tc.name mapIteratorPart02Test057
     * @tc.desc Verify keys $_iterator() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let sizeBefore = map.size;
      let iter = map.keys();
      let ret = iter.$_iterator();
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_5800
     * @tc.name mapIteratorPart02Test058
     * @tc.desc Verify values $_iterator() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      let sizeBefore = map.size;
      let iter = map.values();
      let ret = iter.$_iterator();
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_5900
     * @tc.name mapIteratorPart02Test059
     * @tc.desc Verify entries $_iterator() Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['p', 100], ['q', 200]]);
      let sizeBefore = map.size;
      let iter = map.entries();
      let ret = iter.$_iterator();
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_6000
     * @tc.name mapIteratorPart02Test060
     * @tc.desc Verify keys for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      let sizeBefore = map.size;
      let iter = map.keys();
      for (const key of iter) {
      }
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_6100
     * @tc.name mapIteratorPart02Test061
     * @tc.desc Verify values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['m', 5], ['n', 6]]);
      let sizeBefore = map.size;
      let iter = map.values();
      for (const val of iter) {
      }
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_6200
     * @tc.name mapIteratorPart02Test062
     * @tc.desc Verify entries for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['k1', 1], ['k2', 2], ['k3', 3], ['k4', 4]]);
      let sizeBefore = map.size;
      let iter = map.entries();
      for (const entry of iter) {
      }
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_6300
     * @tc.name mapIteratorPart02Test063
     * @tc.desc Verify keys for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      let sizeBefore = map.size;
      let iter = map.keys();
      for (const key of iter) {
      }
      let entered = false;
      for (const key of iter) {
        entered = true;
      }
      expect(entered).assertFalse();
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_6400
     * @tc.name mapIteratorPart02Test064
     * @tc.desc Verify values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['u', 1], ['v', 2]]);
      let sizeBefore = map.size;
      let iter = map.values();
      for (const val of iter) {
      }
      let entered = false;
      for (const val of iter) {
        entered = true;
      }
      expect(entered).assertFalse();
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_6500
     * @tc.name mapIteratorPart02Test065
     * @tc.desc Verify entries for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['e1', 1], ['e2', 2]]);
      let sizeBefore = map.size;
      let iter = map.entries();
      for (const entry of iter) {
      }
      let entered = false;
      for (const entry of iter) {
        entered = true;
      }
      expect(entered).assertFalse();
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_6600
     * @tc.name mapIteratorPart02Test066
     * @tc.desc Verify Map (-2147483647 - 1) key keys for...of key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[-2147483648, 'min'], [0, 'zero']]);
      let iter = map.keys();
      let keys: int[] = [];
      for (const key of iter) {
        keys.push(key);
      }
      expect(keys[0]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_6700
     * @tc.name mapIteratorPart02Test067
     * @tc.desc Verify Map 2147483647 key keys for...of key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[2147483647, 'max'], [1, 'one']]);
      let iter = map.keys();
      let keys: int[] = [];
      for (const key of iter) {
        keys.push(key);
      }
      expect(keys[0]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_6800
     * @tc.name mapIteratorPart02Test068
     * @tc.desc Verify Map key keys for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['', 0], ['b', 2]]);
      let iter = map.keys();
      let keys: string[] = [];
      for (const key of iter) {
        keys.push(key);
      }
      expect(keys[0]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_6900
     * @tc.name mapIteratorPart02Test069
     * @tc.desc Verify Map emoji key keys for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['😀', 1], ['normal', 2]]);
      let iter = map.keys();
      let keys: string[] = [];
      for (const key of iter) {
        keys.push(key);
      }
      expect(keys[0]).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_7000
     * @tc.name mapIteratorPart02Test070
     * @tc.desc Verify Map boolean true key for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>([[true, 'yes']]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
        expect(key).assertTrue();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_7100
     * @tc.name mapIteratorPart02Test071
     * @tc.desc Verify Map boolean false key for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>([[false, 'no']]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
        expect(key).assertFalse();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_7200
     * @tc.name mapIteratorPart02Test072
     * @tc.desc Verify Map int 0 values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['zero', 0], ['one', 1]]);
      let iter = map.values();
      let vals: int[] = [];
      for (const val of iter) {
        vals.push(val);
      }
      expect(vals[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_7300
     * @tc.name mapIteratorPart02Test073
     * @tc.desc Verify Map int values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['neg', -1], ['pos', 1]]);
      let iter = map.values();
      let vals: int[] = [];
      for (const val of iter) {
        vals.push(val);
      }
      expect(vals[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_7400
     * @tc.name mapIteratorPart02Test074
     * @tc.desc Verify Map 2147483647 values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['max', 2147483647]]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
        expect(val).assertEqual(2147483647);
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_7500
     * @tc.name mapIteratorPart02Test075
     * @tc.desc Verify Map number Infinity values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>([['inf', Number.POSITIVE_INFINITY]]);
      let iter = map.values();
      let count = 0;
      for (const val of iter) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_7600
     * @tc.name mapIteratorPart02Test076
     * @tc.desc Verify Map long.MAX key keys for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>([[9223372036854775807, 'max']]);
      let iter = map.keys();
      let count = 0;
      for (const key of iter) {
        count++;
        expect(key).not().assertNull();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_7700
     * @tc.name mapIteratorPart02Test077
     * @tc.desc Verify duplicate construction keys keys for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['a', 2]]);
      let iter = map.keys();
      let count = 0;
      let keys: string[] = [];
      for (const key of iter) {
        keys.push(key);
        count++;
      }
      expect(count).assertEqual(1);
      expect(keys[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART02_TEST_7800
     * @tc.name mapIteratorPart02Test078
     * @tc.desc Verify duplicate construction values for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['x', 100], ['x', 200]]);
      let iter = map.values();
      let vals: int[] = [];
      for (const val of iter) {
        vals.push(val);
      }
      expect(vals[0]).assertEqual(200);
    });

    });
}
