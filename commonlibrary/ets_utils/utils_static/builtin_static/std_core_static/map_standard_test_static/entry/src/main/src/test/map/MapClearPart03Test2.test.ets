'use static';


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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from "../Util.test";

export default function MapClearPart03Test(): void {
  describe('MapClearPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_0100
     * @tc.name mapClearPart03Test001
     * @tc.desc Verify clearing a Map<string, int> sets size to 0 and get() returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('x', 10);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('x')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_0200
     * @tc.name mapClearPart03Test002
     * @tc.desc Verify clearing a Map<string, double> with a double value sets size to 0 and get() returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      m.set('k', 3.14);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('k')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_0300
     * @tc.name mapClearPart03Test003
     * @tc.desc Verify clearing a Map<int, int> with 1000 entries sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      for (let i: int = 0; i < 1000; i++) {
        m.set(i, i);
      }
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(0)).assertUndefined();
      expect(m.has(999)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_0400
     * @tc.name mapClearPart03Test004
     * @tc.desc Verify has() returns false for an absent key after clear() on an empty Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.clear();
      expect(m.has('anyKey')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_0500
     * @tc.name mapClearPart03Test005
     * @tc.desc Verify get() returns undefined for an absent key after clear() on an empty Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.clear();
      expect(m.get('anyKey')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_0600
     * @tc.name mapClearPart03Test006
     * @tc.desc Verify calling clear() twice on an empty Map keeps size at 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.clear();
      m.clear();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_0700
     * @tc.name mapClearPart03Test007
     * @tc.desc Verify keys() iterator is done immediately after clear() on an empty Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.clear();
      const iter: IterableIterator<string> = m.keys();
      const r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_0800
     * @tc.name mapClearPart03Test008
     * @tc.desc Verify has() returns false for a previously stored key after clear()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('only', 42);
      m.clear();
      expect(m.has('only')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_0900
     * @tc.name mapClearPart03Test009
     * @tc.desc Verify keys() iterator is done after clearing a populated Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('only', 42);
      m.clear();
      const iter: IterableIterator<string> = m.keys();
      const r: IteratorResult<string> = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_1000
     * @tc.name mapClearPart03Test010
     * @tc.desc Verify values() iterator is done after clearing a populated Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('only', 42);
      m.clear();
      const iter: IterableIterator<int> = m.values();
      const r: IteratorResult<int> = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_1100
     * @tc.name mapClearPart03Test011
     * @tc.desc Verify entries() iterator is done after clearing a populated Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('only', 42);
      m.clear();
      const iter: IterableIterator<[string, int]> = m.entries();
      const r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_1200
     * @tc.name mapClearPart03Test012
     * @tc.desc Verify clear() removes a key stored three times, changing size from 1 to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('key', 1);
      m.set('key', 2);
      m.set('key', 3);
      expect(m.size).assertEqual(1);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('key')).assertUndefined();
      expect(m.has('key')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_1300
     * @tc.name mapClearPart03Test013
     * @tc.desc Verify clearing a Map<boolean, int> removes both true and false keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(true, 1);
      m.set(false, 0);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has(true)).assertFalse();
      expect(m.has(false)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_1400
     * @tc.name mapClearPart03Test014
     * @tc.desc Verify clearing a Map with null values sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | null> = new Map<string, string | null>();
      m.set('a', null);
      m.set('b', null);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('a')).assertUndefined();
      expect(m.has('b')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_1500
     * @tc.name mapClearPart03Test015
     * @tc.desc Verify get(null) returns undefined after clearing a Map with a null key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | null, int> = new Map<string | null, int>();
      m.set(null, 99);
      m.clear();
      expect(m.get(null)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_1600
     * @tc.name mapClearPart03Test016
     * @tc.desc Verify clearing a Map with null and int values sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int | null> = new Map<string, int | null>();
      m.set('a', null);
      m.set('b', 2);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('a')).assertUndefined();
      expect(m.get('b')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_1700
     * @tc.name mapClearPart03Test017
     * @tc.desc Verify get(undefined) returns undefined after clearing a Map with an undefined key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | undefined, int> = new Map<string | undefined, int>();
      m.set(undefined, 77);
      m.clear();
      expect(m.get(undefined)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_1800
     * @tc.name mapClearPart03Test018
     * @tc.desc Verify clearing a Map with undefined and int values sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int | undefined> = new Map<string, int | undefined>();
      m.set('a', undefined);
      m.set('b', 2);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('a')).assertUndefined();
      expect(m.has('b')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_1900
     * @tc.name mapClearPart03Test019
     * @tc.desc Verify clearing a Map where +0.0 and -0.0 are stored as the same key (SameValueZero) sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(0.0, 1);
      m.set(-0.0, 2);
      m.set(1, 3);
      expect(m.size).assertEqual(2);
      expect(m.get(0.0)).assertEqual(2);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(0.0)).assertUndefined();
      expect(m.has(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_2000
     * @tc.name mapClearPart03Test020
     * @tc.desc Verify clearing a Map with Number.EPSILON and zero keys sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(Number.EPSILON, 1);
      m.set(0, 2);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(Number.EPSILON)).assertUndefined();
      expect(m.has(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_2100
     * @tc.name mapClearPart03Test021
     * @tc.desc Verify clearing a Map whose value is Number.MAX_VALUE sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, double> = new Map<string, double>();
      m.set('a', Number.MAX_VALUE);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('a')).assertUndefined();
      expect(m.has('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_2200
     * @tc.name mapClearPart03Test022
     * @tc.desc Verify forEach() invokes no callback after clearing a Map with two entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.clear();
      let callCount: int = 0;
      m.forEach((): void => {
        callCount++;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_2300
     * @tc.name mapClearPart03Test023
     * @tc.desc Verify forEach() invokes no callback after clearing a Map with 500 entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      for (let i: int = 0; i < 500; i++) {
        m.set(i, i * 2);
      }
      m.clear();
      let fired: int = 0;
      m.forEach((): void => {
        fired++;
      });
      expect(fired).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_2400
     * @tc.name mapClearPart03Test024
     * @tc.desc Verify for-of over keys() performs zero iterations after clear()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.clear();
      let count: int = 0;
      for (const k of m.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_2500
     * @tc.name mapClearPart03Test025
     * @tc.desc Verify for-of over entries() performs zero iterations after clear()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.clear();
      let count: int = 0;
      for (const e of m.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_2600
     * @tc.name mapClearPart03Test026
     * @tc.desc Verify adding three new keys after clear() yields size 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.clear();
      m.set('x', 10);
      m.set('y', 20);
      m.set('z', 30);
      expect(m.size).assertEqual(3);
      expect(m.get('x')).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_2700
     * @tc.name mapClearPart03Test027
     * @tc.desc Verify has() returns true for a key set after clear()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('before', 1);
      m.clear();
      m.set('after', 2);
      expect(m.has('after')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_2800
     * @tc.name mapClearPart03Test028
     * @tc.desc Verify delete() returns true for a key set after clear()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('before', 1);
      m.clear();
      m.set('after', 2);
      expect(m.delete('after')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_2900
     * @tc.name mapClearPart03Test029
     * @tc.desc Verify a second clear() after re-adding entries sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.clear();
      m.set('b', 2);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('a')).assertUndefined();
      expect(m.get('b')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_3000
     * @tc.name mapClearPart03Test030
     * @tc.desc Verify chained set() calls after clear() store three entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('old', 1);
      m.clear();
      m.set('x', 1).set('y', 2).set('z', 3);
      expect(m.size).assertEqual(3);
      expect(m.get('z')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_3100
     * @tc.name mapClearPart03Test031
     * @tc.desc Verify clearing a Map with an int.MAX value sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 2147483647);
      m.set('b', 0);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('a')).assertUndefined();
      expect(m.has('b')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_3200
     * @tc.name mapClearPart03Test032
     * @tc.desc Verify clearing a Map with an int.MIN value sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', -2147483647 - 1);
      m.set('b', 0);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('a')).assertUndefined();
      expect(m.has('b')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_3300
     * @tc.name mapClearPart03Test033
     * @tc.desc Verify clearing a Map<byte, int> with byte.MAX and zero keys sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, int> = new Map<byte, int>();
      m.set(127 as byte, 1);
      m.set(0 as byte, 2);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(127 as byte)).assertUndefined();
      expect(m.has(0 as byte)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_3400
     * @tc.name mapClearPart03Test034
     * @tc.desc Verify clearing a Map<byte, int> with byte.MIN and zero keys sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, int> = new Map<byte, int>();
      m.set(-128 as byte, 1);
      m.set(0 as byte, 2);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(-128 as byte)).assertUndefined();
      expect(m.has(0 as byte)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_3500
     * @tc.name mapClearPart03Test035
     * @tc.desc Verify clearing a Map<short, int> with short.MAX, short.MIN and zero keys sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, int> = new Map<short, int>();
      m.set(32767 as short, 1);
      m.set(-32768 as short, 3);
      m.set(0 as short, 2);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(32767 as short)).assertUndefined();
      expect(m.get(-32768 as short)).assertUndefined();
      expect(m.has(0 as short)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_3600
     * @tc.name mapClearPart03Test036
     * @tc.desc Verify a key set to int.MAX after clear() returns int.MAX from get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('old', 1);
      m.clear();
      m.set('new', 2147483647);
      expect(m.get('new')).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_3700
     * @tc.name mapClearPart03Test037
     * @tc.desc Verify a key set to int.MIN after clear() returns int.MIN from get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('old', 1);
      m.clear();
      m.set('new', -2147483647 - 1);
      expect(m.get('new')).assertEqual(-2147483647 - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_3800
     * @tc.name mapClearPart03Test038
     * @tc.desc Verify clearing a Map<string, string> sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('k1', 'v1');
      m.set('k2', 'v2');
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('k1')).assertUndefined();
      expect(m.has('k2')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_3900
     * @tc.name mapClearPart03Test039
     * @tc.desc Verify clearing a Map<float, float> sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, float> = new Map<float, float>();
      m.set(1.5 as float, 2.5 as float);
      m.set(3.14 as float, 6.28 as float);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(1.5 as float)).assertUndefined();
      expect(m.has(3.14 as float)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_4000
     * @tc.name mapClearPart03Test040
     * @tc.desc Verify clearing a Map<double, double> sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, double> = new Map<double, double>();
      m.set(1.1, 2.2);
      m.set(3.3, 4.4);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(1.1)).assertUndefined();
      expect(m.has(3.3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_4100
     * @tc.name mapClearPart03Test041
     * @tc.desc Verify clearing a Map<bigint, int> with 100n and 200n keys sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<bigint, int> = new Map<bigint, int>();
      m.set(100n, 1);
      m.set(200n, 2);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(100n)).assertUndefined();
      expect(m.has(200n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_4200
     * @tc.name mapClearPart03Test042
     * @tc.desc Verify clearing a Map<short, int> sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, int> = new Map<short, int>();
      m.set(100 as short, 1);
      m.set(200 as short, 2);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(100 as short)).assertUndefined();
      expect(m.has(200 as short)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_4300
     * @tc.name mapClearPart03Test043
     * @tc.desc Verify clearing a Map<char, string> sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<char, string> = new Map<char, string>();
      m.set(c'A', 'Alpha');
      m.set(c'B', 'Beta');
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(c'A')).assertUndefined();
      expect(m.has(c'B')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_4400
     * @tc.name mapClearPart03Test044
     * @tc.desc Verify clearing a Map<Date, int> with a Date key sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<Date, int> = new Map<Date, int>();
      const d1: Date = new Date();
      m.set(d1, 100);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(d1)).assertUndefined();
      expect(m.has(d1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_4500
     * @tc.name mapClearPart03Test045
     * @tc.desc Verify clearing a Map<RegExp, int> with a RegExp key sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<RegExp, int> = new Map<RegExp, int>();
      const r: RegExp = new RegExp('test', 'g');
      m.set(r, 1);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get(r)).assertUndefined();
      expect(m.has(r)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CLEAR_PART03_TEST_4600
     * @tc.name mapClearPart03Test046
     * @tc.desc Verify clearing a Map<string, Date> with a Date value sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapClearPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, Date> = new Map<string, Date>();
      const d: Date = new Date();
      m.set('today', d);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.get('today')).assertUndefined();
      expect(m.has('today')).assertFalse();
    });

  });
}
