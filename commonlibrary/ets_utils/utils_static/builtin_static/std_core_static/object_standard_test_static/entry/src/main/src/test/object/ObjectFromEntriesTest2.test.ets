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

class AppError extends Error {
  errorCode: number = 0;
  constructor(message: string, code: number) {
    super(message);
    this.errorCode = code;
  }
}

interface Point {
  x: number;
  y: number;
}

interface Inner {
  value: string;
}

interface Outer {
  inner: Inner;
}

interface Point001 {
  x: number;
  y: number;
}

interface Point002 {
  x: number;
  y: number;
}

interface Point003 {
  x: number;
  y: number;
}

interface Point004 {
  x: number;
  y: number;
}

interface Point005 {
  x: number;
  y: number;
}

interface Greeter {
  name: string;
  greet(): string;
}

class Counter {
  count: number = 0;
}

class Counter001 {
  count: number = 0;
  increment(): number {
    this.count += 1;
    return this.count;
  }
}

class Person {
  name: string;
  constructor(name: string) {
    this.name = name;
  }
}

class Counter002 {
  count: number = 0;
}

class Counter003 {
  count: number = 0;
}

class Counter004 {
  count: number = 0;
}

class Wallet {
  private amount: number;
  constructor(amount: number) {
    this.amount = amount;
  }
  get balance(): number {
    return this.amount;
  }
}

class Counter005 {
  count: number = 0;
}

class Counter006 {
  count: number = 0;
}

interface Tag {
  id: number;
}

class Counter007 {
  count: number = 0;
  increment(): number {
    this.count += 1;
    return this.count;
  }
}

interface Tag001 {
  id: number;
}

