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

export default function mapKeysPart01TestTest(): void {
  describe('MapKeysPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_0100
     * @tc.name mapKeysPart01Test001
     * @tc.desc Verify keys() Map null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      const iter = map.keys();
      expect(map.size).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_0200
     * @tc.name mapKeysPart01Test002
     * @tc.desc Verify keys() Map null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      const iter = map.keys();
      expect(map.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_0300
     * @tc.name mapKeysPart01Test003
     * @tc.desc Verify keys() Map null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const iter = map.keys();
      expect(map.size).assertEqual(3);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_0400
     * @tc.name mapKeysPart01Test004
     * @tc.desc Verify keys() K=string Map object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['x', 100]]);
      const iter = map.keys();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_0500
     * @tc.name mapKeysPart01Test005
     * @tc.desc Verify Map(size=0) keys() next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_0600
     * @tc.name mapKeysPart01Test006
     * @tc.desc Verify Map(size=0) keys() next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>();
      const iter = map.keys();
      const r = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_0700
     * @tc.name mapKeysPart01Test007
     * @tc.desc Verify Map(size=0) keys() next().done true( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, boolean>();
      const iter = map.keys();
      const r = iter.next();
      expect(typeof r.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_0800
     * @tc.name mapKeysPart01Test008
     * @tc.desc Verify Map keys() next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['only', 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_0900
     * @tc.name mapKeysPart01Test009
     * @tc.desc Verify Map keys() next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['only', 1]]);
      const iter = map.keys();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_1000
     * @tc.name mapKeysPart01Test010
     * @tc.desc Verify Map keys() next().value null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['only', 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_1100
     * @tc.name mapKeysPart01Test011
     * @tc.desc Verify Map(K=int) keys() next().value null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>([[42, 'answer']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_1200
     * @tc.name mapKeysPart01Test012
     * @tc.desc Verify Map keys() next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['x', 1], ['y', 2]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_1300
     * @tc.name mapKeysPart01Test013
     * @tc.desc Verify Map keys() next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['x', 1], ['y', 2]]);
      const iter = map.keys();
      iter.next();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_1400
     * @tc.name mapKeysPart01Test014
     * @tc.desc Verify Map keys() next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['x', 1], ['y', 2]]);
      const iter = map.keys();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_1500
     * @tc.name mapKeysPart01Test015
     * @tc.desc Verify Map keys() next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const iter = map.keys();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_1600
     * @tc.name mapKeysPart01Test016
     * @tc.desc Verify Map keys() next().done true( size)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const iter = map.keys();
      iter.next();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_1700
     * @tc.name mapKeysPart01Test017
     * @tc.desc Verify Map keys() 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      for (let i = 0; i < 20; i++) {
        map.set('k' + i, i);
      }
      const iter = map.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_1800
     * @tc.name mapKeysPart01Test018
     * @tc.desc Verify "" string key keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['', 0]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_1900
     * @tc.name mapKeysPart01Test019
     * @tc.desc Verify " " string key keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['​', 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_2000
     * @tc.name mapKeysPart01Test020
     * @tc.desc Verify Unicode emoji" " string key keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['😀', 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_2100
     * @tc.name mapKeysPart01Test021
     * @tc.desc Verify XSS "<script>alert(1)</script>" string key keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['<script>alert(1)</script>', 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_2200
     * @tc.name mapKeysPart01Test022
     * @tc.desc Verify (10000 ) string key keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey = 'x'.repeat(10000);
      const map = new Map<string, int>([[longKey, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_2300
     * @tc.name mapKeysPart01Test023
     * @tc.desc Verify string key keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['line1\nline2', 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_2400
     * @tc.name mapKeysPart01Test024
     * @tc.desc Verify string key keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['col1\tcol2', 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_2500
     * @tc.name mapKeysPart01Test025
     * @tc.desc Verify (space only) string key keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['   ', 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_2600
     * @tc.name mapKeysPart01Test026
     * @tc.desc Verify 2147483647(2147483647) int key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const MAX_VAL: int = 2147483647;
      const map = new Map<int, string>([[MAX_VAL, 'max']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_2700
     * @tc.name mapKeysPart01Test027
     * @tc.desc Verify (-2147483647 - 1)(-2147483648) int key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const MIN_VAL: int = -2147483648;
      const map = new Map<int, string>([[MIN_VAL, 'min']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_2800
     * @tc.name mapKeysPart01Test028
     * @tc.desc Verify 0 int key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>([[0, 'zero']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_2900
     * @tc.name mapKeysPart01Test029
     * @tc.desc Verify 1 int key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>([[1, 'one']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_3000
     * @tc.name mapKeysPart01Test030
     * @tc.desc Verify -1 int key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>([[-1, 'neg']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_3100
     * @tc.name mapKeysPart01Test031
     * @tc.desc Verify 2147483647 (-2147483647 - 1) key keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const MAX_VAL: int = 2147483647;
      const MIN_VAL: int = -2147483648;
      const map = new Map<int, string>([[MAX_VAL, 'max'], [MIN_VAL, 'min']]);
      const iter = map.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_3200
     * @tc.name mapKeysPart01Test032
     * @tc.desc Verify NaN number key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, int>([[Number.NaN, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_3300
     * @tc.name mapKeysPart01Test033
     * @tc.desc Verify Number.POSITIVE_INFINITY number key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, int>([[Number.POSITIVE_INFINITY, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_3400
     * @tc.name mapKeysPart01Test034
     * @tc.desc Verify Number.NEGATIVE_INFINITY number key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, int>([[Number.NEGATIVE_INFINITY, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_3500
     * @tc.name mapKeysPart01Test035
     * @tc.desc Verify 0.0 number key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, int>([[0.0, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_3600
     * @tc.name mapKeysPart01Test036
     * @tc.desc Verify Number.EPSILON number key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, int>([[Number.EPSILON, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_3700
     * @tc.name mapKeysPart01Test037
     * @tc.desc Verify number key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, int>([[Number.MAX_VALUE, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_3800
     * @tc.name mapKeysPart01Test038
     * @tc.desc Verify long.MAX long key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<long, string>([[9223372036854775807, 'max']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_3900
     * @tc.name mapKeysPart01Test039
     * @tc.desc Verify long.MIN long key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<long, string>([[(-9223372036854775807 - 1), 'min']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_4000
     * @tc.name mapKeysPart01Test040
     * @tc.desc Verify 0n long key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<long, string>([[Int.toLong(0), 'zero']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_4100
     * @tc.name mapKeysPart01Test041
     * @tc.desc Verify true boolean key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<boolean, string>([[true, 'yes']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_4200
     * @tc.name mapKeysPart01Test042
     * @tc.desc Verify false boolean key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<boolean, string>([[false, 'no']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_4300
     * @tc.name mapKeysPart01Test043
     * @tc.desc Verify true false boolean key keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      const iter = map.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_4400
     * @tc.name mapKeysPart01Test044
     * @tc.desc Verify double NaN key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, int>([[Number.NaN, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_4500
     * @tc.name mapKeysPart01Test045
     * @tc.desc Verify double Infinity key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, int>([[Number.POSITIVE_INFINITY, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_4600
     * @tc.name mapKeysPart01Test046
     * @tc.desc Verify double -Infinity key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, int>([[-Number.POSITIVE_INFINITY, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_4700
     * @tc.name mapKeysPart01Test047
     * @tc.desc Verify double 0.0 key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, int>([[0.0, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_4800
     * @tc.name mapKeysPart01Test048
     * @tc.desc Verify byte.MAX(127) byte key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<byte, string>([[127 as byte, 'max']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_4900
     * @tc.name mapKeysPart01Test049
     * @tc.desc Verify byte.MIN(-128) byte key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<byte, string>([[-128 as byte, 'min']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_5000
     * @tc.name mapKeysPart01Test050
     * @tc.desc Verify byte 0 byte key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<byte, string>([[0 as byte, 'zero']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_5100
     * @tc.name mapKeysPart01Test051
     * @tc.desc Verify short.MAX(32767) short key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<short, string>([[32767 as short, 'max']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_5200
     * @tc.name mapKeysPart01Test052
     * @tc.desc Verify short.MIN(-32768) short key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<short, string>([[-32768 as short, 'min']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_5300
     * @tc.name mapKeysPart01Test053
     * @tc.desc Verify float NaN key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, int>([[Float.NaN, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_5400
     * @tc.name mapKeysPart01Test054
     * @tc.desc Verify float Infinity key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, int>([[Float.POSITIVE_INFINITY, 1]]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_5500
     * @tc.name mapKeysPart01Test055
     * @tc.desc Verify Date key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2024, 5, 15);
      const map = new Map<Date, string>([[d, 'date']]);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_5600
     * @tc.name mapKeysPart01Test056
     * @tc.desc Verify Date key keys() key( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1 = new Date(2024, 5, 15);
      const d2 = new Date(2024, 5, 15);
      const map = new Map<Date, int>([[d1, 1], [d2, 2]]);
      const iter = map.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_5700
     * @tc.name mapKeysPart01Test057
     * @tc.desc Verify set key key done size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2]]);
      map.set('a', 100);
      const iter = map.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_5800
     * @tc.name mapKeysPart01Test058
     * @tc.desc Verify set key key ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2]]);
      map.set('a', 100);
      const iter = map.keys();
      const first = iter.next();
      expect(first.value!).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_5900
     * @tc.name mapKeysPart01Test059
     * @tc.desc Verify set key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      map.set('b', 2);
      const iter = map.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_6000
     * @tc.name mapKeysPart01Test060
     * @tc.desc Verify delete key count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.delete('b');
      const iter = map.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_6100
     * @tc.name mapKeysPart01Test061
     * @tc.desc Verify delete keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.delete('a');
      const iter = map.keys();
      const first = iter.next();
      expect(first.value!).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_6200
     * @tc.name mapKeysPart01Test062
     * @tc.desc Verify delete keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.delete('c');
      const iter = map.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_6300
     * @tc.name mapKeysPart01Test063
     * @tc.desc Verify delete keys() next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2]]);
      map.delete('a');
      map.delete('b');
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_6400
     * @tc.name mapKeysPart01Test064
     * @tc.desc Verify delete key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2]]);
      map.delete('nonexistent');
      const iter = map.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_6500
     * @tc.name mapKeysPart01Test065
     * @tc.desc Verify clear keys() next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.clear();
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_6600
     * @tc.name mapKeysPart01Test066
     * @tc.desc Verify delete set key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.delete('a');
      map.set('a', 100);
      const iter = map.keys();
      iter.next();
      iter.next();
      const third = iter.next();
      expect(third.value!).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_6700
     * @tc.name mapKeysPart01Test067
     * @tc.desc Verify entries keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: [string, int][] = [];
      const map = new Map<string, int>(entries);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_6800
     * @tc.name mapKeysPart01Test068
     * @tc.desc Verify key entries keys() key( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['a', 2], ['a', 3]]);
      const iter = map.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_6900
     * @tc.name mapKeysPart01Test069
     * @tc.desc Verify entries=null keys() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>(null);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_7000
     * @tc.name mapKeysPart01Test070
     * @tc.desc Verify bucketsCount=0 keys() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>(0);
      map.set('a', 1);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_7100
     * @tc.name mapKeysPart01Test071
     * @tc.desc Verify bucketsCount=1 keys() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>(1);
      map.set('a', 1);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_7200
     * @tc.name mapKeysPart01Test072
     * @tc.desc Verify bucketsCount= keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>(1000);
      map.set('a', 1);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_7300
     * @tc.name mapKeysPart01Test073
     * @tc.desc Verify bucketsCount=-1 keys() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>(-1);
      map.set('a', 1);
      const iter = map.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_7400
     * @tc.name mapKeysPart01Test074
     * @tc.desc Verify bucketsCount=2147483647(2147483647) keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const map = new Map<string, int>(2147483647);
        map.set('a', 1);
        const iter = map.keys();
        const r = iter.next();
        expect(r.done).assertFalse();
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ArrayIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_7500
     * @tc.name mapKeysPart01Test075
     * @tc.desc Verify Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter1 = map.keys();
      const iter2 = map.keys();
      iter1.next();
      expect(iter2.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_7600
     * @tc.name mapKeysPart01Test076
     * @tc.desc Verify Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter1 = map.keys();
      const iter2 = map.keys();
      iter1.next();
      iter1.next();
      const r = iter2.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_7700
     * @tc.name mapKeysPart01Test077
     * @tc.desc Verify set keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1).set('b', 2).set('c', 3);
      const iter = map.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_KEYS_PART01_7800
     * @tc.name mapKeysPart01Test078
     * @tc.desc Verify set keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapKeysPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1).set('a', 2).set('a', 3);
      const iter = map.keys();
      let count = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(1);
    });

  });
}
