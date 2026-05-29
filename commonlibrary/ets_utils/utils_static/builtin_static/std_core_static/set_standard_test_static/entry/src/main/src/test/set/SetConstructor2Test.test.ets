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

class Person010 {
  name: string = "";
  age: number = 0;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

export default function SetConstructor2Test(): void {
  describe('SetConstructor2Test', (): void => {
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
     * @tc.name testSetConstructor2001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_0100
     * @tc.desc Verify constructor with one Set<K> parameter constructs successfully
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["a", "b"]);
      let set2: Set<string> = new Set<string>(set1);
      expect(set2.size).assertEqual(2);
    });

    /**
     * @tc.name testSetConstructor2002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_0200
     * @tc.desc Verify constructor without parameter uses default construction behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<string> = new Set<string>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor2003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_0300
     * @tc.desc Verify Set constructed with array has correct size and contains element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["a"]);
      expect(set1.size).assertEqual(1);
      expect(set1.has("a")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_0400
     * @tc.desc Verify copying non-empty Set, new Set content matches original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["x", "y", "z"]);
      let set2: Set<string> = new Set<string>(set1);
      expect(set2.size).assertEqual(3);
      expect(set2.has("x")).assertTrue();
      expect(set2.has("y")).assertTrue();
      expect(set2.has("z")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_0500
     * @tc.desc Verify copying empty Set, new Set is also empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>();
      let set2: Set<string> = new Set<string>(set1);
      expect(set2.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor2006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_0600
     * @tc.desc Verify copying single-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["only"]);
      let set2: Set<string> = new Set<string>(set1);
      expect(set2.size).assertEqual(1);
      expect(set2.has("only")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_0700
     * @tc.desc Verify copying Set<number>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<number> = new Set<number>([1, 2, 3]);
      let set2: Set<number> = new Set<number>(set1);
      expect(set2.size).assertEqual(3);
      expect(set2.has(1)).assertTrue();
      expect(set2.has(2)).assertTrue();
      expect(set2.has(3)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_0800
     * @tc.desc Verify copying Set<string>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["hello", "world"]);
      let set2: Set<string> = new Set<string>(set1);
      expect(set2.size).assertEqual(2);
      expect(set2.has("hello")).assertTrue();
      expect(set2.has("world")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_0900
     * @tc.desc Verify copying Set<boolean>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<boolean> = new Set<boolean>([true, false]);
      let set2: Set<boolean> = new Set<boolean>(set1);
      expect(set2.size).assertEqual(2);
      expect(set2.has(true)).assertTrue();
      expect(set2.has(false)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_1000
     * @tc.desc Verify copying Set with custom object type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Person010 = new Person010("Alice", 20);
      let p2: Person010 = new Person010("Bob", 25);
      let set1: Set<Person010> = new Set<Person010>([p1, p2]);
      let set2: Set<Person010> = new Set<Person010>(set1);
      expect(set2.size).assertEqual(2);
      expect(set2.has(p1)).assertTrue();
      expect(set2.has(p2)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_1100
     * @tc.desc Verify copying Set with number boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<number> = new Set<number>([0, -1, 2147483647, -2147483648, Number.MAX_VALUE, Number.MIN_VALUE]);
      let set2: Set<number> = new Set<number>(set1);
      expect(set2.size).assertEqual(set1.size);
      expect(set2.has(0)).assertTrue();
      expect(set2.has(Number.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_1200
     * @tc.desc Verify copying Set with special character strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["", " ", "​", "中文", "😀"]);
      let set2: Set<string> = new Set<string>(set1);
      expect(set2.size).assertEqual(set1.size);
      expect(set2.has("")).assertTrue();
      expect(set2.has("中文")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_1300
     * @tc.desc Verify constructor with null expects exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<string> = new Set<string>(null as Object as Set<string>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor2014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_1400
     * @tc.desc Verify constructor with undefined expects exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<string> = new Set<string>(undefined as Object as Set<string>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor2015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_1500
     * @tc.desc Verify constructor with array type (not Set) type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<string> = new Set<string>(["a", "b"] as Object as Set<string>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor2016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_1600
     * @tc.desc Verify constructor with number value (not Set) type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<string> = new Set<string>(123 as Object as Set<string>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor2017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_1700
     * @tc.desc Verify constructor with string value (not Set) type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<string> = new Set<string>("abc" as Object as Set<string>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor2018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_1800
     * @tc.desc Verify constructor with plain object (not Set) type mismatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = Error("plain object");
        let set: Set<string> = new Set<string>(obj as Object as Set<string>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor2019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_1900
     * @tc.desc Verify return value is a new Set instance with same content as original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["a", "b", "c"]);
      let set2: Set<string> = new Set<string>(set1);
      expect(set2.size).assertEqual(3);
      expect(set2.has("a")).assertTrue();
      expect(set2.has("b")).assertTrue();
      expect(set2.has("c")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_2000
     * @tc.desc Verify all elements in new Set match original Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<number> = new Set<number>([10, 20, 30, 40, 50]);
      let set2: Set<number> = new Set<number>(set1);
      set1.forEach((value: number): void => {
        expect(set2.has(value)).assertTrue();
      });
      set2.forEach((value: number): void => {
        expect(set1.has(value)).assertTrue();
      });
    });

    /**
     * @tc.name testSetConstructor2021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_2100
     * @tc.desc Verify copy of deduplicated source Set also deduplicated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<number> = new Set<number>([1, 1, 2, 2, 3]);
      expect(set1.size).assertEqual(3);
      let set2: Set<number> = new Set<number>(set1);
      expect(set2.size).assertEqual(3);
    });

    /**
     * @tc.name testSetConstructor2022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_2200
     * @tc.desc Verify return value type is correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["test"]);
      let set2: Set<string> = new Set<string>(set1);
      expect(set2 instanceof Set).assertTrue();
      expect(set2.has("test")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_2300
     * @tc.desc Verify new Set is a different instance from original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["a", "b"]);
      let set2: Set<string> = new Set<string>(set1);
      expect(set1 === set2).assertFalse();
    });

    /**
     * @tc.name testSetConstructor2024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_2400
     * @tc.desc Verify adding element to new Set does not affect original Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["a", "b"]);
      let set2: Set<string> = new Set<string>(set1);
      set2.add("c");
      expect(set1.size).assertEqual(2);
      expect(set1.has("c")).assertFalse();
      expect(set2.size).assertEqual(3);
      expect(set2.has("c")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_2500
     * @tc.desc Verify deleting element from new Set does not affect original Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["a", "b", "c"]);
      let set2: Set<string> = new Set<string>(set1);
      set2.delete("a");
      expect(set1.size).assertEqual(3);
      expect(set1.has("a")).assertTrue();
      expect(set2.size).assertEqual(2);
      expect(set2.has("a")).assertFalse();
    });

    /**
     * @tc.name testSetConstructor2026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_2600
     * @tc.desc Verify clearing new Set does not affect original Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["a", "b"]);
      let set2: Set<string> = new Set<string>(set1);
      set2.clear();
      expect(set1.size).assertEqual(2);
      expect(set1.has("a")).assertTrue();
      expect(set2.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor2027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_2700
     * @tc.desc Verify modifying original Set does not affect new Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<string> = new Set<string>(["a", "b"]);
      let set2: Set<string> = new Set<string>(set1);
      set1.add("c");
      set1.delete("a");
      expect(set2.size).assertEqual(2);
      expect(set2.has("a")).assertTrue();
      expect(set2.has("c")).assertFalse();
    });

    /**
     * @tc.name testSetConstructor2028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_2800
     * @tc.desc Verify copying large Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<number> = new Set<number>();
      for (let i: number = 0; i < 10000; i++) {
        set1.add(i);
      }
      let set2: Set<number> = new Set<number>(set1);
      expect(set2.size).assertEqual(10000);
      expect(set2.has(0)).assertTrue();
      expect(set2.has(9999)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor2029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_2_2900
     * @tc.desc Verify large Set copy independence after modification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1: Set<number> = new Set<number>();
      for (let i: number = 0; i < 1000; i++) {
        set1.add(i);
      }
      let set2: Set<number> = new Set<number>(set1);
      set2.add(99999);
      expect(set1.size).assertEqual(1000);
      expect(set1.has(99999)).assertFalse();
      expect(set2.size).assertEqual(1001);
    });


  });
}
