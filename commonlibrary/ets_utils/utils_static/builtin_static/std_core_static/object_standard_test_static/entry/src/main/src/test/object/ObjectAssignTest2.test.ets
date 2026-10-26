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

class BoxTest {
  size: number = 10;
}

class Maker {
  label: string = 'L';
}

class Animal {
  name: string = "dog";
  legs: number = 4;
}

class Animal001 {
  name: string = "dog";
  speak(): string {
    return "bark";
  }
}

class Base {
  baseProp: string = 'b';
  shared(): string {
    return 's';
  }
}

class Child extends Base {
  childProp: string = 'c';
}

class Point {
  x: number;
  y: number;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

class Config {
  static version: string = "1.0";
  name: string = "app";
}

class Item {
  price: number = 5;
  tag: string = "old";
}

class A {
  a: string = 'A';
}

class B {
  b: string = 'B';
}

class Holder {
  data: Record<string, Any> = { 'v': 1 };
}

class Bag {
  items: Array<string> = ['a', 'b'];
}

class Empty {}

class Defaults {
  count: number = 0;
  flag: boolean = true;
  label: string = '';
}

class Note {
  text: string = "hi";
}

class Tag {
  kind: string = "custom";
}


export default function objectAssignTest2(): void {

  describe("ObjectAssignTest2", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0010
     * @tc.name objectAssignTest001
     * @tc.desc Verify Object.assign merges 1 source keys into empty target with length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "name": "ArkTS" };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = result["name"]! as string;
      let expected2: string = "ArkTS";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0020
     * @tc.name objectAssignTest002
     * @tc.desc Verify Object.assign merges 2 source keys into empty target with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = result["name"]! as string;
      let expected2: string = "ArkTS";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${result['year']!}`;
      let expected3: string = `${2026}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0030
     * @tc.name objectAssignTest003
     * @tc.desc Verify Object.assign copies source value 42 for key "count" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "count": 42 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = `${result['count']!}`;
      let expected1: string = `${42}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0040
     * @tc.name objectAssignTest004
     * @tc.desc Verify Object.assign copies source value 3.14159 for key "pi" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "pi": 3.14159 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: number = result["pi"]! as number;
      let expected1: number = 3.14159;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0050
     * @tc.name objectAssignTest005
     * @tc.desc Verify Object.assign copies source properties into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "flag": true };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: boolean = result["flag"]! as boolean;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0060
     * @tc.name objectAssignTest006
     * @tc.desc Verify Object.assign copies source properties into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "flag": false };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: boolean = result["flag"]! as boolean;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0070
     * @tc.name objectAssignTest007
     * @tc.desc Verify Object.assign keeps value of key "value" as null in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "value": null };
      const result: Record<string, Any> = Object.assign(target, source);
      let actualValue1: Any = result["value"];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0080
     * @tc.name objectAssignTest008
     * @tc.desc Verify Object.assign copies source value 1 for key "a" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const nested1: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { "inner": nested1 };
      const result: Record<string, Any> = Object.assign(target, source);
      const inner: Record<string, Any> = result["inner"] as Record<string, Any>;
      let actual1: string = `${inner['a']!}`;
      let expected1: string = `${1}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0090
     * @tc.name objectAssignTest009
     * @tc.desc Verify Object.assign copies source value 20 for key "list" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "list": [10, 20] };
      const result: Record<string, Any> = Object.assign(target, source);
      const list: Array<int> = result["list"] as Array<int>;
      let actual1: string = `${list[1]}`;
      let expected1: string = `${20}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0100
     * @tc.name objectAssignTest010
     * @tc.desc Verify Object.assign copies source value "empty" for key "" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { '': "empty" };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = Object.keys(result)[0];
      let expected1: string = '';
      expect(actual1).assertEqual(expected1);
      let actual2: string = result['']! as string;
      let expected2: string = "empty";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0110
     * @tc.name objectAssignTest011
     * @tc.desc Verify Object.assign copies source value "hundred" for key "100" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "100": "hundred" };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = result["100"]! as string;
      let expected1: string = "hundred";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0120
     * @tc.name objectAssignTest012
     * @tc.desc Verify Object.assign merges 0 source keys into empty target with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = {};
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0130
     * @tc.name objectAssignTest013
     * @tc.desc Verify Object.assign preserves insertion order of keys "a", "b", "c" in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = Object.keys(result)[0];
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = Object.keys(result)[2];
      let expected2: string = 'c';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0140
     * @tc.name objectAssignTest014
     * @tc.desc Verify Object.assign merges 1 source keys into non-empty target with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "ArkTS" };
      const source: Record<string, Any> = { "year": 2026 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = result["name"]! as string;
      let expected2: string = "ArkTS";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${result['year']!}`;
      let expected3: string = `${2026}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0150
     * @tc.name objectAssignTest015
     * @tc.desc Verify Object.assign merges 1 source keys into non-empty target with length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "ArkTS" };
      const source: Record<string, Any> = { "name": "OpenHarmony" };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = result["name"]! as string;
      let expected2: string = "OpenHarmony";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0160
     * @tc.name objectAssignTest016
     * @tc.desc Verify Object.assign copies source value 2026 for key "count", "count" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "count": '1' };
      const source: Record<string, Any> = { "count": 2026 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = `${result['count']!}`;
      let expected1: string = `${2026}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0170
     * @tc.name objectAssignTest017
     * @tc.desc Verify Object.assign copies source value 1 for key "v", "v" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'v': 1 };
      const source: Record<string, Any> = { 'v': 1 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = `${result['v']!}`;
      let expected1: string = `${1}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0180
     * @tc.name objectAssignTest018
     * @tc.desc Verify Object.assign keeps value of key "v", "v" as null in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'v': 1 };
      const source: Record<string, Any> = { 'v': null };
      const result: Record<string, Any> = Object.assign(target, source);
      let actualValue1: Any = result['v'];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0190
     * @tc.name objectAssignTest019
     * @tc.desc Verify Object.assign copies source value 2 for key "v", "a" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'v': 1 };
      const nested1: Record<string, Any> = { 'a': 2 };
      const source: Record<string, Any> = { 'v': nested1 };
      const result: Record<string, Any> = Object.assign(target, source);
      const inner: Record<string, Any> = result['v'] as Record<string, Any>;
      let actual1: string = `${inner['a']!}`;
      let expected1: string = `${2}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0200
     * @tc.name objectAssignTest020
     * @tc.desc Verify Object.assign merges 0 source keys into non-empty target with length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "ArkTS" };
      const source: Record<string, Any> = {};
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0210
     * @tc.name objectAssignTest021
     * @tc.desc Verify Object.assign returns the target object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "ArkTS" };
      const source: Record<string, Any> = {};
      const result: Record<string, Any> = Object.assign(target, source);
      expect(result).assertEqual(target);
      let actual1: string = result["name"]! as string;
      let expected1: string = "ArkTS";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0220
     * @tc.name objectAssignTest022
     * @tc.desc Verify Object.assign merges 2 source keys into non-empty target with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'a': 2, 'b': 3 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${result['a']!}`;
      let expected2: string = `${2}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${result['b']!}`;
      let expected3: string = `${3}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0230
     * @tc.name objectAssignTest023
     * @tc.desc Verify Object.assign returns the target object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'a': 9 };
      const result: Record<string, Any> = Object.assign(target, source);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0240
     * @tc.name objectAssignTest024
     * @tc.desc Verify Object.assign copies source value "a" for key "a", "b" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'b': 2 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = Object.keys(result)[0];
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = Object.keys(result)[1];
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0250
     * @tc.name objectAssignTest025
     * @tc.desc Verify Object.assign merges 1 source keys into non-empty target with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const source: Record<string, Any> = { 'c': 3 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0260
     * @tc.name objectAssignTest026
     * @tc.desc Verify Object.assign merges 2 source keys into non-empty target with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const source: Record<string, Any> = { 'b': 20, 'c': 30 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${result['b']!}`;
      let expected2: string = `${20}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${result['c']!}`;
      let expected3: string = `${30}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0270
     * @tc.name objectAssignTest027
     * @tc.desc Verify Object.assign merges 2 source keys into non-empty target with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const source: Record<string, Any> = { 'a': 10, 'b': 20 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${result['a']!}`;
      let expected2: string = `${10}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${result['b']!}`;
      let expected3: string = `${20}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0280
     * @tc.name objectAssignTest028
     * @tc.desc Verify Object.assign copies source value 10 for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const source: Record<string, Any> = { 'a': 10 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = `${result['a']!}`;
      let expected1: string = `${10}`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${result['b']!}`;
      let expected2: string = `${2}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${result['c']!}`;
      let expected3: string = `${3}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0290
     * @tc.name objectAssignTest029
     * @tc.desc Verify Object.assign copies source value "b" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const source: Record<string, Any> = { 'b': 20 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = Object.keys(result)[1];
      let expected1: string = 'b';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0300
     * @tc.name objectAssignTest030
     * @tc.desc Verify Object.assign copies source value "c" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const source: Record<string, Any> = { 'c': 3 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = Object.keys(result)[2];
      let expected1: string = 'c';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0310
     * @tc.name objectAssignTest031
     * @tc.desc Verify Object.assign copies source value "a" for key "a", "b" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const source: Record<string, Any> = {};
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = Object.keys(result)[0];
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${result['b']!}`;
      let expected2: string = `${2}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0320
     * @tc.name objectAssignTest032
     * @tc.desc Verify Object.assign returns the target object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const source: Record<string, Any> = {};
      const result: Record<string, Any> = Object.assign(target, source);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0330
     * @tc.name objectAssignTest033
     * @tc.desc Verify Object.assign copies source value 1 for key "a", "y" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested1: Record<string, Any> = { 'a': 1 };
      const target: Record<string, Any> = { 'x': nested1, 'y': 2 };
      const source: Record<string, Any> = { 'y': 5 };
      const result: Record<string, Any> = Object.assign(target, source);
      const inner: Record<string, Any> = result['x'] as Record<string, Any>;
      let actual1: string = `${inner['a']!}`;
      let expected1: string = `${1}`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${result['y']!}`;
      let expected2: string = `${5}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0340
     * @tc.name objectAssignTest034
     * @tc.desc Verify Object.assign merges 2 source keys into non-empty target with length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const source: Record<string, Any> = { 'c': 3, 'd': 4 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${result['d']!}`;
      let expected2: string = `${4}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0350
     * @tc.name objectAssignTest035
     * @tc.desc Verify Object.assign performs shallow copy and target shares source array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { "list": [1, 2] };
      const result: Record<string, Any> = Object.assign(target, source);
      const arr: Array<number> = source["list"] as Array<number>;
      arr.push(3);
      const got: Array<number> = result["list"] as Array<number>;
      let actual1: int = got.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0360
     * @tc.name objectAssignTest036
     * @tc.desc Verify Object.assign performs shallow copy and target shares nested object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const nested1: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { "inner": nested1 };
      const result: Record<string, Any> = Object.assign(target, source);
      const obj: Record<string, Any> = source["inner"] as Record<string, Any>;
      obj['b'] = 2;
      const got: Record<string, Any> = result["inner"] as Record<string, Any>;
      let actual1: string = `${got['b']!}`;
      let expected1: string = `${2}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0370
     * @tc.name objectAssignTest037
     * @tc.desc Verify Object.assign copies source value 0 for key "a", "list" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { "list": [] as Array<Any> };
      const result: Record<string, Any> = Object.assign(target, source);
      const list: Array<int> = result["list"] as Array<int>;
      let actual1: int = list.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0380
     * @tc.name objectAssignTest038
     * @tc.desc Verify Object.assign copies source value 42 for key "a", "z" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const nested1: Record<string, Any> = { 'z': 42 };
      const nested2: Record<string, Any> = { 'y': nested1 };
      const source: Record<string, Any> = { 'x': nested2 };
      const result: Record<string, Any> = Object.assign(target, source);
      const y: Record<string, Any> = result['x'] as Record<string, Any>;
      const z: Record<string, Any> = y['y'] as Record<string, Any>;
      let actual1: string = `${z['z']!}`;
      let expected1: string = `${42}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0390
     * @tc.name objectAssignTest039
     * @tc.desc Verify Object.assign merges 1 source keys into non-empty target with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "ArkTS" };
      const source: Record<string, Any> = { "Name": "OpenHarmony" };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = result["name"]! as string;
      let expected2: string = "ArkTS";
      expect(actual2).assertEqual(expected2);
      let actual3: string = result["Name"]! as string;
      let expected3: string = "OpenHarmony";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0400
     * @tc.name objectAssignTest040
     * @tc.desc Verify Object.assign overwrites boolean true with false for key "flag" in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "flag": true };
      const source: Record<string, Any> = { "flag": false };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: boolean = result["flag"]! as boolean;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0410
     * @tc.name objectAssignTest041
     * @tc.desc Verify Object.assign overwrites string value with boolean true for key "flag" in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "flag": "yes" };
      const source: Record<string, Any> = { "flag": true };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: boolean = result["flag"]! as boolean;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0420
     * @tc.name objectAssignTest042
     * @tc.desc Verify Object.assign copies source value "2026" for key "year", "year" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "year": 2026 };
      const source: Record<string, Any> = { "year": "2026" };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = result["year"]! as string;
      let expected1: string = "2026";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0430
     * @tc.name objectAssignTest043
     * @tc.desc Verify Object.assign keeps value of key "a", "b", "a" as null in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const source: Record<string, Any> = { 'a': null };
      const result: Record<string, Any> = Object.assign(target, source);
      let actualValue1: Any = result['a'];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actual1: string = `${result['b']!}`;
      let expected1: string = `${2}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0440
     * @tc.name objectAssignTest044
     * @tc.desc Verify Object.assign merges 3 source keys into non-empty target with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'b': 2, 'a': 9, 'c': 3 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = Object.keys(result)[1];
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
      let actual3: string = Object.keys(result)[2];
      let expected3: string = 'c';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0450
     * @tc.name objectAssignTest045
     * @tc.desc Verify Object.assign merges target value 1 and source value 2 for keys "a", "b" into sum 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'b': 2 };
      const result: Record<string, Any> = Object.assign(target, source);
      const sum: number = Number(`${result['a']}`) + Number(`${result['b']}`);
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0460
     * @tc.name objectAssignTest046
     * @tc.desc Verify Object.assign keeps target string "Ark" and copies source string "TS", joined value is ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 's': "Ark" };
      const source: Record<string, Any> = { 't': "TS" };
      const result: Record<string, Any> = Object.assign(target, source);
      const joined: string = (result['s'] as string) + (result['t'] as string);
      expect(joined).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0470
     * @tc.name objectAssignTest047
     * @tc.desc Verify Object.assign copies source value 1 for key "a", "b" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'b': 2 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(target).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${result['a']!}`;
      let expected2: string = `${1}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${result['b']!}`;
      let expected3: string = `${2}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0480
     * @tc.name objectAssignTest048
     * @tc.desc Verify Object.assign merges 0 source keys into empty target with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const result: Record<string, Any> = Object.assign(target);
      expect(result).assertEqual(target);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      expect(result.hasOwnProperty("x")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0490
     * @tc.name objectAssignTest049
     * @tc.desc Verify Object.assign returns the target object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "ArkTS" };
      const result: Record<string, Any> = Object.assign(target);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0500
     * @tc.name objectAssignTest050
     * @tc.desc Verify Object.assign returns the target object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const result: Record<string, Any> = Object.assign(target);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0510
     * @tc.name objectAssignTest051
     * @tc.desc Verify Object.assign merges 0 source keys into non-empty target with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const result: Record<string, Any> = Object.assign(target);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0520
     * @tc.name objectAssignTest052
     * @tc.desc Verify Object.assign copies source value "a" for key "a", "b" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const result: Record<string, Any> = Object.assign(target);
      let actual1: string = Object.keys(result)[0];
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0530
     * @tc.name objectAssignTest053
     * @tc.desc Verify Object.assign copies source value 1 for key "a", "b" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const result: Record<string, Any> = Object.assign(target);
      let actual1: string = `${result['a']!}`;
      let expected1: string = `${1}`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${result['b']!}`;
      let expected2: string = `${2}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0540
     * @tc.name objectAssignTest054
     * @tc.desc Verify Object.assign returns the target itself so mutating result key "a" updates target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const result: Record<string, Any> = Object.assign(target);
      result['a'] = 99;
      let actual1: string = `${target['a']!}`;
      let expected1: string = `${99}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0550
     * @tc.name objectAssignTest055
     * @tc.desc Verify Object.assign returns the target itself so adding key "newKey" to result updates target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const result: Record<string, Any> = Object.assign(target);
      result["newKey"] = "added";
      let actual1: string = target["newKey"]! as string;
      let expected1: string = "added";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0560
     * @tc.name objectAssignTest056
     * @tc.desc Verify Object.assign returns the target object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const result: Record<string, Any> = Object.assign(target);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0570
     * @tc.name objectAssignTest057
     * @tc.desc Verify Object.assign returns the target object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'a': 1 };
      const result: Record<string, Any> = Object.assign(target, source);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0580
     * @tc.name objectAssignTest058
     * @tc.desc Verify Object.assign returns the target object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "ArkTS" };
      const source: Record<string, Any> = { "year": 2026 };
      const result: Record<string, Any> = Object.assign(target, source);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0590
     * @tc.name objectAssignTest059
     * @tc.desc Verify Object.assign returns the target object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "ArkTS" };
      const source: Record<string, Any> = { "name": "OpenHarmony" };
      const result: Record<string, Any> = Object.assign(target, source);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0600
     * @tc.name objectAssignTest060
     * @tc.desc Verify Object.assign returns the target object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const source: Record<string, Any> = { 'c': 3 };
      const result: Record<string, Any> = Object.assign(target, source);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0610
     * @tc.name objectAssignTest061
     * @tc.desc Verify Object.assign merges 1 source keys into non-empty target with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'b': 2 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: string = `${result['a']!}`;
      let expected1: string = `${1}`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${result['b']!}`;
      let expected2: string = `${2}`;
      expect(actual2).assertEqual(expected2);
      let actual3: int = Object.keys(result).length;
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0620
     * @tc.name objectAssignTest062
     * @tc.desc Verify Object.assign copies source value 3 for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const s1: Record<string, Any> = { 'b': 2 };
      const r1: Record<string, Any> = Object.assign(target, s1);
      const s2: Record<string, Any> = { 'c': 3 };
      const r2: Record<string, Any> = Object.assign(r1, s2);
      let actual1: int = Object.keys(r2).length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      expect(r2).assertEqual(target);
      let actual2: string = `${r2['a']!}`;
      let expected2: string = `${1}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${r2['b']!}`;
      let expected3: string = `${2}`;
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${r2['c']!}`;
      let expected4: string = `${3}`;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0630
     * @tc.name objectAssignTest063
     * @tc.desc Verify Object.assign copies source value 3 for key "a", "b" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'b': 2 };
      const result: Record<string, Any> = Object.assign(target, source);
      result['c'] = 3;
      let actual1: string = `${target['c']!}`;
      let expected1: string = `${3}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0640
     * @tc.name objectAssignTest064
     * @tc.desc Verify Object.assign copies source value "2" for key "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': 2 };
      Object.assign(target, s1);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0650
     * @tc.name objectAssignTest065
     * @tc.desc Verify Object.assign copies source value "3" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': 2 };
      const s2: Record<string, Any> = { 'k': 3 };
      Object.assign(target, s1, s2);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0660
     * @tc.name objectAssignTest066
     * @tc.desc Verify Object.assign copies source value "10" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const s1: Record<string, Any> = { 'a': 10, 'b': 20, 'c': 30 };
      Object.assign(target, s1);
      let actual1: string = `${target['a']!}`;
      let expected1: string = "10";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['b']!}`;
      let expected2: string = "20";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['c']!}`;
      let expected3: string = "30";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0670
     * @tc.name objectAssignTest067
     * @tc.desc Verify Object.assign copies source value "100" for key "k1", "k2", "k3" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "k1": 1, "k2": 2, "k3": 3 };
      const s1: Record<string, Any> = { "k1": 100 };
      Object.assign(target, s1);
      let actual1: string = `${target['k1']!}`;
      let expected1: string = "100";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['k2']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['k3']!}`;
      let expected3: string = '3';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0680
     * @tc.name objectAssignTest068
     * @tc.desc Verify Object.assign copies source value "new" for key "name", "name" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "old" };
      const s1: Record<string, Any> = { "name": "new" };
      Object.assign(target, s1);
      let actual1: string = `${target['name']!}`;
      let expected1: string = "new";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0690
     * @tc.name objectAssignTest069
     * @tc.desc Verify Object.assign copies source value "one" for key "v", "v" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'v': 1 };
      const s1: Record<string, Any> = { 'v': "one" };
      Object.assign(target, s1);
      let actual1: string = `${target['v']!}`;
      let expected1: string = "one";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0700
     * @tc.name objectAssignTest070
     * @tc.desc Verify Object.assign copies source value "1" for key "v", "v" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'v': "one" };
      const s1: Record<string, Any> = { 'v': 1 };
      Object.assign(target, s1);
      let actual1: string = `${target['v']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0710
     * @tc.name objectAssignTest071
     * @tc.desc Verify Object.assign copies source value "1" for key "Key", "key" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "Key": 1 };
      const s1: Record<string, Any> = { "key": 2 };
      Object.assign(target, s1);
      let actual1: string = `${target['Key']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['key']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0720
     * @tc.name objectAssignTest072
     * @tc.desc Verify Object.assign copies source value "false" for key "flag", "flag" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "flag": 1 };
      const s1: Record<string, Any> = { "flag": false };
      Object.assign(target, s1);
      let actual1: string = `${target['flag']!}`;
      let expected1: string = "false";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0730
     * @tc.name objectAssignTest073
     * @tc.desc Verify Object.assign keeps value of key "k", "k" as null in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': null };
      Object.assign(target, s1);
      let actualValue1: Any = target['k'];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0740
     * @tc.name objectAssignTest074
     * @tc.desc Verify Object.assign copies source value "2" for key "o", "x" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'o': 1 };
      const nested1: Record<string, Any> = { 'x': 2 };
      const s1: Record<string, Any> = { 'o': nested1 };
      Object.assign(target, s1);
      const inner: Record<string, Any> = target['o'] as Record<string, Any>;
      let actual1: string = `${inner['x']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0750
     * @tc.name objectAssignTest075
     * @tc.desc Verify Object.assign copies source value "5" for key "arr", "arr" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "arr": 1 };
      const s1: Record<string, Any> = { "arr": [5, 6] };
      Object.assign(target, s1);
      const list: Array<int> = target["arr"] as Array<int>;
      let actual1: string = list[0].toString();
      let expected1: string = '5';
      expect(actual1).assertEqual(expected1);
      let actual2: string = list[1].toString();
      let expected2: string = '6';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0760
     * @tc.name objectAssignTest076
     * @tc.desc Verify Object.assign copies source value "s2" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': "target" };
      const s1: Record<string, Any> = { 'k': "s1" };
      const s2: Record<string, Any> = { 'k': "s2" };
      Object.assign(target, s1, s2);
      let actual1: string = `${target['k']!}`;
      let expected1: string = "s2";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0770
     * @tc.name objectAssignTest077
     * @tc.desc Verify Object.assign copies source value "s3" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': "target" };
      const s1: Record<string, Any> = { 'k': "s1" };
      const s2: Record<string, Any> = { 'k': "s2" };
      const s3: Record<string, Any> = { 'k': "s3" };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['k']!}`;
      let expected1: string = "s3";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0780
     * @tc.name objectAssignTest078
     * @tc.desc Verify Object.assign copies source value "3" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 0 };
      const s1: Record<string, Any> = { 'k': 1 };
      const s2: Record<string, Any> = { 'k': 2 };
      const s3: Record<string, Any> = { 'k': 3 };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0790
     * @tc.name objectAssignTest079
     * @tc.desc Verify Object.assign copies source value "2" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 0 };
      const s1: Record<string, Any> = { 'k': 1 };
      const s2: Record<string, Any> = { 'k': 2 };
      const s3: Record<string, Any> = { 'x': 3 };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['x']!}`;
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0800
     * @tc.name objectAssignTest080
     * @tc.desc Verify Object.assign copies source value "2" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t1: Record<string, Any> = { 'k': 0 };
      const t2: Record<string, Any> = { 'k': 0 };
      const s1: Record<string, Any> = { 'k': 1 };
      const s2: Record<string, Any> = { 'k': 2 };
      Object.assign(t1, s1, s2);
      Object.assign(t2, s2, s1);
      let actual1: string = `${t1['k']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${t2['k']!}`;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0810
     * @tc.name objectAssignTest081
     * @tc.desc Verify Object.assign copies source value "4" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 0 };
      const s1: Record<string, Any> = { 'k': 1 };
      const s2: Record<string, Any> = { 'k': 2 };
      const s3: Record<string, Any> = { 'k': 3 };
      const s4: Record<string, Any> = { 'k': 4 };
      Object.assign(target, s1, s2, s3, s4);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '4';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0820
     * @tc.name objectAssignTest082
     * @tc.desc Verify Object.assign copies source value "3" for key "a", "b", "a" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 0, 'b': 0 };
      const s1: Record<string, Any> = { 'a': 1, 'b': 1 };
      const s2: Record<string, Any> = { 'b': 2 };
      const s3: Record<string, Any> = { 'a': 3 };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['b']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0830
     * @tc.name objectAssignTest083
     * @tc.desc Verify Object.assign copies source value "2" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': "str" };
      const s1: Record<string, Any> = { 'k': 1 };
      const s2: Record<string, Any> = { 'k': 2 };
      Object.assign(target, s1, s2);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0840
     * @tc.name objectAssignTest084
     * @tc.desc Verify Object.assign copies source value "true" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': 2 };
      const s2: Record<string, Any> = { 'k': true };
      Object.assign(target, s1, s2);
      let actual1: string = `${target['k']!}`;
      let expected1: string = "true";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0850
     * @tc.name objectAssignTest085
     * @tc.desc Verify Object.assign copies source value "2" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 0 };
      const s1: Record<string, Any> = { 'k': 1 };
      const s2: Record<string, Any> = { 'k': 2 };
      Object.assign(target, s1, s1, s2, s2);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0860
     * @tc.name objectAssignTest086
     * @tc.desc Verify Object.assign copies source value "last" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': 2 };
      const s2: Record<string, Any> = { 'k': "last" };
      Object.assign(target, s1, s2);
      let actual1: string = `${target['k']!}`;
      let expected1: string = "last";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0870
     * @tc.name objectAssignTest087
     * @tc.desc Verify Object.assign copies source value "true" for key "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': true };
      Object.assign(target, s1);
      let actual1: string = `${target['k']!}`;
      let expected1: string = "true";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0880
     * @tc.name objectAssignTest088
     * @tc.desc Verify Object.assign copies source value "1" for key "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': true };
      const s1: Record<string, Any> = { 'k': 1 };
      Object.assign(target, s1);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0890
     * @tc.name objectAssignTest089
     * @tc.desc Verify Object.assign copies source value "5" for key "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': false };
      const s1: Record<string, Any> = { 'k': 5 };
      Object.assign(target, s1);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '5';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0900
     * @tc.name objectAssignTest090
     * @tc.desc Verify Object.assign copies source value "true" for key "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': true };
      const s1: Record<string, Any> = { 'k': "true" };
      Object.assign(target, s1);
      let actual1: string = `${target['k']!}`;
      let expected1: string = "true";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0910
     * @tc.name objectAssignTest091
     * @tc.desc Verify Object.assign copies source value "true" for key "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': "true" };
      const s1: Record<string, Any> = { 'k': true };
      Object.assign(target, s1);
      let actual1: string = `${target['k']!}`;
      let expected1: string = "true";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0920
     * @tc.name objectAssignTest092
     * @tc.desc Verify Object.assign copies source value "1" for key "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': null };
      const s1: Record<string, Any> = { 'k': 1 };
      Object.assign(target, s1);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0930
     * @tc.name objectAssignTest093
     * @tc.desc Verify Object.assign copies source value "x" for key "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': null };
      const s1: Record<string, Any> = { 'k': 'x' };
      Object.assign(target, s1);
      let actual1: string = `${target['k']!}`;
      let expected1: string = 'x';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0940
     * @tc.name objectAssignTest094
     * @tc.desc Verify Object.assign copies source value "1" for key "a", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested1: Record<string, Any> = { 'a': 1 };
      const target: Record<string, Any> = { 'k': nested1 };
      const s1: Record<string, Any> = { 'k': [1, 2] };
      Object.assign(target, s1);
      const list: Array<int> = target['k'] as Array<int>;
      let actual1: string = list[0].toString();
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = list[1].toString();
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0950
     * @tc.name objectAssignTest095
     * @tc.desc Verify Object.assign copies source value "2" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': "str" };
      const s2: Record<string, Any> = { 'k': true };
      const s3: Record<string, Any> = { 'k': 2 };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0960
     * @tc.name objectAssignTest096
     * @tc.desc Verify Object.assign copies source value "1" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 0, 'b': 0, 'c': 0 };
      const s1: Record<string, Any> = { 'a': 1 };
      const s2: Record<string, Any> = { 'b': 2 };
      const s3: Record<string, Any> = { 'c': 3 };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['b']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['c']!}`;
      let expected3: string = '3';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0970
     * @tc.name objectAssignTest097
     * @tc.desc Verify Object.assign copies source value "4" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': '2' };
      const s2: Record<string, Any> = { 'k': 3 };
      const s3: Record<string, Any> = { 'k': 4 };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '4';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0980
     * @tc.name objectAssignTest098
     * @tc.desc Verify Object.assign copies source value "6" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': "start" };
      const s1: Record<string, Any> = { 'k': 5 };
      const s2: Record<string, Any> = { 'k': true };
      const s3: Record<string, Any> = { 'k': 6 };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '6';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_0990
     * @tc.name objectAssignTest099
     * @tc.desc Verify Object.assign copies source value "false" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': 2 };
      const s2: Record<string, Any> = { 'k': '3' };
      const s3: Record<string, Any> = { 'k': false };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['k']!}`;
      let expected1: string = "false";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1000
     * @tc.name objectAssignTest100
     * @tc.desc Verify Object.assign copies source value "true" for key "flag", "flag", "flag" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "flag": false };
      const s1: Record<string, Any> = { "flag": true };
      const s2: Record<string, Any> = { "flag": false };
      const s3: Record<string, Any> = { "flag": true };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['flag']!}`;
      let expected1: string = "true";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1010
     * @tc.name objectAssignTest101
     * @tc.desc Verify Object.assign copies source value "3" for key "v", "v", "v" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested1: Record<string, Any> = { 'v': 0 };
      const target: Record<string, Any> = { 'o': nested1 };
      const nested2: Record<string, Any> = { 'v': 1 };
      const s1: Record<string, Any> = { 'o': nested2 };
      const nested3: Record<string, Any> = { 'v': 2 };
      const s2: Record<string, Any> = { 'o': nested3 };
      const nested4: Record<string, Any> = { 'v': 3 };
      const s3: Record<string, Any> = { 'o': nested4 };
      Object.assign(target, s1, s2, s3);
      const inner: Record<string, Any> = target['o'] as Record<string, Any>;
      let actual1: string = `${inner['v']!}`;
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1020
     * @tc.name objectAssignTest102
     * @tc.desc Verify Object.assign copies source value "3" for key "arr", "arr", "arr" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "arr": [0] };
      const s1: Record<string, Any> = { "arr": [1] };
      const s2: Record<string, Any> = { "arr": [2] };
      const s3: Record<string, Any> = { "arr": [3] };
      Object.assign(target, s1, s2, s3);
      const list: Array<int> = target["arr"] as Array<int>;
      let actual1: string = list[0].toString();
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1030
     * @tc.name objectAssignTest103
     * @tc.desc Verify Object.assign copies source value "2" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 0 };
      const s1: Record<string, Any> = { 'k': 1 };
      const empty: Record<string, Any> = {};
      const s2: Record<string, Any> = { 'k': 2 };
      Object.assign(target, s1, empty, s2);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1040
     * @tc.name objectAssignTest104
     * @tc.desc Verify Object.assign copies source value "3" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': null };
      const s2: Record<string, Any> = { 'k': 2 };
      const s3: Record<string, Any> = { 'k': 3 };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1050
     * @tc.name objectAssignTest105
     * @tc.desc Verify Object.assign copies source value "1" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const s1: Record<string, Any> = { 'a': 1 };
      const s2: Record<string, Any> = { 'b': 2 };
      const s3: Record<string, Any> = { 'c': 3 };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['b']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['c']!}`;
      let expected3: string = '3';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1060
     * @tc.name objectAssignTest106
     * @tc.desc Verify Object.assign returns target reference; manual property write on return value is reflected in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': 2 };
      const ret: Record<string, Any> = Object.assign(target, s1);
      ret['m'] = 9;
      let actual1: string = `${target['m']!}`;
      let expected1: string = '9';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1070
     * @tc.name objectAssignTest107
     * @tc.desc Verify Object.assign copies source value "2" for key "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': 2 };
      const ret: Record<string, Any> = Object.assign(target, s1);
      let actual1: string = `${ret['k']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1080
     * @tc.name objectAssignTest108
     * @tc.desc Verify Object.assign copies source value "0" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 0 };
      const s1: Record<string, Any> = { 'b': 1 };
      const s2: Record<string, Any> = { 'c': 2 };
      const ret: Record<string, Any> = Object.assign(target, s1, s2);
      let actual1: string = `${ret['a']!}`;
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${ret['b']!}`;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${ret['c']!}`;
      let expected3: string = '2';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1090
     * @tc.name objectAssignTest109
     * @tc.desc Verify Object.assign keeps non-overridden key "m" in target when source overwrites key "k"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1, 'm': 2 };
      const s1: Record<string, Any> = { 'k': 2 };
      Object.assign(target, s1);
      expect(Object.hasOwn(target, 'm')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1100
     * @tc.name objectAssignTest110
     * @tc.desc Verify Object.assign returns target reference; manual property write on return value is reflected in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': 2 };
      const r1: Record<string, Any> = Object.assign(target, s1);
      const r2: Record<string, Any> = Object.assign(target, s1);
      r1['k'] = 7;
      let actual1: string = `${r2['k']!}`;
      let expected1: string = '7';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1110
     * @tc.name objectAssignTest111
     * @tc.desc Verify Object.assign copies source value "3" for key "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': 2 };
      const ret: Record<string, Any> = Object.assign(target, s1);
      ret['k'] = 3;
      let actual1: string = `${target['k']!}`;
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${s1['k']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1120
     * @tc.name objectAssignTest112
     * @tc.desc Verify Object.assign copies source value "4" for key "k", "k", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': 2 };
      const s2: Record<string, Any> = { 'k': 3 };
      const ret: Record<string, Any> = Object.assign(target, s1, s2);
      ret['k'] = 4;
      let actual1: string = `${target['k']!}`;
      let expected1: string = '4';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${s2['k']!}`;
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1130
     * @tc.name objectAssignTest113
     * @tc.desc Verify Object.assign copies source value "9" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const s1: Record<string, Any> = { 'b': 2 };
      const s2: Record<string, Any> = { 'c': 3 };
      const r1: Record<string, Any> = Object.assign(target, s1);
      const r2: Record<string, Any> = Object.assign(r1, s2);
      r2['a'] = 9;
      let actual1: string = `${target['a']!}`;
      let expected1: string = '9';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['b']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['c']!}`;
      let expected3: string = '3';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1140
     * @tc.name objectAssignTest114
     * @tc.desc Verify Object.assign copies source value "1" for key "a", "b", "b" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const s1: Record<string, Any> = { 'b': 3 };
      const ret: Record<string, Any> = Object.assign(target, s1);
      let actual1: string = `${ret['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${ret['b']!}`;
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1150
     * @tc.name objectAssignTest115
     * @tc.desc Verify Object.assign copies source value 3 for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const s1: Record<string, Any> = { 'b': 2, 'c': 3 };
      const ret: Record<string, Any> = Object.assign(target, s1);
      let actual1: int = Object.keys(ret).length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: int = Object.keys(target).length;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${ret['a']!}`;
      let expected3: string = `${1}`;
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${ret['b']!}`;
      let expected4: string = `${2}`;
      expect(actual4).assertEqual(expected4);
      let actual5: string = `${ret['c']!}`;
      let expected5: string = `${3}`;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1160
     * @tc.name objectAssignTest116
     * @tc.desc Verify Object.assign copies source value "6" for key "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'k': 2 };
      const ret: Record<string, Any> = Object.assign(target, s1);
      ret['k'] = 5;
      const s2: Record<string, Any> = { 'k': 6 };
      Object.assign(target, s2);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '6';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1170
     * @tc.name objectAssignTest117
     * @tc.desc Verify Object.assign returns target reference; manual property write on return value is reflected in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const empty: Record<string, Any> = {};
      const ret: Record<string, Any> = Object.assign(target, empty);
      ret['m'] = 2;
      let actual1: string = `${target['m']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1180
     * @tc.name objectAssignTest118
     * @tc.desc Verify Object.assign returns target reference; existing target key retained and manual write reflected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const s1: Record<string, Any> = { 'm': 2 };
      const ret: Record<string, Any> = Object.assign(target, s1);
      const t2: Record<string, Any> = { 'x': 0 };
      Object.assign(t2, ret);
      t2['k'] = 9;
      let actual1: string = `${target['k']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${t2['k']!}`;
      let expected2: string = '9';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1190
     * @tc.name objectAssignTest119
     * @tc.desc Verify Object.assign returns target reference; manual writes on return value reflected in target (keys a, d)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const s1: Record<string, Any> = { 'c': 3, 'd': 4 };
      const ret: Record<string, Any> = Object.assign(target, s1);
      ret['a'] = 10;
      ret['d'] = 40;
      let actual1: string = `${target['a']!}`;
      let expected1: string = "10";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['b']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['c']!}`;
      let expected3: string = '3';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${target['d']!}`;
      let expected4: string = "40";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1200
     * @tc.name objectAssignTest120
     * @tc.desc Verify Object.assign copies number value 1 for key "a" from source into empty target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'a': 1 };
      Object.assign(target, source);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1210
     * @tc.name objectAssignTest121
     * @tc.desc Verify Object.assign with 2 sources overwrites key "a" with 1 and copies key "c" with 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 0 };
      const s1: Record<string, Any> = { 'a': 1, 'b': 2 };
      const s2: Record<string, Any> = { 'c': 3 };
      Object.assign(target, s1, s2);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['c']!}`;
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1220
     * @tc.name objectAssignTest122
     * @tc.desc Verify Object.assign copies string source chars by index, target["0"] is "a"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, "abc");
      let actual1: string = target['0']! as string;
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1230
     * @tc.name objectAssignTest123
     * @tc.desc Verify Object.assign ignores number source with 0 keys copied into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, 123);
      let actual1: int = Object.keys(target).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1240
     * @tc.name objectAssignTest124
     * @tc.desc Verify Object.assign ignores boolean source with 0 keys copied into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, true);
      let actual1: int = Object.keys(target).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1250
     * @tc.name objectAssignTest125
     * @tc.desc Verify Object.assign copies array source elements, 3 index keys merged into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Array<Any> = [1, 2, 3];
      Object.assign(target, source);
      let actual1: int = Object.keys(target).length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1260
     * @tc.name objectAssignTest126
     * @tc.desc Verify Object.assign ignores empty Object instance source with 0 keys copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Object = new Object();
      Object.assign(target, source);
      let actual1: int = Object.keys(target).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1270
     * @tc.name objectAssignTest127
     * @tc.desc Verify Object.assign copies own field "size" with value 10 from class instance source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: BoxTest = new BoxTest();
      Object.assign(target, source);
      let actual1: string = `${target['size']!}`;
      let expected1: string = "10";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1280
     * @tc.name objectAssignTest128
     * @tc.desc Verify Object.assign overwrites key "a" with 9 and adds key "c" with 3 in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const source: Record<string, Any> = { 'a': 9, 'c': 3 };
      Object.assign(target, source);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '9';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['c']!}`;
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1290
     * @tc.name objectAssignTest129
     * @tc.desc Verify Object.assign merges 3 special-character keys (script tag, CJK, emoji) into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "<script>x</script>": 1, '中': 2, '😀': 3 };
      Object.assign(target, source);
      let actual1: int = Object.keys(target).length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1300
     * @tc.name objectAssignTest130
     * @tc.desc Verify Object.assign of 3 sequential sources merges keys "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const srcRecord1: Record<string, Any> = { 'a': 1 };
      Object.assign(target, srcRecord1);
      const srcRecord2: Record<string, Any> = { 'b': 2 };
      Object.assign(target, srcRecord2);
      const srcRecord3: Record<string, Any> = { 'c': 3 };
      Object.assign(target, srcRecord3);
      let actual1: int = Object.keys(target).length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1310
     * @tc.name objectAssignTest131
     * @tc.desc Verify Object.assign copies top-level key of nested source by reference, 1 key in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested1: Record<string, Any> = { 'v': 1 };
      const nested2: Record<string, Any> = { "l3": nested1 };
      const nested3: Record<string, Any> = { "l2": nested2 };
      const deep: Record<string, Any> = { "l1": nested3 };
      const target: Record<string, Any> = {};
      Object.assign(target, deep);
      let actual1: int = Object.keys(target).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1320
     * @tc.name objectAssignTest132
     * @tc.desc Verify Object.assign copies source value "1" for key "a" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const srcRecord4: Record<string, Any> = { 'a': 1 };
      const ret: Record<PropertyKey, Any> = Object.assign(target, srcRecord4);
      let actual1: string = `${ret['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1330
     * @tc.name objectAssignTest133
     * @tc.desc Verify Object.assign copies source value "x" for key "0", "1", "2" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, ['x', 'y', 'z']);
      let actual1: string = `${target['0']!}`;
      let expected1: string = 'x';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['1']!}`;
      let expected2: string = 'y';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['2']!}`;
      let expected3: string = 'z';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1340
     * @tc.name objectAssignTest134
     * @tc.desc Verify Object.assign copies source value "3" for key "2" into target without copying "length"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, [1, 2, 3]);
      let actual1: boolean = target.hasOwnProperty("length");
      expect(actual1).assertFalse();
      let actual2: string = `${target['2']!}`;
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1350
     * @tc.name objectAssignTest135
     * @tc.desc Verify Object.assign copies source value "v" for key "extra" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Record<string, Any> = { "extra": 'v' };
      const target: Record<string, Any> = {};
      Object.assign(target, arr);
      let actual1: string = `${target['extra']!}`;
      let expected1: string = 'v';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1360
     * @tc.name objectAssignTest136
     * @tc.desc Verify Object.assign copies source value "1" for key "0", "1" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const matrix: Array<Array<number>> = [
        [1, 2],
        [3, 4],
      ];
      const target: Record<string, Any> = {};
      Object.assign(target, matrix);
      let actual1: string = (target['0'] as Array<number>)[0].toString();
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = (target['1'] as Array<number>)[1].toString();
      let expected2: string = '4';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1370
     * @tc.name objectAssignTest137
     * @tc.desc Verify Object.assign keeps target value "1" for key "a" when assigning an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      Object.assign(target, [] as Array<Any>);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = target.hasOwnProperty('0');
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1380
     * @tc.name objectAssignTest138
     * @tc.desc Verify Object.assign copies source value "10" for key "0", "1" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, [10, 20]);
      let actual1: string = `${target['0']!}`;
      let expected1: string = "10";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['1']!}`;
      let expected2: string = "20";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1390
     * @tc.name objectAssignTest139
     * @tc.desc Verify Object.assign copies source value "true" for key "0", "1" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, [true, false]);
      let actual1: string = `${target['0']!}`;
      let expected1: string = "true";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['1']!}`;
      let expected2: string = "false";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1400
     * @tc.name objectAssignTest140
     * @tc.desc Verify Object.assign copies source value "9" for key "0", "1", "2" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, [1, 2, 3], [9]);
      let actual1: string = `${target['0']!}`;
      let expected1: string = '9';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['1']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['2']!}`;
      let expected3: string = '3';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1410
     * @tc.name objectAssignTest141
     * @tc.desc Verify Object.assign copies source value "5" for key "0" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { '0': "old" };
      Object.assign(target, [5]);
      let actual1: string = `${target['0']!}`;
      let expected1: string = '5';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1420
     * @tc.name objectAssignTest142
     * @tc.desc Verify Object.assign copies source value "1" for key "0", "name" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const srcRecord5: Record<string, Any> = { "name": "arr" };
      Object.assign(target, [1, 2], srcRecord5);
      let actual1: string = `${target['0']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['name']!}`;
      let expected2: string = "arr";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1430
     * @tc.name objectAssignTest143
     * @tc.desc Verify Object.assign copies source value "7" for key "0", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, [7]);
      const srcRecord6: Record<string, Any> = { 'k': 'v' };
      Object.assign(target, srcRecord6);
      let actual1: string = `${target['0']!}`;
      let expected1: string = '7';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['k']!}`;
      let expected2: string = 'v';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1440
     * @tc.name objectAssignTest144
     * @tc.desc Verify Object.assign keeps target value "1" for key "a" when assigning an empty object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Object = new Object();
      Object.assign(target, source);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = target.hasOwnProperty('b');
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1450
     * @tc.name objectAssignTest145
     * @tc.desc Verify Object.assign copies source value "d" for key "dynamic" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Record<string, Any> = {};
      source["dynamic"] = 'd';
      const target: Record<string, Any> = {};
      Object.assign(target, source);
      let actual1: string = `${target['dynamic']!}`;
      let expected1: string = 'd';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1460
     * @tc.name objectAssignTest146
     * @tc.desc Verify Object.assign copies source value "10" for key "x", "y" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Record<string, Any> = {};
      source['x'] = 10;
      source['y'] = 20;
      const target: Record<string, Any> = {};
      Object.assign(target, source);
      let actual1: string = `${target['x']!}`;
      let expected1: string = "10";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['y']!}`;
      let expected2: string = "20";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1470
     * @tc.name objectAssignTest147
     * @tc.desc Verify Object.assign copies source value "1" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst: Record<string, Any> = {};
      inst['a'] = 1;
      inst['b'] = 2;
      const target: Record<string, Any> = {};
      const srcRecord7: Record<string, Any> = { 'a': 9, 'c': 3 };
      Object.assign(target, srcRecord7, inst);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['b']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['c']!}`;
      let expected3: string = '3';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1480
     * @tc.name objectAssignTest148
     * @tc.desc Verify Object.assign copies source value "1" for key "a", "b" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: Record<string, Any> = {};
      o1['a'] = 1;
      const o2: Record<string, Any> = {};
      o2['b'] = 2;
      const target: Record<string, Any> = {};
      Object.assign(target, o1, o2);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['b']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1490
     * @tc.name objectAssignTest149
     * @tc.desc Verify Object.assign copies source value "k" for key "keep" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "keep": 'k' };
      const source: Object = new Object();
      Object.assign(target, source);
      let actual1: string = `${target['keep']!}`;
      let expected1: string = 'k';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1500
     * @tc.name objectAssignTest150
     * @tc.desc Verify Object.assign performs shallow copy and target reflects nested source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Record<string, Any> = { "inner": 'v' };
      const inst: Record<string, Any> = {};
      inst["deep"] = nested;
      const target: Record<string, Any> = {};
      Object.assign(target, inst);
      nested["inner"] = 'w';
      let actual1: string = `${(target['deep'] as Record<string, Any>)['inner']!}`;
      let expected1: string = 'w';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1510
     * @tc.name objectAssignTest151
     * @tc.desc Verify Object.assign copies source value "e" for key "extra", "label" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst: Record<string, Any> = {};
      inst["extra"] = 'e';
      const target: Record<string, Any> = {};
      Object.assign(target, inst, new Maker());
      let actual1: string = `${target['extra']!}`;
      let expected1: string = 'e';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['label']!}`;
      let expected2: string = 'L';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1520
     * @tc.name objectAssignTest152
     * @tc.desc Verify Object.assign copies source value "1" for key "first", "0" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst: Record<string, Any> = {};
      inst["first"] = 1;
      const target: Record<string, Any> = {};
      Object.assign(target, inst, [9]);
      let actual1: string = `${target['first']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['0']!}`;
      let expected2: string = '9';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1530
     * @tc.name objectAssignTest153
     * @tc.desc Verify Object.assign copies source value "42" for key "n", "s" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst: Record<string, Any> = {};
      inst['n'] = 42;
      inst['s'] = "forty";
      const target: Record<string, Any> = {};
      Object.assign(target, inst);
      let actual1: string = `${target['n']!}`;
      let expected1: string = "42";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['s']!}`;
      let expected2: string = "forty";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1540
     * @tc.name objectAssignTest154
     * @tc.desc Verify Object.assign copies source value "dog" for key "name", "legs" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, new Animal());
      let actual1: string = `${target['name']!}`;
      let expected1: string = "dog";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['legs']!}`;
      let expected2: string = '4';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1550
     * @tc.name objectAssignTest155
     * @tc.desc Verify Object.assign does not copy class methods from source instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, new Animal001());
      let actual1: boolean = target.hasOwnProperty("speak");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1560
     * @tc.name objectAssignTest156
     * @tc.desc Verify Object.assign copies source value "b" for key "baseProp", "childProp" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, new Child());
      let actual1: string = `${target['baseProp']!}`;
      let expected1: string = 'b';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['childProp']!}`;
      let expected2: string = 'c';
      expect(actual2).assertEqual(expected2);
      let actual3: boolean = target.hasOwnProperty("shared");
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1570
     * @tc.name objectAssignTest157
     * @tc.desc Verify Object.assign copies source value "3" for key "x", "y" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, new Point(3, 5));
      let actual1: string = `${target['x']!}`;
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['y']!}`;
      let expected2: string = '5';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1580
     * @tc.name objectAssignTest158
     * @tc.desc Verify Object.assign copies source value "app" for key "name" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, new Config());
      let actual1: string = `${target['name']!}`;
      let expected1: string = "app";
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = target.hasOwnProperty("version");
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1590
     * @tc.name objectAssignTest159
     * @tc.desc Verify Object.assign copies source value "8" for key "price", "tag" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const srcRecord8: Record<string, Any> = { "price": 8 };
      Object.assign(target, new Item(), srcRecord8);
      let actual1: string = `${target['price']!}`;
      let expected1: string = '8';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['tag']!}`;
      let expected2: string = "old";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1600
     * @tc.name objectAssignTest160
     * @tc.desc Verify Object.assign copies source value "A" for key "a", "b" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, new A(), new B());
      let actual1: string = `${target['a']!}`;
      let expected1: string = 'A';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['b']!}`;
      let expected2: string = 'B';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1610
     * @tc.name objectAssignTest161
     * @tc.desc Verify Object.assign copies source value "1" for nested key "data" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, new Holder());
      let actual1: string = `${(target['data'] as Record<string, Any>)['v']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1620
     * @tc.name objectAssignTest162
     * @tc.desc Verify Object.assign copies source array for key "items" into target with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, new Bag());
      let actual1: string = (target["items"] as Array<string>).length.toString();
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
      let actual2: string = (target["items"] as Array<string>)[0].toString();
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1630
     * @tc.name objectAssignTest163
     * @tc.desc Verify Object.assign copies source value "1" for key "keep" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "keep": 1 };
      Object.assign(target, new Empty());
      let actual1: string = `${target['keep']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = target.hasOwnProperty("extra");
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1640
     * @tc.name objectAssignTest164
     * @tc.desc Verify Object.assign copies source value "0" for key "count", "flag", "label" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, new Defaults());
      let actual1: string = `${target['count']!}`;
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['flag']!}`;
      let expected2: string = "true";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['label']!}`;
      let expected3: string = '';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1650
     * @tc.name objectAssignTest165
     * @tc.desc Verify Object.assign copies source value "hi" for key "text", "0" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, new Note(), ["tail"]);
      let actual1: string = `${target['text']!}`;
      let expected1: string = "hi";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['0']!}`;
      let expected2: string = "tail";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1660
     * @tc.name objectAssignTest166
     * @tc.desc Verify Object.assign copies source value "zh" for key "\u4E2D\u6587" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "\u4E2D\u6587": "zh" };
      Object.assign(target, source);
      let actual1: string = `${target['\u4E2D\u6587']!}`;
      let expected1: string = "zh";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1670
     * @tc.name objectAssignTest167
     * @tc.desc Verify Object.assign copies source value "fire" for key "\u1f525", "\u6c34" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { '🔥': "fire", '水': "water" };
      Object.assign(target, source);
      let actual1: string = `${target['🔥']!}`;
      let expected1: string = "fire";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['水']!}`;
      let expected2: string = "water";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1680
     * @tc.name objectAssignTest168
     * @tc.desc Verify Object.assign copies source value "1" for key "\u4E2D", "\u1f1e8\u1f1f3", "\u1f440" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const srcRecord9: Record<string, Any> = { "\u4E2D": 1 };
      Object.assign(target, srcRecord9);
      const srcRecord10: Record<string, Any> = { "🇨🇳": 2 };
      Object.assign(target, srcRecord10);
      const srcRecord11: Record<string, Any> = { '👀': 3 };
      Object.assign(target, srcRecord11);
      let actual1: string = `${target['\u4E2D']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['🇨🇳']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['👀']!}`;
      let expected3: string = '3';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1690
     * @tc.name objectAssignTest169
     * @tc.desc Verify Object.assign copies source value "3" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const srcRecord12: Record<string, Any> = { 'b': 2 };
      Object.assign(target, srcRecord12);
      target['c'] = 3;
      let actual1: string = `${target['c']!}`;
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1700
     * @tc.name objectAssignTest170
     * @tc.desc Verify Object.assign copies source value "99" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const srcRecord13: Record<string, Any> = { 'b': 2, 'c': 3 };
      Object.assign(target, srcRecord13);
      target['b'] = 99;
      let actual1: string = `${target['b']!}`;
      let expected1: string = "99";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['c']!}`;
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1710
     * @tc.name objectAssignTest171
     * @tc.desc Verify Object.assign copies source value "1" for key "a", "b" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const srcRecord14: Record<string, Any> = { 'b': 2 };
      const ret: Record<PropertyKey, Any> = Object.assign(target, srcRecord14);
      let actual1: boolean = target.hasOwnProperty('b');
      expect(actual1).assertTrue();
      let actual2: string = `${ret['a']!}`;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1720
     * @tc.name objectAssignTest172
     * @tc.desc Verify Object.assign copies source value "9" for key "a", "b", "z" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const srcRecord15: Record<string, Any> = { 'b': 2 };
      const ret: Record<PropertyKey, Any> = Object.assign(target, srcRecord15);
      ret['z'] = 9;
      let actual1: string = `${target['z']!}`;
      let expected1: string = '9';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1730
     * @tc.name objectAssignTest173
     * @tc.desc Verify Object.assign copies source value "e" for key "a", "extra" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const srcRecord16: Record<string, Any> = { 'a': 1 };
      const ret: Record<PropertyKey, Any> = Object.assign(target, srcRecord16);
      ret["extra"] = 'e';
      let actual1: string = `${target['extra']!}`;
      let expected1: string = 'e';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1740
     * @tc.name objectAssignTest174
     * @tc.desc Verify Object.assign keeps existing key "a" in target after merging source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const srcRecord17: Record<string, Any> = { 'b': 2 };
      Object.assign(target, srcRecord17);
      let actual1: boolean = target.hasOwnProperty('a');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1750
     * @tc.name objectAssignTest175
     * @tc.desc Verify Object.assign copies source value "1" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const srcRecord18: Record<string, Any> = { 'b': 2 };
      Object.assign(target, srcRecord18);
      const srcRecord19: Record<string, Any> = { 'c': 3 };
      Object.assign(target, srcRecord19);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['c']!}`;
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1760
     * @tc.name objectAssignTest176
     * @tc.desc Verify Object.assign keeps target value "1" for key "a" after source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Record<string, Any> = { 'a': 1 };
      const target: Record<string, Any> = {};
      Object.assign(target, source);
      source['a'] = 99;
      let actual1: string = `${target['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1770
     * @tc.name objectAssignTest177
     * @tc.desc Verify Object.assign copies source value "3" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const srcRecord21: Record<string, Any> = { 'a': 1 };
      const srcRecord20: Record<string, Any> = { 'b': 2 };
      const first: Record<string, Any> = Object.assign(srcRecord21, srcRecord20);
      const srcRecord22: Record<string, Any> = { 'c': 3 };
      const second: Record<string, Any> = Object.assign(first, srcRecord22);
      let actual1: string = `${first['c']!}`;
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${second['a']!}`;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1780
     * @tc.name objectAssignTest178
     * @tc.desc Verify Object.assign preserves key order "a", "b" in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const srcRecord23: Record<string, Any> = { 'b': 2 };
      Object.assign(target, srcRecord23);
      let actual1: string = Object.keys(target)[0]!.toString();
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = Object.keys(target)[1]!.toString();
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1790
     * @tc.name objectAssignTest179
     * @tc.desc Verify Object.assign shallow-copies nested value for key "nested" reflecting mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const nested1: Record<string, Any> = { 'v': 1 };
      const srcRecord24: Record<string, Any> = { "nested": nested1 };
      Object.assign(target, srcRecord24);
      const nested: Record<string, Any> = target["nested"] as Record<string, Any>;
      nested['v'] = 5;
      let actual1: string = `${(target['nested'] as Record<string, Any>)['v']!}`;
      let expected1: string = '5';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1800
     * @tc.name objectAssignTest180
     * @tc.desc Verify Object.assign does not mutate source values "v1", "v2" for key "k" when target changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s1: Record<string, Any> = { 'k': "v1" };
      const s2: Record<string, Any> = { 'k': "v2" };
      const target: Record<string, Any> = {};
      Object.assign(target, s1);
      Object.assign(target, s2);
      target['k'] = "final";
      let actual1: string = `${s1['k']!}`;
      let expected1: string = "v1";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${s2['k']!}`;
      let expected2: string = "v2";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1810
     * @tc.name objectAssignTest181
     * @tc.desc Verify Object.assign copies source value "1" for key "a", "b", "c" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const srcRecord25: Record<string, Any> = { 'a': 1, 'b': 2 };
      Object.assign(target, srcRecord25);
      const srcRecord26: Record<string, Any> = { 'c': 3 };
      Object.assign(target, srcRecord26);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['b']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['c']!}`;
      let expected3: string = '3';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1820
     * @tc.name objectAssignTest182
     * @tc.desc Verify Object.assign copies source value "1" for key "a", "b", "c", "d" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const srcRecord28: Record<string, Any> = { 'a': 1 };
      const srcRecord27: Record<string, Any> = { 'b': 2 };
      const t1: Record<string, Any> = Object.assign(srcRecord28, srcRecord27);
      const srcRecord29: Record<string, Any> = { 'c': 3 };
      const t2: Record<string, Any> = Object.assign(t1, srcRecord29);
      const srcRecord30: Record<string, Any> = { 'd': 4 };
      const t3: Record<string, Any> = Object.assign(t2, srcRecord30);
      let actual1: string = `${t3['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${t3['b']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${t3['c']!}`;
      let expected3: string = '3';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${t3['d']!}`;
      let expected4: string = '4';
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1830
     * @tc.name objectAssignTest183
     * @tc.desc Verify Object.assign overrides target with later source value "3" for key "k"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const srcRecord31: Record<string, Any> = { 'k': 1 };
      Object.assign(target, srcRecord31);
      const srcRecord32: Record<string, Any> = { 'k': 2 };
      Object.assign(target, srcRecord32);
      const srcRecord33: Record<string, Any> = { 'k': 3 };
      Object.assign(target, srcRecord33);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1840
     * @tc.name objectAssignTest184
     * @tc.desc Verify Object.assign copies source value "second" for key "a", "k" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const srcRecord34: Record<string, Any> = { 'a': 1, 'k': "first" };
      Object.assign(target, srcRecord34);
      const srcRecord35: Record<string, Any> = { 'k': "second" };
      Object.assign(target, srcRecord35);
      let actual1: string = `${target['k']!}`;
      let expected1: string = "second";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['a']!}`;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1850
     * @tc.name objectAssignTest185
     * @tc.desc Verify Object.assign copies source value "1" for key "a", "b" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const srcRecord36: Record<string, Any> = { 'a': 1 };
      Object.assign(target, srcRecord36);
      const srcRecord37: Record<string, Any> = {};
      Object.assign(target, srcRecord37);
      const srcRecord38: Record<string, Any> = { 'b': 2 };
      Object.assign(target, srcRecord38);
      let actual1: string = `${target['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['b']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1860
     * @tc.name objectAssignTest186
     * @tc.desc Verify Object.assign copies source value "2" for key "0", "name", "tail" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, [1]);
      const srcRecord39: Record<string, Any> = { "name": "mix" };
      Object.assign(target, srcRecord39);
      Object.assign(target, [2]);
      const srcRecord40: Record<string, Any> = { "tail": "end" };
      Object.assign(target, srcRecord40);
      let actual1: string = `${target['0']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['name']!}`;
      let expected2: string = "mix";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['tail']!}`;
      let expected3: string = "end";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1870
     * @tc.name objectAssignTest187
     * @tc.desc Verify Object.assign copies source value "keep" for key "first", "second", "third" into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "first": "keep" };
      const srcRecord41: Record<string, Any> = { "second": "add" };
      Object.assign(target, srcRecord41);
      const srcRecord42: Record<string, Any> = { "third": "more" };
      Object.assign(target, srcRecord42);
      let actual1: string = `${target['first']!}`;
      let expected1: string = "keep";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['second']!}`;
      let expected2: string = "add";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['third']!}`;
      let expected3: string = "more";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN2_1880
     * @tc.name objectAssignTest188
     * @tc.desc Verify Object.assign merges sources leaving 4 keys "a", "b", "c", "d" in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectAssignTest188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const srcRecord43: Record<string, Any> = { 'b': 20, 'c': 3 };
      Object.assign(target, srcRecord43);
      const srcRecord44: Record<string, Any> = { 'd': 4 };
      Object.assign(target, srcRecord44);
      let actual1: string = Object.keys(target).length.toString();
      let expected1: string = '4';
      expect(actual1).assertEqual(expected1);
    });
  });
}
