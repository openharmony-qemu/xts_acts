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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

class Person032 {
  name: string = "";
  age: int = 0;

  constructor(name: string, age: int) {
    this.name = name;
    this.age = age;
  }
}

export default function SetClearTest(): void {
  describe('SetClearTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.name testSetClear001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_0100
     * @tc.desc Verify clear() with no parameters normally clears all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_0200
     * @tc.desc Verify size becomes 0 after clearing non-empty Set with multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<float>([1.0, 2.0, 3.0]);
      expect(set.size).assertEqual(3);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_0300
     * @tc.desc Verify clearing single-element Set, size becomes 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["hello"]);
      expect(set.size).assertEqual(1);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_0400
     * @tc.desc Verify clearing Set with multiple string type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b", "c", "d", "e"]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_0500
     * @tc.desc Verify calling clear on empty Set, size remains 0 without error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      expect(set.size).assertEqual(0);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_0600
     * @tc.desc Verify add new element after clear, Set still works normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      set.clear();
      expect(set.size).assertEqual(0);
      set.add(10);
      expect(set.size).assertEqual(1);
      expect(set.has(10)).assertTrue();
    });

    /**
     * @tc.name testSetClear007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_0700
     * @tc.desc Verify add multiple elements after clear, Set functions normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      set.clear();
      set.add(100);
      set.add(200);
      set.add(300);
      expect(set.size).assertEqual(3);
      expect(set.has(100)).assertTrue();
      expect(set.has(200)).assertTrue();
      expect(set.has(300)).assertTrue();
    });

    /**
     * @tc.name testSetClear008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_0800
     * @tc.desc Verify delete returns false for nonexistent element after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      set.clear();
      let result = set.delete(1);
      expect(result).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_0900
     * @tc.desc Verify has returns false for all original int elements after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      set.clear();
      expect(set.has(1)).assertFalse();
      expect(set.has(2)).assertFalse();
      expect(set.has(3)).assertFalse();
    });

    /**
     * @tc.name testSetClear010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_1000
     * @tc.desc Verify clear() return value is void/undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let result = set.clear();
      expect(result).assertUndefined();
    });

    /**
     * @tc.name testSetClear011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_1100
     * @tc.desc Verify has returns false for all original string elements after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["apple", "banana", "cherry"]);
      set.clear();
      expect(set.has("apple")).assertFalse();
      expect(set.has("banana")).assertFalse();
      expect(set.has("cherry")).assertFalse();
    });

    /**
     * @tc.name testSetClear012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_1200
     * @tc.desc Verify keys() returns empty iterator after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      set.clear();
      let keys = set.keys();
      let count = 0;
      for (let key of keys) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testSetClear013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_1300
     * @tc.desc Verify values() returns empty iterator after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([10, 20, 30]);
      set.clear();
      let values = set.values();
      let count = 0;
      for (let val of values) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testSetClear014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_1400
     * @tc.desc Verify entries() returns empty iterator after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["x", "y", "z"]);
      set.clear();
      let entries = set.entries();
      let count = 0;
      for (let entry of entries) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testSetClear015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_1500
     * @tc.desc Verify forEach callback is not executed after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      set.clear();
      let callCount = 0;
      set.forEach((value: int, key: int): void => {
        callCount++;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.name testSetClear016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_1600
     * @tc.desc Verify size consistently reads 0 after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<short>([1, 2, 3]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.size).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_1700
     * @tc.desc Verify clearing large Set, validate performance and correctness
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      for (let i = 0; i < 10000; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(10000);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_1800
     * @tc.desc Verify clearing extremely large Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      for (let i = 0; i < 100000; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(100000);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(0)).assertFalse();
      expect(set.has(99999)).assertFalse();
    });

    /**
     * @tc.name testSetClear019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_1900
     * @tc.desc Verify calling clear twice consecutively, no error, size stays 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3]);
      set.clear();
      expect(set.size).assertEqual(0);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_2000
     * @tc.desc Verify calling clear multiple times, validate stability
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3]);
      for (let i = 0; i < 100; i++) {
        set.clear();
      }
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_2100
     * @tc.desc Verify iterator behavior after obtaining iterator then calling clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<float>([1.0, 2.0, 3.0, 4.0, 5.0]);
      let iter = set.values();
      set.clear();
      let count = 0;
      for (let val of iter) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testSetClear022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_2200
     * @tc.desc Verify calling clear during for-of iteration over Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<double>([1.0, 2.0, 3.0]);
      let cleared = false;
      for (let val of set) {
        if (!cleared) {
          set.clear();
          cleared = true;
        }
      }
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_2300
     * @tc.desc Verify delete some elements then clear, final size is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3]);
      set.delete(1);
      expect(set.size).assertEqual(2);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_2400
     * @tc.desc Verify clear on Set<string>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["hello", "world"]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has("hello")).assertFalse();
    });

    /**
     * @tc.name testSetClear025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_2500
     * @tc.desc Verify clear on Set<double>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<double>([1.1, 2.2, 3.3]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_2600
     * @tc.desc Verify clear on Set<boolean>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, false]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_2700
     * @tc.desc Verify clear on Set with object type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1 = new Person032("Alice", 20);
      let p2 = new Person032("Bob", 25);
      let set = new Set<Person032>([p1, p2]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(p1)).assertFalse();
    });

    /**
     * @tc.name testSetClear028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_2800
     * @tc.desc Verify clear with one extra parameter still clears all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      (set.clear as Object as (x: int) => void)(1);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_2900
     * @tc.desc Verify clear with multiple extra parameters still clears all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      (set.clear as Object as (a: int, b: string, c: boolean) => void)(1, "extra", true);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_3000
     * @tc.desc Verify clear with null extra parameter still clears all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      (set.clear as Object as (x: Object | null) => void)(null);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetClear031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CLEAR_3100
     * @tc.desc Verify clear with undefined extra parameter still clears all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetClear031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      (set.clear as Object as (x: Object | undefined) => void)(undefined);
      expect(set.size).assertEqual(0);
    });
  });
}
