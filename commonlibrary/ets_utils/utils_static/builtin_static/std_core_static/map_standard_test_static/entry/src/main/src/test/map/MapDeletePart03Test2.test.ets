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
class KeyClass {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}
class KeyClass2 {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}
interface ObjKey2 { id: int; name: string; }
interface ObjKey4 { k: int; v: string; }
const LONG_MAX: long = 9223372036854775807;
const LONG_MIN: long = -9223372036854775807 - 1;
const SHORT_MIN: short = -32768;
const FLOAT_NAN: float = Double.toFloat(Number.NaN);
const FLOAT_POS_INF: float = Double.toFloat(Number.POSITIVE_INFINITY);
const FLOAT_NEG_ZERO: float = -0.0 as float;

export default function MapDeletePart03Test(): void {
  describe('MapDeletePart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_0100
     * @tc.name mapDeletePart03Test001
     * @tc.desc Verify deleting an existing int key returns true and removes it from the map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int, string> = new Map<int, string>();
      m.set(42, 'value');
      let result: boolean = m.delete(42);
      expect(result).assertTrue();
      expect(m.has(42)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_0200
     * @tc.name mapDeletePart03Test002
     * @tc.desc Verify deleting a NaN double key that was never inserted returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<double, string> = new Map<double, string>();
      m.set(1.0, 'one');
      let result: boolean = m.delete(Number.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_0300
     * @tc.name mapDeletePart03Test003
     * @tc.desc Verify deleting a NaN double key that was inserted returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<double, string> = new Map<double, string>();
      m.set(Number.NaN, 'nan value');
      let result: boolean = m.delete(Number.NaN);
      expect(result).assertTrue();
      expect(m.has(Number.NaN)).assertFalse();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_0400
     * @tc.name mapDeletePart03Test004
     * @tc.desc Verify deleting the inserted -0.0 double key returns true and removes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<double, string> = new Map<double, string>();
      m.set(-0.0, 'negative zero');
      let result: boolean = m.delete(-0.0);
      expect(result).assertTrue();
      expect(m.has(-0.0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_0500
     * @tc.name mapDeletePart03Test005
     * @tc.desc Verify deleting a boolean key that is not present in the map returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<boolean, string> = new Map<boolean, string>();
      m.set(true, 'yes');
      let result: boolean = m.delete(false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_0600
     * @tc.name mapDeletePart03Test006
     * @tc.desc Verify deleting the same object key instance that was inserted returns true and removes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<ObjKey, string> = new Map<ObjKey, string>();
      let o: ObjKey = { id: 1 } as ObjKey;
      m.set(o, 'obj1');
      let result: boolean = m.delete(o);
      expect(result).assertTrue();
      expect(m.has(o)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_0700
     * @tc.name mapDeletePart03Test007
     * @tc.desc Verify deleting a distinct object key instance with equal content returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<ObjKey, string> = new Map<ObjKey, string>();
      let o1: ObjKey = { id: 1 } as ObjKey;
      m.set(o1, 'obj1');
      let o2: ObjKey = { id: 1 } as ObjKey;
      let result: boolean = m.delete(o2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_0800
     * @tc.name mapDeletePart03Test008
     * @tc.desc Verify deleting an inserted Date key from a Map<Date, int> returns true and empties the map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<Date, int> = new Map<Date, int>();
      let d: Date = new Date();
      m.set(d, 1);
      let result: boolean = m.delete(d);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_0900
     * @tc.name mapDeletePart03Test009
     * @tc.desc Verify deleting the true boolean key returns true and leaves the map with size one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<boolean, int> = new Map<boolean, int>();
      m.set(true, 1);
      m.set(false, 0);
      let result: boolean = m.delete(true);
      expect(result).assertTrue();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_1000
     * @tc.name mapDeletePart03Test010
     * @tc.desc Verify deleting a key removes it from the keys() iteration sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      m.delete('b');
      let keys: string[] = [];
      let iter: IterableIterator<string> = m.keys();
      let nextResult = iter.next();
      while (!nextResult.done) {
        keys.push(nextResult.value!);
        nextResult = iter.next();
      }
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('c');
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_1100
     * @tc.name mapDeletePart03Test011
     * @tc.desc Verify a key that is deleted, re-inserted, and deleted again returns true both times
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      let first: boolean = m.delete('a');
      m.set('a', 10);
      let second: boolean = m.delete('a');
      expect(first).assertTrue();
      expect(second).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_1200
     * @tc.name mapDeletePart03Test012
     * @tc.desc Verify deleting a non-existent key leaves existing entries and map size unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.delete('c');
      expect(m.get('a')).assertEqual(1);
      expect(m.get('b')).assertEqual(2);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_1300
     * @tc.name mapDeletePart03Test013
     * @tc.desc Verify deleting one key leaves the remaining key visible to has()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      let result: boolean = m.delete('a');
      expect(result).assertTrue();
      expect(m.has('a')).assertFalse();
      expect(m.has('b')).assertTrue();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_1400
     * @tc.name mapDeletePart03Test014
     * @tc.desc Verify deleting keys one by one decrements the map size to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      m.delete('a');
      expect(m.size).assertEqual(2);
      m.delete('b');
      expect(m.size).assertEqual(1);
      m.delete('c');
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_1500
     * @tc.name mapDeletePart03Test015
     * @tc.desc Verify deleting the int.MIN key keeps other keys present and makes has() return false for it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int, string> = new Map<int, string>();
      m.set(-2147483647 - 1, 'min');
      m.set(0, 'zero');
      m.delete(-2147483647 - 1);
      expect(m.has(0)).assertTrue();
      expect(m.has(-2147483647 - 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_1600
     * @tc.name mapDeletePart03Test016
     * @tc.desc Verify deleting the long.MAX key returns true and leaves the long.MIN key present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<long, string> = new Map<long, string>();
      let maxVal: long = 9223372036854775807;
      let minVal: long = -9223372036854775807 - 1;
      m.set(maxVal, 'max');
      m.set(minVal, 'min');
      let result: boolean = m.delete(maxVal);
      expect(result).assertTrue();
      expect(m.has(maxVal)).assertFalse();
      expect(m.has(minVal)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_1700
     * @tc.name mapDeletePart03Test017
     * @tc.desc Verify deleting the long.MIN key returns true and leaves the map empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<long, string> = new Map<long, string>();
      let minVal: long = -9223372036854775807 - 1;
      m.set(minVal, 'min');
      let result: boolean = m.delete(minVal);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_1800
     * @tc.name mapDeletePart03Test018
     * @tc.desc Verify deleting the negative infinity key leaves the positive infinity key present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<double, string> = new Map<double, string>();
      m.set(Number.POSITIVE_INFINITY, 'pos');
      m.set(Number.NEGATIVE_INFINITY, 'neg');
      m.delete(Number.NEGATIVE_INFINITY);
      expect(m.has(Number.POSITIVE_INFINITY)).assertTrue();
      expect(m.has(Number.NEGATIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_1900
     * @tc.name mapDeletePart03Test019
     * @tc.desc Verify deleting the -0.0 key also removes the 0.0 entry because -0.0 and 0.0 are the same key (SameValueZero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<double, string> = new Map<double, string>();
      m.set(-0.0, 'neg');
      m.set(0.0, 'pos');
      expect(m.size).assertEqual(1);
      expect(m.get(-0.0)).assertEqual('pos');
      m.delete(-0.0);
      expect(m.has(0.0)).assertFalse();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_2000
     * @tc.name mapDeletePart03Test020
     * @tc.desc Verify deleting the int.MAX key leaves the int.MIN key present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int, string> = new Map<int, string>();
      m.set(2147483647, 'max');
      m.set(-2147483647 - 1, 'min');
      let result: boolean = m.delete(2147483647);
      expect(result).assertTrue();
      expect(m.has(2147483647)).assertFalse();
      expect(m.has(-2147483647 - 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_2100
     * @tc.name mapDeletePart03Test021
     * @tc.desc Verify deleting an inserted long key from a Map<long, int> returns true and removes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<long, int> = new Map<long, int>();
      let k: long = 123456789012345;
      m.set(k, 1);
      let result: boolean = m.delete(k);
      expect(result).assertTrue();
      expect(m.has(k)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_2200
     * @tc.name mapDeletePart03Test022
     * @tc.desc Verify deleting an inserted float key 1.5 from a Map<float, int> returns true and removes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<float, int> = new Map<float, int>();
      let k: float = 1.5 as float;
      m.set(k, 10);
      let result: boolean = m.delete(k);
      expect(result).assertTrue();
      expect(m.has(k)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_2300
     * @tc.name mapDeletePart03Test023
     * @tc.desc Verify deleting an inserted double key from a Map<double, int> returns true and removes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<double, int> = new Map<double, int>();
      let k: double = 3.141592653589793;
      m.set(k, 1);
      let result: boolean = m.delete(k);
      expect(result).assertTrue();
      expect(m.has(k)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_2400
     * @tc.name mapDeletePart03Test024
     * @tc.desc Verify deleting an inserted bigint key from a Map<bigint, int> returns true and removes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<bigint, int> = new Map<bigint, int>();
      let k: bigint = BigInt(12345678901234567890n);
      m.set(k, 100);
      let result: boolean = m.delete(k);
      expect(result).assertTrue();
      expect(m.has(k)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_2500
     * @tc.name mapDeletePart03Test025
     * @tc.desc Verify deleting an inserted char key c'A' from a Map<char, int> returns true and removes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<char, int> = new Map<char, int>();
      let k: char = c'A';
      m.set(k, 65);
      let result: boolean = m.delete(k);
      expect(result).assertTrue();
      expect(m.has(k)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_2600
     * @tc.name mapDeletePart03Test026
     * @tc.desc Verify deleting an inserted Error instance key from a Map<Error, int> returns true and removes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<Error, int> = new Map<Error, int>();
      let e: Error = new Error('test');
      m.set(e, 1);
      let result: boolean = m.delete(e);
      expect(result).assertTrue();
      expect(m.has(e)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_2700
     * @tc.name mapDeletePart03Test027
     * @tc.desc Verify deleting the same inserted array instance key from a Map<int[], int> returns true and removes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int[], int> = new Map<int[], int>();
      let arr: int[] = [1, 2, 3];
      m.set(arr, 100);
      let result: boolean = m.delete(arr);
      expect(result).assertTrue();
      expect(m.has(arr)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_2800
     * @tc.name mapDeletePart03Test028
     * @tc.desc Verify deleting a distinct array instance with equal content from a Map<int[], int> returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int[], int> = new Map<int[], int>();
      let arr1: int[] = [1, 2, 3];
      m.set(arr1, 100);
      let arr2: int[] = [1, 2, 3];
      let result: boolean = m.delete(arr2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_2900
     * @tc.name mapDeletePart03Test029
     * @tc.desc Verify deleting the same inserted Set instance key from a Map<Set<int>, int> returns true and removes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<Set<int>, int> = new Map<Set<int>, int>();
      let s: Set<int> = new Set<int>();
      s.add(1);
      m.set(s, 10);
      let result: boolean = m.delete(s);
      expect(result).assertTrue();
      expect(m.has(s)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_3000
     * @tc.name mapDeletePart03Test030
     * @tc.desc Verify deleting the same inserted Map instance key from a Map<Map<string, int>, int> returns true and removes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<Map<string, int>, int> = new Map<Map<string, int>, int>();
      let inner: Map<string, int> = new Map<string, int>();
      inner.set('x', 1);
      m.set(inner, 999);
      let result: boolean = m.delete(inner);
      expect(result).assertTrue();
      expect(m.has(inner)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_3100
     * @tc.name mapDeletePart03Test031
     * @tc.desc Verify deleting the same inserted KeyClass instance key from a Map<KeyClass, int> returns true and removes it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<KeyClass, int> = new Map<KeyClass, int>();
      let obj: KeyClass = new KeyClass(1);
      m.set(obj, 100);
      let result: boolean = m.delete(obj);
      expect(result).assertTrue();
      expect(m.has(obj)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_3200
     * @tc.name mapDeletePart03Test032
     * @tc.desc Verify deleting a distinct KeyClass2 instance with equal field values from a Map<KeyClass2, int> returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<KeyClass2, int> = new Map<KeyClass2, int>();
      let obj1: KeyClass2 = new KeyClass2(1);
      m.set(obj1, 100);
      let obj2: KeyClass2 = new KeyClass2(1);
      let result: boolean = m.delete(obj2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_3300
     * @tc.name mapDeletePart03Test033
     * @tc.desc Verify delete() of an existing key returns true and size decreases from 2 to 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('first', 1);
      map.set('second', 2);
      let result: boolean = map.delete('first');
      expect(result).assertTrue();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_3400
     * @tc.name mapDeletePart03Test034
     * @tc.desc Verify delete() of a middle key returns true and size decreases from 3 to 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 10);
      map.set('b', 20);
      map.set('c', 30);
      let result: boolean = map.delete('b');
      expect(result).assertTrue();
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_3500
     * @tc.name mapDeletePart03Test035
     * @tc.desc Verify deleting the same key twice returns false the second time and size is 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('temp', 1);
      let first: boolean = map.delete('temp');
      expect(first).assertTrue();
      let result: boolean = map.delete('temp');
      expect(result).assertFalse();
      expect(map.size).assertEqual(0);
      expect(map.has('temp')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_3600
     * @tc.name mapDeletePart03Test036
     * @tc.desc Verify a repeated delete() of the same key returns false while the other key remains
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('keep', 10);
      map.set('remove', 20);
      let first: boolean = map.delete('remove');
      expect(first).assertTrue();
      let result: boolean = map.delete('remove');
      expect(result).assertFalse();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_3700
     * @tc.name mapDeletePart03Test037
     * @tc.desc Verify has() returns true before delete() and false after delete()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('target', 55);
      expect(map.has('target')).assertTrue();
      map.delete('target');
      expect(map.has('target')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_3800
     * @tc.name mapDeletePart03Test038
     * @tc.desc Verify get() returns undefined for a key deleted twice
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('double', 88);
      map.delete('double');
      map.delete('double');
      let val: int | undefined = map.get('double');
      expect(val).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_3900
     * @tc.name mapDeletePart03Test039
     * @tc.desc Verify a deleted key no longer appears in entries() iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('vanished', 999);
      map.set('remain', 111);
      map.delete('vanished');
      let foundVanished: boolean = false;
      let iter = map.entries();
      let next = iter.next();
      expect(next.done).assertFalse();
      expect(next.value![0]).assertEqual('remain');
      while (!next.done) {
        if (next.value![0] === 'vanished') {
          foundVanished = true;
        }
        next = iter.next();
      }
      expect(foundVanished).assertFalse();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_4000
     * @tc.name mapDeletePart03Test040
     * @tc.desc Verify a deleted key no longer appears in keys() iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('delKey', 5);
      map.set('stayKey', 10);
      map.delete('delKey');
      let foundDel: boolean = false;
      let iter = map.keys();
      let next = iter.next();
      expect(next.done).assertFalse();
      expect(next.value).assertEqual('stayKey');
      while (!next.done) {
        if (next.value === 'delKey') {
          foundDel = true;
        }
        next = iter.next();
      }
      expect(foundDel).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_4100
     * @tc.name mapDeletePart03Test041
     * @tc.desc Verify the value of a deleted key no longer appears in values() iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('rm', 777);
      map.set('st', 888);
      map.delete('rm');
      let foundVal: boolean = false;
      let iter = map.values();
      let next = iter.next();
      expect(next.done).assertFalse();
      expect(next.value).assertEqual(888);
      while (!next.done) {
        if (next.value === 777) {
          foundVal = true;
        }
        next = iter.next();
      }
      expect(foundVal).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_4200
     * @tc.name mapDeletePart03Test042
     * @tc.desc Verify forEach() does not visit a deleted key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('bye', 42);
      map.set('hello', 24);
      map.delete('bye');
      let visitedBye: boolean = false;
      map.forEach((value: int, key: string): void => {
        if (key === 'bye') {
          visitedBye = true;
        }
      });
      expect(visitedBye).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_4300
     * @tc.name mapDeletePart03Test043
     * @tc.desc Verify forEach() preserves the insertion order of the remaining keys after delete()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('apple', 1);
      map.set('banana', 2);
      map.set('cherry', 3);
      map.delete('banana');
      let keys: string[] = [];
      map.forEach((value: int, key: string): void => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('apple');
      expect(keys[1]).assertEqual('cherry');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_4400
     * @tc.name mapDeletePart03Test044
     * @tc.desc Verify entries() iterator is done after deleting all entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('alpha', 1);
      map.set('beta', 2);
      map.delete('alpha');
      map.delete('beta');
      let iter = map.entries();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_4500
     * @tc.name mapDeletePart03Test045
     * @tc.desc Verify delete() returns false for a missing key and true after the key is set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      let firstDelete: boolean = map.delete('newKey');
      expect(firstDelete).assertFalse();
      map.set('newKey', 7);
      let secondDelete: boolean = map.delete('newKey');
      expect(secondDelete).assertTrue();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_4600
     * @tc.name mapDeletePart03Test046
     * @tc.desc Verify deleting a key from one Map does not affect another Map holding the same key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mapA: Map<string, int> = new Map<string, int>();
      const mapB: Map<string, int> = new Map<string, int>();
      mapA.set('shared', 111);
      mapB.set('shared', 222);
      mapA.delete('shared');
      expect(mapA.has('shared')).assertFalse();
      expect(mapB.get('shared')!).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_4700
     * @tc.name mapDeletePart03Test047
     * @tc.desc Verify delete() of an overwritten key returns true and has() becomes false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('overwrite', 1);
      map.set('overwrite', 999);
      let result: boolean = map.delete('overwrite');
      expect(result).assertTrue();
      expect(map.has('overwrite')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_4800
     * @tc.name mapDeletePart03Test048
     * @tc.desc Verify clear() after delete() keeps size at 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('solo', 50);
      map.delete('solo');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_4900
     * @tc.name mapDeletePart03Test049
     * @tc.desc Verify re-setting a deleted key puts it after the remaining keys in iteration order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('A', 1);
      map.set('B', 2);
      map.set('C', 3);
      expect(map.delete('B')).assertTrue();
      map.set('B', 200);
      let keys: string[] = [];
      map.forEach((value: int, key: string): void => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('A');
      expect(keys[1]).assertEqual('C');
      expect(keys[2]).assertEqual('B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_5000
     * @tc.name mapDeletePart03Test050
     * @tc.desc Verify deleting two independent keys returns true for each and size becomes 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('indepA', 10);
      map.set('indepB', 20);
      let delA: boolean = map.delete('indepA');
      expect(delA).assertTrue();
      let delB: boolean = map.delete('indepB');
      expect(delB).assertTrue();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_5100
     * @tc.name mapDeletePart03Test051
     * @tc.desc Verify the surviving key keeps its value after four other keys are deleted
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('k1', 11);
      map.set('k2', 22);
      map.set('k3', 33);
      map.set('k4', 44);
      map.set('k5', 55);
      map.delete('k1');
      map.delete('k2');
      map.delete('k3');
      map.delete('k4');
      expect(map.size).assertEqual(1);
      expect(map.has('k1')).assertFalse();
      expect(map.get('k5')!).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_5200
     * @tc.name mapDeletePart03Test052
     * @tc.desc Verify deleting the current key inside forEach() removes it from the Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('self', 100);
      map.set('other', 200);
      map.forEach((value: int, key: string): void => {
        if (key === 'self') {
          map.delete('self');
        }
      });
      expect(map.has('self')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_5300
     * @tc.name mapDeletePart03Test053
     * @tc.desc Verify deleting a key after entries() has advanced still yields the remaining entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('eat', 1);
      map.set('keep', 2);
      let iter = map.entries();
      let first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value![0]).assertEqual('eat');
      map.delete('eat');
      let second = iter.next();
      expect(second.done).assertFalse();
      expect(second.value![0]).assertEqual('keep');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_5400
     * @tc.name mapDeletePart03Test054
     * @tc.desc Verify delete() of a long.MAX key returns true and size becomes 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(LONG_MAX, 500);
      let result: boolean = map.delete(LONG_MAX);
      expect(result).assertTrue();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_5500
     * @tc.name mapDeletePart03Test055
     * @tc.desc Verify has() returns false for a deleted long.MAX key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(LONG_MAX, 75);
      map.delete(LONG_MAX);
      expect(map.has(LONG_MAX)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_5600
     * @tc.name mapDeletePart03Test056
     * @tc.desc Verify get() returns undefined for a deleted long.MAX key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(LONG_MAX, 999);
      map.delete(LONG_MAX);
      let val: int | undefined = map.get(LONG_MAX);
      expect(val).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_5700
     * @tc.name mapDeletePart03Test057
     * @tc.desc Verify the long.MIN entry is unaffected by deleting the long.MAX key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(LONG_MAX, 100);
      map.set(LONG_MIN, 200);
      map.delete(LONG_MAX);
      expect(map.size).assertEqual(1);
      expect(map.get(LONG_MIN)!).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_5800
     * @tc.name mapDeletePart03Test058
     * @tc.desc Verify get() returns undefined for a deleted short.MIN key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, int> = new Map<short, int>();
      map.set(SHORT_MIN, 256);
      map.delete(SHORT_MIN);
      let val: int | undefined = map.get(SHORT_MIN);
      expect(val).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_5900
     * @tc.name mapDeletePart03Test059
     * @tc.desc Verify has() returns false for a deleted NaN key in a Map<double, int>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, int> = new Map<double, int>();
      map.set(Number.NaN, 222);
      map.delete(Number.NaN);
      expect(map.has(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_6000
     * @tc.name mapDeletePart03Test060
     * @tc.desc Verify re-setting a deleted long.MAX key stores the new value 20
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(LONG_MAX, 10);
      map.delete(LONG_MAX);
      map.set(LONG_MAX, 20);
      expect(map.get(LONG_MAX)!).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_6100
     * @tc.name mapDeletePart03Test061
     * @tc.desc Verify delete() of long key 100 returns true and size becomes 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, int> = new Map<long, int>();
      m.set(100, 200);
      const result: boolean = m.delete(100);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
      expect(m.has(100)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_6200
     * @tc.name mapDeletePart03Test062
     * @tc.desc Verify delete() of long.MAX returns true and size decreases by 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, int> = new Map<long, int>();
      m.set(LONG_MAX, 100);
      const oldSize: int = m.size;
      const result: boolean = m.delete(LONG_MAX);
      expect(result).assertTrue();
      expect(m.size).assertEqual(oldSize - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_6300
     * @tc.name mapDeletePart03Test063
     * @tc.desc Verify delete() of a non-existent long.MAX key returns false and size is unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, int> = new Map<long, int>();
      m.set(1, 10);
      const oldSize: int = m.size;
      const result: boolean = m.delete(LONG_MAX);
      expect(result).assertFalse();
      expect(m.size).assertEqual(oldSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_6400
     * @tc.name mapDeletePart03Test064
     * @tc.desc Verify a second delete() of long.MAX returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, int> = new Map<long, int>();
      m.set(LONG_MAX, 100);
      m.delete(LONG_MAX);
      const result: boolean = m.delete(LONG_MAX);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_6500
     * @tc.name mapDeletePart03Test065
     * @tc.desc Verify delete() of long.MIN returns true and size becomes 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, int> = new Map<long, int>();
      m.set(LONG_MIN, 200);
      const result: boolean = m.delete(LONG_MIN);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_6600
     * @tc.name mapDeletePart03Test066
     * @tc.desc Verify delete() of long key 0 returns true and has(0) becomes false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, int> = new Map<long, int>();
      m.set(0, 999);
      const result: boolean = m.delete(0);
      expect(result).assertTrue();
      expect(m.has(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_6700
     * @tc.name mapDeletePart03Test067
     * @tc.desc Verify delete() of a non-existent long key 0 returns false while key 7 remains
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, int> = new Map<long, int>();
      m.set(7, 77);
      const result: boolean = m.delete(0);
      expect(result).assertFalse();
      expect(m.has(7)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_6800
     * @tc.name mapDeletePart03Test068
     * @tc.desc Verify delete() of the long.MAX key leaves the long.MIN entry retrievable with value 888
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, int> = new Map<long, int>();
      m.set(LONG_MAX, 777);
      m.set(LONG_MIN, 888);
      m.delete(LONG_MAX);
      const val: int | undefined = m.get(LONG_MIN);
      expect(val).assertEqual(888);
      expect(m.has(LONG_MAX)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_6900
     * @tc.name mapDeletePart03Test069
     * @tc.desc Verify delete() of key true returns true and size becomes 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(true, 100);
      const result: boolean = m.delete(true);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_7000
     * @tc.name mapDeletePart03Test070
     * @tc.desc Verify get(true) returns undefined after deleting the true key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(true, 300);
      m.delete(true);
      const val: int | undefined = m.get(true);
      expect(val).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_7100
     * @tc.name mapDeletePart03Test071
     * @tc.desc Verify a second delete() of key true returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(true, 400);
      m.delete(true);
      const result: boolean = m.delete(true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_7200
     * @tc.name mapDeletePart03Test072
     * @tc.desc Verify size becomes 0 after delete() and a re-set key returns the new value 444
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(false, 333);
      m.delete(false);
      expect(m.size).assertEqual(0);
      m.set(false, 444);
      const val: int | undefined = m.get(false);
      expect(val).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_7300
     * @tc.name mapDeletePart03Test073
     * @tc.desc Verify delete() of byte.MAX key 127 returns true and size becomes 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, int> = new Map<byte, int>();
      m.set(127, 100);
      const result: boolean = m.delete(127);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_7400
     * @tc.name mapDeletePart03Test074
     * @tc.desc Verify delete() of byte.MIN key -128 returns true and has() becomes false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, int> = new Map<byte, int>();
      m.set(-128, 400);
      const result: boolean = m.delete(-128);
      expect(result).assertTrue();
      expect(m.has(-128)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_7500
     * @tc.name mapDeletePart03Test075
     * @tc.desc Verify delete() of short.MIN key SHORT_MIN returns true and has() becomes false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, int> = new Map<short, int>();
      m.set(SHORT_MIN, 400);
      const result: boolean = m.delete(SHORT_MIN);
      expect(result).assertTrue();
      expect(m.has(SHORT_MIN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_7600
     * @tc.name mapDeletePart03Test076
     * @tc.desc Verify delete() of a float NaN key returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, int> = new Map<float, int>();
      m.set(FLOAT_NAN, 100);
      const result: boolean = m.delete(FLOAT_NAN);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_7700
     * @tc.name mapDeletePart03Test077
     * @tc.desc Verify delete() of a float Infinity key returns true and size becomes 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, int> = new Map<float, int>();
      m.set(FLOAT_POS_INF, 300);
      const result: boolean = m.delete(FLOAT_POS_INF);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_7800
     * @tc.name mapDeletePart03Test078
     * @tc.desc Verify has() returns false for both -0.0 and 0.0 after deleting the -0.0 key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, int> = new Map<float, int>();
      m.set(FLOAT_NEG_ZERO, 500);
      m.delete(FLOAT_NEG_ZERO);
      expect(m.has(FLOAT_NEG_ZERO)).assertFalse();
      expect(m.has(0.0 as float)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_7900
     * @tc.name mapDeletePart03Test079
     * @tc.desc Verify delete() of a RegExp key returns true and size becomes 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re: RegExp = new RegExp('abc', 'g');
      const m: Map<RegExp, int> = new Map<RegExp, int>();
      m.set(re, 100);
      const result: boolean = m.delete(re);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_8000
     * @tc.name mapDeletePart03Test080
     * @tc.desc Verify delete() of a Date key returns true and size becomes 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dt: Date = new Date(1000, 0, 1);
      const m: Map<Date, int> = new Map<Date, int>();
      m.set(dt, 100);
      const result: boolean = m.delete(dt);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_8100
     * @tc.name mapDeletePart03Test081
     * @tc.desc Verify delete() of a distinct Date with the same time returns false and the original key remains
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dt1: Date = new Date(5000, 0, 1);
      const dt2: Date = new Date(5000, 0, 1);
      const m: Map<Date, int> = new Map<Date, int>();
      m.set(dt1, 500);
      const result: boolean = m.delete(dt2);
      expect(result).assertFalse();
      expect(m.has(dt1)).assertTrue();
      expect(m.get(dt1)).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_8200
     * @tc.name mapDeletePart03Test082
     * @tc.desc Verify delete() of an object key returns true and size becomes 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ObjKey2 = { id: 1, name: 'test' } as ObjKey2;
      const m: Map<ObjKey2, int> = new Map<ObjKey2, int>();
      m.set(obj, 100);
      const result: boolean = m.delete(obj);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_8300
     * @tc.name mapDeletePart03Test083
     * @tc.desc Verify delete() of a structurally equal but distinct object key returns false and size stays 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ObjKey4 = { k: 1, v: 'a' } as ObjKey4;
      const obj2: ObjKey4 = { k: 1, v: 'a' } as ObjKey4;
      const m: Map<ObjKey4, int> = new Map<ObjKey4, int>();
      m.set(obj1, 400);
      const result: boolean = m.delete(obj2);
      expect(result).assertFalse();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_8400
     * @tc.name mapDeletePart03Test084
     * @tc.desc Verify get() returns undefined after deleting a script-string key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      const xssKey: string = '<script>alert(1)</script>';
      m.set(xssKey, 700);
      m.delete(xssKey);
      const val: int | undefined = m.get(xssKey);
      expect(val).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_8500
     * @tc.name mapDeletePart03Test085
     * @tc.desc Verify delete() of a 10000-character key returns true and size becomes 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let longKey: string = '';
      for (let i: int = 0; i < 10000; i++) {
        longKey = longKey + 'a';
      }
      m.set(longKey, 900);
      const result: boolean = m.delete(longKey);
      expect(result).assertTrue();
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_8600
     * @tc.name mapDeletePart03Test086
     * @tc.desc Verify repeated set()/delete() of a float NaN key leaves the latest value 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, int> = new Map<float, int>();
      m.set(FLOAT_NAN, 1);
      m.delete(FLOAT_NAN);
      m.set(FLOAT_NAN, 2);
      m.delete(FLOAT_NAN);
      m.set(FLOAT_NAN, 3);
      const val: int | undefined = m.get(FLOAT_NAN);
      expect(val).assertEqual(3);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_8700
     * @tc.name mapDeletePart03Test087
     * @tc.desc Verify repeated set()/delete() of a Unicode key leaves the latest value 130
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('​', 110);
      m.delete('​');
      m.set('​', 120);
      m.delete('​');
      m.set('​', 130);
      const val: int | undefined = m.get('​');
      expect(val).assertEqual(130);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_8800
     * @tc.name mapDeletePart03Test088
     * @tc.desc Verify delete() returns false for a non-existent key and has() stays false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('only', 1);
      let result: boolean = map.delete('nobody');
      expect(result).assertFalse();
      expect(map.has('nobody')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_8900
     * @tc.name mapDeletePart03Test089
     * @tc.desc Verify get() returns the value of the surviving key after delete()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('alpha', 1);
      map.set('beta', 2);
      map.delete('alpha');
      expect(map.get('beta')!).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_9000
     * @tc.name mapDeletePart03Test090
     * @tc.desc Verify forEach() is not called after deleting all entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 10);
      map.set('b', 20);
      map.delete('a');
      map.delete('b');
      let callCount: int = 0;
      map.forEach((value: int, key: string): void => {
        callCount = callCount + 1;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_9100
     * @tc.name mapDeletePart03Test091
     * @tc.desc Verify keys() iterator is done after deleting all entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('m', 1);
      map.set('n', 2);
      map.delete('m');
      map.delete('n');
      let iter = map.keys();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_9200
     * @tc.name mapDeletePart03Test092
     * @tc.desc Verify values() iterator is done after deleting all entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('u', 100);
      map.set('v', 200);
      map.delete('u');
      map.delete('v');
      let iter = map.values();
      let result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_9300
     * @tc.name mapDeletePart03Test093
     * @tc.desc Verify deleting one of three chained keys leaves the other two present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('one', 1).set('two', 2).set('three', 3);
      map.delete('two');
      expect(map.has('one')).assertTrue();
      expect(map.has('three')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_9400
     * @tc.name mapDeletePart03Test094
     * @tc.desc Verify repeated set() and delete() cycles leave size at 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('cycle', 1);
      map.delete('cycle');
      map.set('cycle', 2);
      map.delete('cycle');
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_9500
     * @tc.name mapDeletePart03Test095
     * @tc.desc Verify forEach() visits a re-set key with its new value after delete()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('reborn', 1);
      map.delete('reborn');
      map.set('reborn', 999);
      let found: boolean = false;
      map.forEach((value: int, key: string): void => {
        if (key === 'reborn' && value === 999) {
          found = true;
        }
      });
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_9600
     * @tc.name mapDeletePart03Test096
     * @tc.desc Verify deleting all keys collected during forEach() sets size to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('d1', 1);
      map.set('d2', 2);
      map.set('d3', 3);
      let keysToDelete: string[] = [];
      map.forEach((value: int, key: string): void => {
        keysToDelete.push(key);
      });
      for (let i: int = 0; i < keysToDelete.length; i = i + 1) {
        map.delete(keysToDelete[i]);
      }
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_DELETE_PART03_TEST_9700
     * @tc.name mapDeletePart03Test097
     * @tc.desc Verify deleting a key after keys() has advanced still yields the remaining key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapDeletePart03Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('keyDel', 5);
      map.set('keyStay', 15);
      let iter = map.keys();
      let first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual('keyDel');
      map.delete('keyDel');
      let second = iter.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual('keyStay');
    });

  });
}
