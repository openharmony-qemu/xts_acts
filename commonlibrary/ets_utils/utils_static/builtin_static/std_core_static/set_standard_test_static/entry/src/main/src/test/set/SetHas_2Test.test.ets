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
import Utils from '../Util.test';

class ObjTest {
  value: number = 0;
  id: number = 0;
  constructor(value: number = 0) {
    this.value = value;
    this.id = value;
  }
}

class PersonHas {
  name: string = "";
  age: int = 0;

  constructor(name: string, age: int) {
    this.name = name;
    this.age = age;
  }
}

export default function SetHas_2Test(): void {
  describe('SetHasPart1Test', (): void => {
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
     * @tc.name testHas001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_0100
     * @tc.desc Verify has() returns false for non-existing long element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>([1]);
      const result: boolean = set.has(999);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_0200
     * @tc.desc Verify has() returns false on empty Set<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>();
      const result: boolean = set.has(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_0300
     * @tc.desc Verify has() returns false for non-existing double element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([1.0]);
      const result: boolean = set.has(2.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_0400
     * @tc.desc Verify has() returns false on empty Set<double>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>();
      const result: boolean = set.has(1.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_0500
     * @tc.desc Verify has() returns false for absent boolean element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>([true]);
      const result: boolean = set.has(false);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_0600
     * @tc.desc Verify has() returns false on empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>();
      const result: boolean = set.has(false);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_0700
     * @tc.desc Verify has() returns false for non-existing string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["hello"]);
      const result: boolean = set.has("world");
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_0800
     * @tc.desc Verify has() returns false on empty Set<string>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>();
      const result: boolean = set.has("hello");
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_0900
     * @tc.desc Verify has() with empty string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>([""]);
      const result: boolean = set.has("");
      expect(result).assertTrue();
    });

    /**
     * @tc.name testHas010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_1000
     * @tc.desc Verify has() returns false for non-existing Object element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ObjTest = new ObjTest(1);
      const obj2: ObjTest = new ObjTest(1);
      const set: Set<ObjTest> = new Set<ObjTest>([obj1]);
      const result: boolean = set.has(obj2);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_1100
     * @tc.desc Verify has() returns false on empty Set<ObjTest>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<ObjTest> = new Set<ObjTest>();
      const result: boolean = set.has(new ObjTest(1));
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_1200
     * @tc.desc Verify has() returns false for non-existing array element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const set: Set<number[]> = new Set<number[]>([arr]);
      const result: boolean = set.has([4, 5, 6]);
      expect(result).assertFalse();
      const result2: boolean = set.has(arr);
      expect(result2).assertTrue();
    });

    /**
     * @tc.name testHas013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_1300
     * @tc.desc Verify has() returns false on empty Set<number[]>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number[]> = new Set<number[]>();
      const result: boolean = set.has([1]);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_1400
     * @tc.desc Verify has() with empty array element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArr: number[] = [];
      const set: Set<number[]> = new Set<number[]>([emptyArr]);
      const result: boolean = set.has(emptyArr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name testHas015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_1500
     * @tc.desc Verify has() returns false for non-existing Function element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn1: () => void = (): void => {};
      const fn2: () => void = (): void => {};
      const set: Set<() => void> = new Set<() => void>([fn1]);
      const result: boolean = set.has(fn2);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_1600
     * @tc.desc Verify has() returns false on empty Set<Function>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<() => void> = new Set<() => void>();
      const fn: () => void = (): void => {};
      const result: boolean = set.has(fn);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_1700
     * @tc.desc Verify has() returns false on empty Set with union type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number | string> = new Set<number | string>();
      const result: boolean = set.has(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testHas018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_1800
     * @tc.desc Verify has() result used in boolean expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      expect(set.has(2)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testHas019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_1900
     * @tc.desc Verify has() after state transition from empty to full
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      expect(set.has(1)).assertFalse();
      set.add(1);
      set.add(2);
      set.add(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testHas020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_2000
     * @tc.desc Verify has() after state transition from full to empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(1)).assertFalse();
      expect(set.has(2)).assertFalse();
      expect(set.has(3)).assertFalse();
    });

    /**
     * @tc.name testHas021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_2100
     * @tc.desc Verify has() after constructing empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      expect(set.has(1)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testHas022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_2200
     * @tc.desc Verify has() on empty Set constructed with empty array returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([]);
      expect(set.has(1)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testHas023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_2300
     * @tc.desc Verify has with hex int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([0x0A, 0x0F, 0xFF]);
      expect(set.has(0x0A)).assertTrue();
      expect(set.has(0x0F)).assertTrue();
      expect(set.has(0xFF)).assertTrue();
      expect(set.has(0x00)).assertFalse();
    });

    /**
     * @tc.name testHas024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_2400
     * @tc.desc Verify has with octal int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([0o10, 0o17, 0o77]);
      expect(set.has(0o10)).assertTrue();
      expect(set.has(0o17)).assertTrue();
      expect(set.has(0o77)).assertTrue();
      expect(set.has(0o00)).assertFalse();
    });

    /**
     * @tc.name testHas025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_2500
     * @tc.desc Verify has with binary int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([0b1010, 0b1111, 0b10101010]);
      expect(set.has(0b1010)).assertTrue();
      expect(set.has(0b1111)).assertTrue();
      expect(set.has(0b10101010)).assertTrue();
      expect(set.has(0b0000)).assertFalse();
    });

    /**
     * @tc.name testHas026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_2600
     * @tc.desc Verify has treats -0.0 and 0.0 as the same value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([-0.0]);
      expect(set.has(-0.0)).assertTrue();
      expect(set.has(0.0)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testHas027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_2700
     * @tc.desc Verify has type checking with int Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      expect(set.has(2)).assertTrue();
      expect(set.has(4)).assertFalse();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testHas028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_2800
     * @tc.desc Verify has with Array.from serialization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const arr = Array.from(set);
      for (const v of arr) {
        expect(set.has(v)).assertTrue();
      }
    });

    /**
     * @tc.name testHas029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_2900
     * @tc.desc Verify has on 2-element Set<int>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 3]);
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testHas030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_3000
     * @tc.desc Verify has sequential multi-operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 5; i++) {
        set.add(i);
      }
      for (let i: int = 0; i < 5; i++) {
        expect(set.has(i)).assertTrue();
      }
    });

    /**
     * @tc.name testHas031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_3100
     * @tc.desc Verify has with large Set of 1000 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 1000; i++) {
        set.add(i);
      }
      expect(set.has(500)).assertTrue();
      expect(set.has(999)).assertTrue();
    });

    /**
     * @tc.name testHas032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_3200
     * @tc.desc Verify has returns true for element with value 0.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([0.0, 1.0, 2.0]);
      expect(set.has(0.0)).assertTrue();
    });

    /**
     * @tc.name testHas033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_3300
     * @tc.desc Verify has returns true for Unicode string elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["中文", "test"]);
      expect(set.has("中文")).assertTrue();
    });

    /**
     * @tc.name testHas034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_3400
     * @tc.desc Verify has returns true for special character string elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["!@#$%", "\n\t"]);
      expect(set.has("!@#$%")).assertTrue();
    });

    /**
     * @tc.name testHas035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_3500
     * @tc.desc Verify has returns true for existing object reference and false for different object with same values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new PersonHas("Alice", 30);
      const p2 = new PersonHas("Alice", 30);
      const set = new Set<PersonHas>([p1]);
      expect(set.has(p1)).assertTrue();
      expect(set.has(p2)).assertFalse();
    });

    /**
     * @tc.name testHas036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_3600
     * @tc.desc Verify has still returns true after mutating field of stored object via reference identity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new PersonHas("Alice", 30);
      const set = new Set<PersonHas>([p1]);
      p1.name = "ChangedName";
      p1.age = 999;
      expect(set.has(p1)).assertTrue();
    });

    /**
     * @tc.name testHas037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_3700
     * @tc.desc Verify has return value type is boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const result: boolean = set.has(1);
      expect(result).assertTrue();
    });

    /**
     * @tc.name testHas038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_3800
     * @tc.desc Verify has operation does not modify Set size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const sizeBefore = set.size;
      set.has(2);
      set.has(999);
      const sizeAfter = set.size;
      expect(sizeBefore).assertEqual(sizeAfter);
    });

    /**
     * @tc.name testHas039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_3900
     * @tc.desc Verify has returns false for deleted element, other elements remain findable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.delete(2);
      expect(set.has(2)).assertFalse();
      expect(set.has(1)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testHas040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_4000
     * @tc.desc Verify has returns true for existing Person instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new PersonHas("Alice", 30);
      const set = new Set<PersonHas>([p1]);
      expect(set.has(p1)).assertTrue();
      const p2 = new PersonHas("Bob", 25);
      expect(set.has(p2)).assertFalse();
    });

    /**
     * @tc.name testHas041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_4100
     * @tc.desc Verify has byte -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(-128 as byte);
      expect(s.has(-128 as byte)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testHas042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_4200
     * @tc.desc Verify has byte 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(0 as byte);
      expect(s.has(0 as byte)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testHas043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_4300
     * @tc.desc Verify has byte 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(127 as byte);
      expect(s.has(127 as byte)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testHas044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_4400
     * @tc.desc Verify has short -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(-32768 as short);
      expect(s.has(-32768 as short)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testHas045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_4500
     * @tc.desc Verify has short 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(0 as short);
      expect(s.has(0 as short)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testHas046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_4600
     * @tc.desc Verify has short 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(32767 as short);
      expect(s.has(32767 as short)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testHas047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_4700
     * @tc.desc Verify Set<float> has existing value → true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>();
      set.add(3.14 as float);
      set.add(Float.NaN);
      expect(set.has(3.14 as float)).assertTrue();
      expect(set.has(Float.NaN)).assertTrue();
    });

    /**
     * @tc.name testHas048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_4800
     * @tc.desc Verify Set<float> has non-existent value → false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>([1.0 as float, 2.0 as float]);
      expect(set.has(99.0 as float)).assertFalse();
    });

    /**
     * @tc.name testHas049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_4900
     * @tc.desc Verify Set<float> has Float.POSITIVE_INFINITY values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>();
      set.add(Float.POSITIVE_INFINITY);
      set.add(Float.NEGATIVE_INFINITY);
      expect(set.has(Float.POSITIVE_INFINITY)).assertTrue();
      expect(set.has(Float.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testHas050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_5000
     * @tc.desc Verify Set<char> has Unicode and escape characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>();
      set.add(c'a');
      set.add(c'中');
      set.add(c'\n');
      expect(set.has(c'a')).assertTrue();
      expect(set.has(c'中')).assertTrue();
      expect(set.has(c'\n')).assertTrue();
    });

    /**
     * @tc.name testHas051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_5100
     * @tc.desc Verify Set<char> has non-existent char returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>();
      set.add(c'Z');
      expect(set.has(c'X')).assertFalse();
    });

    /**
     * @tc.name testHas052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_5200
     * @tc.desc Verify Set<number> has mixed int, float, Number.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>([0, 1.5, -3.14, Number.POSITIVE_INFINITY, Number.NaN]);
      expect(set.has(0)).assertTrue();
      expect(set.has(1.5)).assertTrue();
      expect(set.has(Number.POSITIVE_INFINITY)).assertTrue();
      expect(set.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.name testHas053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_5300
     * @tc.desc Verify Set<number> has non-existent → false, delete then has → false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>([42, 3.14]);
      expect(set.has(99)).assertFalse();
      set.delete(42);
      expect(set.has(42)).assertFalse();
    });

    /**
     * @tc.name testHas054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_5400
     * @tc.desc Verify Set<Date> has same ref → true, different ref same value → false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1 = new Date(2025, 0, 1);
      const d2 = new Date(2025, 0, 1);
      const set: Set<Date> = new Set<Date>([d1]);
      expect(set.has(d1)).assertTrue();
      expect(set.has(d2)).assertFalse();
    });

    /**
     * @tc.name testHas055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_5500
     * @tc.desc Verify Set<RegExp> has ref semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = new RegExp("test");
      const r2 = new RegExp("test");
      const set: Set<RegExp> = new Set<RegExp>([r1]);
      expect(set.has(r1)).assertTrue();
      expect(set.has(r2)).assertFalse();
    });

    /**
     * @tc.name testHas056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_5600
     * @tc.desc Verify Set<object> has structurally equal different ref → false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new ObjTest(1);
      const obj2 = new ObjTest(1);
      const set: Set<object> = new Set<object>([obj1]);
      expect(set.has(obj1)).assertTrue();
      expect(set.has(obj2)).assertFalse();
    });

    /**
     * @tc.name testHas057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_5700
     * @tc.desc Verify Set<Map> has same-content different ref → false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, number>();
      m1.set('a', 1);
      const m2 = new Map<string, number>();
      m2.set('a', 1);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>([m1]);
      expect(set.has(m1)).assertTrue();
      expect(set.has(m2)).assertFalse();
    });

    /**
     * @tc.name testHas058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_5800
     * @tc.desc Verify Set<Map> has same-content different ref → false (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, number>();
      m1.set('a', 1);
      const m2 = new Map<string, number>();
      m2.set('a', 1);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>();
      set.add(m1);

      expect(set.has(m1)).assertTrue();
      expect(set.has(m2)).assertFalse();
    });

    /**
     * @tc.name testHas059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_5900
     * @tc.desc Verify Set<Set<int>> has nested Set ref semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Set<int>([1, 2]);
      const inner2 = new Set<int>([1, 2]);
      const outer: Set<Set<int>> = new Set<Set<int>>([inner1]);
      expect(outer.has(inner1)).assertTrue();
      expect(outer.has(inner2)).assertFalse();
    });

    /**
     * @tc.name testHas060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_6000
     * @tc.desc Verify Set<Set<int>> has nested Set ref semantics (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Set<int>([1, 2]);
      const inner2 = new Set<int>([1, 2]);
      const outer: Set<Set<int>> = new Set<Set<int>>();
      outer.add(inner1);

      expect(outer.has(inner1)).assertTrue();
      expect(outer.has(inner2)).assertFalse();
    });

    /**
     * @tc.name testHas061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_6100
     * @tc.desc Verify Set<Record> has ref semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'a': 1 };
      const r2: Record<string, int> = { 'a': 1 };
      const set: Set<Record<string, int>> = new Set<Record<string, int>>([r1]);
      expect(set.has(r1)).assertTrue();
      expect(set.has(r2)).assertFalse();
    });

    /**
     * @tc.name testHas062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_6200
     * @tc.desc Verify Set<Record> has ref semantics (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'a': 1 };
      const r2: Record<string, int> = { 'a': 1 };
      const set: Set<Record<string, int>> = new Set<Record<string, int>>();
      set.add(r1);

      expect(set.has(r1)).assertTrue();
      expect(set.has(r2)).assertFalse();
    });

    /**
     * @tc.name testHas063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_6300
     * @tc.desc Verify Set<Int8Array> has ref semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int8Array([1, 2]);
      const a2 = new Int8Array([1, 2]);
      const set: Set<Int8Array> = new Set<Int8Array>([a1]);
      expect(set.has(a1)).assertTrue();
      expect(set.has(a2)).assertFalse();
    });

    /**
     * @tc.name testHas064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_6400
     * @tc.desc Verify Set<Int8Array> has ref semantics (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int8Array([1, 2]);
      const a2 = new Int8Array([1, 2]);
      const set: Set<Int8Array> = new Set<Int8Array>();
      set.add(a1);

      expect(set.has(a1)).assertTrue();
      expect(set.has(a2)).assertFalse();
    });

    /**
     * @tc.name testHas065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_6500
     * @tc.desc Verify Set<WeakMap> has ref semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm = new WeakMap<object, number>();
      const set: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>([wm]);
      expect(set.has(wm)).assertTrue();
    });

    /**
     * @tc.name testHas066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_6600
     * @tc.desc Verify Set<WeakMap> has ref semantics (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm = new WeakMap<object, number>();
      const set: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>();
      set.add(wm);

      expect(set.has(wm)).assertTrue();
    });

    /**
     * @tc.name testHas067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_6700
     * @tc.desc Verify Set<WeakSet> has ref semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws = new WeakSet<object>();
      const set: Set<WeakSet<object>> = new Set<WeakSet<object>>([ws]);
      expect(set.has(ws)).assertTrue();
    });

    /**
     * @tc.name testHas068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_6800
     * @tc.desc Verify Set<WeakSet> has ref semantics (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws = new WeakSet<object>();
      const set: Set<WeakSet<object>> = new Set<WeakSet<object>>();
      set.add(ws);

      expect(set.has(ws)).assertTrue();
    });

    /**
     * @tc.name testHas069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_6900
     * @tc.desc Verify Set<Error> has same ref → true, different ref → false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new Error('msg');
      const e2 = new Error('msg');
      const set: Set<Error> = new Set<Error>([e1]);
      expect(set.has(e1)).assertTrue();
      expect(set.has(e2)).assertFalse();
    });

    /**
     * @tc.name testHas070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_7000
     * @tc.desc Verify Set<bigint> has with BigInt constructor values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<bigint> = new Set<bigint>([0n, BigInt(0xFF), -1n]);
      expect(set.has(0n)).assertTrue();
      expect(set.has(BigInt(0xFF))).assertTrue();
      expect(set.has(999n)).assertFalse();
    });

    /**
     * @tc.name testHas071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_7100
     * @tc.desc Verify Set<ObjTest> has class instance ref semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1 = new ObjTest(1);
      const o2 = new ObjTest(1);
      const set: Set<ObjTest> = new Set<ObjTest>([o1]);
      expect(set.has(o1)).assertTrue();
      expect(set.has(o2)).assertFalse();
    });

    /**
     * @tc.name testHas072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_7200
     * @tc.desc Verify ReadonlySet<int> has with value semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      const rs: ReadonlySet<int> = set;
      expect(rs.has(1)).assertTrue();
      expect(rs.has(2)).assertTrue();
      expect(rs.has(99)).assertFalse();
    });

    /**
     * @tc.name testHas073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_7300
     * @tc.desc Verify Set<Promise<Set<int>>> has nested Promise generic by ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([42]);
      const p1: Promise<Set<int>> = Promise.resolve(inner);
      const p2: Promise<Set<int>> = Promise.resolve(inner);
      const set: Set<Promise<Set<int>>> = new Set<Promise<Set<int>>>([p1]);
      expect(set.has(p1)).assertTrue();
      expect(set.has(p2)).assertFalse();
    });

    /**
     * @tc.name testHas074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_HAS_P1_7400
     * @tc.desc Verify Set<jsonx.JsonElement> has JSON parsed object: same ref → true, different ref → false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testHas074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const j1: jsonx.JsonElement = JSON.parseJsonElement('{"a":1}');
      const j2: jsonx.JsonElement = JSON.parseJsonElement('{"a":1}');
      const set: Set<jsonx.JsonElement> = new Set<jsonx.JsonElement>([j1]);
      expect(set.has(j1)).assertTrue();
      expect(set.has(j2)).assertFalse();
    });
  });
}

