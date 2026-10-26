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

type EmptyRecord = Record<string, Any>;

class BoxTest {
  value: int = 5;
}

class Box001 {
  value: int = 5;
}

class Box002 {
  value: int = 5;
}

class Pair {
  a: int = 1;
  b: int = 2;
}

class Pair001 {
  a: int = 1;
  b: int = 2;
}

class Triple {
  first: int = 1;
  second: int = 2;
  third: int = 3;
}

class Defaults {
  x: int = 10;
  y: string = "hi";
}

class User {
  name: string = '';
  age: int = 0;
  constructor(name: string, age: int) {
    this.name = name;
    this.age = age;
  }
}

class D {
  ratio: double = 1.5;
}

class S {
  msg: string = "ok";
}

class B {
  flag: boolean = true;
}

class N {
  value: string | null = null;
}

class Holder {
  data: int[] = [1, 2, 3];
}

class Address {
  city: string = "Beijing";
}

class Person {
  name: string = "Tom";
  address: Address = new Address();
}

class Config {
  static version: string = "1.0";
  env: string = "prod";
}

class Greeter {
  greeting: string = "hi";
  greet(): string {
    return this.greeting;
  }
}

class Item {
  name: string = 'n';
}

class Animal {
  type: string = "animal";
}

class Dog extends Animal {
  name: string = "wangwang";
}

class Animal001 {
  type: string = "animal";
}

class Dog001 extends Animal001 {
  name: string = "wangwang";
}

class Animal002 {
  type: string = "animal";
}

class Dog002 extends Animal002 {
  name: string = "wangwang";
}

class GrandParent {
  a: string = 'a';
}

class Parent extends GrandParent {
  b: string = 'b';
}

class Child extends Parent {
  c: string = 'c';
}

class Point {
  x: number = 1;
  y: number = 2;
}

class Counter {
  count: number = 0;
  inc(): void {
    this.count = this.count + 1;
  }
}

class Box003 {
  w: number = 1;
  h: number = 2;
  d: number = 3;
}

class Pair002 {
  a: number = 1;
  b: number = 2;
}

class Rec {
  m: number = 1;
  n: number = 2;
}

class Book {
  title: string = "ArkTS";
  pages: number = 100;
}

class Config001 {
  host: string = "localhost";
  port: number = 8080;
}

class Task {
  id: number = 1;
  name: string = 't';
}

class WorkerTest {
  name: string = "tom";
  run(): void {
    this.name = "run";
  }
}