export default function objectFromEntriesTest2(): void {

  describe("ObjectFromEntriesTest2", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0010
     * @tc.name objectFromEntriesTest001
     * @tc.desc Verify Object.fromEntries<int> builds record with value "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [
        ['a', 1],
        ['b', 2],
        ['c', 3],
      ];
      const record: Record<string, int> = Object.fromEntries<int>(pairs);
      expect(record['a']!).assertEqual(1);
      expect(record['b']!).assertEqual(2);
      expect(record['c']!).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0020
     * @tc.name objectFromEntriesTest002
     * @tc.desc Verify Object.fromEntries<int> yields undefined for missing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [['a', 1]];
      const record: Record<string, int> = Object.fromEntries<int>(pairs);
      expect(record["notExist"]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0030
     * @tc.name objectFromEntriesTest003
     * @tc.desc Verify Object.fromEntries<string> builds record with value "ArkTS"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, string]> = [
        ["k1", "ArkTS"],
        ["k2", "OpenHarmony"],
        ["k3", "ets"],
      ];
      const record: Record<string, string> = Object.fromEntries<string>(pairs);
      let actual1: string = record["k1"]!.toString();
      let expected1: string = "ArkTS";
      expect(actual1).assertEqual(expected1);
      let actual2: string = record["k2"]!.toString();
      let expected2: string = "OpenHarmony";
      expect(actual2).assertEqual(expected2);
      let actual3: string = record["k3"]!.toString();
      let expected3: string = "ets";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0040
     * @tc.name objectFromEntriesTest004
     * @tc.desc Verify Object.fromEntries<string> yields undefined for missing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, string]> = [['a', 'x']];
      const record: Record<string, string> = Object.fromEntries<string>(pairs);
      expect(record["missing"]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0050
     * @tc.name objectFromEntriesTest005
     * @tc.desc Verify Object.fromEntries<string> builds record with value "two"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, string]> = [
        ['k', "one"],
        ['k', "two"],
      ];
      const record: Record<string, string> = Object.fromEntries<string>(pairs);
      let actual1: string = record['k']!.toString();
      let expected1: string = "two";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0060
     * @tc.name objectFromEntriesTest006
     * @tc.desc Verify Object.fromEntries<string> builds record with value "hello"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, string]> = [
        ['a', "hello"],
        ['b', "world"],
      ];
      const record: Record<string, string> = Object.fromEntries<string>(pairs);
      let actual1: string = record['a']!.toString();
      let expected1: string = "hello";
      expect(actual1).assertEqual(expected1);
      let actual2: string = record['b']!.toString();
      let expected2: string = "world";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0070
     * @tc.name objectFromEntriesTest007
     * @tc.desc Verify Object.fromEntries<boolean> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, boolean]> = [
        ["flagA", true],
        ["flagB", false],
        ["flagC", true],
      ];
      const record: Record<string, boolean> = Object.fromEntries<boolean>(pairs);
      let actual1: boolean = record["flagA"]!;
      expect(actual1).assertTrue();
      let actual2: boolean = record["flagB"]!;
      expect(actual2).assertFalse();
      let actual3: boolean = record["flagC"]!;
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0080
     * @tc.name objectFromEntriesTest008
     * @tc.desc Verify Object.fromEntries<boolean> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const truePairs: Array<[string, boolean]> = [
        ["on1", true],
        ["on2", true],
      ];
      const falsePairs: Array<[string, boolean]> = [
        ["off1", false],
        ["off2", false],
      ];
      const onRecord: Record<string, boolean> = Object.fromEntries<boolean>(truePairs);
      const offRecord: Record<string, boolean> = Object.fromEntries<boolean>(falsePairs);
      let actual1: boolean = onRecord["on1"]!;
      expect(actual1).assertTrue();
      let actual2: boolean = onRecord["on2"]!;
      expect(actual2).assertTrue();
      let actual3: boolean = offRecord["off1"]!;
      expect(actual3).assertFalse();
      let actual4: boolean = offRecord["off2"]!;
      expect(actual4).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0090
     * @tc.name objectFromEntriesTest009
     * @tc.desc Verify Object.fromEntries<boolean> yields undefined for missing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, boolean]> = [['a', true]];
      const record: Record<string, boolean> = Object.fromEntries<boolean>(pairs);
      expect(record["notExist"]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0100
     * @tc.name objectFromEntriesTest010
     * @tc.desc Verify Object.fromEntries<boolean> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, boolean]> = [
        ['k', true],
        ['k', false],
        ['k', true],
      ];
      const record: Record<string, boolean> = Object.fromEntries<boolean>(pairs);
      let actual1: boolean = record['k']!;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0110
     * @tc.name objectFromEntriesTest011
     * @tc.desc Verify Object.fromEntries<boolean> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, boolean]> = [
        ['a', false],
        ['b', true],
      ];
      const record: Record<string, boolean> = Object.fromEntries<boolean>(pairs);
      let actual1: boolean = record['a']!;
      expect(actual1).assertFalse();
      let actual2: boolean = record['b']!;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0120
     * @tc.name objectFromEntriesTest012
     * @tc.desc Verify Object.fromEntries<double> builds record with value "3.14"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, double]> = [
        ["pi", 3.14],
        ["half", 0.5],
        ["ratio", 2.25],
      ];
      const record: Record<string, double> = Object.fromEntries<double>(pairs);
      let actual1: string = record["pi"]!.toString();
      let expected1: string = "3.14";
      expect(actual1).assertEqual(expected1);
      let actual2: string = record["half"]!.toString();
      let expected2: string = "0.5";
      expect(actual2).assertEqual(expected2);
      let actual3: string = record["ratio"]!.toString();
      let expected3: string = "2.25";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0130
     * @tc.name objectFromEntriesTest013
     * @tc.desc Verify Object.fromEntries<double> yields undefined for missing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, double]> = [['a', 1.5]];
      const record: Record<string, double> = Object.fromEntries<double>(pairs);
      expect(record["missing"]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0140
     * @tc.name objectFromEntriesTest014
     * @tc.desc Verify Object.fromEntries<double> builds record with value "2.75"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, double]> = [
        ['k', 1.5],
        ['k', 2.75],
      ];
      const record: Record<string, double> = Object.fromEntries<double>(pairs);
      let actual1: string = record['k']!.toString();
      let expected1: string = "2.75";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0150
     * @tc.name objectFromEntriesTest015
     * @tc.desc Verify Object.fromEntries<double> builds record with value "0.125"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, double]> = [
        ['a', 0.125],
        ['b', 4.5],
      ];
      const record: Record<string, double> = Object.fromEntries<double>(pairs);
      let actual1: string = record['a']!.toString();
      let expected1: string = "0.125";
      expect(actual1).assertEqual(expected1);
      let actual2: string = record['b']!.toString();
      let expected2: string = "4.5";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0160
     * @tc.name objectFromEntriesTest016
     * @tc.desc Verify Object.fromEntries<byte> builds record with value "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1: byte = 1;
      const b2: byte = 64;
      const b3: byte = 127;
      const pairs: Array<[string, byte]> = [
        ['a', b1],
        ['b', b2],
        ['c', b3],
      ];
      const record: Record<string, byte> = Object.fromEntries<byte>(pairs);
      let actual1: string = record['a']!.toString();
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = record['b']!.toString();
      let expected2: string = "64";
      expect(actual2).assertEqual(expected2);
      let actual3: string = record['c']!.toString();
      let expected3: string = "127";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0170
     * @tc.name objectFromEntriesTest017
     * @tc.desc Verify Object.fromEntries<byte> yields undefined for missing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const pairs: Array<[string, byte]> = [['a', v]];
      const record: Record<string, byte> = Object.fromEntries<byte>(pairs);
      expect(record["missing"]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0180
     * @tc.name objectFromEntriesTest018
     * @tc.desc Verify Object.fromEntries<byte> builds record with value "9"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstVal: byte = 7;
      const secondVal: byte = 9;
      const pairs: Array<[string, byte]> = [
        ['k', firstVal],
        ['k', secondVal],
      ];
      const record: Record<string, byte> = Object.fromEntries<byte>(pairs);
      let actual1: string = record['k']!.toString();
      let expected1: string = '9';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0190
     * @tc.name objectFromEntriesTest019
     * @tc.desc Verify Object.fromEntries<byte> builds record with value "11"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstVal: byte = 11;
      const secondVal: byte = 22;
      const pairs: Array<[string, byte]> = [
        ['a', firstVal],
        ['b', secondVal],
      ];
      const record: Record<string, byte> = Object.fromEntries<byte>(pairs);
      let actual1: string = record['a']!.toString();
      let expected1: string = "11";
      expect(actual1).assertEqual(expected1);
      let actual2: string = record['b']!.toString();
      let expected2: string = "22";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0200
     * @tc.name objectFromEntriesTest020
     * @tc.desc Verify Object.fromEntries<char> builds record with value "A"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1: char = 'A'.charAt(0);
      const c2: char = 'B'.charAt(0);
      const c3: char = 'C'.charAt(0);
      const pairs: Array<[string, char]> = [
        ["first", c1],
        ["second", c2],
        ["third", c3],
      ];
      const record: Record<string, char> = Object.fromEntries<char>(pairs);
      let actual1: string = record["first"]!.toString();
      let expected1: string = 'A';
      expect(actual1).assertEqual(expected1);
      let actual2: string = record["second"]!.toString();
      let expected2: string = 'B';
      expect(actual2).assertEqual(expected2);
      let actual3: string = record["third"]!.toString();
      let expected3: string = 'C';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0210
     * @tc.name objectFromEntriesTest021
     * @tc.desc Verify Object.fromEntries<char> builds record with values "\u4e2d" and "!"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zh: char = '中'.charAt(0);
      const mark: char = '!'.charAt(0);
      const pairs: Array<[string, char]> = [
        ["zh", zh],
        ["mark", mark],
      ];
      const record: Record<string, char> = Object.fromEntries<char>(pairs);
      let actual1: string = record["zh"]!.toString();
      let expected1: string = '中';
      expect(actual1).assertEqual(expected1);
      let actual2: string = record["mark"]!.toString();
      let expected2: string = '!';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0220
     * @tc.name objectFromEntriesTest022
     * @tc.desc Verify Object.fromEntries<char> yields undefined for missing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: char = 'Z'.charAt(0);
      const pairs: Array<[string, char]> = [['a', v]];
      const record: Record<string, char> = Object.fromEntries<char>(pairs);
      expect(record["missing"]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0230
     * @tc.name objectFromEntriesTest023
     * @tc.desc Verify Object.fromEntries<char> builds record with value "b"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstVal: char = 'a'.charAt(0);
      const secondVal: char = 'b'.charAt(0);
      const pairs: Array<[string, char]> = [
        ['k', firstVal],
        ['k', secondVal],
      ];
      const record: Record<string, char> = Object.fromEntries<char>(pairs);
      let actual1: string = record['k']!.toString();
      let expected1: string = 'b';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0240
     * @tc.name objectFromEntriesTest024
     * @tc.desc Verify Object.fromEntries<string> builds record with value "ArkTS"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, string]> = [["name", "ArkTS"]];
      const record: Record<string, string> = Object.fromEntries<string>(pairs);
      let actual1: string = record["name"]!.toString();
      let expected1: string = "ArkTS";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0250
     * @tc.name objectFromEntriesTest025
     * @tc.desc Verify Object.fromEntries<int> builds record with value "2026"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [["year", 2026]];
      const record: Record<string, int> = Object.fromEntries<int>(pairs);
      let actual1: string = record["year"]!.toString();
      let expected1: string = "2026";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0260
     * @tc.name objectFromEntriesTest026
     * @tc.desc Verify Object.fromEntries<string> builds record with value "ArkTS"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strPairs: Array<[string, string]> = [["name", "ArkTS"]];
      const intPairs: Array<[string, int]> = [["year", 2026]];
      const strRecord: Record<string, string> = Object.fromEntries<string>(strPairs);
      const intRecord: Record<string, int> = Object.fromEntries<int>(intPairs);
      let actual1: string = strRecord["name"]!.toString();
      let expected1: string = "ArkTS";
      expect(actual1).assertEqual(expected1);
      let actual2: string = intRecord["year"]!.toString();
      let expected2: string = "2026";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0270
     * @tc.name objectFromEntriesTest027
     * @tc.desc Verify Object.fromEntries<string> builds record with value "hello"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, string> = Object.fromEntries<string>([
        ['x', "hello"],
        ['y', "world"],
      ] as Array<[string, string]>);
      let actual1: string = record['x']!.toString();
      let expected1: string = "hello";
      expect(actual1).assertEqual(expected1);
      let actual2: string = record['y']!.toString();
      let expected2: string = "world";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0280
     * @tc.name objectFromEntriesTest028
     * @tc.desc Verify Object.fromEntries<boolean> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, boolean]> = [
        ["ok", true],
        ["no", false],
      ];
      const record: Record<string, boolean> = Object.fromEntries<boolean>(pairs);
      let actual1: boolean = record["ok"]!;
      expect(actual1).assertTrue();
      let actual2: boolean = record["no"]!;
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0290
     * @tc.name objectFromEntriesTest029
     * @tc.desc Verify Object.fromEntries<int> builds record with value "10"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [['k', 10]];
      const explicitRecord: Record<string, int> = Object.fromEntries<int>(pairs);
      const inferredRecord: Record<string, int> = Object.fromEntries<int>(pairs);
      let actual1: string = explicitRecord['k']!.toString();
      let expected1: string = "10";
      expect(actual1).assertEqual(expected1);
      expect(inferredRecord['k']!).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0300
     * @tc.name objectFromEntriesTest030
     * @tc.desc Verify Object.fromEntries<double> builds record with value "2.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, double]> = [['v', 2.5]];
      const explicitRecord: Record<string, double> = Object.fromEntries<double>(pairs);
      const inferredRecord: Record<string, double> = Object.fromEntries<double>(pairs);
      let actual1: string = explicitRecord['v']!.toString();
      let expected1: string = "2.5";
      expect(actual1).assertEqual(expected1);
      let actual2: string = inferredRecord['v']!.toString();
      let expected2: string = "2.5";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0310
     * @tc.name objectFromEntriesTest031
     * @tc.desc Verify Object.fromEntries<int> builds record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Array<[string, int]> = [];
      const record: Record<string, int> = Object.fromEntries<int>(empty);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      expect(record["any"]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0320
     * @tc.name objectFromEntriesTest032
     * @tc.desc Verify Object.fromEntries<double> builds record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Array<[string, double]> = [];
      const record: Record<string, double> = Object.fromEntries<double>(empty);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0330
     * @tc.name objectFromEntriesTest033
     * @tc.desc Verify Object.fromEntries<string> builds record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Array<[string, string]> = [];
      const record: Record<string, string> = Object.fromEntries<string>(empty);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      expect(record['a']).assertUndefined();
      expect(record['b']).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0340
     * @tc.name objectFromEntriesTest034
     * @tc.desc Verify Object.fromEntries<Date> builds record with value d.getFullYear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(2024, 0, 15);
      const pairs: Array<[string, Date]> = [['d', d]];
      const record: Record<string, Date> = Object.fromEntries<Date>(pairs);
      expect(record['d']!.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0350
     * @tc.name objectFromEntriesTest035
     * @tc.desc Verify Object.fromEntries<Date> builds record with value 1700000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(1700000000000);
      const pairs: Array<[PropertyKey, Date]> = [['1', d]];
      const record: Record<PropertyKey, Date> = Object.fromEntries<Date>(pairs);
      let actual1: number = record['1']!.getTime();
      let expected1: number = 1700000000000;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0360
     * @tc.name objectFromEntriesTest036
     * @tc.desc Verify Object.fromEntries<Date> builds record with value 2025
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: string = "__dateKey__";
      const d: Date = new Date(2025, 5, 1);
      const pairs: Array<[PropertyKey, Date]> = [[key, d]];
      const record: Record<PropertyKey, Date> = Object.fromEntries<Date>(pairs);
      let actual1: number = record[key]!.getFullYear();
      let expected1: int = 2025;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0370
     * @tc.name objectFromEntriesTest037
     * @tc.desc Verify Object.fromEntries<Date> builds record with value 2020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Date = new Date(2020, 0, 1);
      const b: Date = new Date(2021, 1, 2);
      const pairs: Array<[string, Date]> = [
        ['a', a],
        ['b', b],
      ];
      const record: Record<string, Date> = Object.fromEntries<Date>(pairs);
      let actual1: number = record['a']!.getFullYear();
      let expected1: int = 2020;
      expect(actual1).assertEqual(expected1);
      let actual2: number = record['b']!.getFullYear();
      let expected2: int = 2021;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0380
     * @tc.name objectFromEntriesTest038
     * @tc.desc Verify Object.fromEntries<Date> builds record with value 2030
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(2020, 0, 1);
      const pairs: Array<[string, Date]> = [['d', d]];
      const record: Record<string, Date> = Object.fromEntries<Date>(pairs);
      d.setFullYear(2030);
      let actual1: number = record['d']!.getFullYear();
      let expected1: int = 2030;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0390
     * @tc.name objectFromEntriesTest039
     * @tc.desc Verify Object.fromEntries<Date> builds record with value 2040
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(2020, 0, 1);
      const pairs: Array<[string, Date]> = [['d', d]];
      const record: Record<string, Date> = Object.fromEntries<Date>(pairs);
      record['d']!.setFullYear(2040);
      let actual1: number = d.getFullYear();
      let expected1: int = 2040;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0400
     * @tc.name objectFromEntriesTest040
     * @tc.desc Verify Object.fromEntries<Date> builds record with value 2050
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(2020, 0, 1);
      const pairs: Array<[string, Date]> = [
        ['x', d],
        ['y', d],
      ];
      const record: Record<string, Date> = Object.fromEntries<Date>(pairs);
      record['x']!.setFullYear(2050);
      let actual1: number = record['y']!.getFullYear();
      let expected1: int = 2050;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0410
     * @tc.name objectFromEntriesTest041
     * @tc.desc Verify Object.fromEntries<Date> builds record from pairs without mutating input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(2020, 0, 1);
      const pairs: Array<[string, Date]> = [['d', d]];
      const before: number = pairs.length;
      const record: Record<string, Date> = Object.fromEntries<Date>(pairs);
      let actual1: int = pairs.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = pairs[0]![0];
      let expected2: string = 'd';
      expect(actual2).assertEqual(expected2);
      let actual3: boolean = record.hasOwnProperty("d");
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0420
     * @tc.name objectFromEntriesTest042
     * @tc.desc Verify Object.fromEntries<RegExp> builds record with value "/abc/gi"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: RegExp = new RegExp("abc", "gi");
      const pairs: Array<[string, RegExp]> = [['r', r]];
      const record: Record<string, RegExp> = Object.fromEntries<RegExp>(pairs);
      let actual1: string = record['r']!.toString();
      let expected1: string = "/abc/gi";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0430
     * @tc.name objectFromEntriesTest043
     * @tc.desc Verify Object.fromEntries<RegExp> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: RegExp = new RegExp("world");
      const pairs: Array<[string, RegExp]> = [['r', r]];
      const record: Record<string, RegExp> = Object.fromEntries<RegExp>(pairs);
      let actual1: boolean = record['r']!.test("hello world");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0440
     * @tc.name objectFromEntriesTest044
     * @tc.desc Verify Object.fromEntries<RegExp> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: RegExp = new RegExp("world");
      const pairs: Array<[string, RegExp]> = [['r', r]];
      const record: Record<string, RegExp> = Object.fromEntries<RegExp>(pairs);
      let actual1: boolean = record['r']!.test("hello arkts");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0450
     * @tc.name objectFromEntriesTest045
     * @tc.desc Verify Object.fromEntries<RegExp> builds record with RegExp value matching "42"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: RegExp = new RegExp("(\\d+)");
      const pairs: Array<[string, RegExp]> = [['r', r]];
      const record: Record<string, RegExp> = Object.fromEntries<RegExp>(pairs);
      const m = record['r']!.exec("abc 42");
      expect(m).not().assertNull();
      let actual1: string = `${m![0]}`;
      let expected1: string = "42";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0460
     * @tc.name objectFromEntriesTest046
     * @tc.desc Verify Object.fromEntries<RegExp> builds record with value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: RegExp = new RegExp("abc", 'g');
      const pairs: Array<[string, RegExp]> = [['r', r]];
      const record: Record<string, RegExp> = Object.fromEntries<RegExp>(pairs);
      r.lastIndex = 3;
      let actual1: number = record['r']!.lastIndex;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0470
     * @tc.name objectFromEntriesTest047
     * @tc.desc Verify Object.fromEntries<RegExp> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: RegExp = new RegExp("abc", 'g');
      const pairs: Array<[string, RegExp]> = [['r', r]];
      const record: Record<string, RegExp> = Object.fromEntries<RegExp>(pairs);
      record['r']!.lastIndex = 2;
      let actual1: number = r.lastIndex;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0480
     * @tc.name objectFromEntriesTest048
     * @tc.desc Verify Object.fromEntries<RegExp> builds record with value "[a-z]+"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: RegExp = new RegExp("[a-z]+");
      const pairs: Array<[PropertyKey, RegExp]> = [['2', r]];
      const record: Record<PropertyKey, RegExp> = Object.fromEntries<RegExp>(pairs);
      let actual1: string = record['2']!.source;
      let expected1: string = "[a-z]+";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0490
     * @tc.name objectFromEntriesTest049
     * @tc.desc Verify Object.fromEntries<RegExp> builds record with value 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: RegExp = new RegExp("abc", 'g');
      const pairs: Array<[string, RegExp]> = [
        ['x', r],
        ['y', r],
      ];
      const record: Record<string, RegExp> = Object.fromEntries<RegExp>(pairs);
      record['x']!.lastIndex = 5;
      let actual1: number = record['y']!.lastIndex;
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0500
     * @tc.name objectFromEntriesTest050
     * @tc.desc Verify Object.fromEntries<Error> builds record with value "custom"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ce: AppError = new AppError("custom", 42);
      const pairs: Array<[string, Error]> = [['e', ce]];
      const record: Record<string, Error> = Object.fromEntries<Error>(pairs);
      let actual1: string = record['e']!.message;
      let expected1: string = "custom";
      expect(actual1).assertEqual(expected1);
      let actual2: number = (record['e'] as AppError).errorCode;
      let expected2: int = 42;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0510
     * @tc.name objectFromEntriesTest051
     * @tc.desc Verify Object.fromEntries<Error> builds record with value "new"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e: Error = new Error("old");
      const pairs: Array<[string, Error]> = [['e', e]];
      const record: Record<string, Error> = Object.fromEntries<Error>(pairs);
      e.message = "new";
      let actual1: string = record['e']!.message;
      let expected1: string = "new";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0520
     * @tc.name objectFromEntriesTest052
     * @tc.desc Verify Object.fromEntries<Error> builds record with value "reversed"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e: Error = new Error("old");
      const pairs: Array<[string, Error]> = [['e', e]];
      const record: Record<string, Error> = Object.fromEntries<Error>(pairs);
      record['e']!.message = "reversed";
      let actual1: string = e.message;
      let expected1: string = "reversed";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0530
     * @tc.name objectFromEntriesTest053
     * @tc.desc Verify Object.fromEntries<Error> builds record with values "first" and "second"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("first");
      const e2: Error = new Error("second");
      const pairs: Array<[string, Error]> = [
        ['a', e1],
        ['b', e2],
      ];
      const record: Record<string, Error> = Object.fromEntries<Error>(pairs);
      let actual1: string = record['a']!.message;
      let expected1: string = "first";
      expect(actual1).assertEqual(expected1);
      let actual2: string = record['b']!.message;
      let expected2: string = "second";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0540
     * @tc.name objectFromEntriesTest054
     * @tc.desc Verify Object.fromEntries<Error> builds record with Error value keeping message "fmt"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e: Error = new Error("fmt");
      const pairs: Array<[string, Error]> = [['e', e]];
      const record: Record<string, Error> = Object.fromEntries<Error>(pairs);
      expect(record['e']!.message).assertEqual("fmt");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0550
     * @tc.name objectFromEntriesTest055
     * @tc.desc Verify Object.fromEntries<Point> builds record with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point = { x: 1, y: 2 };
      const pairs: Array<[string, Point]> = [['p', p]];
      const record: Record<string, Point> = Object.fromEntries<Point>(pairs);
      let actual1: number = record['p']!.x;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = record['p']!.y;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0560
     * @tc.name objectFromEntriesTest056
     * @tc.desc Verify Object.fromEntries<Outer> builds record with value "deep"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Outer = { inner: { value: "deep" } };
      const pairs: Array<[string, Outer]> = [['o', o]];
      const record: Record<string, Outer> = Object.fromEntries<Outer>(pairs);
      let actual1: string = record['o']!.inner.value;
      let expected1: string = "deep";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0570
     * @tc.name objectFromEntriesTest057
     * @tc.desc Verify Object.fromEntries<Point001> builds record with value 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point001 = { x: 1, y: 2 };
      const pairs: Array<[string, Point001]> = [['p', p]];
      const record: Record<string, Point001> = Object.fromEntries<Point001>(pairs);
      p.x = 100;
      let actual1: number = record['p']!.x;
      let expected1: int = 100;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0580
     * @tc.name objectFromEntriesTest058
     * @tc.desc Verify Object.fromEntries<Point002> builds record with value 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point002 = { x: 1, y: 2 };
      const pairs: Array<[string, Point002]> = [['p', p]];
      const record: Record<string, Point002> = Object.fromEntries<Point002>(pairs);
      record['p']!.y = 200;
      let actual1: number = p.y;
      let expected1: int = 200;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0590
     * @tc.name objectFromEntriesTest059
     * @tc.desc Verify Object.fromEntries<Point003> builds record with value 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point003 = { x: 1, y: 2 };
      const pairs: Array<[string, Point003]> = [
        ['a', p],
        ['b', p],
      ];
      const record: Record<string, Point003> = Object.fromEntries<Point003>(pairs);
      record['a']!.x = 9;
      let actual1: number = record['b']!.x;
      let expected1: int = 9;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0600
     * @tc.name objectFromEntriesTest060
     * @tc.desc Verify Object.fromEntries<Point004> builds record with value 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point004 = { x: 7, y: 8 };
      const pairs: Array<[PropertyKey, Point004]> = [['3', p]];
      const record: Record<PropertyKey, Point004> = Object.fromEntries<Point004>(pairs);
      let actual1: number = record['3']!.x;
      let expected1: int = 7;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0610
     * @tc.name objectFromEntriesTest061
     * @tc.desc Verify Object.fromEntries<Point005> builds record with value 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: string = "__point__";
      const p: Point005 = { x: 4, y: 5 };
      const pairs: Array<[PropertyKey, Point005]> = [[key, p]];
      const record: Record<PropertyKey, Point005> = Object.fromEntries<Point005>(pairs);
      let actual1: number = record[key]!.y;
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0620
     * @tc.name objectFromEntriesTest062
     * @tc.desc Verify Object.fromEntries<Greeter> builds record with value "hello"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const g: Greeter = {
        name: "hi",
        greet(): string {
          return "hello";
        },
      };
      const pairs: Array<[string, Greeter]> = [['g', g]];
      const record: Record<string, Greeter> = Object.fromEntries<Greeter>(pairs);
      let actual1: string = record['g']!.greet();
      let expected1: string = "hello";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0630
     * @tc.name objectFromEntriesTest063
     * @tc.desc Verify Object.fromEntries<Counter> builds record with value 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Counter = new Counter();
      c.count = 5;
      const pairs: Array<[string, Counter]> = [['c', c]];
      const record: Record<string, Counter> = Object.fromEntries<Counter>(pairs);
      let actual1: number = record['c']!.count;
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0640
     * @tc.name objectFromEntriesTest064
     * @tc.desc Verify Object.fromEntries<Counter001> builds record with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Counter001 = new Counter001();
      const pairs: Array<[string, Counter001]> = [['c', c]];
      const record: Record<string, Counter001> = Object.fromEntries<Counter001>(pairs);
      let actual1: number = record['c']!.increment();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0650
     * @tc.name objectFromEntriesTest065
     * @tc.desc Verify Object.fromEntries<Person> builds record with value "alice"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Person = new Person("alice");
      const pairs: Array<[string, Person]> = [['p', p]];
      const record: Record<string, Person> = Object.fromEntries<Person>(pairs);
      let actual1: string = record['p']!.name;
      let expected1: string = "alice";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0660
     * @tc.name objectFromEntriesTest066
     * @tc.desc Verify Object.fromEntries<Counter003> builds record with value 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Counter003 = new Counter003();
      const pairs: Array<[string, Counter003]> = [['c', c]];
      const record: Record<string, Counter003> = Object.fromEntries<Counter003>(pairs);
      record['c']!.count = 88;
      let actual1: number = c.count;
      let expected1: int = 88;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0670
     * @tc.name objectFromEntriesTest067
     * @tc.desc Verify Object.fromEntries<Counter004> builds record with value 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Counter004 = new Counter004();
      const pairs: Array<[string, Counter004]> = [
        ['x', c],
        ['y', c],
      ];
      const record: Record<string, Counter004> = Object.fromEntries<Counter004>(pairs);
      record['x']!.count = 77;
      let actual1: number = record['y']!.count;
      let expected1: int = 77;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0680
     * @tc.name objectFromEntriesTest068
     * @tc.desc Verify Object.fromEntries<Wallet> builds record with value 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const w: Wallet = new Wallet(50);
      const pairs: Array<[string, Wallet]> = [['w', w]];
      const record: Record<string, Wallet> = Object.fromEntries<Wallet>(pairs);
      let actual1: number = record['w']!.balance;
      let expected1: int = 50;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0690
     * @tc.name objectFromEntriesTest069
     * @tc.desc Verify Object.fromEntries<Counter005> builds record with value 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Counter005 = new Counter005();
      c.count = 6;
      const pairs: Array<[PropertyKey, Counter005]> = [['4', c]];
      const record: Record<PropertyKey, Counter005> = Object.fromEntries<Counter005>(pairs);
      let actual1: number = record['4']!.count;
      let expected1: int = 6;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0700
     * @tc.name objectFromEntriesTest070
     * @tc.desc Verify Object.fromEntries<Counter006> builds record with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Counter006 = new Counter006();
      const b: Counter006 = new Counter006();
      a.count = 1;
      b.count = 2;
      const pairs: Array<[string, Counter006]> = [
        ['a', a],
        ['b', b],
      ];
      const record: Record<string, Counter006> = Object.fromEntries<Counter006>(pairs);
      let actual1: number = record['a']!.count;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = record['b']!.count;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0710
     * @tc.name objectFromEntriesTest071
     * @tc.desc Verify Object.fromEntries<Array<number>> builds record with value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const pairs: Array<[string, Array<number>]> = [["arr", arr]];
      const record: Record<string, Array<number>> = Object.fromEntries<Array<number>>(pairs);
      let actual1: int = record["arr"]!.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0720
     * @tc.name objectFromEntriesTest072
     * @tc.desc Verify Object.fromEntries<Array<string>> builds record with value "b"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b'];
      const pairs: Array<[string, Array<string>]> = [["arr", arr]];
      const record: Record<string, Array<string>> = Object.fromEntries<Array<string>>(pairs);
      let actual1: string = record["arr"]![1]!;
      let expected1: string = 'b';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0730
     * @tc.name objectFromEntriesTest073
     * @tc.desc Verify Object.fromEntries<Array<number>> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1];
      const pairs: Array<[string, Array<number>]> = [["arr", arr]];
      const record: Record<string, Array<number>> = Object.fromEntries<Array<number>>(pairs);
      arr.push(2);
      let actual1: int = record["arr"]!.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0740
     * @tc.name objectFromEntriesTest074
     * @tc.desc Verify Object.fromEntries<Array<number>> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1];
      const pairs: Array<[string, Array<number>]> = [["arr", arr]];
      const record: Record<string, Array<number>> = Object.fromEntries<Array<number>>(pairs);
      record["arr"]!.push(2);
      let actual1: int = arr.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0750
     * @tc.name objectFromEntriesTest075
     * @tc.desc Verify Object.fromEntries<Array<string>> builds record with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Array<string> = [];
      const pairs: Array<[string, Array<string>]> = [['e', empty]];
      const record: Record<string, Array<string>> = Object.fromEntries<Array<string>>(pairs);
      let actual1: int = record['e']!.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0760
     * @tc.name objectFromEntriesTest076
     * @tc.desc Verify Object.fromEntries<Array<Array<number>>> builds record with value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const grid: Array<Array<number>> = [
        [1, 2],
        [3, 4],
      ];
      const pairs: Array<[string, Array<Array<number>>]> = [['g', grid]];
      const record: Record<string, Array<Array<number>>> = Object.fromEntries<Array<Array<number>>>(pairs);
      let actual1: number = record['g']![1][0];
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0770
     * @tc.name objectFromEntriesTest077
     * @tc.desc Verify Object.fromEntries<Array<number>> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1];
      const pairs: Array<[string, Array<number>]> = [
        ['x', arr],
        ['y', arr],
      ];
      const record: Record<string, Array<number>> = Object.fromEntries<Array<number>>(pairs);
      record['x']!.push(9);
      let actual1: int = record['y']!.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0780
     * @tc.name objectFromEntriesTest078
     * @tc.desc Verify Object.fromEntries<Array<number>> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [10, 20];
      const pairs: Array<[PropertyKey, Array<number>]> = [['5', arr]];
      const record: Record<PropertyKey, Array<number>> = Object.fromEntries<Array<number>>(pairs);
      let actual1: int = record['5']!.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0790
     * @tc.name objectFromEntriesTest079
     * @tc.desc Verify Object.fromEntries<Array<string>> builds record with value "z"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b'];
      const pairs: Array<[string, Array<string>]> = [["arr", arr]];
      const record: Record<string, Array<string>> = Object.fromEntries<Array<string>>(pairs);
      arr[0] = 'z';
      let actual1: string = record["arr"]![0]!;
      let expected1: string = 'z';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0800
     * @tc.name objectFromEntriesTest080
     * @tc.desc Verify Object.fromEntries<Map<string, number>> builds record with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('a', 1);
      const pairs: Array<[string, Map<string, number>]> = [['m', m]];
      const record: Record<string, Map<string, number>> = Object.fromEntries<Map<string, number>>(pairs);
      let actual1: number = record['m']!.size;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0810
     * @tc.name objectFromEntriesTest081
     * @tc.desc Verify Object.fromEntries<Map<string, string>> builds record with value "v"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('k', 'v');
      const pairs: Array<[string, Map<string, string>]> = [['m', m]];
      const record: Record<string, Map<string, string>> = Object.fromEntries<Map<string, string>>(pairs);
      let actual1: string = record['m']!.get('k')!;
      let expected1: string = 'v';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0820
     * @tc.name objectFromEntriesTest082
     * @tc.desc Verify Object.fromEntries<Map<string, number>> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('a', 1);
      const pairs: Array<[string, Map<string, number>]> = [['m', m]];
      const record: Record<string, Map<string, number>> = Object.fromEntries<Map<string, number>>(pairs);
      m.set('b', 2);
      let actual1: number = record['m']!.size;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0830
     * @tc.name objectFromEntriesTest083
     * @tc.desc Verify Object.fromEntries<Map<string, number>> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('a', 1);
      const pairs: Array<[string, Map<string, number>]> = [['m', m]];
      const record: Record<string, Map<string, number>> = Object.fromEntries<Map<string, number>>(pairs);
      record['m']!.set('b', 2);
      let actual1: number = m.get('b')!;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0840
     * @tc.name objectFromEntriesTest084
     * @tc.desc Verify Object.fromEntries<Map<string, number>> builds record and record.get('m').has('a') returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('a', 1);
      const pairs: Array<[string, Map<string, number>]> = [['m', m]];
      const record: Record<string, Map<string, number>> = Object.fromEntries<Map<string, number>>(pairs);
      let actual1: boolean = record['m']!.has('a');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0850
     * @tc.name objectFromEntriesTest085
     * @tc.desc Verify Object.fromEntries<Map<string, number>> builds record with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Map<string, number> = new Map<string, number>();
      const pairs: Array<[string, Map<string, number>]> = [['e', empty]];
      const record: Record<string, Map<string, number>> = Object.fromEntries<Map<string, number>>(pairs);
      let actual1: number = record['e']!.size;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0860
     * @tc.name objectFromEntriesTest086
     * @tc.desc Verify Object.fromEntries<Map<string, number>> builds record with value 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('x', 9);
      const pairs: Array<[PropertyKey, Map<string, number>]> = [['6', m]];
      const record: Record<PropertyKey, Map<string, number>> = Object.fromEntries<Map<string, number>>(pairs);
      let actual1: number = record['6']!.get('x')!;
      let expected1: int = 9;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0870
     * @tc.name objectFromEntriesTest087
     * @tc.desc Verify Object.fromEntries<Map<string, number>> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, number> = new Map<string, number>();
      m.set('a', 1);
      const pairs: Array<[string, Map<string, number>]> = [['m', m]];
      const record: Record<string, Map<string, number>> = Object.fromEntries<Map<string, number>>(pairs);
      m.delete('a');
      let actual1: boolean = record['m']!.has('a');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0880
     * @tc.name objectFromEntriesTest088
     * @tc.desc Verify Object.fromEntries<Set<number>> builds record with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(1);
      const pairs: Array<[string, Set<number>]> = [['s', s]];
      const record: Record<string, Set<number>> = Object.fromEntries<Set<number>>(pairs);
      let actual1: number = record['s']!.size;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0890
     * @tc.name objectFromEntriesTest089
     * @tc.desc Verify Object.fromEntries<Set<string>> builds record and record.get('s').has('x') returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<string> = new Set<string>();
      s.add('x');
      const pairs: Array<[string, Set<string>]> = [['s', s]];
      const record: Record<string, Set<string>> = Object.fromEntries<Set<string>>(pairs);
      let actual1: boolean = record['s']!.has('x');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0900
     * @tc.name objectFromEntriesTest090
     * @tc.desc Verify Object.fromEntries<Set<number>> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(1);
      const pairs: Array<[string, Set<number>]> = [['s', s]];
      const record: Record<string, Set<number>> = Object.fromEntries<Set<number>>(pairs);
      s.add(2);
      let actual1: number = record['s']!.size;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0910
     * @tc.name objectFromEntriesTest091
     * @tc.desc Verify Object.fromEntries<Set<string>> builds record sharing source Set so add('b') is visible via has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<string> = new Set<string>();
      s.add('a');
      const pairs: Array<[string, Set<string>]> = [['s', s]];
      const record: Record<string, Set<string>> = Object.fromEntries<Set<string>>(pairs);
      record['s']!.add('b');
      let actual1: boolean = s.has('b');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0920
     * @tc.name objectFromEntriesTest092
     * @tc.desc Verify Object.fromEntries<Set<number>> builds record with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Set<number> = new Set<number>();
      const pairs: Array<[string, Set<number>]> = [['e', empty]];
      const record: Record<string, Set<number>> = Object.fromEntries<Set<number>>(pairs);
      let actual1: number = record['e']!.size;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0930
     * @tc.name objectFromEntriesTest093
     * @tc.desc Verify Object.fromEntries<Set<number>> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Set<number> = new Set<number>();
      const b: Set<number> = new Set<number>();
      a.add(1);
      b.add(2);
      const pairs: Array<[string, Set<number>]> = [
        ['a', a],
        ['b', b],
      ];
      const record: Record<string, Set<number>> = Object.fromEntries<Set<number>>(pairs);
      let actual1: boolean = record['a']!.has(1);
      expect(actual1).assertTrue();
      let actual2: boolean = record['b']!.has(2);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0940
     * @tc.name objectFromEntriesTest094
     * @tc.desc Verify Object.fromEntries<Set<string>> builds record with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<string> = new Set<string>();
      s.add('q');
      const pairs: Array<[PropertyKey, Set<string>]> = [['7', s]];
      const record: Record<PropertyKey, Set<string>> = Object.fromEntries<Set<string>>(pairs);
      let actual1: number = record['7']!.size;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0950
     * @tc.name objectFromEntriesTest095
     * @tc.desc Verify Object.fromEntries<Set<number>> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(1);
      const pairs: Array<[string, Set<number>]> = [['s', s]];
      const record: Record<string, Set<number>> = Object.fromEntries<Set<number>>(pairs);
      s.delete(1);
      let actual1: boolean = record['s']!.has(1);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0960
     * @tc.name objectFromEntriesTest096
     * @tc.desc Verify Object.fromEntries<Record<string, number>> builds record with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, number> = { 'x': 1, 'y': 2 };
      const pairs: Array<[string, Record<string, number>]> = [['r', inner]];
      const record: Record<string, Record<string, number>> = Object.fromEntries<Record<string, number>>(pairs);
      let actual1: string = `${record['r']!['x']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0970
     * @tc.name objectFromEntriesTest097
     * @tc.desc Verify Object.fromEntries<Record<string, number>> builds record with value 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, number> = { 'x': 1 };
      const pairs: Array<[string, Record<string, number>]> = [['r', inner]];
      const record: Record<string, Record<string, number>> = Object.fromEntries<Record<string, number>>(pairs);
      inner['x'] = 55;
      let actual1: string = `${record['r']!['x']!}`;
      let expected1: string = "55";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0980
     * @tc.name objectFromEntriesTest098
     * @tc.desc Verify Object.fromEntries<Record<string, number>> builds record with value 66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, number> = { 'x': 1 };
      const pairs: Array<[string, Record<string, number>]> = [['r', inner]];
      const record: Record<string, Record<string, number>> = Object.fromEntries<Record<string, number>>(pairs);
      record['r']!['y'] = 66;
      let actual1: string = `${inner['y']!}`;
      let expected1: string = "66";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_0990
     * @tc.name objectFromEntriesTest099
     * @tc.desc Verify Object.fromEntries<Record<string, number>> builds record with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Record<string, number> = {};
      const pairs: Array<[string, Record<string, number>]> = [['e', empty]];
      const record: Record<string, Record<string, number>> = Object.fromEntries<Record<string, number>>(pairs);
      let actual1: int = Object.keys(record['e']!).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1000
     * @tc.name objectFromEntriesTest100
     * @tc.desc Verify Object.fromEntries with nested Record value builds record with value 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Record<string, Record<string, number>> = { 'a': { 'b': 7 } };
      const pairs: Array<[string, Record<string, Record<string, number>>]> = [['n', nested]];
      const record: Record<string, Record<string, Record<string, number>>> = Object.fromEntries<
        Record<string, Record<string, number>>
      >(pairs);
      let actual1: string = `${record['n']!['a']!['b']!}`;
      let expected1: string = '7';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1010
     * @tc.name objectFromEntriesTest101
     * @tc.desc Verify Object.fromEntries<Record<string, string>> builds record with value "v"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, string> = { 'k': 'v' };
      const pairs: Array<[PropertyKey, Record<string, string>]> = [['8', inner]];
      const record: Record<PropertyKey, Record<string, string>> = Object.fromEntries<Record<string, string>>(pairs);
      let actual1: string = record['8']!['k']!;
      let expected1: string = 'v';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1020
     * @tc.name objectFromEntriesTest102
     * @tc.desc Verify Object.fromEntries<Record<string, number>> builds record with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ra: Record<string, number> = { 'a': 1 };
      const rb: Record<string, number> = { 'b': 2 };
      const pairs: Array<[string, Record<string, number>]> = [
        ['p', ra],
        ['q', rb],
      ];
      const record: Record<string, Record<string, number>> = Object.fromEntries<Record<string, number>>(pairs);
      let actual1: string = `${record['p']!['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${record['q']!['b']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1030
     * @tc.name objectFromEntriesTest103
     * @tc.desc Verify Object.fromEntries<Object> builds record with Date year 2020 and RegExp string /ab/
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(2020, 0, 1);
      const r: RegExp = new RegExp("ab");
      const pairs: Array<[string, Object]> = [
        ['d', d],
        ['r', r],
      ];
      const record: Record<string, Object> = Object.fromEntries<Object>(pairs);
      expect((record['d']! as Date).getFullYear()).assertEqual(2020);
      let actual2: string = record['r']!.toString();
      let expected2: string = "/ab/";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1040
     * @tc.name objectFromEntriesTest104
     * @tc.desc Verify Object.fromEntries<Object> builds record with value "mix"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e: Error = new Error("mix");
      const tag: Tag = { id: 3 };
      const pairs: Array<[string, Object]> = [
        ['e', e],
        ['t', tag],
      ];
      const record: Record<string, Object> = Object.fromEntries<Object>(pairs);
      let actual1: string = (record['e'] as Error).message;
      let expected1: string = "mix";
      expect(actual1).assertEqual(expected1);
      let actual2: number = (record['t'] as Tag).id;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1050
     * @tc.name objectFromEntriesTest105
     * @tc.desc Verify Object.fromEntries<Object> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2];
      const m: Map<string, number> = new Map<string, number>();
      m.set('k', 1);
      const pairs: Array<[string, Object]> = [
        ['a', arr],
        ['m', m],
      ];
      const record: Record<string, Object> = Object.fromEntries<Object>(pairs);
      let actual1: int = (record['a'] as Array<number>).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: number = (record['m'] as Map<string, number>).size;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1060
     * @tc.name objectFromEntriesTest106
     * @tc.desc Verify Object.fromEntries<Object> builds record with value "v"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(1);
      const inner: Record<string, string> = { 'k': 'v' };
      const pairs: Array<[string, Object]> = [
        ['s', s],
        ['r', inner],
      ];
      const record: Record<string, Object> = Object.fromEntries<Object>(pairs);
      let actual1: boolean = (record['s'] as Set<number>).has(1);
      expect(actual1).assertTrue();
      let actual2: string = (record['r'] as Record<string, string>)['k']!;
      let expected2: string = 'v';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1070
     * @tc.name objectFromEntriesTest107
     * @tc.desc Verify Object.fromEntries<Object> builds record with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Counter007 = new Counter007();
      const tag: Tag001 = { id: 9 };
      const pairs: Array<[string, Object]> = [
        ['c', c],
        ['t', tag],
      ];
      const record: Record<string, Object> = Object.fromEntries<Object>(pairs);
      let actual1: number = (record['c'] as Counter007).increment();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: number = (record['t'] as Tag001).id;
      let expected2: int = 9;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1080
     * @tc.name objectFromEntriesTest108
     * @tc.desc Verify Object.fromEntries<Object> builds record with Error message only and Set containing z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e: Error = new Error("only");
      const s: Set<string> = new Set<string>();
      s.add('z');
      const pairs: Array<[string, Object]> = [
        ['e', e],
        ['s', s],
      ];
      const record: Record<string, Object> = Object.fromEntries<Object>(pairs);
      expect((record['e']! as Error).message).assertEqual("only");
      let actual2: boolean = (record['s'] as Set<string>).has('z');
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1090
     * @tc.name objectFromEntriesTest109
     * @tc.desc Verify Object.fromEntries<Date> builds record with value 1710000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(1710000000000);
      const source: Map<string, Date> = new Map<string, Date>();
      source.set('d', d);
      const record: Record<string, Date> = Object.fromEntries<Date>(source.entries());
      let actual1: number = record['d']!.getTime();
      let expected1: number = 1710000000000;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1100
     * @tc.name objectFromEntriesTest110
     * @tc.desc Verify Object.fromEntries<RegExp> builds record from Set entries and record.test returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: RegExp = new RegExp("abc");
      const source: Set<[string, RegExp]> = new Set<[string, RegExp]>();
      source.add(['r', r]);
      const record: Record<string, RegExp> = Object.fromEntries<RegExp>(source);
      let actual1: boolean = record['r']!.test("xxabcxx");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1110
     * @tc.name objectFromEntriesTest111
     * @tc.desc Verify Object.fromEntries<Date> builds record with key "k" and Date value from array pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(2020, 0, 1);
      const pairs: Array<[string, Date]> = [['k', d]];
      const r1: Record<string, Date> = Object.fromEntries<Date>(pairs);
      let actual1: number = r1['k']!.getTime();
      let expected1: number = new Date(2020, 0, 1).getTime();
      expect(actual1).assertEqual(expected1);
      let actual2: number = r1['k']!.getFullYear();
      let expected2: int = 2020;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1120
     * @tc.name objectFromEntriesTest112
     * @tc.desc Verify Object.fromEntries<Error> builds record with value "viaMap"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e: Error = new Error("viaMap");
      const source: Map<string, Error> = new Map<string, Error>();
      source.set('e', e);
      const record: Record<string, Error> = Object.fromEntries<Error>(source.entries());
      let actual1: string = record['e']!.message;
      let expected1: string = "viaMap";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1130
     * @tc.name objectFromEntriesTest113
     * @tc.desc Verify Object.fromEntries<Date> keys s, 1, __sk__ map to 2020, 2021, 2020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(2020, 0, 1);
      const d2: Date = new Date(2021, 0, 1);
      const sk: string = "__sk__";
      const pairs: Array<[PropertyKey, Date]> = [
        ['s', d1],
        ['1', d2],
        [sk, d1],
      ];
      const record: Record<PropertyKey, Date> = Object.fromEntries<Date>(pairs);
      let actual1: number = record['s']!.getFullYear();
      let expected1: int = 2020;
      expect(actual1).assertEqual(expected1);
      let actual2: number = record['1']!.getFullYear();
      let expected2: int = 2021;
      expect(actual2).assertEqual(expected2);
      let actual3: number = record[sk]!.getFullYear();
      let expected3: int = 2020;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1140
     * @tc.name objectFromEntriesTest114
     * @tc.desc Verify Object.fromEntries<Any> builds a non-null record from empty pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      expect(Object.keys(record).length).assertEqual(0);
      expect(record.hasOwnProperty("anything")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1150
     * @tc.name objectFromEntriesTest115
     * @tc.desc Verify Object.fromEntries<Any> on empty pairs yields record where Object.hasOwn is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: boolean = Object.hasOwn(record, 'x');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1160
     * @tc.name objectFromEntriesTest116
     * @tc.desc Verify Object.fromEntries<Any> builds record with value '{}'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: string = JSON.stringify(record);
      let expected1: string = "{}";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1170
     * @tc.name objectFromEntriesTest117
     * @tc.desc Verify Object.fromEntries<Any> builds record with 1 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      record["added"] = 1;
      let actual1: int = Object.keys(record).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1180
     * @tc.name objectFromEntriesTest118
     * @tc.desc Verify Object.fromEntries<Any> builds record with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [];
      const recordA: Record<string, Any> = Object.fromEntries<Any>(pairs);
      const recordB: Record<string, Any> = Object.fromEntries<Any>(pairs);
      recordA['k'] = 1;
      let actual1: int = Object.keys(recordB).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1190
     * @tc.name objectFromEntriesTest119
     * @tc.desc Verify Object.fromEntries<Any> on empty array copied via Array.from yields record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<[string, Any]> = [];
      const pairs: Array<[string, Any]> = Array.from(source);
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1200
     * @tc.name objectFromEntriesTest120
     * @tc.desc Verify Object.fromEntries<Any> on empty Map.entries() iterator yields record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Any> = new Map<string, Any>();
      const record: Record<string, Any> = Object.fromEntries<Any>(map.entries());
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1210
     * @tc.name objectFromEntriesTest121
     * @tc.desc Verify Object.fromEntries<Any> on empty Map itself yields record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Any> = new Map<string, Any>();
      const record: Record<string, Any> = Object.fromEntries<Any>(map);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1220
     * @tc.name objectFromEntriesTest122
     * @tc.desc Verify Object.fromEntries<Any> on empty Set of pairs yields record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<[string, Any]> = new Set<[string, Any]>();
      const record: Record<string, Any> = Object.fromEntries<Any>(set);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1230
     * @tc.name objectFromEntriesTest123
     * @tc.desc Verify Object.fromEntries<Any> on array.values() of empty pairs yields record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs.values());
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1240
     * @tc.name objectFromEntriesTest124
     * @tc.desc Verify Object.fromEntries<Any> on cleared Map.entries() yields record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Any> = new Map<string, Any>();
      map.set('a', 1);
      map.clear();
      const record: Record<string, Any> = Object.fromEntries<Any>(map.entries());
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1250
     * @tc.name objectFromEntriesTest125
     * @tc.desc Verify Object.fromEntries<Any> on Map after deleting sole entry yields record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Any> = new Map<string, Any>();
      map.set('a', 1);
      map.delete('a');
      const record: Record<string, Any> = Object.fromEntries<Any>(map.entries());
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1260
     * @tc.name objectFromEntriesTest126
     * @tc.desc Verify Object.fromEntries<Any> on Set after deleting sole pair yields record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entry: [string, Any] = ['a', 1];
      const set: Set<[string, Any]> = new Set<[string, Any]>();
      set.add(entry);
      set.delete(entry);
      const record: Record<string, Any> = Object.fromEntries<Any>(set);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1270
     * @tc.name objectFromEntriesTest127
     * @tc.desc Verify Object.fromEntries<Any> on inline empty array literal yields record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = Object.fromEntries<Any>([] as Array<[string, Any]>);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1280
     * @tc.name objectFromEntriesTest128
     * @tc.desc Verify Object.fromEntries<Any> on exhausted Map iterator yields record with 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Any> = new Map<string, Any>();
      const it: IterableIterator<[string, Any]> = map.entries();
      it.next();
      const record: Record<string, Any> = Object.fromEntries<Any>(it);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1290
     * @tc.name objectFromEntriesTest129
     * @tc.desc Verify Object.fromEntries<Any> on empty Map yields record without own property __proto__
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Any> = new Map<string, Any>();
      const record: Record<string, Any> = Object.fromEntries<Any>(map.entries());
      let actual1: boolean = record.hasOwnProperty("__proto__");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1300
     * @tc.name objectFromEntriesTest130
     * @tc.desc Verify Object.fromEntries<Any> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', 1],
        ['a', 2],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: string = `${record['a']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1310
     * @tc.name objectFromEntriesTest131
     * @tc.desc Verify Object.fromEntries<Any> builds record with 1 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', 1],
        ['a', 2],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1320
     * @tc.name objectFromEntriesTest132
     * @tc.desc Verify Object.fromEntries<Any> duplicate key keeps last value 10 and typeof int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', "first"],
        ['a', 10],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: string = `${record['a']!}`;
      let expected1: string = "10";
      expect(actual1).assertEqual(expected1);
      let actual2: string = typeof record['a'];
      let expected2: string = "int";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1330
     * @tc.name objectFromEntriesTest133
     * @tc.desc Verify Object.fromEntries<Any> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['x', 1],
        ['y', 2],
        ['x', 3],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: string = `${record['y']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${record['x']!}`;
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1340
     * @tc.name objectFromEntriesTest134
     * @tc.desc Verify Object.fromEntries<Any> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', 1],
        ['a', 2],
        ['b', 3],
        ['b', 4],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: string = `${record['a']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${record['b']!}`;
      let expected2: string = '4';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1350
     * @tc.name objectFromEntriesTest135
     * @tc.desc Verify Object.fromEntries<Any> builds record with 1 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sym: string = "__dup__";
      const pairs: Array<[string, Any]> = [
        [sym, "first"],
        [sym, "second"],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1360
     * @tc.name objectFromEntriesTest136
     * @tc.desc Verify Object.fromEntries<Any> builds record with 2 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', 1],
        ['A', 2],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${record['a']!}`;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${record['A']!}`;
      let expected3: string = '2';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1370
     * @tc.name objectFromEntriesTest137
     * @tc.desc Verify Object.fromEntries<Any> builds record with value shared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared: Record<string, Any> = { "tag": "shared" };
      const pairs: Array<[string, Any]> = [
        ['a', shared],
        ['a', shared],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: Record<string, Any> = record['a']! as Record<string, Any>;
      let expected1: Record<string, Any> = shared;
      expect(actual1).assertEqual(expected1);
      expect(actual1["tag"] as string).assertEqual("shared");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1380
     * @tc.name objectFromEntriesTest138
     * @tc.desc Verify Object.fromEntries<Any> builds record with 1 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['1', "num"],
        ['1', "str"],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = record['1']! as string;
      let expected2: string = "str";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1390
     * @tc.name objectFromEntriesTest139
     * @tc.desc Verify Object.fromEntries<Any> builds record with value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', 1],
        ['b', 2],
        ['b', 3],
        ['a', 4],
        ['c', 5],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: int = Object.entries(record).length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1400
     * @tc.name objectFromEntriesTest140
     * @tc.desc Verify Object.fromEntries<Any> builds record with key 'a' mapped to null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [['a', null]];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: boolean = Object.hasOwn(record, 'a');
      expect(actual1).assertTrue();
      let actualValue1: Any = record['a'];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1410
     * @tc.name objectFromEntriesTest141
     * @tc.desc Verify Object.fromEntries<Any> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [['a', undefined]];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: boolean = record.hasOwnProperty('a');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1420
     * @tc.name objectFromEntriesTest142
     * @tc.desc Verify Object.fromEntries<Any> builds record with value '{"a":null}'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [['a', null]];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: string = JSON.stringify(record);
      let expected1: string = "{\"a\":null}";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1430
     * @tc.name objectFromEntriesTest143
     * @tc.desc Verify Object.fromEntries<Any> builds record with value '{}'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [['a', undefined]];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: string = JSON.stringify(record);
      let expected1: string = "{}";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1440
     * @tc.name objectFromEntriesTest144
     * @tc.desc Verify Object.fromEntries<Any> builds record with 3 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', 1],
        ['b', null],
        ['c', 'x'],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actualValue1: Any = record['b'];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1450
     * @tc.name objectFromEntriesTest145
     * @tc.desc Verify Object.fromEntries<Any> builds record with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', undefined],
        ['b', 2],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: string = `${record['b']!}`;
      let expected1: string = '2';
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = Object.hasOwn(record, 'a');
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1460
     * @tc.name objectFromEntriesTest146
     * @tc.desc Verify Object.fromEntries<Any> builds record with value 'set'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [['a', null]];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      record['a'] = "set";
      let actual1: string = record['a']! as string;
      let expected1: string = "set";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1470
     * @tc.name objectFromEntriesTest147
     * @tc.desc Verify Object.fromEntries<Any> builds record with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [['a', undefined]];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      record['a'] = 1;
      let actual1: string = `${record['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1480
     * @tc.name objectFromEntriesTest148
     * @tc.desc Verify Object.fromEntries<Any> builds record with 2 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['n', null],
        ['u', undefined],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actualValue1: Any = record['n'];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1490
     * @tc.name objectFromEntriesTest149
     * @tc.desc Verify Object.fromEntries<Any> builds record with value 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [['a', undefined]];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: boolean = Object.hasOwn(record, 'a');
      expect(actual1).assertTrue();
      let actual2: string = String(record['a']);
      let expected2: string = "undefined";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1500
     * @tc.name objectFromEntriesTest150
     * @tc.desc Verify Object.fromEntries<Any> builds record preserving key order ab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', 1],
        ['b', 2],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let order: string = '';
      for (const key of Object.keys(record)) {
        order += key;
      }
      expect(order).assertEqual("ab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1510
     * @tc.name objectFromEntriesTest151
     * @tc.desc Verify Object.fromEntries<Any> builds record preserving key order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ["first", 1],
        ["second", 2],
        ["third", 3],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: string = Object.keys(record)[0];
      let expected1: string = "first";
      expect(actual1).assertEqual(expected1);
      let actual2: string = Object.keys(record)[2];
      let expected2: string = "third";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1520
     * @tc.name objectFromEntriesTest152
     * @tc.desc Verify Object.fromEntries<Any> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', 1],
        ['b', 2],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: boolean = record.hasOwnProperty('a');
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty('b');
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1530
     * @tc.name objectFromEntriesTest153
     * @tc.desc Verify Object.fromEntries<Any> builds record with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', 1],
        ['b', 2],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: string = `${record['a']!}`;
      let expected1: string = '1';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${record['b']!}`;
      let expected2: string = '2';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1540
     * @tc.name objectFromEntriesTest154
     * @tc.desc Verify Object.fromEntries<Any> builds record with 1 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [['a', 1]];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      record['a'] = 9;
      let actual1: int = Object.keys(record).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${record['a']!}`;
      let expected2: string = '9';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1550
     * @tc.name objectFromEntriesTest155
     * @tc.desc Verify Object.fromEntries<Any> builds record from key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', 1],
        ['b', 2],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: boolean = Object.hasOwn(record, 'a');
      expect(actual1).assertTrue();
      let actual2: boolean = Object.hasOwn(record, 'b');
      expect(actual2).assertTrue();
      let actual3: boolean = Object.hasOwn(record, 'c');
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1560
     * @tc.name objectFromEntriesTest156
     * @tc.desc Verify Object.fromEntries<Any> builds record with 1 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sym: string = "__s__";
      const pairs: Array<[string, Any]> = [[sym, 1]];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: int = Object.keys(record).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1570
     * @tc.name objectFromEntriesTest157
     * @tc.desc Verify Object.fromEntries<Any> builds record with 2 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', 10],
        ['b', 20],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let actual1: int = Object.keys(record).length;
      let expected1: number = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1580
     * @tc.name objectFromEntriesTest158
     * @tc.desc Verify Object.fromEntries<Any> builds record whose keys iterate summing values 3 across 2 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [
        ['a', 1],
        ['b', 2],
      ];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      let total: int = 0;
      let keyCount: number = 0;
      for (const key of Object.keys(record)) {
        total += Int.parseInt(`${record[key]}`, 10);
        keyCount++;
      }
      expect(total).assertEqual(3);
      expect(keyCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROMENTRIES_1590
     * @tc.name objectFromEntriesTest159
     * @tc.desc Verify Object.fromEntries<Any> builds record with key 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectFromEntriesTest159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [['a', 1]];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      const keys: Array<string> = Object.keys(record);
      expect(keys[0]!).assertEqual('a');
    });
  });
}
