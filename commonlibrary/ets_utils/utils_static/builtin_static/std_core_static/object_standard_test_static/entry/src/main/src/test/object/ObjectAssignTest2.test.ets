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
  });
}