export default function objectEntriesTest2(): void {

  describe("ObjectEntriesTest2", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0010
     * @tc.name objectEntriesTest001
     * @tc.desc Verify Object.entries returns empty array of length 0 for empty record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const entries = Object.entries(record);
      expect(entries.length).assertEqual(0);
      expect(entries.includes(['a', 1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0020
     * @tc.name objectEntriesTest002
     * @tc.desc Verify Object.entries returns array of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, number> = {};
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0030
     * @tc.name objectEntriesTest003
     * @tc.desc Verify Object.entries returns array of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = {};
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0040
     * @tc.name objectEntriesTest004
     * @tc.desc Verify Object.entries returns array of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: EmptyRecord = {};
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0050
     * @tc.name objectEntriesTest005
     * @tc.desc Verify Object.entries returns array of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const first = Object.entries(record);
      const second = Object.entries(record);
      let actual1: int = first.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = second.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0060
     * @tc.name objectEntriesTest006
     * @tc.desc Verify Object.entries returns array of length 0 and reflects property additions (length 1 after adding key)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      let actual1: int = Object.entries(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      record["count"] = 1;
      let actual2: int = Object.entries(record).length;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0070
     * @tc.name objectEntriesTest007
     * @tc.desc Verify Object.entries includes property added to record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["flag"] = true;
      const entries = Object.entries(record);
      let actual1: string = entries[0]![0];
      let expected1: string = "flag";
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = entries[0]![1]! as boolean;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0080
     * @tc.name objectEntriesTest008
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "year": 2026 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[0]![1]!}`;
      let expected2: string = "2026";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0090
     * @tc.name objectEntriesTest009
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "active": true };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "active";
      expect(actual2).assertEqual(expected2);
      let actual3: boolean = entries[0]![1]! as boolean;
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0100
     * @tc.name objectEntriesTest010
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '': "empty-key" };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = '';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]!}`;
      let expected3: string = "empty-key";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0110
     * @tc.name objectEntriesTest011
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "key with space": 42 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "key with space";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]!}`;
      let expected3: string = "42";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0120
     * @tc.name objectEntriesTest012
     * @tc.desc Verify Object.entries entry for record is a pair array of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const entries = Object.entries(record);
      let actual1: int = entries[0]!.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0130
     * @tc.name objectEntriesTest013
     * @tc.desc Verify Object.entries returns array of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0140
     * @tc.name objectEntriesTest014
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
      const entries = Object.entries(record);
      let actual1: string = entries[0]![0];
      let expected1: string = "name";
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![0];
      let expected2: string = "year";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0150
     * @tc.name objectEntriesTest015
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
      const entries = Object.entries(record);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = "ArkTS";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[1]![1]!}`;
      let expected2: string = "2026";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0160
     * @tc.name objectEntriesTest016
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "str": "hello", "num": 7, "bool": false };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = entries[2]![1]! as boolean;
      expect(actual2).assertFalse();
      let actual3: string = `${entries[0]![1]!}`;
      let expected3: string = "hello";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0170
     * @tc.name objectEntriesTest017
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "姓名": "张三", "年龄": 18 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "姓名";
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = "年龄";
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${entries[1]![1]!}`;
      let expected4: string = "18";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0180
     * @tc.name objectEntriesTest018
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '': "blank", "key": 1 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = '';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = "key";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0190
     * @tc.name objectEntriesTest019
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = 'x';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = 'y';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0200
     * @tc.name objectEntriesTest020
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2 };
      record['x'] = 100;
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = 'x';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]!}`;
      let expected3: string = "100";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0210
     * @tc.name objectEntriesTest021
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      record['b'] = 2;
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = 'b';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0220
     * @tc.name objectEntriesTest022
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["key"] = 1;
      record["key"] = 2;
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "key";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]!}`;
      let expected3: string = '2';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0230
     * @tc.name objectEntriesTest023
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      record['a'] = 9;
      const entries = Object.entries(record);
      let actual1: string = entries[0]![0];
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![0];
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0240
     * @tc.name objectEntriesTest024
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "one": "1st", "two": "2nd", "three": "3rd" };
      const entries = Object.entries(record);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = "1st";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[1]![1]!}`;
      let expected2: string = "2nd";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[2]![1]!}`;
      let expected3: string = "3rd";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0250
     * @tc.name objectEntriesTest025
     * @tc.desc Verify Object.entries returns array of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': "one", 'b': "two" };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0260
     * @tc.name objectEntriesTest026
     * @tc.desc Verify Object.entries returns array of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "same": 1 };
      record["same"] = 5;
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0270
     * @tc.name objectEntriesTest027
     * @tc.desc Verify Object.entries returns array of length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      record['c'] = 3;
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0280
     * @tc.name objectEntriesTest028
     * @tc.desc Verify Object.entries returns array of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["k1"] = 1;
      record["k2"] = 2;
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0290
     * @tc.name objectEntriesTest029
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "level": 5 };
      const entries = Object.entries(record);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = '5';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0300
     * @tc.name objectEntriesTest030
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "ok": false };
      const entries = Object.entries(record);
      let actual1: boolean = entries[0]![1]! as boolean;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0310
     * @tc.name objectEntriesTest031
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const entries = Object.entries(record);
      const last = entries[entries.length - 1]!;
      let actual1: string = last[0]!;
      let expected1: string = 'c';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${last[1]}`;
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0320
     * @tc.name objectEntriesTest032
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "lang": "ArkTS" };
      const entries = Object.entries(record);
      let actual1: string = entries[0]![0];
      let expected1: string = "lang";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[0]![1]!}`;
      let expected2: string = "ArkTS";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0330
     * @tc.name objectEntriesTest033
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 10, 'y': 20, 'z': 30 };
      const entries = Object.entries(record);
      let total: int = 0;
      for (let i = 0; i < entries.length; i++) {
        total += Int.parseInt(`${entries[i]![1]!}`, 10);
      }
      expect(total).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0340
     * @tc.name objectEntriesTest034
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'n': null };
      const entries = Object.entries(record);
      let actual1: string = entries[0]![0];
      let expected1: string = 'n';
      expect(actual1).assertEqual(expected1);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0350
     * @tc.name objectEntriesTest035
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': null, 'b': 2 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actual2: string = `${entries[1]![1]!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0360
     * @tc.name objectEntriesTest036
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': null, 'y': null };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actualValue2: Any = entries[1]![1];
      let actualValue2IsNull: boolean = actualValue2 === null;
      expect(actualValue2IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0370
     * @tc.name objectEntriesTest037
     * @tc.desc Verify Object.entries entry value is undefined for undefined property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'u': undefined };
      const entries = Object.entries(record);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsUndefined: boolean = actualValue1 === undefined;
      expect(actualValue1IsUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0380
     * @tc.name objectEntriesTest038
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'u': undefined };
      const entries = Object.entries(record);
      let actual1: string = entries[0]![0];
      let expected1: string = 'u';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0390
     * @tc.name objectEntriesTest039
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'n': null, 'u': undefined };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actualValue2: Any = entries[1]![1];
      let actualValue2IsUndefined: boolean = actualValue2 === undefined;
      expect(actualValue2IsUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0400
     * @tc.name objectEntriesTest040
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': null, 'c': 3 };
      const entries = Object.entries(record);
      let actual1: string = entries[1]![0];
      let expected1: string = 'b';
      expect(actual1).assertEqual(expected1);
      let actualValue1: Any = entries[1]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      expect(entries[2]![1] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0410
     * @tc.name objectEntriesTest041
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': null };
      const entries = Object.entries(record);
      let actual1: string = entries[1]![0];
      let expected1: string = 'b';
      expect(actual1).assertEqual(expected1);
      let actualValue1: Any = entries[1]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actual2: int = entries.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0420
     * @tc.name objectEntriesTest042
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'n': null, 'v': "valid" };
      const entries = Object.entries(record);
      let actual1: string = `${entries[1]![1]!}`;
      let expected1: string = "valid";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0430
     * @tc.name objectEntriesTest043
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'u': undefined, 'k': 5 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsUndefined: boolean = actualValue1 === undefined;
      expect(actualValue1IsUndefined).assertTrue();
      let actual2: string = `${entries[1]![1]!}`;
      let expected2: string = '5';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0440
     * @tc.name objectEntriesTest044
     * @tc.desc Verify Object.entries returns array of length 0 for empty new Object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const entries1 = Object.entries(obj);
      const entries2 = Object.entries(obj);
      let actual1: int = entries1.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      expect(entries2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0450
     * @tc.name objectEntriesTest045
     * @tc.desc Verify Object.entries returns an array for new Object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const entries = Object.entries(obj);
      let actual1: boolean = Array.isArray(entries);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0460
     * @tc.name objectEntriesTest046
     * @tc.desc Verify Object.entries returns array of length 0 for two empty new Object instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objA: Object = new Object();
      const objB: Object = new Object();
      const entriesA = Object.entries(objA);
      const entriesB = Object.entries(objB);
      let actual1: int = entriesA.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = entriesB.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0470
     * @tc.name objectEntriesTest047
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const entries = Object.entries(arr);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = `${10}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0480
     * @tc.name objectEntriesTest048
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const entries = Object.entries(arr);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = "10";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[1]![1]!}`;
      let expected2: string = "20";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0490
     * @tc.name objectEntriesTest049
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const entries = Object.entries(arr);
      let actual1: int = entries[0]!.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = entries[1]!.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0500
     * @tc.name objectEntriesTest050
     * @tc.desc Verify Object.entries returns 1 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [7];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]!}`;
      let expected3: string = `${7}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0510
     * @tc.name objectEntriesTest051
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [-1, -2];
      const entries = Object.entries(arr);
      let actual1: string = entries[0]![0];
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![0];
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0520
     * @tc.name objectEntriesTest052
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [-1, -2];
      const entries = Object.entries(arr);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = `${-1}`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[1]![1]!}`;
      let expected2: string = `${-2}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0530
     * @tc.name objectEntriesTest053
     * @tc.desc Verify Object.entries returns 1 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [1000000];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[0]![1]!}`;
      let expected2: string = `${1000000}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0540
     * @tc.name objectEntriesTest054
     * @tc.desc Verify Object.entries returns 5 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [1, 2, 3, 4, 5];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[4]![0];
      let expected2: string = '4';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[4]![1]!}`;
      let expected3: string = `${5}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0550
     * @tc.name objectEntriesTest055
     * @tc.desc Verify Object.entries returns array of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.5, 2.25];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0560
     * @tc.name objectEntriesTest056
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.5, 2.25];
      const entries = Object.entries(arr);
      let actual1: string = entries[0]![0];
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![0];
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0570
     * @tc.name objectEntriesTest057
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.5, 2.25];
      const entries = Object.entries(arr);
      let actual1: number = entries[0]![1]! as number;
      let expected1: number = 1.5;
      expect(actual1).assertEqual(expected1);
      let actual2: number = entries[1]![1]! as number;
      let expected2: number = 2.25;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0580
     * @tc.name objectEntriesTest058
     * @tc.desc Verify Object.entries returns 1 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [3.0];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = entries[0]![1]! as number;
      let expected2: number = 3.0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0590
     * @tc.name objectEntriesTest059
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
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
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0600
     * @tc.name objectEntriesTest060
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const entries = Object.entries(arr);
      let actual1: string = entries[0]![1]! as string;
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![1]! as string;
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0610
     * @tc.name objectEntriesTest061
     * @tc.desc Verify Object.entries returns 1 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = [''];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![1]! as string;
      let expected2: string = '';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0620
     * @tc.name objectEntriesTest062
     * @tc.desc Verify Object.entries returns 1 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['x'];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0630
     * @tc.name objectEntriesTest063
     * @tc.desc Verify Object.entries returns array of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0640
     * @tc.name objectEntriesTest064
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false];
      const entries = Object.entries(arr);
      let actual1: string = entries[0]![0];
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![0];
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0650
     * @tc.name objectEntriesTest065
     * @tc.desc Verify Object.entries returns 1 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [false];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = entries[0]![1]! as boolean;
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0660
     * @tc.name objectEntriesTest066
     * @tc.desc Verify Object.entries returns 1 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string | null> = [null];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0670
     * @tc.name objectEntriesTest067
     * @tc.desc Verify Object.entries returns array of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | null> = [null, 5];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0680
     * @tc.name objectEntriesTest068
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | null> = [null, 5];
      const entries = Object.entries(arr);
      let actual1: string = entries[1]![0];
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[1]![1]!}`;
      let expected2: string = `${5}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0690
     * @tc.name objectEntriesTest069
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string | null> = [null, 'a'];
      const entries = Object.entries(arr);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actual1: string = entries[1]![1]! as string;
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0700
     * @tc.name objectEntriesTest070
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | string> = [1, 'a'];
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
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0710
     * @tc.name objectEntriesTest071
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | string> = [1, 'a'];
      const entries = Object.entries(arr);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = `${1}`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![1]! as string;
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0720
     * @tc.name objectEntriesTest072
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<boolean | double> = [true, 2.5];
      const entries = Object.entries(arr);
      let actual1: boolean = entries[0]![1]! as boolean;
      expect(actual1).assertTrue();
      let actual2: number = entries[1]![1]! as number;
      let expected2: number = 2.5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0730
     * @tc.name objectEntriesTest073
     * @tc.desc Verify Object.entries returns 3 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string | int | double> = ['x', 1, 2.5];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: number = entries[2]![1]! as number;
      let expected2: number = 2.5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0740
     * @tc.name objectEntriesTest074
     * @tc.desc Verify Object.entries returns 3 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string | int | null> = [null, 'b', 3];
      const entries = Object.entries(arr);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actual1: string = entries[1]![1]! as string;
      let expected1: string = 'b';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[2]![1]!}`;
      let expected2: string = `${3}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0750
     * @tc.name objectEntriesTest075
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[][] = [
        [1, 2],
        [3, 4],
      ];
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
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0760
     * @tc.name objectEntriesTest076
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[][] = [
        [1, 2],
        [3, 4],
      ];
      const entries = Object.entries(arr);
      let actual1: int = (entries[0]![1] as int[]).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0770
     * @tc.name objectEntriesTest077
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[][] = [
        [1, 2],
        [3, 4],
      ];
      const entries = Object.entries(arr);
      let actual1: number = (entries[0]![1] as int[])[0];
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = (entries[1]![1] as int[])[1];
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0780
     * @tc.name objectEntriesTest078
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[][] = [[], [1]];
      const entries = Object.entries(arr);
      let actual1: int = (entries[0]![1] as int[]).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: number = (entries[1]![1] as int[])[0];
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0790
     * @tc.name objectEntriesTest079
     * @tc.desc Verify Object.entries returns 1 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[][][] = [[[1]]];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = ((entries[0]![1] as int[][])[0] as int[])[0];
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0800
     * @tc.name objectEntriesTest080
     * @tc.desc Verify Object.entries returns array of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: BoxTest = new BoxTest();
      const entries = Object.entries(b);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0810
     * @tc.name objectEntriesTest081
     * @tc.desc Verify Object.entries returns the "value" key for class instance Box001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Box001 = new Box001();
      const entries = Object.entries(b);
      let actual1: string = entries[0]![0];
      let expected1: string = "value";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0820
     * @tc.name objectEntriesTest082
     * @tc.desc Verify Object.entries returns value 5 for class instance Box002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Box002 = new Box002();
      const entries = Object.entries(b);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = `${5}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0830
     * @tc.name objectEntriesTest083
     * @tc.desc Verify Object.entries returns 2 key-value pairs for class instance Pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Pair = new Pair();
      const entries = Object.entries(p);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = 'b';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0840
     * @tc.name objectEntriesTest084
     * @tc.desc Verify Object.entries returns values 1 and 2 for class instance Pair001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Pair001 = new Pair001();
      const entries = Object.entries(p);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = `${1}`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[1]![1]!}`;
      let expected2: string = `${2}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0850
     * @tc.name objectEntriesTest085
     * @tc.desc Verify Object.entries returns 3 key-value pairs for class instance Triple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Triple = new Triple();
      const entries = Object.entries(t);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "first";
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = "second";
      expect(actual3).assertEqual(expected3);
      let actual4: string = entries[2]![0];
      let expected4: string = "third";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0860
     * @tc.name objectEntriesTest086
     * @tc.desc Verify Object.entries returns 2 key-value pairs for class instance Defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Defaults = new Defaults();
      const entries = Object.entries(d);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[0]![1]!}`;
      let expected2: string = `${10}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![1]! as string;
      let expected3: string = "hi";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0870
     * @tc.name objectEntriesTest087
     * @tc.desc Verify Object.entries returns 2 key-value pairs for class instance User
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: User = new User("Alice", 30);
      const entries = Object.entries(u);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "name";
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = "age";
      expect(actual3).assertEqual(expected3);
      let actual4: string = entries[0]![1]! as string;
      let expected4: string = "Alice";
      expect(actual4).assertEqual(expected4);
      let actual5: string = `${entries[1]![1]!}`;
      let expected5: string = `${30}`;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0880
     * @tc.name objectEntriesTest088
     * @tc.desc Verify Object.entries returns value 1.5 for class instance D
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: D = new D();
      const entries = Object.entries(d);
      let actual1: number = entries[0]![1]! as number;
      let expected1: number = 1.5;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0890
     * @tc.name objectEntriesTest089
     * @tc.desc Verify Object.entries returns value "ok" for class instance S
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: S = new S();
      const entries = Object.entries(s);
      let actual1: string = entries[0]![1]! as string;
      let expected1: string = "ok";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0900
     * @tc.name objectEntriesTest090
     * @tc.desc Verify Object.entries returns value true for class instance B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: B = new B();
      const entries = Object.entries(b);
      let actual1: boolean = entries[0]![1]! as boolean;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0910
     * @tc.name objectEntriesTest091
     * @tc.desc Verify Object.entries returns 1 key-value pairs for class instance N
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: N = new N();
      const entries = Object.entries(n);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "value";
      expect(actual2).assertEqual(expected2);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0920
     * @tc.name objectEntriesTest092
     * @tc.desc Verify Object.entries returns 1 key-value pairs for class instance Holder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const h: Holder = new Holder();
      const entries = Object.entries(h);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: int = (entries[0]![1] as int[]).length;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
      let actual3: number = (entries[0]![1] as int[])[0];
      let expected3: int = 1;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0930
     * @tc.name objectEntriesTest093
     * @tc.desc Verify Object.entries returns 2 key-value pairs for class instance Person
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Person = new Person();
      const entries = Object.entries(p);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = (entries[1]![1] as Address).city;
      let expected2: string = "Beijing";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0940
     * @tc.name objectEntriesTest094
     * @tc.desc Verify Object.entries returns 1 key-value pairs for class instance Config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Config = new Config();
      const entries = Object.entries(c);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "env";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0950
     * @tc.name objectEntriesTest095
     * @tc.desc Verify Object.entries returns 1 key-value pairs for class instance Greeter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const g: Greeter = new Greeter();
      const entries = Object.entries(g);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "greeting";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0960
     * @tc.name objectEntriesTest096
     * @tc.desc Verify Object.entries returns entries with values "A" and "B" for class instance Item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Item = new Item();
      const b: Item = new Item();
      a.name = 'A';
      b.name = 'B';
      const entriesA = Object.entries(a);
      const entriesB = Object.entries(b);
      let actual1: string = entriesA[0]![1]! as string;
      let expected1: string = 'A';
      expect(actual1).assertEqual(expected1);
      let actual2: string = entriesB[0]![1]! as string;
      let expected2: string = 'B';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0970
     * @tc.name objectEntriesTest097
     * @tc.desc Verify Object.entries returns array of length 2 for class instance Dog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Dog = new Dog();
      const entries = Object.entries(d);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0980
     * @tc.name objectEntriesTest098
     * @tc.desc Verify Object.entries returns 2 key-value pairs for class instance Dog001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Dog001 = new Dog001();
      const entries = Object.entries(d);
      let actual1: string = entries[0]![0];
      let expected1: string = "type";
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![1]! as string;
      let expected2: string = "animal";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_0990
     * @tc.name objectEntriesTest099
     * @tc.desc Verify Object.entries returns 2 key-value pairs for class instance Dog002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Dog002 = new Dog002();
      const entries = Object.entries(d);
      let actual1: string = entries[1]![0];
      let expected1: string = "name";
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![1]! as string;
      let expected2: string = "wangwang";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1000
     * @tc.name objectEntriesTest100
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Child = new Child();
      const entries = Object.entries(c);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = 'b';
      expect(actual3).assertEqual(expected3);
      let actual4: string = entries[2]![0];
      let expected4: string = 'c';
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1010
     * @tc.name objectEntriesTest101
     * @tc.desc Verify Object.entries returns 3 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      const entries = Object.entries(arr);
      let actual1: string = entries[0]![0];
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![0];
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[2]![0];
      let expected3: string = '2';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1020
     * @tc.name objectEntriesTest102
     * @tc.desc Verify Object.entries returns 10 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 10;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[9]![0];
      let expected2: string = '9';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[9]![1]!}`;
      let expected3: string = `${9}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1030
     * @tc.name objectEntriesTest103
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const entries = Object.entries(arr);
      let actual1: int = entries[0]![1] as int;
      let expected1: int = 10;
      expect(actual1).assertEqual(expected1);
      let actual2: int = entries[1]![1] as int;
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1040
     * @tc.name objectEntriesTest104
     * @tc.desc Verify Object.entries returns array of length matching the input array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1050
     * @tc.name objectEntriesTest105
     * @tc.desc Verify Object.entries returns array of length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "type": "language", "ver": "1.2" };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1060
     * @tc.name objectEntriesTest106
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const entries = Object.entries(record);
      let actual1: string = entries[0]![1]! as string;
      let expected1: string = "ArkTS";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1070
     * @tc.name objectEntriesTest107
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 't': true, 'f': false };
      const entries = Object.entries(record);
      let actual1: boolean = entries[0]![1]! as boolean;
      expect(actual1).assertTrue();
      let actual2: boolean = entries[1]![1]! as boolean;
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1080
     * @tc.name objectEntriesTest108
     * @tc.desc Verify Object.entries returns 4 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3, 'd': 4 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[3]![0];
      let expected2: string = 'd';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[3]![1]!}`;
      let expected3: string = `${4}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1090
     * @tc.name objectEntriesTest109
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '': "empty" };
      const entries = Object.entries(record);
      let actual1: string = entries[0]![0];
      let expected1: string = '';
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![1]! as string;
      let expected2: string = "empty";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1100
     * @tc.name objectEntriesTest110
     * @tc.desc Verify Object.entries returns array of length matching a second Object.entries call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const e1 = Object.entries(record);
      const e2 = Object.entries(record);
      let actual1: int = e1.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${e1[0]![0]}`;
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${e1[1]![1]!}`;
      let expected3: string = '2';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${e2[0]![0]}`;
      let expected4: string = 'a';
      expect(actual4).assertEqual(expected4);
      let actual5: string = `${e2[1]![1]!}`;
      let expected5: string = '2';
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1110
     * @tc.name objectEntriesTest111
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const entries = Object.entries(record);
      entries[0] = ['z', 9];
      const again = Object.entries(record);
      let actual1: string = again[0]![0];
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${again[0]![1]!}`;
      let expected2: string = `${1}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1120
     * @tc.name objectEntriesTest112
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const srcRecord1: Record<string, Any> = { 'x': 1 };
      const entries = Object.entries(srcRecord1);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = 'x';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]!}`;
      let expected3: string = `${1}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1130
     * @tc.name objectEntriesTest113
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const srcRecord2: Record<string, Any> = { "alpha": 'a', "beta": 'b' };
      const entries = Object.entries(srcRecord2);
      let actual1: string = entries[0]![0];
      let expected1: string = "alpha";
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![0];
      let expected2: string = "beta";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1140
     * @tc.name objectEntriesTest114
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const srcRecord3: Record<string, Any> = { "alpha": 'a', "beta": 'b' };
      const entries = Object.entries(srcRecord3);
      let actual1: string = entries[0]![1]! as string;
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![1]! as string;
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1150
     * @tc.name objectEntriesTest115
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const srcRecord4: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const entries = Object.entries(srcRecord4);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[2]![0];
      let expected2: string = 'c';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[2]![1]!}`;
      let expected3: string = `${3}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1160
     * @tc.name objectEntriesTest116
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new Point();
      const entries = Object.entries(p);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = 'x';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]!}`;
      let expected3: string = `${1}`;
      expect(actual3).assertEqual(expected3);
      let actual4: string = entries[1]![0];
      let expected4: string = 'y';
      expect(actual4).assertEqual(expected4);
      let actual5: string = `${entries[1]![1]!}`;
      let expected5: string = `${2}`;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1170
     * @tc.name objectEntriesTest117
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Counter();
      const entries = Object.entries(c);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "count";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1180
     * @tc.name objectEntriesTest118
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Box003();
      const entries = Object.entries(b);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[2]![0];
      let expected2: string = 'd';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1190
     * @tc.name objectEntriesTest119
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 's': "text", 'n': 7 };
      const entries = Object.entries(record);
      let actual1: string = entries[0]![1]! as string;
      let expected1: string = "text";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[1]![1]!}`;
      let expected2: string = `${7}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1200
     * @tc.name objectEntriesTest120
     * @tc.desc Verify Object.entries returns array of length matching a second Object.entries call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new Pair002();
      const e1 = Object.entries(p);
      const srcRecord6: Record<string, Any> = { 'a': 1, 'b': 2 };
      const e2 = Object.entries(srcRecord6);
      let actual1: int = e1.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${e1[0]![0]}`;
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${e1[1]![1]!}`;
      let expected3: string = '2';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${e2[0]![0]}`;
      let expected4: string = 'a';
      expect(actual4).assertEqual(expected4);
      let actual5: string = `${e2[1]![1]!}`;
      let expected5: string = '2';
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1210
     * @tc.name objectEntriesTest121
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20];
      const entries = Object.entries(arr);
      let actual1: string = entries[0]![0];
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![0];
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1220
     * @tc.name objectEntriesTest122
     * @tc.desc Verify Object.entries returns 3 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const entries = Object.entries(arr);
      let actual1: string = entries[0]![0];
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[2]![0];
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1230
     * @tc.name objectEntriesTest123
     * @tc.desc Verify Object.entries returns 3 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 6, 7];
      const entries = Object.entries(arr);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = `${5}`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[1]![1]!}`;
      let expected2: string = `${6}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[2]![1]!}`;
      let expected3: string = `${7}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1240
     * @tc.name objectEntriesTest124
     * @tc.desc Verify Object.entries returns array of length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1250
     * @tc.name objectEntriesTest125
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objA: Record<string, number> = { "id": 1 };
      const objB: Record<string, number> = { "id": 2 };
      const arr: Record<string, number>[] = [objA, objB];
      const entries = Object.entries(arr);
      let actual1: number = (entries[0]![1]! as Record<string, number>)["id"]! as number;
      let expected1: number = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = (entries[1]![1]! as Record<string, number>)["id"]! as number;
      let expected2: number = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1260
     * @tc.name objectEntriesTest126
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const grid: number[][] = [
        [1, 2],
        [3, 4],
      ];
      const entries = Object.entries(grid);
      let actual1: number = (entries[0]![1]! as number[])[0]!;
      let expected1: number = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = (entries[1]![1]! as number[])[1]!;
      let expected2: number = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1270
     * @tc.name objectEntriesTest127
     * @tc.desc Verify Object.entries returns 3 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [7, 8, 9];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[2]![0];
      let expected3: string = '2';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1280
     * @tc.name objectEntriesTest128
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false];
      const entries = Object.entries(arr);
      let actual1: boolean = entries[0]![1]! as boolean;
      expect(actual1).assertTrue();
      let actual2: boolean = entries[1]![1]! as boolean;
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1290
     * @tc.name objectEntriesTest129
     * @tc.desc Verify Object.entries returns array of length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const e1 = Object.entries(r);
      const srcRecord8: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const e2 = Object.entries(srcRecord8);
      let actual1: int = e1.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: int = e2.length;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1300
     * @tc.name objectEntriesTest130
     * @tc.desc Verify Object.entries returns entries with keys "a" and "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, Any> = { 'a': 1 };
      const arr: number[] = [1];
      const e1 = Object.entries(r);
      const srcRecord9: Record<string, Any> = { 'a': 1 };
      const e2 = Object.entries(srcRecord9);
      const e3 = Object.entries(arr);
      let actual1: string = e1[0]![0];
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = e2[0]![0];
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = e3[0]![0];
      let expected3: string = '0';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1310
     * @tc.name objectEntriesTest131
     * @tc.desc Verify Object.entries returns array of length matching a second Object.entries call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [4, 5];
      const e1 = Object.entries(arr);
      const srcRecord10: Record<string, Any> = { '0': 4, '1': 5 };
      const e2 = Object.entries(srcRecord10);
      let actual1: int = e1.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${e1[0]![1]!}`;
      let expected2: string = '4';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${e1[1]![1]!}`;
      let expected3: string = '5';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${e2[0]![1]!}`;
      let expected4: string = '4';
      expect(actual4).assertEqual(expected4);
      let actual5: string = `${e2[1]![1]!}`;
      let expected5: string = '5';
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1320
     * @tc.name objectEntriesTest132
     * @tc.desc Verify Object.entries returns array of length matching a second Object.entries call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = Object.entries(new Rec());
      const srcRecord11: Record<string, Any> = { 'm': 1, 'n': 2 };
      const e2 = Object.entries(srcRecord11);
      let actual1: int = e1.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = e1[0]![0];
      let expected2: string = 'm';
      expect(actual2).assertEqual(expected2);
      let actual3: string = e1[1]![0];
      let expected3: string = 'n';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${e2[0]![1]!}`;
      let expected4: string = '1';
      expect(actual4).assertEqual(expected4);
      let actual5: string = `${e2[1]![1]!}`;
      let expected5: string = '2';
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1330
     * @tc.name objectEntriesTest133
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const entries = Object.entries(record);
      const keys: string[] = Object.keys(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = 'b';
      expect(actual3).assertEqual(expected3);
      let actual4: string = entries[2]![0];
      let expected4: string = 'c';
      expect(actual4).assertEqual(expected4);
      let actual5: string = keys[0]!;
      let expected5: string = 'a';
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1340
     * @tc.name objectEntriesTest134
     * @tc.desc Verify Object.entries returns array of length matching Object.keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'p': 1, 'q': 2 };
      const entries = Object.entries(record);
      const keys: string[] = Object.keys(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = keys.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1350
     * @tc.name objectEntriesTest135
     * @tc.desc Verify Object.entries returns array of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = {};
      const entries = Object.entries(o);
      const keys: string[] = Object.keys(o);
      let actual1: int = entries.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = keys.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1360
     * @tc.name objectEntriesTest136
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Book();
      const entries = Object.entries(b);
      const keys: string[] = Object.keys(b);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "title";
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = "pages";
      expect(actual3).assertEqual(expected3);
      let actual4: string = keys[0]!;
      let expected4: string = "title";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1370
     * @tc.name objectEntriesTest137
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20];
      const entries = Object.entries(arr);
      const keys: string[] = Object.keys(arr);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = '1';
      expect(actual3).assertEqual(expected3);
      let actual4: string = keys[0]!;
      let expected4: string = '0';
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1380
     * @tc.name objectEntriesTest138
     * @tc.desc Verify Object.entries returns array of length matching a second Object.entries call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const e1 = Object.entries(record);
      const k1: string[] = Object.keys(record);
      const e2 = Object.entries(record);
      const k2: string[] = Object.keys(record);
      let actual1: int = e1.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = k1.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: string = e1[0]![0];
      let expected3: string = 'a';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${e2[0]![1]!}`;
      let expected4: string = '1';
      expect(actual4).assertEqual(expected4);
      let actual5: string = k2[1]!;
      let expected5: string = 'b';
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1390
     * @tc.name objectEntriesTest139
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      record['b'] = 2;
      const entries = Object.entries(record);
      const keys: string[] = Object.keys(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = keys.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = 'b';
      expect(actual3).assertEqual(expected3);
      let actual4: string = keys[1]!;
      let expected4: string = 'b';
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1400
     * @tc.name objectEntriesTest140
     * @tc.desc Verify Object.entries returns array of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const k1: string[] = Object.keys(record);
      const k2: string[] = Object.keys(record);
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = k1.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: string = k2[0]!;
      let expected3: string = 'a';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1410
     * @tc.name objectEntriesTest141
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 10, 'y': 20 };
      const entries = Object.entries(record);
      const keys: string[] = Object.keys(record);
      let actual0: int = entries.length;
      let expected0: int = 2;
      expect(actual0).assertEqual(expected0);
      let expectedKeys: string[] = ['x', 'y'];
      for (let i = 0; i < keys.length; i++) {
        let actual1: string = entries[i]![0]!;
        let expected1: string = expectedKeys[i]!;
        expect(actual1).assertEqual(expected1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1420
     * @tc.name objectEntriesTest142
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[0]![1]!}`;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[1]![1]!}`;
      let expected3: string = '2';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${entries[2]![1]!}`;
      let expected4: string = '3';
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1430
     * @tc.name objectEntriesTest143
     * @tc.desc Verify Object.entries returns array of length matching Object.values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "k1": "v1", "k2": "v2" };
      const entries = Object.entries(record);
      const values: Any[] = Object.values(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = values.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1440
     * @tc.name objectEntriesTest144
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'b': 1, 'a': 2 };
      const entries = Object.entries(record);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[1]![1]!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1450
     * @tc.name objectEntriesTest145
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 'x', 'b': 2, 'c': true };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[0]![1]!}`;
      let expected2: string = 'x';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[1]![1]!}`;
      let expected3: string = '2';
      expect(actual3).assertEqual(expected3);
      let actual4: boolean = entries[2]![1]! as boolean;
      expect(actual4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1460
     * @tc.name objectEntriesTest146
     * @tc.desc Verify Object.entries enumerates integer-index string keys per engine ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '2': 'b', '1': 'a' };
      const entries = Object.entries(record);
      const values: Any[] = Object.values(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![1]! as string;
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![1]! as string;
      let expected3: string = 'a';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${values[0]}`;
      let expected4: string = 'b';
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1470
     * @tc.name objectEntriesTest147
     * @tc.desc Verify Object.entries returns array of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = {};
      const entries = Object.entries(o);
      const values: Any[] = Object.values(o);
      let actual1: int = entries.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = values.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1480
     * @tc.name objectEntriesTest148
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cfg = new Config001();
      const entries = Object.entries(cfg);
      const values: Any[] = Object.values(cfg);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![1]! as string;
      let expected2: string = "localhost";
      expect(actual2).assertEqual(expected2);
      let actual3: number = entries[1]![1]! as number;
      let expected3: number = 8080;
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${values[0]}`;
      let expected4: string = "localhost";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1490
     * @tc.name objectEntriesTest149
     * @tc.desc Verify Object.entries returns 1 key-value pair for record with nested object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, number> = { 'k': 1 };
      const record: Record<string, Any> = { "obj": inner };
      const entries = Object.entries(record);
      let actual1: number = (entries[0]![1]! as Record<string, number>)['k']! as number;
      let expected1: number = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "obj";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1500
     * @tc.name objectEntriesTest150
     * @tc.desc Verify Object.entries returns 3 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5, 6, 7];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[0]![1]!}`;
      let expected2: string = '5';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[2]![1]!}`;
      let expected3: string = '7';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1510
     * @tc.name objectEntriesTest151
     * @tc.desc Verify Object.entries returns a snapshot unaffected by later record mutation (entries keeps 1, values reflects 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const entries = Object.entries(record);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = `${1}`;
      expect(actual1).assertEqual(expected1);
      record['a'] = 99;
      let actual2: string = `${entries[0]![1]!}`;
      let expected2: string = `${1}`;
      expect(actual2).assertEqual(expected2);
      const values: Any[] = Object.values(record);
      let actual3: string = `${values[0]}`;
      let expected3: string = `${99}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1520
     * @tc.name objectEntriesTest152
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 10, 'b': 20, 'c': 30 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual3: string = `${entries[0]![0]}`;
      let expected3: string = 'a';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${entries[0]![1]!}`;
      let expected4: string = "10";
      expect(actual4).assertEqual(expected4);
      let actual5: string = `${entries[2]![1]!}`;
      let expected5: string = "30";
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1530
     * @tc.name objectEntriesTest153
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "level": 3 };
      const entries = Object.entries(record);
      let actual1: string = entries[0]![0];
      let expected1: string = "name";
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![1]! as string;
      let expected2: string = "ArkTS";
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = "level";
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${entries[1]![1]!}`;
      let expected4: string = `${3}`;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1540
     * @tc.name objectEntriesTest154
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'b': 1, 'a': 2 };
      const entries = Object.entries(record);
      const keys: string[] = Object.keys(record);
      const values: Any[] = Object.values(record);
      let actual1: string = `${entries[0]![0]}`;
      let expected1: string = 'b';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[0]![1]!}`;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
      let actual3: string = keys[0]!;
      let expected3: string = 'b';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${values[0]}`;
      let expected4: string = `${1}`;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1550
     * @tc.name objectEntriesTest155
     * @tc.desc Verify Object.entries returns array of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = {};
      const entries = Object.entries(o);
      const keys: string[] = Object.keys(o);
      const values: Any[] = Object.values(o);
      let actual1: int = entries.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = keys.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: int = values.length;
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1560
     * @tc.name objectEntriesTest156
     * @tc.desc Verify Object.entries returns 4 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3, 'd': 4 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let expectedKeys: string[] = ['a', 'b', 'c', 'd'];
      let expectedValues: string[] = ['1', '2', '3', '4'];
      for (let i = 0; i < entries.length; i++) {
        let actual2: string = entries[i]![0]!;
        let expected2: string = expectedKeys[i]!;
        expect(actual2).assertEqual(expected2);
        let actual3: string = `${entries[i]![1]!}`;
        let expected3: string = expectedValues[i]!;
        expect(actual3).assertEqual(expected3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1570
     * @tc.name objectEntriesTest157
     * @tc.desc Verify Object.entries returns array of length matching Object.getOwnPropertyNames
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "k1": "v1", "k2": "v2" };
      const entries = Object.entries(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1580
     * @tc.name objectEntriesTest158
     * @tc.desc Verify Object.entries returns array of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = {};
      const entries = Object.entries(o);
      const names: string[] = Object.getOwnPropertyNames(o);
      let actual1: int = entries.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1590
     * @tc.name objectEntriesTest159
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = new Task();
      const entries = Object.entries(t);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "id";
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = "name";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1600
     * @tc.name objectEntriesTest160
     * @tc.desc Verify Object.entries returns 2 key-value pairs for array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      const entries = Object.entries(arr);
      const names: string[] = Object.getOwnPropertyNames(arr);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names.length;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[0]![0];
      let expected3: string = '0';
      expect(actual3).assertEqual(expected3);
      let actual4: string = names[2]!;
      let expected4: string = "length";
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1610
     * @tc.name objectEntriesTest161
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "solo": 1 };
      const entries = Object.entries(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: string = entries[0]![0];
      let expected1: string = "solo";
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = "solo";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1620
     * @tc.name objectEntriesTest162
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const w = new WorkerTest();
      const entries = Object.entries(w);
      const names: string[] = Object.getOwnPropertyNames(w);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: int = names.length;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[0]![0];
      let expected3: string = "name";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1630
     * @tc.name objectEntriesTest163
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const names1: string[] = Object.getOwnPropertyNames(record);
      let actual1: int = names1.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      record['b'] = 2;
      const entries = Object.entries(record);
      const names2: string[] = Object.getOwnPropertyNames(record);
      let actual2: int = entries.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: int = names2.length;
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
      let actual4: string = entries[1]![0];
      let expected4: string = 'b';
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1640
     * @tc.name objectEntriesTest164
     * @tc.desc Verify Object.entries returns array of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, Any> = {};
      const o: Record<string, Any> = {};
      const arr: number[] = [];
      const e1 = Object.entries(r);
      const e2 = Object.entries(o);
      const e3 = Object.entries(arr);
      let actual1: int = e1.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = e2.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: int = e3.length;
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1650
     * @tc.name objectEntriesTest165
     * @tc.desc Verify Object.entries returns array of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const e1 = Object.entries(record);
      let actual1: int = e1.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      record['b'] = 2;
      record['c'] = 3;
      const e2 = Object.entries(record);
      let actual2: int = e2.length;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
      let actual3: string = e2[2]![0];
      let expected3: string = 'c';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1660
     * @tc.name objectEntriesTest166
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["added"] = 1;
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "added";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]!}`;
      let expected3: string = `${1}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1670
     * @tc.name objectEntriesTest167
     * @tc.desc Verify Object.entries returns array of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = {};
      const outer: Record<string, Any> = { "inner": inner };
      const entries = Object.entries(outer);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      const innerEntries = Object.entries(inner);
      let actual2: int = innerEntries.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1680
     * @tc.name objectEntriesTest168
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': {} as Record<string, Any>, 'c': 3 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![0];
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1690
     * @tc.name objectEntriesTest169
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '😀': "smile" };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = '😀';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[0]![1]! as string;
      let expected3: string = "smile";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1700
     * @tc.name objectEntriesTest170
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "\u200B": null };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "\u200B";
      expect(actual2).assertEqual(expected2);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1710
     * @tc.name objectEntriesTest171
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "👨‍👩‍👧": "family" };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = "👨‍👩‍👧";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1720
     * @tc.name objectEntriesTest172
     * @tc.desc Verify Object.entries returns 1 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "Hello世界": 1 };
      const entries = Object.entries(record);
      let actual1: string = entries[0]![0];
      let expected1: string = "Hello世界";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1730
     * @tc.name objectEntriesTest173
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '甲': 1, '乙': 2, '丙': 3 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = '甲';
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![0];
      let expected3: string = '乙';
      expect(actual3).assertEqual(expected3);
      let actual4: string = entries[2]![0];
      let expected4: string = '丙';
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1740
     * @tc.name objectEntriesTest174
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'Ａ': "full", 'A': "half" };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![1]! as string;
      let expected2: string = "full";
      expect(actual2).assertEqual(expected2);
      let actual3: string = entries[1]![1]! as string;
      let expected3: string = "half";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1750
     * @tc.name objectEntriesTest175
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'n': null, 's': "text", 'z': 0 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actual2: string = entries[1]![1]! as string;
      let expected2: string = "text";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[2]![1]!}`;
      let expected3: string = `${0}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1760
     * @tc.name objectEntriesTest176
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': "<script>", 'n': null, 'y': "<img>" };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![1]! as string;
      let expected2: string = "<script>";
      expect(actual2).assertEqual(expected2);
      let actualValue1: Any = entries[1]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actual3: string = entries[2]![1]! as string;
      let expected3: string = "<img>";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1770
     * @tc.name objectEntriesTest177
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'n': null, "zero": 0, "empty": '' };
      const entries = Object.entries(record);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actual1: string = `${entries[1]![1]!}`;
      let expected1: string = `${0}`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[2]![1]! as string;
      let expected2: string = '';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1780
     * @tc.name objectEntriesTest178
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': null, 'c': 3 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![0];
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
      let actualValue1: Any = entries[1]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actual3: string = `${entries[2]![1]!}`;
      let expected3: string = `${3}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1790
     * @tc.name objectEntriesTest179
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 't': true, 'n': null };
      const entries = Object.entries(record);
      let actual1: boolean = entries[0]![1]! as boolean;
      expect(actual1).assertTrue();
      let actualValue1: Any = entries[1]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1800
     * @tc.name objectEntriesTest180
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      record['b'] = 2;
      record['c'] = 3;
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[2]![0];
      let expected2: string = 'c';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1810
     * @tc.name objectEntriesTest181
     * @tc.desc Verify Object.entries returns 3 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 10, 'b': 20, 'c': 30 };
      const entries = Object.entries(record);
      let actual1: string = `${entries[0]![1]!}`;
      let expected1: string = `${10}`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entries[1]![1]!}`;
      let expected2: string = `${20}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[2]![1]!}`;
      let expected3: string = `${30}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1820
     * @tc.name objectEntriesTest182
     * @tc.desc Verify Object.entries returns 2 key-value pairs for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "中文": 1, "$_hashCode": 2 };
      const entries = Object.entries(record);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[1]![0];
      let expected2: string = "$_hashCode";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1830
     * @tc.name objectEntriesTest183
     * @tc.desc Verify Object.entries returns array of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "$_hashCode": 7 };
      const first = Object.entries(record);
      const second = Object.entries(record);
      let actual1: int = first.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: int = second.length;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${second[0]![1]!}`;
      let expected3: string = `${7}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1840
     * @tc.name objectEntriesTest184
     * @tc.desc Verify Object.entries keys are consistent between two calls for 2-key record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2 };
      const first = Object.entries(record);
      const second = Object.entries(record);
      let actual1: string = first[0]![0];
      let expected1: string = 'x';
      expect(actual1).assertEqual(expected1);
      let actual2: string = first[1]![0];
      let expected2: string = 'y';
      expect(actual2).assertEqual(expected2);
      let actual3: string = second[0]![0];
      let expected3: string = 'x';
      expect(actual3).assertEqual(expected3);
      let actual4: string = second[1]![0];
      let expected4: string = 'y';
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1850
     * @tc.name objectEntriesTest185
     * @tc.desc Verify Object.entries value is consistent between two calls for record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'k': 'v' };
      const first = Object.entries(record);
      const second = Object.entries(record);
      let actual1: string = first[0]![1]! as string;
      let expected1: string = 'v';
      expect(actual1).assertEqual(expected1);
      let actual2: string = second[0]![1]! as string;
      let expected2: string = 'v';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1860
     * @tc.name objectEntriesTest186
     * @tc.desc Verify Object.entries returns array of length matching the same record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const before = Object.entries(record);
      const after = Object.entries(record);
      let actual1: int = before.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${after[0]![1]!}`;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1870
     * @tc.name objectEntriesTest187
     * @tc.desc Verify Object.entries key for emoji record is stable and equals expected key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "😀中文\u200B": 1 };
      const first = Object.entries(record);
      const second = Object.entries(record);
      let actual1: string = first[0]![0];
      let expected1: string = "😀中文​";
      expect(actual1).assertEqual(expected1);
      let actual2: string = second[0]![0];
      let expected2: string = "😀中文\u200B";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES2_1880
     * @tc.name objectEntriesTest188
     * @tc.desc Verify Object.entries returns entries with keys "a"/"b" and values 1/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectEntriesTest188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const entries = Object.entries(record);
      const entriesAgain = Object.entries(record);
      let actual1: string = entriesAgain[0]![0];
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${entriesAgain[0]![1]!}`;
      let expected2: string = `${1}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = entriesAgain[1]![0];
      let expected3: string = 'b';
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${entriesAgain[1]![1]!}`;
      let expected4: string = `${2}`;
      expect(actual4).assertEqual(expected4);
    });
  });
}
