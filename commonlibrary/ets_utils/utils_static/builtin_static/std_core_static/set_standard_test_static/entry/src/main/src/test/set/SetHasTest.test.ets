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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

const LONG_STR = "a".repeat(10000);

class Person {
  name: string = "";
  age: number = 0;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

export default function SetHasTest(): void {
  describe('SetHasTest', (): void => {
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
     * @tc.name testSetHas001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_0100
     * @tc.desc Verify has with one parameter normally calls method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<short>([1, 2, 3]);
      let result = set.has(2);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_0200
     * @tc.desc Verify has preserves Set size after query
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2]);
      set.has(1);
      set.has(2);
      set.has(999);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetHas003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_0300
     * @tc.desc Verify has returns true for existing element in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<float>([1.0, 2.0]);
      let result = set.has(1.0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_0400
     * @tc.desc Verify has returns false for nonexistent int element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3]);
      let result = set.has(999);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name testSetHas005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_0500
     * @tc.desc Verify has returns true for int max value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([2147483647]);
      let result = set.has(2147483647);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_0600
     * @tc.desc Verify has returns true for int min value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([-2147483648]);
      let result = set.has(-2147483648);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_0700
     * @tc.desc Verify has returns true for element with value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<double>([0.0, 1.0, 2.0]);
      let result = set.has(0.0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_0800
     * @tc.desc Verify has returns true for negative element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([-1, -100, -999]);
      let result = set.has(-1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_0900
     * @tc.desc Verify has returns true for hex value element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([0x10, 0xFF]);
      let result = set.has(0x10);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_1000
     * @tc.desc Verify has returns true for existing string element in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["hello", "world"]);
      let result = set.has("hello");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_1100
     * @tc.desc Verify has returns false for nonexistent string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["hello", "world"]);
      let result = set.has("test");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name testSetHas012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_1200
     * @tc.desc Verify has returns true for empty string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["", "hello"]);
      let result = set.has("");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_1300
     * @tc.desc Verify has returns true for special character string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["!@#$%", "\n\t"]);
      let result = set.has("!@#$%");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_1400
     * @tc.desc Verify has returns true for Unicode string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["中文", "test"]);
      let result = set.has("中文");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_1500
     * @tc.desc Verify has returns true for multilingual strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["テスト", "테스트", "АБВ"]);
      let result = set.has("テスト");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_1600
     * @tc.desc Verify has returns true for very long string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = LONG_STR;
      let set = new Set<string>([longStr]);
      let result = set.has(longStr);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_1700
     * @tc.desc Verify has distinguishes empty string and whitespace strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["", " ", "  ", "\t"]);
      let r0 = set.has("");
      let r1 = set.has(" ");
      let r2 = set.has("\t");
      expect(r0).assertTrue();
      expect(r1).assertTrue();
      expect(r2).assertTrue();
    });

    /**
     * @tc.name testSetHas018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_1800
     * @tc.desc Verify has returns true for existing boolean true value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, false]);
      let result = set.has(true);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_1900
     * @tc.desc Verify has returns true for existing boolean false value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, false]);
      let result = set.has(false);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_2000
     * @tc.desc Verify has returns false for nonexistent boolean value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true]);
      let result = set.has(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name testSetHas021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_2100
     * @tc.desc Verify has returns true for existing Object reference in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1 = new Person("Alice", 30);
      let set = new Set<Object>([p1]);
      let result = set.has(p1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_2200
     * @tc.desc Verify has returns false for different object with same property values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1 = new Person("Alice", 30);
      let p2 = new Person("Alice", 30);
      let set = new Set<Object>([p1]);
      let result = set.has(p2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name testSetHas023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_2300
     * @tc.desc Verify has returns false for nonexistent object in empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Object>();
      let obj = new Object();
      let result = set.has(obj);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name testSetHas024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_2400
     * @tc.desc Verify has returns true for NaN value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([Number.NaN, 1.5]);
      let result = set.has(Number.NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_2500
     * @tc.desc Verify has returns true for floating-point element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([3.14, 2.718]);
      let result = set.has(3.14);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_2600
     * @tc.desc Verify has returns true for Number.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([Number.MAX_VALUE]);
      let result = set.has(Number.MAX_VALUE);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_2700
     * @tc.desc Verify has treats +0 and -0 as same value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([+0.0]);
      let result = set.has(-0.0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_2800
     * @tc.desc Verify has returns true for positive infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([Number.POSITIVE_INFINITY]);
      let result = set.has(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_2900
     * @tc.desc Verify passing null value to has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<short>([1, 2, 3]);
      try {
        let result = set.has(null as Object as short);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetHas030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_3000
     * @tc.desc Verify passing undefined value to has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<short>([1, 2, 3]);
      try {
        let result = set.has(undefined as Object as short);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetHas031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_3100
     * @tc.desc Verify passing string type to int generic Set has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<short>([1, 2, 3]);
      try {
        let result = set.has("abc" as Object as short);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetHas032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_3200
     * @tc.desc Verify has returns true when Set contains target element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<short>([1, 2, 3]);
      let result = set.has(1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_3300
     * @tc.desc Verify has returns false when Set does not contain target element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<short>([1, 2, 3]);
      let result = set.has(100);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name testSetHas034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_3400
     * @tc.desc Verify has returns true for middle element in multi-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<short>([10, 20, 30, 40, 50]);
      let result = set.has(30);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_3500
     * @tc.desc Verify has returns true for single-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<short>([42]);
      let result = set.has(42);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_3600
     * @tc.desc Verify has returns false for all elements in empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<byte>();
      let result = set.has(1);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name testSetHas037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_3700
     * @tc.desc Verify has returns true after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(100);
      let result = set.has(100);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_3800
     * @tc.desc Verify has returns false before add, true after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      let result1 = set.has(100);
      expect(result1).assertEqual(false);
      set.add(100);
      let result2 = set.has(100);
      expect(result2).assertEqual(true);
    });

    /**
     * @tc.name testSetHas039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_3900
     * @tc.desc Verify has returns false after delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      set.delete(2);
      let result = set.has(2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name testSetHas040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_4000
     * @tc.desc Verify deleting one element, other elements still return true from has
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<short>([1, 2, 3]);
      set.delete(2);
      expect(set.has(1)).assertEqual(true);
      expect(set.has(3)).assertEqual(true);
    });

    /**
     * @tc.name testSetHas041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_4100
     * @tc.desc Verify has returns false for all elements after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      set.clear();
      expect(set.has(1)).assertEqual(false);
      expect(set.has(2)).assertEqual(false);
      expect(set.has(3)).assertEqual(false);
    });

    /**
     * @tc.name testSetHas042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_4200
     * @tc.desc Verify has still returns true after repeated add of same element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(1);
      set.add(1);
      set.add(1);
      let result = set.has(1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_4300
     * @tc.desc Verify has return value type is boolean when true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      let result = set.has(1);
      let type: string = typeof result;
      expect(type).assertEqual("boolean");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_4400
     * @tc.desc Verify has return value type is boolean when false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      let result = set.has(999);
      let type: string = typeof result;
      expect(type).assertEqual("boolean");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name testSetHas045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_4500
     * @tc.desc Verify calling has multiple times on same element returns consistent results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let r1 = set.has(2);
      let r2 = set.has(2);
      let r3 = set.has(2);
      expect(r1).assertEqual(true);
      expect(r2).assertEqual(true);
      expect(r3).assertEqual(true);
    });

    /**
     * @tc.name testSetHas046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_4600
     * @tc.desc Verify alternating has queries between existing and nonexistent elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      expect(set.has(1)).assertEqual(true);
      expect(set.has(100)).assertEqual(false);
      expect(set.has(2)).assertEqual(true);
      expect(set.has(200)).assertEqual(false);
      expect(set.has(3)).assertEqual(true);
    });

    /**
     * @tc.name testSetHas047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_4700
     * @tc.desc Verify has in large Set for first, last, middle and nonexistent elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      for (let i = 0; i < 10000; i++) {
        set.add(i);
      }
      expect(set.has(0)).assertEqual(true);
      expect(set.has(9999)).assertEqual(true);
      expect(set.has(5000)).assertEqual(true);
      expect(set.has(10000)).assertEqual(false);
    });

    /**
     * @tc.name testSetHas048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_4800
     * @tc.desc Verify has does not modify Set content and size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let sizeBefore = set.size;
      let result = set.has(2);
      let sizeAfter = set.size;
      expect(sizeBefore).assertEqual(sizeAfter);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testSetHas049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_4900
     * @tc.desc Verify has returns true for existing element and size unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      expect(set.has(1)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetHas050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_5000
     * @tc.desc Verify passing string type value to int generic Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      try {
        let result = set.has("hello" as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetHas051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_5100
     * @tc.desc Verify passing number type value to string generic Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b"]);
      try {
        let result = set.has(123 as Object as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetHas052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_5200
     * @tc.desc Verify catch correctly captures Error object in exception scenario
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Overloaded method cannot be used as value in ARKTS cast expressions
      let set = new Set<int>([1, 2]);
      try {
        let result = set.has("abc" as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetHas053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_5300
     * @tc.desc Verify has without parameter throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      try {
        let hasFn = (set as Record<string, Object>)["has"];
        (hasFn as Object as () => void)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetHas054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_5400
     * @tc.desc Verify has returns true for Number.MIN_VALUE element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([Number.MIN_VALUE]);
      expect(set.has(Number.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.name testSetHas055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_5500
     * @tc.desc Verify has returns true for emoji string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["😀", "🔥"]);
      expect(set.has("😀")).assertTrue();
      expect(set.has("🔥")).assertTrue();
    });

    /**
     * @tc.name testSetHas056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_5600
     * @tc.desc Verify has returns true for scientific notation number element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1.23e5]);
      expect(set.has(1.23e5)).assertTrue();
    });

    /**
     * @tc.name testSetHas057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_5700
     * @tc.desc Verify has returns true for existing custom class instance in Set of Person
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1 = new Person("Alice", 30);
      let set = new Set<Person>([p1]);
      expect(set.has(p1)).assertTrue();
    });

    /**
     * @tc.name testSetHas058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_5800
     * @tc.desc Verify has returns false for different instance with same property values in Set of Person
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1 = new Person("Alice", 30);
      let p2 = new Person("Alice", 30);
      let set = new Set<Person>([p1]);
      expect(set.has(p2)).assertFalse();
    });

    /**
     * @tc.name testSetHas059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_5900
     * @tc.desc Verify has still returns true after mutating field of stored Person object via reference identity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1 = new Person("Alice", 30);
      let set = new Set<Person>([p1]);
      p1.name = "ChangedName";
      p1.age = 999;
      expect(set.has(p1)).assertTrue();
    });

    /**
     * @tc.name testSetHas060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_6000
     * @tc.desc Verify has returns true for Person instance and null in Set of Person pipe null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1 = new Person("Alice", 30);
      let set = new Set<Person | null>([p1, null]);
      expect(set.has(p1)).assertTrue();
      expect(set.has(null)).assertTrue();
      let p2 = new Person("Bob", 25);
      expect(set.has(p2)).assertFalse();
    });

    /**
     * @tc.name testSetHas061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_6100
     * @tc.desc Verify has undefined and Person in Set of Person pipe undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetHas061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1 = new Person("Alice", 30);
      let set = new Set<Person | undefined>([p1, undefined]);
      expect(set.has(p1)).assertTrue();
      expect(set.has(undefined)).assertTrue();
    });
  });
}
