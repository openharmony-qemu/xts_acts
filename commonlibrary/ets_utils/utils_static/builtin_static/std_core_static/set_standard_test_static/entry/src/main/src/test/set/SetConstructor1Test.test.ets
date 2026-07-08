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

class Person015 {
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}

class Obj034 {
  key: string = "value";
}

class Item016 {
  id: number;

  constructor(id: number) {
    this.id = id;
  }
}

export default function SetConstructor1Test(): void {
  describe('SetConstructor1Test', (): void => {
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
     * @tc.name testSetConstructor1001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_0100
     * @tc.desc Verify constructor with no parameters creates empty Set instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor1002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_0200
     * @tc.desc Verify constructor with elements parameter using iterable object to initialize Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b"]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetConstructor1003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_0300
     * @tc.desc Verify constructor with no parameters creates empty Set usable for boolean type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>();
      expect(set.size).assertEqual(0);
      set.add(true);
      expect(set.has(true)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetConstructor1004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_0400
     * @tc.desc Verify constructor with explicit null creates empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(null);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor1005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_0500
     * @tc.desc Verify constructor with empty array creates empty Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>([]);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor1006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_0600
     * @tc.desc Verify constructor with string array iterable, Set contains all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b", "c"]);
      expect(set.size).assertEqual(3);
      expect(set.has("a")).assertTrue();
      expect(set.has("b")).assertTrue();
      expect(set.has("c")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_0700
     * @tc.desc Verify constructor with number type iterable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 2, 3]);
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_0800
     * @tc.desc Verify constructor with duplicate elements in array, Set deduplicates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 2, 2, 3, 3, 3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetConstructor1009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_0900
     * @tc.desc Verify constructor passing another Set instance as iterable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1 = new Set<string>(["x", "y"]);
      let set2 = new Set<string>(set1);
      expect(set2.size).assertEqual(2);
      expect(set2.has("x")).assertTrue();
      expect(set2.has("y")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_1000
     * @tc.desc Verify constructor with Unicode/multi-language character array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["中文", "日本語", "한국어", "test"]);
      expect(set.size).assertEqual(4);
      expect(set.has("中文")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_1100
     * @tc.desc Verify constructor with array containing empty strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["", "a", " "]);
      expect(set.size).assertEqual(3);
      expect(set.has("")).assertTrue();
      expect(set.has(" ")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_1200
     * @tc.desc Verify constructor with special character strings including XSS and escape chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["<script>alert(1)</script>", "\t", "\n", "​"]);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testSetConstructor1013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_1300
     * @tc.desc Verify constructor with boolean type iterable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, false]);
      expect(set.size).assertEqual(2);
      expect(set.has(true)).assertTrue();
      expect(set.has(false)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_1400
     * @tc.desc Verify constructor with duplicate boolean values, validate deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, true, false, false]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetConstructor1015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_1500
     * @tc.desc Verify constructor with object reference array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1 = new Person015("Alice");
      let p2 = new Person015("Bob");
      let set = new Set<Person015>([p1, p2]);
      expect(set.size).assertEqual(2);
      expect(set.has(p1)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_1600
     * @tc.desc Verify constructor with array containing same object reference, validate deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item = new Item016(1);
      let set = new Set<Item016>([item, item, item]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetConstructor1017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_1700
     * @tc.desc Verify constructor with number boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([0, -1, Number.MAX_VALUE, Number.MIN_VALUE]);
      expect(set.size).assertEqual(4);
      expect(set.has(0)).assertTrue();
      expect(set.has(-1)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_1800
     * @tc.desc Verify constructor with array containing null elements (union type)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | null>(["a", null, "b"]);
      expect(set.size).assertEqual(3);
      expect(set.has(null)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_1900
     * @tc.desc Verify constructor with mismatched type, passing number to string generic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(123 as Object as Iterable<string>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor1020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_2000
     * @tc.desc Verify constructor with illegal boolean as parameter, validate type check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<number>(true as Object as Iterable<number>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor1021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_2100
     * @tc.desc Verify constructor with non-iterable Error object passed to elements parameter, validate type check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<number>(Error("not iterable") as Object as Iterable<number>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor1022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_2200
     * @tc.desc Verify constructor with array returns Set containing all array elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b"]);
      expect(set.size).assertEqual(2);
      expect(set.has("a")).assertTrue();
      expect(set.has("b")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_2300
     * @tc.desc Verify constructor with existing Set returns new independent Set instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1 = new Set<number>([1, 2, 3]);
      let set2 = new Set<number>(set1);
      expect(set2 === set1).assertFalse();
      expect(set2.size).assertEqual(set1.size);
    });

    /**
     * @tc.name testSetConstructor1024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_2400
     * @tc.desc Verify add duplicate elements does not increase size after construction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([1, 2, 3]);
      expect(set.size).assertEqual(3);
      set.add(2);
      set.add(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetConstructor1025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_2500
     * @tc.desc Verify constructor with empty array returns empty Set instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([]);
      expect(set instanceof Set).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetConstructor1026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_2600
     * @tc.desc Verify Iterable constructor with single-element string array creates one-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["only"]);
      expect(set.size).assertEqual(1);
      expect(set.has("only")).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_2700
     * @tc.desc Verify constructor with array containing NaN, NaN treated as valid element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([Number.NaN, 1, 2]);
      expect(set.size).assertEqual(3);
      expect(set.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_2800
     * @tc.desc Verify 0 and -0 are treated as the same value in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([0, -0]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetConstructor1029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_2900
     * @tc.desc Verify constructor return value is a Set instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a"]);
      let isSet = set instanceof Set;
      expect(isSet).assertTrue();
      expect(set.has("a")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetConstructor1030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_3000
     * @tc.desc Verify Set<string> element type is string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["hello"]);
      set.forEach((value: string): void => {
        let t: string = typeof value;
        expect(t).assertEqual("string");
      });
    });

    /**
     * @tc.name testSetConstructor1031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_3100
     * @tc.desc Verify Set<number> element type is number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>([42]);
      set.forEach((value: number): void => {
        let t: string = typeof value;
        expect(t).assertEqual("number");
      });
    });

    /**
     * @tc.name testSetConstructor1032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_3200
     * @tc.desc Verify Set<Object> element is object reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Obj034();
      let set = new Set<Object>([obj]);
      set.forEach((value: Object): void => {
        expect(value instanceof Obj034).assertTrue();
      });
    });

    /**
     * @tc.name testSetConstructor1033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_3300
     * @tc.desc Verify size property type is int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b"]);
      let sizeType: string = typeof set.size;
      expect(sizeType).assertEqual("int");
    });

    /**
     * @tc.name testSetConstructor1034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_3400
     * @tc.desc Verify constructor with large array, validate performance and correctness
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push("item_" + i.toString());
      }
      let set = new Set<string>(arr);
      expect(set.size).assertEqual(10000);
    });

    /**
     * @tc.name testSetConstructor1035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_3500
     * @tc.desc Verify constructor with many duplicates, validate deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i % 100);
      }
      let set = new Set<number>(arr);
      expect(set.size).assertEqual(100);
    });

    /**
     * @tc.name testSetConstructor1036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_3600
     * @tc.desc Verify constructor with all identical elements, Set size is 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push("same");
      }
      let set = new Set<string>(arr);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetConstructor1037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_3700
     * @tc.desc Verify constructor with very long string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = LONG_STR;
      let set = new Set<string>([longStr]);
      expect(set.size).assertEqual(1);
      expect(set.has(longStr)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_3800
     * @tc.desc Verify Iterable constructor with union type Set<string | number> combining string and number elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | number>(["a", 1, "b", 2]);
      expect(set.size).assertEqual(4);
      expect(set.has("a")).assertTrue();
      expect(set.has(1)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_3900
     * @tc.desc Verify constructor with number type instead of iterable, validate type error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(42 as Object as Iterable<string>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor1040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_4000
     * @tc.desc Verify constructor with non-iterable Error object instead of iterable, validate type error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = Error("non-iterable object");
        let set = new Set<string>(obj as Iterable<string>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor1041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_4100
     * @tc.desc Verify constructor with array containing undefined elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | undefined>(["a", undefined, "b"]);
      expect(set.size).assertEqual(3);
      expect(set.has(undefined)).assertTrue();
    });

    /**
     * @tc.name testSetConstructor1042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_4200
     * @tc.desc Verify constructor with multiple undefined elements, validate deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | undefined>([undefined, undefined, "a"]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetConstructor1043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_4300
     * @tc.desc Verify constructor with multiple null elements, validate deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | null>([null, null, "a"]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetConstructor1044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_4400
     * @tc.desc Verify try-catch catches constructor exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(-1 as Object as Iterable<string>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor1045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_4500
     * @tc.desc Verify Iterable constructor type mismatch caught error has ClassCastError name
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set = new Set<string>(false as Object as Iterable<string>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetConstructor1046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_4600
     * @tc.desc Verify no residual Set instance after construction failure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<string> | null = null;
      try {
        let err: Object = Error("symbol not available");
        set = new Set<string>(err as Iterable<string>);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
      expect(set).assertNull();
    });

    /**
     * @tc.name testSetConstructor1047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_4700
     * @tc.desc Verify constructor with FixedArray<int> initializes Set with all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3];
      let set = new Set<int>(arr);
      expect(set.size).assertEqual(3);
      expect(set.has(2)).assertTrue();
      expect(set.has(4)).assertFalse();
    });

    /**
     * @tc.name testSetConstructor1048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR_1_4800
     * @tc.desc Verify constructor with FixedArray of Item016 initializes Set of Item016
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetConstructor1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new Item016(1);
      let item2 = new Item016(2);
      let arr: FixedArray<Item016> = [item1, item2];
      let set = new Set<Item016>(arr);
      expect(set.size).assertEqual(2);
      expect(set.has(item1)).assertTrue();
      expect(set.has(item2)).assertTrue();
    });
  });
}
