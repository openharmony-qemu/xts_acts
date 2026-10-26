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
  TestType,
} from "../../../../hypium/index";
import Utils from "../Util.test";
class Point {
  x: number = 0;
  y: number = 0;
}
class Point001 {
  x: number = 0;
  y: number = 0;
}
class Point002 {
  x: number = 0;
  y: number = 0;
}
class Point003 {
  x: number = 0;
  y: number = 0;
}
class Rect {
  w: number = 0;
  h: number = 0;
  color: string = "red";
}
class Person {
  name: string = "Alice";
}
class Flag {
  ok: boolean = true;
}
class Counter {
  count: number = 0;
}
class Item {
  id: number = 1;
  tag: string = "default";
}
class Mixed {
  n: number = 1;
  s: string = 's';
  b: boolean = false;
}
class Config {
  opts: Record<string, Any> = { 'a': 1 };
}
class Handler {
  cb: () => number = (): number => 0;
}
class Cell {
  v: number = 0;
}
class A {
  v: number = 0;
}
class A001 {
  x: number = 0;
}
class B {
  y: number = 0;
}
class Base {
  base: number = 1;
}
class Child extends Base {
  child: number = 2;
}
class Pair {
  first: number = 1;
  second: number = 2;
}
class BoxTest {
  v: number = 0;
}
class Item001 {
  v: number = 0;
}
class Data {
  a: number = 1;
  b: number = 2;
}
class Point004 {
  x: number = 1;
  y: number = 2;
}
export default function objectGetOwnPropertyNamesTest2(): void {
  describe("ObjectGetOwnPropertyNamesTest2", (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0010
     * @tc.name objectGetOwnPropertyNamesTest001
     * @tc.desc Verify Object.getOwnPropertyNames returns empty array for empty record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(0);
      expect(names.includes("a")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0020
     * @tc.name objectGetOwnPropertyNamesTest002
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 name for record with single key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(1);
      expect(names[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0030
     * @tc.name objectGetOwnPropertyNamesTest003
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 0 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names1.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names2.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0040
     * @tc.name objectGetOwnPropertyNamesTest004
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const holder: Record<PropertyKey, Any> = record;
      const names: string[] = Object.getOwnPropertyNames(holder);
      let actual1: int = names.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0050
     * @tc.name objectGetOwnPropertyNamesTest005
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const names: string[] = Object.getOwnPropertyNames({});
      let actual1: int = names.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0060
     * @tc.name objectGetOwnPropertyNamesTest006
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "name" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: string = names[0]!;
      let expected1: string = "name";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0070
     * @tc.name objectGetOwnPropertyNamesTest007
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "count": 2026 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "count";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0080
     * @tc.name objectGetOwnPropertyNamesTest008
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "flag": true };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "flag";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0090
     * @tc.name objectGetOwnPropertyNamesTest009
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "list": [1, 2, 3] };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "list";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0100
     * @tc.name objectGetOwnPropertyNamesTest010
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nestedRecord: Record<string, Any> = { "deep": 1 };
      const record: Record<string, Any> = { "child": nestedRecord };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "child";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0110
     * @tc.name objectGetOwnPropertyNamesTest011
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "empty": null };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "empty";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0120
     * @tc.name objectGetOwnPropertyNamesTest012
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "fn": (x: number): number => x };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "fn";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0130
     * @tc.name objectGetOwnPropertyNamesTest013
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "_internal" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "_internal": 1 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: string = names[0]!;
      let expected1: string = "_internal";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0140
     * @tc.name objectGetOwnPropertyNamesTest014
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '': "empty-key" };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = '';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0150
     * @tc.name objectGetOwnPropertyNamesTest015
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "name" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: string = names[0]!;
      let expected1: string = "name";
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[1]!;
      let expected2: string = "year";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0160
     * @tc.name objectGetOwnPropertyNamesTest016
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "a" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: string = names[0]!;
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[1]!;
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[2]!;
      let expected3: string = 'c';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0170
     * @tc.name objectGetOwnPropertyNamesTest017
     * @tc.desc Verify Object.getOwnPropertyNames returns 5 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "k1": 1, "k2": 2, "k3": 3, "k4": 4, "k5": 5 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "k1";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[4]!;
      let expected3: string = "k5";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0180
     * @tc.name objectGetOwnPropertyNamesTest018
     * @tc.desc Verify Object.getOwnPropertyNames returns 5 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nestedRecord: Record<string, Any> = { 'x': 1 };
      const record: Record<string, Any> = { 's': "str", 'n': 1, 'b': false, "arr": [1], "obj": nestedRecord };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = 's';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[4]!;
      let expected3: string = "obj";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0190
     * @tc.name objectGetOwnPropertyNamesTest019
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "alpha": 1, "beta": 2, "gamma": 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.indexOf("alpha");
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names.indexOf("beta");
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: int = names.indexOf("gamma");
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0200
     * @tc.name objectGetOwnPropertyNamesTest020
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let visited: number = 0;
      for (let i: int = 0; i < names.length; i++) {
        visited++;
      }
      expect(visited).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0210
     * @tc.name objectGetOwnPropertyNamesTest021
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "id": 1 };
      record["id"] = 2;
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "id";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0220
     * @tc.name objectGetOwnPropertyNamesTest022
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "2026" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "2026": "year" };
      const names: string[] = Object.getOwnPropertyNames(record);
      expect(names[0]!).assertEqual("2026");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0230
     * @tc.name objectGetOwnPropertyNamesTest023
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "123": "num", "name": "str" };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0240
     * @tc.name objectGetOwnPropertyNamesTest024
     * @tc.desc Verify Object.getOwnPropertyNames returns names for record with integer-index keys and string keys (enumeration order per engine)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "123": "num", "name": "str", '7': "seven" };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: string = names[0]!;
      let expected1: string = "123";
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[1]!;
      let expected2: string = "name";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[2]!;
      let expected3: string = '7';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0250
     * @tc.name objectGetOwnPropertyNamesTest025
     * @tc.desc Verify Object.getOwnPropertyNames contains integer-index key for record with mixed keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, "456": 2, 'b': 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.indexOf("456");
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0260
     * @tc.name objectGetOwnPropertyNamesTest026
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "zebra" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "zebra": 1, "apple": 2 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: string = names[0]!;
      let expected1: string = "zebra";
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[1]!;
      let expected2: string = "apple";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0270
     * @tc.name objectGetOwnPropertyNamesTest027
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      record['c'] = 3;
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = 'b';
      expect(actual3).assertEqual(expected3);
      let actual4: string = names[2]!;
      let expected4: string = 'c';
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0280
     * @tc.name objectGetOwnPropertyNamesTest028
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      record['a'] = 99;
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = 'b';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0290
     * @tc.name objectGetOwnPropertyNamesTest029
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': '1', 'y': '2' };
      record['x'] = "changed";
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0300
     * @tc.name objectGetOwnPropertyNamesTest030
     * @tc.desc Verify Object.getOwnPropertyNames returns 4 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "userName": 1, "_id": 2, "data-source": 3, "VERSION": 4 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "userName";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = "_id";
      expect(actual3).assertEqual(expected3);
      let actual4: string = names[2]!;
      let expected4: string = "data-source";
      expect(actual4).assertEqual(expected4);
      let actual5: string = names[3]!;
      let expected5: string = "VERSION";
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0310
     * @tc.name objectGetOwnPropertyNamesTest031
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "e1" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "e1": 1, "e2": 2, "e3": 3, "e4": 4, "e5": 5 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: string = names[0]!;
      let expected1: string = "e1";
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[2]!;
      let expected2: string = "e3";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[4]!;
      let expected3: string = "e5";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0320
     * @tc.name objectGetOwnPropertyNamesTest032
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "姓名": "Alice", "年龄": 18 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "姓名";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = "年龄";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0330
     * @tc.name objectGetOwnPropertyNamesTest033
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "中文": "cn", "English": "en" };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.indexOf("中文");
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names.indexOf("English");
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0340
     * @tc.name objectGetOwnPropertyNamesTest034
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '🚀': 1, '🔥': 2 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = '🚀';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = '🔥';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0350
     * @tc.name objectGetOwnPropertyNamesTest035
     * @tc.desc Verify Object.getOwnPropertyNames lists own property names of record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
      const names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual("name");
      expect(names[1]).assertEqual("year");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0360
     * @tc.name objectGetOwnPropertyNamesTest036
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "k" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'k': 1 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const reused: string[] = names;
      let actual1: string = reused[0]!;
      let expected1: string = 'k';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0370
     * @tc.name objectGetOwnPropertyNamesTest037
     * @tc.desc Verify Object.getOwnPropertyNames returns 4 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3, 'd': 4 };
      const names: string[] = Object.getOwnPropertyNames(record);
      expect(names.length).assertEqual(4);
      expect(names[0]).assertEqual('a');
      expect(names[1]).assertEqual('b');
      expect(names[2]).assertEqual('c');
      expect(names[3]).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0380
     * @tc.name objectGetOwnPropertyNamesTest038
     * @tc.desc Verify Object.getOwnPropertyNames returns expected names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2, 'z': 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: number = 3;
      expect(actual1).assertEqual(expected1);
      expect(names[0]).assertEqual('x');
      expect(names[1]).assertEqual('y');
      expect(names[2]).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0390
     * @tc.name objectGetOwnPropertyNamesTest039
     * @tc.desc Verify Object.getOwnPropertyNames returns property name with length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names[0]!.length;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0400
     * @tc.name objectGetOwnPropertyNamesTest040
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "a,b" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: string = names.join(',');
      let expected1: string = "a,b";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0410
     * @tc.name objectGetOwnPropertyNamesTest041
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names and exact keys for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { 'a': 1, 'b': 2 };
      const names: string[] = Object.getOwnPropertyNames(o);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('a');
      expect(names[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0420
     * @tc.name objectGetOwnPropertyNamesTest042
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { 'a': 1, 'b': 2 };
      const names: string[] = Object.getOwnPropertyNames(o);
      names[0] = "modified";
      const again: string[] = Object.getOwnPropertyNames(o);
      let actual1: int = again.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      expect(again.indexOf('a')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0430
     * @tc.name objectGetOwnPropertyNamesTest043
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { 'a': 1, 'b': 2 };
      const names: string[] = Object.getOwnPropertyNames(o);
      const len: number = names.length;
      expect(len).assertEqual(2);
      expect(names[0]).assertEqual('a');
      expect(names[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0440
     * @tc.name objectGetOwnPropertyNamesTest044
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const names: string[] = Object.getOwnPropertyNames(obj);
      expect(names.length).assertEqual(0);
      expect(names.includes("x")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0450
     * @tc.name objectGetOwnPropertyNamesTest045
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 0 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: Object = new Object();
      const o2: Object = new Object();
      let actual1: int = Object.getOwnPropertyNames(o1).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = Object.getOwnPropertyNames(o2).length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0460
     * @tc.name objectGetOwnPropertyNamesTest046
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const names: string[] = Object.getOwnPropertyNames(obj);
      let actual1: int = names.indexOf("length");
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names.indexOf('0');
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0470
     * @tc.name objectGetOwnPropertyNamesTest047
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 0 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const first: string[] = Object.getOwnPropertyNames(obj);
      const second: string[] = Object.getOwnPropertyNames(obj);
      let actual1: int = first.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = second.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0480
     * @tc.name objectGetOwnPropertyNamesTest048
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 0 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual1: int = Object.getOwnPropertyNames(new Object()).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0490
     * @tc.name objectGetOwnPropertyNamesTest049
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 0 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const names: string[] = Object.getOwnPropertyNames(obj);
      names.push("fake");
      const again: string[] = Object.getOwnPropertyNames(obj);
      let actual1: int = again.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0500
     * @tc.name objectGetOwnPropertyNamesTest050
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const names: string[] = Object.getOwnPropertyNames(new Object());
      expect(names.length).assertEqual(0);
      expect(names.includes("x")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0510
     * @tc.name objectGetOwnPropertyNamesTest051
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let names: string[] = Object.getOwnPropertyNames(obj);
      let actual1: int = names.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      obj = new Object();
      names = Object.getOwnPropertyNames(obj);
      let actual2: int = names.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0520
     * @tc.name objectGetOwnPropertyNamesTest052
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const names: string[] = Object.getOwnPropertyNames(arr);
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('0');
      expect(names[1]).assertEqual('1');
      expect(names[2]).assertEqual("length");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0530
     * @tc.name objectGetOwnPropertyNamesTest053
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const names: string[] = Object.getOwnPropertyNames(arr);
      expect(names.indexOf('0')).assertEqual(0);
      expect(names.indexOf('1')).assertEqual(1);
      expect(names.indexOf("length")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0540
     * @tc.name objectGetOwnPropertyNamesTest054
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "0" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const names: string[] = Object.getOwnPropertyNames(arr);
      let actual1: string = names[0]!;
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[1]!;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0550
     * @tc.name objectGetOwnPropertyNamesTest055
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [1, 2, 3];
      const names: string[] = Object.getOwnPropertyNames(arr);
      expect(names.indexOf('0')).assertEqual(0);
      expect(names.indexOf('1')).assertEqual(1);
      expect(names.indexOf('2')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0560
     * @tc.name objectGetOwnPropertyNamesTest056
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = [];
      const names: string[] = Object.getOwnPropertyNames(arr);
      expect(names.indexOf("length")).assertEqual(0);
      let actual1: int = names.indexOf('0');
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0570
     * @tc.name objectGetOwnPropertyNamesTest057
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = [];
      const names: string[] = Object.getOwnPropertyNames(arr);
      expect(names.length).assertEqual(1);
      expect(names[0]).assertEqual("length");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0580
     * @tc.name objectGetOwnPropertyNamesTest058
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const names: string[] = Object.getOwnPropertyNames(arr);
      expect(names.indexOf('0')).assertEqual(0);
      expect(names.indexOf('1')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0590
     * @tc.name objectGetOwnPropertyNamesTest059
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false];
      const names: string[] = Object.getOwnPropertyNames(arr);
      expect(names.indexOf('0')).assertEqual(0);
      expect(names.indexOf('1')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0600
     * @tc.name objectGetOwnPropertyNamesTest060
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.5, 2.5, 3.5];
      const names: string[] = Object.getOwnPropertyNames(arr);
      expect(names.indexOf('2')).assertEqual(2);
      expect(names.indexOf("length")).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0610
     * @tc.name objectGetOwnPropertyNamesTest061
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[][] = [[1], [2]];
      const names: string[] = Object.getOwnPropertyNames(arr);
      expect(names.indexOf('0')).assertEqual(0);
      expect(names.indexOf('1')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0620
     * @tc.name objectGetOwnPropertyNamesTest062
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const names: string[] = Object.getOwnPropertyNames(arr);
      let actual1: int = names.indexOf('2');
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0630
     * @tc.name objectGetOwnPropertyNamesTest063
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point = new Point();
      const names: string[] = Object.getOwnPropertyNames(p);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0640
     * @tc.name objectGetOwnPropertyNamesTest064
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point001 = new Point001();
      const names: string[] = Object.getOwnPropertyNames(p);
      expect(names.indexOf('x')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0650
     * @tc.name objectGetOwnPropertyNamesTest065
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point002 = new Point002();
      const names: string[] = Object.getOwnPropertyNames(p);
      expect(names.indexOf('y')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0660
     * @tc.name objectGetOwnPropertyNamesTest066
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point003 = new Point003();
      const names: string[] = Object.getOwnPropertyNames(p);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      expect(names.indexOf('x')).assertEqual(0);
      expect(names.indexOf('y')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0670
     * @tc.name objectGetOwnPropertyNamesTest067
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Rect = new Rect();
      const names: string[] = Object.getOwnPropertyNames(r);
      let actual1: int = names.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0680
     * @tc.name objectGetOwnPropertyNamesTest068
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Person = new Person();
      const names: string[] = Object.getOwnPropertyNames(p);
      expect(names.indexOf("name")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0690
     * @tc.name objectGetOwnPropertyNamesTest069
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Flag = new Flag();
      const names: string[] = Object.getOwnPropertyNames(f);
      expect(names.indexOf("ok")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0700
     * @tc.name objectGetOwnPropertyNamesTest070
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Counter = new Counter();
      const names: string[] = Object.getOwnPropertyNames(c);
      expect(names.indexOf("count")).assertEqual(0);
      expect(names.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0710
     * @tc.name objectGetOwnPropertyNamesTest071
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item: Item = new Item();
      const names: string[] = Object.getOwnPropertyNames(item);
      expect(names.indexOf("tag")).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0720
     * @tc.name objectGetOwnPropertyNamesTest072
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Mixed = new Mixed();
      const names: string[] = Object.getOwnPropertyNames(m);
      let actual1: int = names.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      expect(names.indexOf('s')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0730
     * @tc.name objectGetOwnPropertyNamesTest073
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Config = new Config();
      const names: string[] = Object.getOwnPropertyNames(c);
      expect(names.indexOf("opts")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0740
     * @tc.name objectGetOwnPropertyNamesTest074
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const h: Handler = new Handler();
      const names: string[] = Object.getOwnPropertyNames(h);
      expect(names.indexOf("cb")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0750
     * @tc.name objectGetOwnPropertyNamesTest075
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cells: Cell[] = [new Cell(), new Cell()];
      const names: string[] = Object.getOwnPropertyNames(cells[0]);
      expect(names.indexOf('v')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0760
     * @tc.name objectGetOwnPropertyNamesTest076
     * @tc.desc Verify Object.getOwnPropertyNames lists own property names of record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: A = new A();
      const names: string[] = Object.getOwnPropertyNames(a);
      let actual1: int = names.indexOf('v');
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0770
     * @tc.name objectGetOwnPropertyNamesTest077
     * @tc.desc Verify Object.getOwnPropertyNames excludes absent keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: A001 = new A001();
      const b: B = new B();
      const na: string[] = Object.getOwnPropertyNames(a);
      const nb: string[] = Object.getOwnPropertyNames(b);
      expect(na.indexOf('x')).assertEqual(0);
      let actual1: int = na.indexOf('y');
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
      expect(nb.indexOf('y')).assertEqual(0);
      let actual2: int = nb.indexOf('x');
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0780
     * @tc.name objectGetOwnPropertyNamesTest078
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Child = new Child();
      const names: string[] = Object.getOwnPropertyNames(c);
      expect(names.indexOf("base")).assertEqual(0);
      expect(names.indexOf("child")).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0790
     * @tc.name objectGetOwnPropertyNamesTest079
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "first" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Pair = new Pair();
      const names: string[] = Object.getOwnPropertyNames(p);
      let actual1: string = names[0]!;
      let expected1: string = "first";
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[1]!;
      let expected2: string = "second";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0800
     * @tc.name objectGetOwnPropertyNamesTest080
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: BoxTest = new BoxTest();
      b.v = 100;
      const names: string[] = Object.getOwnPropertyNames(b);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      expect(names.indexOf('v')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0810
     * @tc.name objectGetOwnPropertyNamesTest081
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 1 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i1: Item001 = new Item001();
      const i2: Item001 = new Item001();
      const n1: string[] = Object.getOwnPropertyNames(i1);
      const n2: string[] = Object.getOwnPropertyNames(i2);
      let actual1: int = n1.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: int = n2.length;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0820
     * @tc.name objectGetOwnPropertyNamesTest082
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Data = new Data();
      const names: string[] = Object.getOwnPropertyNames(d);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual("a");
      expect(names[1]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0830
     * @tc.name objectGetOwnPropertyNamesTest083
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { 'a': 1 };
      const names: string[] = Object.getOwnPropertyNames(o);
      expect(names.indexOf('a')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0840
     * @tc.name objectGetOwnPropertyNamesTest084
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nestedRecord: Record<string, Any> = { 'x': 1 };
      const o: Record<string, Any> = { "nested": nestedRecord };
      const names: string[] = Object.getOwnPropertyNames(o);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      expect(names.indexOf("nested")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0850
     * @tc.name objectGetOwnPropertyNamesTest085
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { "name": "tom" };
      const names: string[] = Object.getOwnPropertyNames(o);
      expect(names.indexOf("name")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0860
     * @tc.name objectGetOwnPropertyNamesTest086
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { "list": [1, 2] };
      const names: string[] = Object.getOwnPropertyNames(o);
      expect(names.indexOf("list")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0870
     * @tc.name objectGetOwnPropertyNamesTest087
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 1 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: Record<string, Any> = { 'a': 1 };
      const o2: Record<string, Any> = { 'a': 999 };
      const n1: string[] = Object.getOwnPropertyNames(o1);
      let actual1: int = n1.length;
      let expected1: number = 1;
      expect(actual1).assertEqual(expected1);
      expect(n1.indexOf('a')).assertEqual(0);
      const n2: string[] = Object.getOwnPropertyNames(o2);
      expect(n2.length).assertEqual(1);
      expect(n2[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0880
     * @tc.name objectGetOwnPropertyNamesTest088
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { "_private": 1, "key_2": 2 };
      const names: string[] = Object.getOwnPropertyNames(o);
      expect(names.indexOf("_private")).assertEqual(0);
      expect(names.indexOf("key_2")).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0890
     * @tc.name objectGetOwnPropertyNamesTest089
     * @tc.desc Verify Object.getOwnPropertyNames excludes pushed "fake" key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const names: string[] = Object.getOwnPropertyNames(arr);
      names.push("fake");
      const again: string[] = Object.getOwnPropertyNames(arr);
      let actual1: int = again.indexOf("fake");
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
      expect(again.indexOf('0')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0900
     * @tc.name objectGetOwnPropertyNamesTest090
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 0 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Object = new Object();
      const filled: Record<string, Any> = { 'a': 1 };
      const n1: string[] = Object.getOwnPropertyNames(empty);
      const n2: string[] = Object.getOwnPropertyNames(filled);
      expect(n1.length).assertEqual(0);
      expect(n2.length).assertEqual(1);
      expect(n2[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0910
     * @tc.name objectGetOwnPropertyNamesTest091
     * @tc.desc Verify Object.getOwnPropertyNames lists own property names of record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const arr: int[] = [1];
      const o2: Record<string, Any> = { 'a': 1 };
      const n1: string[] = Object.getOwnPropertyNames(obj);
      const n2: string[] = Object.getOwnPropertyNames(arr);
      expect(n2.length).assertEqual(2);
      const n3: string[] = Object.getOwnPropertyNames(o2);
      let actual1: int = n1.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = n3.indexOf('a');
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0920
     * @tc.name objectGetOwnPropertyNamesTest092
     * @tc.desc Verify Object.getOwnPropertyNames returned array is mutable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { 'a': 1 };
      let names: string[] = Object.getOwnPropertyNames(o);
      names.push("extra");
      expect(names.indexOf("extra")).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0930
     * @tc.name objectGetOwnPropertyNamesTest093
     * @tc.desc Verify Object.getOwnPropertyNames lists own property names of record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const o: Record<string, Any> = { 'a': 1 };
      const nArr: string[] = Object.getOwnPropertyNames(arr);
      const nObj: string[] = Object.getOwnPropertyNames(o);
      expect(nArr.indexOf('0')).assertEqual(0);
      expect(nObj.indexOf('a')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0940
     * @tc.name objectGetOwnPropertyNamesTest094
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { 'a': 1, 'b': 2 };
      const names: string[] = Object.getOwnPropertyNames(o);
      let found: number = 0;
      for (let i: int = 0; i < names.length; i++) {
        if (names[i] === 'a' || names[i] === 'b') {
          found++;
        }
      }
      expect(found).assertEqual(2);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0950
     * @tc.name objectGetOwnPropertyNamesTest095
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "x" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 10, 'y': 20 };
      const names1: string[] = Object.getOwnPropertyNames(record);
      const ref: Object = record;
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: string = names1[0]!;
      let expected1: string = 'x';
      expect(actual1).assertEqual(expected1);
      let actual2: string = names2[0]!;
      let expected2: string = 'x';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0960
     * @tc.name objectGetOwnPropertyNamesTest096
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '': "empty", "name": "ArkTS" };
      const names1: string[] = Object.getOwnPropertyNames(record);
      const ref: Object = record;
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: string = names1[0]!;
      let expected1: string = '';
      expect(actual1).assertEqual(expected1);
      let actual2: string = names2[0]!;
      let expected2: string = '';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names1[1]!;
      let expected3: string = "name";
      expect(actual3).assertEqual(expected3);
      let actual4: string = names2[1]!;
      let expected4: string = "name";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0970
     * @tc.name objectGetOwnPropertyNamesTest097
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "姓名": "Alice", "年龄": 18 };
      const names1: string[] = Object.getOwnPropertyNames(record);
      const ref: Object = record;
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: int = names1.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names1[0]!;
      let expected2: string = "姓名";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names2[1]!;
      let expected3: string = "年龄";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0980
     * @tc.name objectGetOwnPropertyNamesTest098
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "data-source" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "data-source": 1, "my key": 2 };
      const names1: string[] = Object.getOwnPropertyNames(record);
      const ref: Object = record;
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: string = names1[0]!;
      let expected1: string = "data-source";
      expect(actual1).assertEqual(expected1);
      let actual2: string = names2[0]!;
      let expected2: string = "data-source";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names1[1]!;
      let expected3: string = "my key";
      expect(actual3).assertEqual(expected3);
      let actual4: string = names2[1]!;
      let expected4: string = "my key";
      expect(actual4).assertEqual(expected4);
    });
  });
}
