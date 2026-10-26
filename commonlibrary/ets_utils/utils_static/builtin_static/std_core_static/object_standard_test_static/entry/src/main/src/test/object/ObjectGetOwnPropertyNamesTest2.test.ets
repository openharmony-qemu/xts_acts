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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_0990
     * @tc.name objectGetOwnPropertyNamesTest099
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 1 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nestedRecord: Record<string, Any> = { "inner": 1 };
      const record: Record<string, Any> = { "outer": nestedRecord };
      const names1: string[] = Object.getOwnPropertyNames(record);
      const ref: Object = record;
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: int = names1.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names1[0]!;
      let expected2: string = "outer";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names2[0]!;
      let expected3: string = "outer";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1000
     * @tc.name objectGetOwnPropertyNamesTest100
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "gap": undefined, "keep": 1 };
      const names1: string[] = Object.getOwnPropertyNames(record);
      const ref: Object = record;
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: int = names1.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names2.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: string = names1[0]!;
      let expected3: string = "gap";
      expect(actual3).assertEqual(expected3);
      let actual4: string = names2[0]!;
      let expected4: string = "gap";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1010
     * @tc.name objectGetOwnPropertyNamesTest101
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "empty": null, "full": 2 };
      const names1: string[] = Object.getOwnPropertyNames(record);
      const ref: Object = record;
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: int = names1.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names2.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: int = names1.indexOf("empty");
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: int = names2.indexOf("empty");
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1020
     * @tc.name objectGetOwnPropertyNamesTest102
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "a" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const ref: Object = record;
      const n1: string[] = Object.getOwnPropertyNames(record);
      const n2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: string = n1[0]!;
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = n2[1]!;
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
      let actual3: string = n1[2]!;
      let expected3: string = 'c';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1030
     * @tc.name objectGetOwnPropertyNamesTest103
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const ref: Object = record;
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(ref);
      names1.push("fake");
      let actual1: int = names1.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names2.length;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: string = names2[0]!;
      let expected3: string = 'a';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1040
     * @tc.name objectGetOwnPropertyNamesTest104
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "x,y,z" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2, 'z': 3 };
      const ref: Object = record;
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: string = names1.join(',');
      let expected1: string = "x,y,z";
      expect(actual1).assertEqual(expected1);
      let actual2: string = names2.join(',');
      let expected2: string = "x,y,z";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1050
     * @tc.name objectGetOwnPropertyNamesTest105
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, Any> = { 'm': 1, 'n': 2 };
      const r2: Record<string, Any> = {};
      r2['m'] = 1;
      r2['n'] = 2;
      const n1: string[] = Object.getOwnPropertyNames(r1);
      let actual1: int = n1.length;
      let expected1: number = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = n1[0]!;
      let expected2: string = 'm';
      expect(actual2).assertEqual(expected2);
      let actual3: string = n1[1]!;
      let expected3: string = 'n';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1060
     * @tc.name objectGetOwnPropertyNamesTest106
     * @tc.desc Verify Object.getOwnPropertyNames returns 4 names (3 indices plus length) for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['p', 'q', 'r'];
      const names: string[] = Object.getOwnPropertyNames(arr);
      let actual1: int = names.length;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = '1';
      expect(actual3).assertEqual(expected3);
      let actual4: string = names[3]!;
      let expected4: string = "length";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1070
     * @tc.name objectGetOwnPropertyNamesTest107
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "0" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      const names: string[] = Object.getOwnPropertyNames(arr);
      let actual1: string = names[0]!;
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[1]!;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[2]!;
      let expected3: string = '2';
      expect(actual3).assertEqual(expected3);
      let actual4: string = names[3]!;
      let expected4: string = "length";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1080
     * @tc.name objectGetOwnPropertyNamesTest108
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = [];
      const names: string[] = Object.getOwnPropertyNames(arr);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "length";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1090
     * @tc.name objectGetOwnPropertyNamesTest109
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<Array<number>> = [[1], [2]];
      const names: string[] = Object.getOwnPropertyNames(arr);
      let actual1: int = names.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = '1';
      expect(actual3).assertEqual(expected3);
      let actual4: string = names[2]!;
      let expected4: string = "length";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1100
     * @tc.name objectGetOwnPropertyNamesTest110
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const obj: Record<string, Any> = { '0': 'a', '1': 'b', "length": 2 };
      const names1: string[] = Object.getOwnPropertyNames(arr);
      const names2: string[] = Object.getOwnPropertyNames(obj);
      let actual1: int = names1.length;
      let expected1: number = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names1[0]!;
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names1[1]!;
      let expected3: string = '1';
      expect(actual3).assertEqual(expected3);
      let actual4: string = names1[2]!;
      let expected4: string = "length";
      expect(actual4).assertEqual(expected4);
      expect(names2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1110
     * @tc.name objectGetOwnPropertyNamesTest111
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrS: Array<string> = ['a', 'b'];
      const arrN: number[] = [1, 2];
      const names1: string[] = Object.getOwnPropertyNames(arrS);
      let actual1: int = names1.length;
      let expected1: number = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names1[0]!;
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names1[2]!;
      let expected3: string = "length";
      expect(actual3).assertEqual(expected3);
      expect(arrN.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1120
     * @tc.name objectGetOwnPropertyNamesTest112
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "0" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const names1: string[] = Object.getOwnPropertyNames(arr);
      let actual1: string = names1[0]!;
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = names1[1]!;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names1[2]!;
      let expected3: string = "length";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1130
     * @tc.name objectGetOwnPropertyNamesTest113
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      arr[0] = 'z';
      const names: string[] = Object.getOwnPropertyNames(arr);
      let actual1: int = names.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[2]!;
      let expected3: string = "length";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1140
     * @tc.name objectGetOwnPropertyNamesTest114
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const ref: Object = record;
      record['b'] = 2;
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: int = names1.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names1.indexOf('b');
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: int = names2.indexOf('b');
      let expected3: int = 1;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1150
     * @tc.name objectGetOwnPropertyNamesTest115
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const ref: Object = record;
      record['a'] = 99;
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: int = names1.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names1[0]!;
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names2[0]!;
      let expected3: string = 'a';
      expect(actual3).assertEqual(expected3);
      let actual4: string = names2[1]!;
      let expected4: string = 'b';
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1160
     * @tc.name objectGetOwnPropertyNamesTest116
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 1 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const names: string[] = Object.getOwnPropertyNames(record);
      names.push("fake");
      const again: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = again.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: int = again.indexOf("fake");
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1170
     * @tc.name objectGetOwnPropertyNamesTest117
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const ref: Object = record;
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: int = names1.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names2.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1180
     * @tc.name objectGetOwnPropertyNamesTest118
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "a" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      let ref: Object = record;
      const names1: string[] = Object.getOwnPropertyNames(ref);
      const newRec: Record<string, Any> = { 'b': 2 };
      ref = newRec;
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: string = names1[0]!;
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = names2[0]!;
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1190
     * @tc.name objectGetOwnPropertyNamesTest119
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const keys: string[] = Object.keys(record);
      let actual1: int = names.length;
      let expected1: number = 3;
      expect(actual1).assertEqual(expected1);
      expect(keys.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1200
     * @tc.name objectGetOwnPropertyNamesTest120
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "x" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 10, 'y': 20 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const keys: string[] = Object.keys(record);
      let actual1: string = names[0]!;
      let expected1: string = 'x';
      expect(actual1).assertEqual(expected1);
      expect(keys[0]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1210
     * @tc.name objectGetOwnPropertyNamesTest121
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "a" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const keys: string[] = Object.keys(record);
      let actual1: string = names[0]!;
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[1]!;
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1220
     * @tc.name objectGetOwnPropertyNamesTest122
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "k1,k2,k3" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "k1": 1, "k2": 2, "k3": 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const keys: string[] = Object.keys(record);
      let actual1: string = names.join(',');
      let expected1: string = "k1,k2,k3";
      expect(actual1).assertEqual(expected1);
      expect(keys.join(',')).assertEqual("k1,k2,k3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1230
     * @tc.name objectGetOwnPropertyNamesTest123
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "名字": "ArkTS", "版本": "1.2" };
      const names: string[] = Object.getOwnPropertyNames(record);
      const keys: string[] = Object.keys(record);
      let actual1: int = names.length;
      let expected1: number = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "名字";
      expect(actual2).assertEqual(expected2);
      let actual3: string = keys[1]!;
      let expected3: string = "版本";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1240
     * @tc.name objectGetOwnPropertyNamesTest124
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 0 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const ref: Object = record;
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(ref);
      const keys: string[] = Object.keys(record);
      let actual1: int = names1.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names2.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: int = keys.length;
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1250
     * @tc.name objectGetOwnPropertyNamesTest125
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = {};
      const names: string[] = Object.getOwnPropertyNames(obj);
      const keys: string[] = Object.keys(obj);
      let actual1: int = names.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = keys.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1260
     * @tc.name objectGetOwnPropertyNamesTest126
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const keys: string[] = Object.keys(record);
      let hit: number = 0;
      for (const key of keys) {
        if (names.indexOf(key) !== -1) {
          hit++;
        }
      }
      expect(hit).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1270
     * @tc.name objectGetOwnPropertyNamesTest127
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "a" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const keys: string[] = Object.keys(record);
      let actual1: string = names[0]!;
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1280
     * @tc.name objectGetOwnPropertyNamesTest128
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const names: string[] = Object.getOwnPropertyNames(arr);
      const keys: string[] = Object.keys(arr);
      let actual1: int = names.indexOf("length");
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = keys.indexOf("length");
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1290
     * @tc.name objectGetOwnPropertyNamesTest129
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const names: string[] = Object.getOwnPropertyNames(arr);
      const keys: string[] = Object.keys(arr);
      let actual1: int = names.length - keys.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[keys.length]!;
      let expected2: string = "length";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1300
     * @tc.name objectGetOwnPropertyNamesTest130
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = [];
      const names: string[] = Object.getOwnPropertyNames(arr);
      const keys: string[] = Object.keys(arr);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "length";
      expect(actual2).assertEqual(expected2);
      let actual3: int = keys.length;
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1310
     * @tc.name objectGetOwnPropertyNamesTest131
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["hidden"] = 1;
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "hidden";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1320
     * @tc.name objectGetOwnPropertyNamesTest132
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "shown" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["shown"] = 2;
      const names: string[] = Object.getOwnPropertyNames(record);
      const keys: string[] = Object.keys(record);
      let actual1: string = names[0]!;
      let expected1: string = "shown";
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = "shown";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1330
     * @tc.name objectGetOwnPropertyNamesTest133
     * @tc.desc Verify Object.getOwnPropertyNames returns 4 names for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const names: string[] = Object.getOwnPropertyNames(arr);
      let actual1: int = names.length;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[3]!;
      let expected2: string = "length";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1340
     * @tc.name objectGetOwnPropertyNamesTest134
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const vals: Any[] = Object.values(record);
      let actual1: int = names.length;
      let expected1: number = 3;
      expect(actual1).assertEqual(expected1);
      expect(vals.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1350
     * @tc.name objectGetOwnPropertyNamesTest135
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "x" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 10, 'y': 20 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const vals: Any[] = Object.values(record);
      let actual1: string = names[0]!;
      let expected1: string = 'x';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${vals[0]!}`;
      let expected2: string = `${10}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = 'y';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${vals[1]!}`;
      let expected4: string = `${20}`;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1360
     * @tc.name objectGetOwnPropertyNamesTest136
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "\u59d3\u540d" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "姓名": "Alice", "年龄": 18 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const vals: Any[] = Object.values(record);
      let actual1: string = names[0]!;
      let expected1: string = "姓名";
      expect(actual1).assertEqual(expected1);
      let actual2: string = vals[0]! as string;
      let expected2: string = "Alice";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = "年龄";
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${vals[1]!}`;
      let expected4: string = `${18}`;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1370
     * @tc.name objectGetOwnPropertyNamesTest137
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const names: string[] = Object.getOwnPropertyNames(record);
      const vals: Any[] = Object.values(record);
      let actual1: int = names.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = vals.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1380
     * @tc.name objectGetOwnPropertyNamesTest138
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = {};
      const names: string[] = Object.getOwnPropertyNames(obj);
      const vals: Any[] = Object.values(obj);
      let actual1: int = names.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = vals.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1390
     * @tc.name objectGetOwnPropertyNamesTest139
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "0" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const names: string[] = Object.getOwnPropertyNames(arr);
      const vals: Any[] = Object.values(arr);
      let actual1: string = names[0]!;
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = vals[0]! as string;
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = '1';
      expect(actual3).assertEqual(expected3);
      let actual4: string = vals[1]! as string;
      let expected4: string = 'b';
      expect(actual4).assertEqual(expected4);
      let actual5: string = names[2]!;
      let expected5: string = "length";
      expect(actual5).assertEqual(expected5);
      let actual6: int = vals.length;
      let expected6: int = 2;
      expect(actual6).assertEqual(expected6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1400
     * @tc.name objectGetOwnPropertyNamesTest140
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "1" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const vals: Any[] = Object.values(record);
      let actual1: string = `${record[names[0]]!}`;
      let expected1: string = `1`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${record[names[1]]!}`;
      let expected2: string = `2`;
      expect(actual2).assertEqual(expected2);
      expect(vals.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1410
     * @tc.name objectGetOwnPropertyNamesTest141
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const entries = Object.entries(record);
      let actual1: int = names.length;
      let expected1: number = 3;
      expect(actual1).assertEqual(expected1);
      expect(entries.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1420
     * @tc.name objectGetOwnPropertyNamesTest142
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "x" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 10, 'y': 20 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const entries = Object.entries(record);
      let actual1: string = entries[0]![0];
      let expected1: string = 'x';
      expect(actual1).assertEqual(expected1);
      expect(names[0]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1430
     * @tc.name objectGetOwnPropertyNamesTest143
     * @tc.desc Verify Object.entries and Object.values return value 10 and length 2 for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 10, 'y': 20 };
      const entries = Object.entries(record);
      const vals: Any[] = Object.values(record);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = `10`;
      expect(actual1).assertEqual(expected1);
      expect(vals.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1440
     * @tc.name objectGetOwnPropertyNamesTest144
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const entries = Object.entries(record);
      let actual1: int = names.indexOf(entries[0]![0]);
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names.indexOf(entries[1]![0]);
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1450
     * @tc.name objectGetOwnPropertyNamesTest145
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const names: string[] = Object.getOwnPropertyNames(record);
      const entries = Object.entries(record);
      let actual1: int = names.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = entries.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1460
     * @tc.name objectGetOwnPropertyNamesTest146
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const names: string[] = Object.getOwnPropertyNames(arr);
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = '1';
      expect(actual3).assertEqual(expected3);
      let actual4: string = names[2]!;
      let expected4: string = "length";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1470
     * @tc.name objectGetOwnPropertyNamesTest147
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with "\u540d\u5b57" elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "名字": "ArkTS" };
      const names: string[] = Object.getOwnPropertyNames(record);
      const entries = Object.entries(record);
      let actual1: string = names[0]!;
      let expected1: string = "名字";
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "名字";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1480
     * @tc.name objectGetOwnPropertyNamesTest148
     * @tc.desc Verify Object.getOwnPropertyNames lists own property names of record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: boolean = record.hasOwnProperty('a');
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty('b');
      expect(actual2).assertTrue();
      let actual3: boolean = record.hasOwnProperty('c');
      expect(actual3).assertTrue();
      expect(names[0]).assertEqual('a');
      expect(names[1]).assertEqual('b');
      expect(names[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1490
     * @tc.name objectGetOwnPropertyNamesTest149
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let owned: number = 0;
      for (const key of names) {
        if (record.hasOwnProperty(key)) {
          owned++;
        }
      }
      expect(owned).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1500
     * @tc.name objectGetOwnPropertyNamesTest150
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: boolean = record.hasOwnProperty("notHere");
      expect(actual1).assertFalse();
      let actual2: int = names.indexOf("notHere");
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1510
     * @tc.name objectGetOwnPropertyNamesTest151
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const names: string[] = Object.getOwnPropertyNames(arr);
      let actual1: int = names.indexOf("length");
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = arr.hasOwnProperty("length");
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1520
     * @tc.name objectGetOwnPropertyNamesTest152
     * @tc.desc Verify Object.getOwnPropertyNames lists own property names of record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = { 'x': 1, 'y': 2 };
      const names: string[] = Object.getOwnPropertyNames(obj);
      let actual1: boolean = obj.hasOwnProperty('x');
      expect(actual1).assertTrue();
      let actual2: boolean = obj.hasOwnProperty('y');
      expect(actual2).assertTrue();
      expect(names[0]).assertEqual('x');
      expect(names[1]).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1530
     * @tc.name objectGetOwnPropertyNamesTest153
     * @tc.desc Verify Object.getOwnPropertyNames contains the record keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "gap": undefined, "keep": 1 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: boolean = record.hasOwnProperty("gap");
      expect(actual1).assertTrue();
      let actual2: int = names.indexOf("gap");
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1540
     * @tc.name objectGetOwnPropertyNamesTest154
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = {};
      const names: string[] = Object.getOwnPropertyNames(obj);
      let actual1: int = names.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = obj.hasOwnProperty('a');
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1550
     * @tc.name objectGetOwnPropertyNamesTest155
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const ref: Object = record;
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(ref);
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      let actual1: int = names1.length;
      let expected1: number = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names1.length;
      let expected2: number = 3;
      expect(actual2).assertEqual(expected2);
      let actual3: int = keys.length;
      let expected3: number = 3;
      expect(actual3).assertEqual(expected3);
      expect(names2.length).assertEqual(3);
      expect(vals.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1560
     * @tc.name objectGetOwnPropertyNamesTest156
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2, 'z': 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const keys: string[] = Object.keys(record);
      const entries = Object.entries(record);
      let actual1: int = names.length;
      let expected1: number = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: int = keys.length;
      let expected2: number = 3;
      expect(actual2).assertEqual(expected2);
      expect(entries.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1570
     * @tc.name objectGetOwnPropertyNamesTest157
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const names: string[] = Object.getOwnPropertyNames(arr);
      const keys: string[] = Object.keys(arr);
      const entries = Object.entries(arr);
      let actual1: int = names.length - keys.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: int = keys.length;
      let expected2: number = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[keys.length]!;
      let expected3: string = "length";
      expect(actual3).assertEqual(expected3);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1580
     * @tc.name objectGetOwnPropertyNamesTest158
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      const entries = Object.entries(record);
      let actual1: int = names.length;
      let expected1: number = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = keys.length;
      let expected2: number = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: int = vals.length;
      let expected3: number = 2;
      expect(actual3).assertEqual(expected3);
      let actual4: boolean = record.hasOwnProperty('a');
      expect(actual4).assertTrue();
      let actual5: boolean = record.hasOwnProperty('b');
      expect(actual5).assertTrue();
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1590
     * @tc.name objectGetOwnPropertyNamesTest159
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const ref: Object = record;
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(ref);
      const keys: string[] = Object.keys(record);
      let actual1: int = names1.length;
      let expected1: number = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names2.length;
      let expected2: number = 2;
      expect(actual2).assertEqual(expected2);
      expect(keys.length).assertEqual(2);
      let actual3: boolean = record.hasOwnProperty('a');
      expect(actual3).assertTrue();
      let actual4: boolean = record.hasOwnProperty('b');
      expect(actual4).assertTrue();
      expect(names2[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1600
     * @tc.name objectGetOwnPropertyNamesTest160
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const names: string[] = Object.getOwnPropertyNames(obj);
      const keys: string[] = Object.keys(obj);
      const vals: Any[] = Object.values(obj);
      const entries = Object.entries(obj);
      let actual1: int = names.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = keys.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: int = vals.length;
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: int = entries.length;
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1610
     * @tc.name objectGetOwnPropertyNamesTest161
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const ref: Object = record;
      Object.getOwnPropertyNames(record);
      Object.getOwnPropertyNames(ref);
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1620
     * @tc.name objectGetOwnPropertyNamesTest162
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 1 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "only": 1 };
      const ref: Object = record;
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: int = names1.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names1[0]!;
      let expected2: string = "only";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names2[0]!;
      let expected3: string = "only";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1630
     * @tc.name objectGetOwnPropertyNamesTest163
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nestedRecord: Record<string, Any> = { 'x': 1 };
      const record: Record<string, Any> = { 's': "str", 'n': 1, 'b': false, "arr": [1], "obj": nestedRecord };
      const ref: Object = record;
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: int = names1.length;
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names2.length;
      let expected2: int = 5;
      expect(actual2).assertEqual(expected2);
      let actual3: string = names1[0]!;
      let expected3: string = 's';
      expect(actual3).assertEqual(expected3);
      let actual4: string = names2[4]!;
      let expected4: string = "obj";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1640
     * @tc.name objectGetOwnPropertyNamesTest164
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '$': 1, '@': 2, "你好，ArkTS": 3 };
      const ref: Object = record;
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: int = names1.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names1[0]!;
      let expected2: string = '$';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names2[1]!;
      let expected3: string = '@';
      expect(actual3).assertEqual(expected3);
      let actual4: string = names1[2]!;
      let expected4: string = "你好，ArkTS";
      expect(actual4).assertEqual(expected4);
      let actual5: string = names2[2]!;
      let expected5: string = "你好，ArkTS";
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1650
     * @tc.name objectGetOwnPropertyNamesTest165
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 4 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "txt": 'v', "num": 42, "flag": true, "list": [1, 2] };
      const ref: Object = record;
      const names1: string[] = Object.getOwnPropertyNames(record);
      const names2: string[] = Object.getOwnPropertyNames(ref);
      let actual1: int = names1.length;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names2.length;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
      let actual3: int = names1.indexOf("txt");
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: int = names2.indexOf("list");
      let expected4: int = 3;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1660
     * @tc.name objectGetOwnPropertyNamesTest166
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 for empty record and 1 for zero-width-space key record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyRecord: Record<string, Any> = {};
      const blankRecord: Record<string, Any> = { "\u200B": 'w' };
      const emptyNames: string[] = Object.getOwnPropertyNames(emptyRecord);
      const blankNames: string[] = Object.getOwnPropertyNames(blankRecord);
      let actual1: int = emptyNames.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = blankNames.length;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: string = blankNames[0]!;
      let expected3: string = "\u200B";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1670
     * @tc.name objectGetOwnPropertyNamesTest167
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 for empty record and 1 for XSS-string key record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyRecord: Record<string, Any> = {};
      const xssRecord: Record<string, Any> = { "<script>alert(1)</script>": 1 };
      const emptyNames: string[] = Object.getOwnPropertyNames(emptyRecord);
      const xssNames: string[] = Object.getOwnPropertyNames(xssRecord);
      let actual1: int = emptyNames.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = xssNames.length;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: string = xssNames[0]!;
      let expected3: string = "<script>alert(1)</script>";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1680
     * @tc.name objectGetOwnPropertyNamesTest168
     * @tc.desc Verify Object.getOwnPropertyNames returns 0 for empty record and 1 for 1000-char key record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyRecord: Record<string, Any> = {};
      const longKey: string = 'k'.repeat(1000);
      const longRecord: Record<string, Any> = {};
      longRecord[longKey] = 1;
      let actual1: int = Object.getOwnPropertyNames(emptyRecord).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = Object.getOwnPropertyNames(longRecord).length;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1690
     * @tc.name objectGetOwnPropertyNamesTest169
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record after adding 3 keys (0 before)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const before: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = before.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      record["中文"] = 1;
      record['🎉'] = 2;
      record["42"] = 3;
      const after: string[] = Object.getOwnPropertyNames(record);
      let actual2: int = after.length;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
      let actual3: string = after[0]!;
      let expected3: string = "中文";
      expect(actual3).assertEqual(expected3);
      let actual4: string = after[1]!;
      let expected4: string = '🎉';
      expect(actual4).assertEqual(expected4);
      let actual5: string = after[2]!;
      let expected5: string = "42";
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1700
     * @tc.name objectGetOwnPropertyNamesTest170
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': 'a', "00": 'b' };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = names.includes('0');
      expect(actual2).assertTrue();
      let actual3: boolean = names.includes("00");
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1710
     * @tc.name objectGetOwnPropertyNamesTest171
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "k1": null, "k2": undefined };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "k1";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = "k2";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1720
     * @tc.name objectGetOwnPropertyNamesTest172
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "测试": 1, "用例": 2, "边界": 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "测试";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = "用例";
      expect(actual3).assertEqual(expected3);
      let actual4: string = names[2]!;
      let expected4: string = "边界";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1730
     * @tc.name objectGetOwnPropertyNamesTest173
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'é': 1, "e\u0301": 2 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = names.includes('é');
      expect(actual2).assertTrue();
      let actual3: boolean = names.includes("e\u0301");
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1740
     * @tc.name objectGetOwnPropertyNamesTest174
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'x'.repeat(1000);
      const record: Record<string, Any> = {};
      record[longKey] = 1;
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = longKey;
      expect(actual2).assertEqual(expected2);
      let actual3: int = names[0]!.length;
      let expected3: int = 1000;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1750
     * @tc.name objectGetOwnPropertyNamesTest175
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'z'.repeat(1000);
      const record: Record<string, Any> = { "short": 1 };
      record[longKey] = 2;
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "short";
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = longKey;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1760
     * @tc.name objectGetOwnPropertyNamesTest176
     * @tc.desc Verify Object.getOwnPropertyNames returns 2 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyA: string = 'a'.repeat(500);
      const keyB: string = 'b'.repeat(500);
      const record: Record<string, Any> = {};
      record[keyA] = 1;
      record[keyB] = 2;
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = keyA;
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = keyB;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1770
     * @tc.name objectGetOwnPropertyNamesTest177
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = "ab\u200Bcd".repeat(200);
      const record: Record<string, Any> = {};
      record[longKey] = 1;
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = longKey;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1780
     * @tc.name objectGetOwnPropertyNamesTest178
     * @tc.desc Verify Object.getOwnPropertyNames returns 1 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'm'.repeat(1000);
      const record: Record<string, Any> = {};
      record[longKey] = "payload";
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = longKey;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1790
     * @tc.name objectGetOwnPropertyNamesTest179
     * @tc.desc Verify Object.getOwnPropertyNames returns 3 names for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      record['b'] = 2;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_GETOWNPROPERTYNAMES_1800
     * @tc.name objectGetOwnPropertyNamesTest180
     * @tc.desc Verify Object.getOwnPropertyNames returns names array with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectGetOwnPropertyNamesTest180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, Any> = { 'x': 1, 'y': 2 };
      const r2: Record<string, Any> = {};
      r2['x'] = 1;
      r2['y'] = 2;
      const n1: string[] = Object.getOwnPropertyNames(r1);
      const n2: string[] = Object.getOwnPropertyNames(r2);
      let actual1: int = n1.length;
      let expected1: number = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = n1[0]!;
      let expected2: string = 'x';
      expect(actual2).assertEqual(expected2);
      let actual3: string = n1[1]!;
      let expected3: string = 'y';
      expect(actual3).assertEqual(expected3);
      expect(n2.length).assertEqual(2);
      expect(n2.join(',')).assertEqual("x,y");
    });
  });
}
