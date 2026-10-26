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
  });
}
