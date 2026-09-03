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
interface ObjKey { id: int; }
interface Point {
  x: int;
  y: int;
}

export default function MapHasPart03Test(): void {
  describe('MapHasPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_0100
     * @tc.name mapHasPart03Test001
     * @tc.desc Verify that Map<int, string> has(key) returns false after set(100) is followed by clear()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(100, 'value');
      map.clear();
      expect(map.has(100)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_0200
     * @tc.name mapHasPart03Test002
     * @tc.desc Verify that has(key) returns false for each of the string keys "a", "b" and "c" after clear() is called on a populated Map<string, int>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      map.clear();
      expect(map.has('a')).assertFalse();
      expect(map.has('b')).assertFalse();
      expect(map.has('c')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_0300
     * @tc.name mapHasPart03Test003
     * @tc.desc Verify that has(key) returns false when clear() is called twice on an empty Map<string, int>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.clear();
      map.clear();
      expect(map.has('any')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_0400
     * @tc.name mapHasPart03Test004
     * @tc.desc Verify has returns false for a key deleted from a map with several keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      map.delete('b');
      expect(map.has('b')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_0500
     * @tc.name mapHasPart03Test005
     * @tc.desc Verify deleting a nonexistent key leaves has returning true for the stored key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.delete('nonexistent');
      expect(map.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_0600
     * @tc.name mapHasPart03Test006
     * @tc.desc Verify that has("a") returns true after the deleted key "a" is re-inserted via set("a", 2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.delete('a');
      map.set('a', 2);
      expect(map.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_0700
     * @tc.name mapHasPart03Test007
     * @tc.desc Verify that delete("last") on a Map<string, int> makes has("last") return false and size equal 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('last', 1);
      map.delete('last');
      expect(map.has('last')).assertFalse();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_0800
     * @tc.name mapHasPart03Test008
     * @tc.desc Verify that has(Number.NaN) and has(100.0) return true for the NaN and double keys stored via set() in a Map<double, string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(Number.NaN, 'nan');
      map.set(100.0, 'hundred');
      expect(map.has(Number.NaN)).assertTrue();
      expect(map.has(100.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_0900
     * @tc.name mapHasPart03Test009
     * @tc.desc Verify that setting NaN twice in a Map<double, string> keeps size equal 1 and has(NaN) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(Number.NaN, 'first');
      map.set(Number.NaN, 'second');
      expect(map.size).assertEqual(1);
      expect(map.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_1000
     * @tc.name mapHasPart03Test010
     * @tc.desc Verify that has(0.0) returns true when -0.0 is stored as the key in a Map<double, string> because SameValueZero treats -0 and +0 as equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(-0.0, 'negZero');
      expect(map.has(0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_1100
     * @tc.name mapHasPart03Test011
     * @tc.desc Verify that has(-0.0) returns true when 0.0 is stored as the key in a Map<double, string> because SameValueZero treats +0 and -0 as equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(0.0, 'posZero');
      expect(map.has(-0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_1200
     * @tc.name mapHasPart03Test012
     * @tc.desc Verify that storing both 0.0 and -0.0 in a Map<double, string> keeps size equal 1 and has(0.0) and has(-0.0) return true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(0.0, 'pos');
      map.set(-0.0, 'neg');
      expect(map.size).assertEqual(1);
      expect(map.has(0.0)).assertTrue();
      expect(map.has(-0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_1300
     * @tc.name mapHasPart03Test013
     * @tc.desc Verify that has(obj) returns true for the object key stored via set() in a Map<ObjKey, int> for a single-field interface ObjKey (type-matrix dimension, paired with test052's two-field Point)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ObjKey = { id: 1 } as ObjKey;
      const map: Map<ObjKey, int> = new Map<ObjKey, int>();
      map.set(obj, 100);
      expect(map.has(obj)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_1400
     * @tc.name mapHasPart03Test014
     * @tc.desc Verify that has(objB) returns false when objB is a distinct object instance from the stored objA even though both have the same id value (single-field ObjKey key, paired with test053's two-field Point)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objA: ObjKey = { id: 1 } as ObjKey;
      const objB: ObjKey = { id: 1 } as ObjKey;
      const map: Map<ObjKey, int> = new Map<ObjKey, int>();
      map.set(objA, 100);
      expect(map.has(objB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_1500
     * @tc.name mapHasPart03Test015
     * @tc.desc Verify that has(key) returns true for each of the two object keys stored in a Map<ObjKey, int>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objA: ObjKey = { id: 1 } as ObjKey;
      const objB: ObjKey = { id: 2 } as ObjKey;
      const map: Map<ObjKey, int> = new Map<ObjKey, int>();
      map.set(objA, 10);
      map.set(objB, 20);
      expect(map.has(objA)).assertTrue();
      expect(map.has(objB)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_1600
     * @tc.name mapHasPart03Test016
     * @tc.desc Verify has returns true for each stored Date key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1000, 0, 1);
      const d2: Date = new Date(2000, 0, 1);
      const map: Map<Date, string> = new Map<Date, string>();
      map.set(d1, 'early');
      map.set(d2, 'late');
      expect(map.has(d1)).assertTrue();
      expect(map.has(d2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_1700
     * @tc.name mapHasPart03Test017
     * @tc.desc Verify that has(d1) returns false after delete(d1) removes the Date key from a Map<Date, string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1000, 0, 1);
      const map: Map<Date, string> = new Map<Date, string>();
      map.set(d1, 'time');
      map.delete(d1);
      expect(map.has(d1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_1800
     * @tc.name mapHasPart03Test018
     * @tc.desc Verify has returns true for each stored array key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrA: int[] = [1, 2];
      const arrB: int[] = [3, 4];
      const map: Map<int[], string> = new Map<int[], string>();
      map.set(arrA, 'first');
      map.set(arrB, 'second');
      expect(map.has(arrA)).assertTrue();
      expect(map.has(arrB)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_1900
     * @tc.name mapHasPart03Test019
     * @tc.desc Verify that has(arr) returns false after delete(arr) removes the array key from a Map<int[], string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [1, 2, 3];
      const map: Map<int[], string> = new Map<int[], string>();
      map.set(arr, 'data');
      map.delete(arr);
      expect(map.has(arr)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_2000
     * @tc.name mapHasPart03Test020
     * @tc.desc Verify that has(reB) returns false for a RegExp instance with the same pattern "abc" as, but not identical to, the stored key reA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const reA: RegExp = new RegExp('abc', 'g');
      const reB: RegExp = new RegExp('abc', 'g');
      const map: Map<RegExp, string> = new Map<RegExp, string>();
      map.set(reA, 'pattern');
      expect(map.has(reB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_2100
     * @tc.name mapHasPart03Test021
     * @tc.desc Verify has returns true for the stored RegExp keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const reA: RegExp = new RegExp('abc', 'g');
      const reB: RegExp = new RegExp('xyz', 'i');
      const map: Map<RegExp, string> = new Map<RegExp, string>();
      map.set(reA, 'first');
      map.set(reB, 'second');
      expect(map.has(reA)).assertTrue();
      expect(map.has(reB)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_2200
     * @tc.name mapHasPart03Test022
     * @tc.desc Verify that has(re) returns false after delete(re) removes the RegExp key from a Map<RegExp, string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re: RegExp = new RegExp('abc', 'g');
      const map: Map<RegExp, string> = new Map<RegExp, string>();
      map.set(re, 'pattern');
      map.delete(re);
      expect(map.has(re)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_2300
     * @tc.name mapHasPart03Test023
     * @tc.desc Verify that constructing a Map<string, int> from entries [["a", 1], ["a", 2]] yields has("a") true, size equal 1 and get("a") equal 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['a', 2]]);
      expect(map.has('a')).assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.get('a')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_2400
     * @tc.name mapHasPart03Test024
     * @tc.desc Verify that has(key) returns true for a zero-width space key (U+200B) stored via set() in a Map<string, int>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('​', 1);
      expect(map.has('​')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_2500
     * @tc.name mapHasPart03Test025
     * @tc.desc Verify that has(key) returns true for the int.MAX (2147483647) and int.MIN (-2147483647 - 1) keys stored via set() in a Map<int, string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(2147483647, 'max');
      map.set(-2147483647 - 1, 'min');
      expect(map.has(2147483647)).assertTrue();
      expect(map.has(-2147483647 - 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_2600
     * @tc.name mapHasPart03Test026
     * @tc.desc Verify has returns true for the stored Infinity and -Infinity keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(Number.POSITIVE_INFINITY, 'pos');
      map.set(Number.NEGATIVE_INFINITY, 'neg');
      expect(map.has(Number.POSITIVE_INFINITY)).assertTrue();
      expect(map.has(Number.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_2700
     * @tc.name mapHasPart03Test027
     * @tc.desc Verify that has(key) returns true for both boolean keys true and false after set(true, 1) and set(false, 0) in a Map<boolean, int>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>();
      map.set(true, 1);
      map.set(false, 0);
      expect(map.has(true)).assertTrue();
      expect(map.has(false)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_2800
     * @tc.name mapHasPart03Test028
     * @tc.desc Verify that has("a") returns false after the key "a" is set, deleted, re-set and deleted again in a Map<string, int>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.delete('a');
      map.set('a', 2);
      map.delete('a');
      expect(map.has('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_2900
     * @tc.name mapHasPart03Test029
     * @tc.desc Verify that after set("old"), clear() and set("new"), has("new") returns true while has("old") returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('old', 1);
      map.clear();
      map.set('new', 2);
      expect(map.has('new')).assertTrue();
      expect(map.has('old')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_3000
     * @tc.name mapHasPart03Test030
     * @tc.desc Verify that setting the same key "a" three times in a Map<string, int> leaves has("a") true, size equal 1 and get("a") equal 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('a', 2);
      map.set('a', 3);
      expect(map.has('a')).assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.get('a')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_3100
     * @tc.name mapHasPart03Test031
     * @tc.desc Verify that has(9999) returns false for an absent key in a Map<int, int> populated with 1000 entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      for (let i: int = 0; i < 1000; i++) {
        map.set(i, i);
      }
      expect(map.has(9999)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_3200
     * @tc.name mapHasPart03Test032
     * @tc.desc Verify has returns true for the first key 0 of a 1000-entry map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(0, 0);
      for (let i: int = 1; i < 1000; i++) {
        map.set(i, i);
      }
      expect(map.has(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_3300
     * @tc.name mapHasPart03Test033
     * @tc.desc Verify that a Map<string, int> constructed from another Map keeps its keys, with has("a") and has("b") returning true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      src.set('a', 1);
      src.set('b', 2);
      const map: Map<string, int> = new Map<string, int>(src);
      expect(map.has('a')).assertTrue();
      expect(map.has('b')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_3400
     * @tc.name mapHasPart03Test034
     * @tc.desc Verify that a Map<string, int> constructed from src.entries() keeps its keys, with has("x") and has("y") returning true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      src.set('x', 10);
      src.set('y', 20);
      const map: Map<string, int> = new Map<string, int>(src.entries());
      expect(map.has('x')).assertTrue();
      expect(map.has('y')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_3500
     * @tc.name mapHasPart03Test035
     * @tc.desc Verify that a Map<string, int> constructed from an Array<[string, int]> of [["p", 1], ["q", 2]] yields has("p") and has("q") returning true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: [string, int][] = [['p', 1], ['q', 2]];
      const map: Map<string, int> = new Map<string, int>(arr);
      expect(map.has('p')).assertTrue();
      expect(map.has('q')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_3600
     * @tc.name mapHasPart03Test036
     * @tc.desc Verify that has("any") returns false for an empty Map<string, int> created with bucketsCount 16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(16 as int);
      expect(map.has('any')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_3700
     * @tc.name mapHasPart03Test037
     * @tc.desc Verify that a Map<string, int> created with bucketsCount 0 still stores keys, with has("key") returning true after set("key", 1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(0 as int);
      map.set('key', 1);
      expect(map.has('key')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_3800
     * @tc.name mapHasPart03Test038
     * @tc.desc Verify for a Map with K=string, has("a") returns false initially and returns true after set("a", 1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      expect(map.has('a')).assertFalse();
      map.set('a', 1);
      expect(map.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_3900
     * @tc.name mapHasPart03Test039
     * @tc.desc Verify for a Map with K=string, has("a") returns true after set("a", 1) and returns false after clear()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      expect(map.has('a')).assertTrue();
      map.clear();
      expect(map.has('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_4000
     * @tc.name mapHasPart03Test040
     * @tc.desc Verify for a Map with K=string, deleting key "a" then deleting it again makes has("a") return false each time
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.delete('a');
      expect(map.has('a')).assertFalse();
      map.delete('a');
      expect(map.has('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_4100
     * @tc.name mapHasPart03Test041
     * @tc.desc Verify adding more keys keeps the existing key present and the map size grows by two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      const beforeSize: int = map.size;
      expect(map.has('a')).assertTrue();
      map.set('b', 2);
      map.set('c', 3);
      expect(map.has('a')).assertTrue();
      expect(map.size).assertEqual(beforeSize + 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_4200
     * @tc.name mapHasPart03Test042
     * @tc.desc Verify for a Map with K=int, has(0) returns false initially and returns true after set(0, "v")
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      expect(map.has(0)).assertFalse();
      map.set(0, 'v');
      expect(map.has(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_4300
     * @tc.name mapHasPart03Test043
     * @tc.desc Verify for a Map with K=int, has(0) returns true after set(0, "v") and returns false after delete(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0, 'v');
      expect(map.has(0)).assertTrue();
      map.delete(0);
      expect(map.has(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_4400
     * @tc.name mapHasPart03Test044
     * @tc.desc Verify for a Map with K=int, re-setting key 1 after deleting it makes has(1) return true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'first');
      map.delete(1);
      map.set(1, 'second');
      expect(map.has(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_4500
     * @tc.name mapHasPart03Test045
     * @tc.desc Verify has() returns true for an existing key and size stays unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      const before: int = map.size;
      expect(map.has('a')).assertTrue();
      expect(map.size).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_4600
     * @tc.name mapHasPart03Test046
     * @tc.desc Verify calling map.set("a", 1).has("a") on a Map returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      expect(map.set('a', 1).has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_4700
     * @tc.name mapHasPart03Test047
     * @tc.desc Verify chained set adds keys and has() returns true for each of them
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1).set('b', 2).set('c', 3);
      expect(map.has('a')).assertTrue();
      expect(map.has('b')).assertTrue();
      expect(map.has('c')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_4800
     * @tc.name mapHasPart03Test048
     * @tc.desc Verify deleting a key makes has() return false for it and true for the remaining key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1).set('b', 2);
      map.delete('a');
      expect(map.has('a')).assertFalse();
      expect(map.has('b')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_4900
     * @tc.name mapHasPart03Test049
     * @tc.desc Verify clear() makes has() return false for all previously inserted keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      map.clear();
      expect(map.has('a')).assertFalse();
      expect(map.has('b')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_5000
     * @tc.name mapHasPart03Test050
     * @tc.desc Verify setting int keys 0, 1 and -1 makes has() return true for each of them on a Map with K=int
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0, 'zero');
      map.set(1, 'one');
      map.set(-1, 'neg');
      expect(map.has(0)).assertTrue();
      expect(map.has(1)).assertTrue();
      expect(map.has(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_5100
     * @tc.name mapHasPart03Test051
     * @tc.desc Verify forEach is not invoked on an empty Map and has("a") returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let called: int = 0;
      map.forEach((value: int, key: string): void => {
        called++;
      });
      expect(called).assertEqual(0);
      expect(map.has('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_5200
     * @tc.name mapHasPart03Test052
     * @tc.desc Verify for a Map with K=object, a Point interface key set via set() is reported present by has() for a two-field interface Point (type-matrix dimension, mirroring test013's single-field ObjKey)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pt: Point = { x: 1, y: 2 } as Point;
      const map: Map<Point, string> = new Map<Point, string>();
      map.set(pt, 'origin');
      expect(map.has(pt)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_5300
     * @tc.name mapHasPart03Test053
     * @tc.desc Verify for a Map with K=object, has() returns false for a distinct object key B when only key A was set (two-field Point key, mirroring test014's single-field ObjKey)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ptA: Point = { x: 1, y: 2 } as Point;
      const ptB: Point = { x: 1, y: 2 } as Point;
      const map: Map<Point, string> = new Map<Point, string>();
      map.set(ptA, 'origin');
      expect(map.has(ptB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_5400
     * @tc.name mapHasPart03Test054
     * @tc.desc Verify for a Map with K=boolean, has(true) and has(false) both return true after both keys are set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(true, 'yes');
      map.set(false, 'no');
      expect(map.has(true)).assertTrue();
      expect(map.has(false)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_5500
     * @tc.name mapHasPart03Test055
     * @tc.desc Verify an empty Map of size 0 reports has() as false for the key "a" and the empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      expect(map.has('a')).assertFalse();
      expect(map.has('')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_5600
     * @tc.name mapHasPart03Test056
     * @tc.desc Verify a Map with 100 entries reports has() as true for the first, middle and last inserted keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      for (let i: int = 0; i < 100; i++) {
        map.set(i, i * 2);
      }
      expect(map.has(0)).assertTrue();
      expect(map.has(50)).assertTrue();
      expect(map.has(99)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_5700
     * @tc.name mapHasPart03Test057
     * @tc.desc Verify after set("a", 1), set("b", 2), delete("a") and set("a", 3), has("a") and has("b") both return true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.delete('a');
      map.set('a', 3);
      expect(map.has('a')).assertTrue();
      expect(map.has('b')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_5800
     * @tc.name mapHasPart03Test058
     * @tc.desc Verify after repeated clear() and set("a", ...) cycles, a final clear() makes has("a") return false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.clear();
      map.set('a', 1);
      map.clear();
      map.set('a', 2);
      map.clear();
      expect(map.has('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_5900
     * @tc.name mapHasPart03Test059
     * @tc.desc Verify every key yielded by keys() is present in the map, so has() returns true for each of them
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const keyIter: IterableIterator<string> = map.keys();
      let iterated: int = 0;
      for (const k of keyIter) {
        expect(map.has(k)).assertTrue();
        iterated++;
      }
      expect(iterated).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_6000
     * @tc.name mapHasPart03Test060
     * @tc.desc Verify for a Map with K=string, has("a") remains true after set("a", 1) is followed by set("a", 2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      expect(map.has('a')).assertTrue();
      map.set('a', 2);
      expect(map.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_6100
     * @tc.name mapHasPart03Test061
     * @tc.desc Verify for a Map with K=string, the existing key "a" keeps has("a") returning true after set("b", 2) is called
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      expect(map.has('a')).assertTrue();
      map.set('b', 2);
      expect(map.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_6200
     * @tc.name mapHasPart03Test062
     * @tc.desc Verify for a Map with K=int, has(0) returns true after set(0, "v") and returns false after clear()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0, 'v');
      expect(map.has(0)).assertTrue();
      map.clear();
      expect(map.has(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_6300
     * @tc.name mapHasPart03Test063
     * @tc.desc Verify for a Map with K=int, has(0) remains true after set(0, "v") is followed by set(0, "w")
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0, 'v');
      expect(map.has(0)).assertTrue();
      map.set(0, 'w');
      expect(map.has(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_HAS_PART03_TEST_6400
     * @tc.name mapHasPart03Test064
     * @tc.desc Verify for a Map with K=int, the existing key 1 keeps has(1) returning true after set(2, "two") is called
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapHasPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'one');
      expect(map.has(1)).assertTrue();
      map.set(2, 'two');
      expect(map.has(1)).assertTrue();
    });

  });
}
