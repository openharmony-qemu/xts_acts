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
class Item {
  val0: string = "class-zero";
}
interface KHolder {
  k: number;
}
class Point002 {
  x: number = 0;
  y: number = 0;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}
class Calc {
  num: number = 10;
  doubleVal(): number {
    return this.num * 2;
  }
}
class G {
  _v: number = 3;
  get val(): number {
    return this._v * 2;
  }
}
class Base {
  baseField: string = "base";
  baseMethod(): string {
    return "bm";
  }
}
class Derived extends Base {
  ownField: string = "derived";
}
class Tag {
  name: string = "t1";
}
class User {
  name: string = "tom";
  age: number = 20;
}
class BoxTest {
  size: number = 5;
}
class P {
  name: string = 'x';
}
class P001 {
  age: number = 18;
}
class P002 {
  active: boolean = true;
}
class P004 {
  readonly id: number = 1;
}
class P005 {
  child: KHolder = { k: 1 };
}
class P006 {
  data: number[] = [1, 2];
}
class P007 {
  name: string = 'x';
}
class P008 {}
class Child001 extends Base {
  b: string = 'b';
}
class Grand {
  g: number = 1;
}
class Mid extends Grand {
  m: number = 2;
}
class Leaf extends Mid {
  l: number = 3;
}
class Child002 extends Base {
  v: number = 2;
}
class Child003 extends Base {
  b: number = 2;
}
class Child005 extends Base {
  a: number = 1;
}
class P009 {
  say(): string {
    return "hi";
  }
}
class P010 {
  constructor() {}
  name: string = 'x';
}
class P011 {
  static s: number = 1;
  name: string = 'x';
}
class P012 {
  private _v: number = 1;
  get v(): number {
    return this._v;
  }
  set v(val: number) {
    this._v = val;
  }
}
class P013 {
  x: number = 1;
  y: number = 2;
  z: number = 3;
}
class Node {
  child: KHolder = { k: 1 };
}
class P014 {
  say(): string {
    return "hi";
  }
}
class EmptyBox {}
class Greeter {
  greet(): string {
    return "hi";
  }
}
class EmptyBox001 {}
class EmptyBox002 {}
class Owned {
  name: string = 't';
  age: number = 1;
}
export default function objectHasOwnTest2(): void {
  describe("ObjectHasOwnTest2", (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0010
     * @tc.name objectHasOwnTest001
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '': "empty", "name": "ArkTS" };
      let actual1: boolean = record.hasOwnProperty('');
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty("name");
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0020
     * @tc.name objectHasOwnTest002
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '': "only" };
      let actual1: boolean = record.hasOwnProperty('');
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty("only");
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0030
     * @tc.name objectHasOwnTest003
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "\u4f60\u597d"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "你好": "hello" };
      let actual1: boolean = record.hasOwnProperty("你好");
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty("\u4F60\u597D");
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0040
     * @tc.name objectHasOwnTest004
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "\u200B"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zwsp: string = "\u200B";
      const record: Record<string, Any> = {};
      record[zwsp] = "zwsp";
      let actual1: boolean = record.hasOwnProperty(zwsp);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0050
     * @tc.name objectHasOwnTest005
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "\u200B"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zwsp: string = "\u200B";
      const record: Record<string, Any> = { "normal": 1 };
      let actual1: boolean = record.hasOwnProperty(zwsp);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0060
     * @tc.name objectHasOwnTest006
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "\t"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record['\t'] = "tab";
      let actual1: boolean = record.hasOwnProperty('\t');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0070
     * @tc.name objectHasOwnTest007
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "\u2764\uFE0F"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const heartVS: string = "\u2764\uFE0F";
      const record: Record<string, Any> = {};
      record[heartVS] = "heart";
      let actual1: boolean = record.hasOwnProperty(heartVS);
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty("\u2764");
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0080
     * @tc.name objectHasOwnTest008
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c62: string = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
      const present: string = c62 + c62 + c62 + c62 + c62 + c62 + c62 + c62;
      const absent: string = present + '!';
      const record: Record<string, Any> = {};
      record[present] = 'v';
      let actual1: boolean = record.hasOwnProperty(present);
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty(absent);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0090
     * @tc.name objectHasOwnTest009
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key longKey
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c62: string = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
      let longKey: string = '';
      for (let i: int = 0; i < 17; i++) {
        longKey += c62;
      }
      const record: Record<string, Any> = {};
      record[longKey] = 'v';
      let actual2: boolean = record.hasOwnProperty(longKey);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0100
     * @tc.name objectHasOwnTest010
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key longKey
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c62: string = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
      const longKey: string = c62 + c62;
      const record: Record<string, Any> = {};
      record[longKey] = 'v';
      let actual1: boolean = record.hasOwnProperty(longKey);
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty(c62);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0110
     * @tc.name objectHasOwnTest011
     * @tc.desc Verify Record.hasOwnProperty accepts 80-character numeric and 496-character alphanumeric keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const segments: string[] = [
        '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
        '0123456789'
      ];
      for (const segment of segments) {
        const longKey: string = segment + segment + segment + segment + segment + segment + segment + segment;
        const record: Record<string, Any> = {};
        record[longKey] = 'v';
        let actual1: boolean = record.hasOwnProperty(longKey);
        expect(actual1).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0120
     * @tc.name objectHasOwnTest012
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chunk: string = "中\u6587😀é\u200B";
      const mixed: string = chunk + chunk + chunk + chunk + chunk + chunk;
      const record: Record<string, Any> = {};
      record[mixed] = 'v';
      let actual1: boolean = record.hasOwnProperty(mixed);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0130
     * @tc.name objectHasOwnTest013
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "k1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "k1": 1, "k2": 2, "k3": 3, "k4": 4, "k5": 5 };
      let actual1: boolean = record.hasOwnProperty("k1");
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty("k2");
      expect(actual2).assertTrue();
      let actual3: boolean = record.hasOwnProperty("k3");
      expect(actual3).assertTrue();
      let actual4: boolean = record.hasOwnProperty("k4");
      expect(actual4).assertTrue();
      let actual5: boolean = record.hasOwnProperty("k5");
      expect(actual5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0140
     * @tc.name objectHasOwnTest014
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "x"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 10, 'y': 20 };
      let actual1: boolean = record.hasOwnProperty('x');
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty('y');
      expect(actual2).assertTrue();
      let actual3: boolean = record.hasOwnProperty('z');
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0150
     * @tc.name objectHasOwnTest015
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero", '1': "one" };
      let actual1: boolean = record.hasOwnProperty('0');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0160
     * @tc.name objectHasOwnTest016
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "own"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Record<string, Any> = { "own": 1 };
      const obj: Object = source;
      let actual1: boolean = obj.hasOwnProperty("own");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0170
     * @tc.name objectHasOwnTest017
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "missing"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Record<string, Any> = { "own": 1 };
      const obj: Object = source;
      let actual1: boolean = obj.hasOwnProperty("missing");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0180
     * @tc.name objectHasOwnTest018
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "x"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const point: Point = new Point();
      let actual1: boolean = point.hasOwnProperty('x');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0190
     * @tc.name objectHasOwnTest019
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "z"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const point: Point001 = new Point001();
      let actual1: boolean = point.hasOwnProperty('z');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0200
     * @tc.name objectHasOwnTest020
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["zero", "one"];
      let actual1: boolean = arr.hasOwnProperty('0');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0210
     * @tc.name objectHasOwnTest021
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "9"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["zero", "one"];
      let actual1: boolean = arr.hasOwnProperty('9');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0220
     * @tc.name objectHasOwnTest022
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single: string[] = ["only"];
      let actual1: boolean = single.hasOwnProperty('0');
      expect(actual1).assertTrue();
      let actual2: boolean = single.hasOwnProperty('1');
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0230
     * @tc.name objectHasOwnTest023
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "count"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, number> = { "count": 42 };
      let actual1: boolean = record.hasOwnProperty("count");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0240
     * @tc.name objectHasOwnTest024
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "enabled"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, boolean> = { "enabled": true };
      let actual1: boolean = record.hasOwnProperty("enabled");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0250
     * @tc.name objectHasOwnTest025
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "outer"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = { "deep": "value" };
      const record: Record<string, Any> = { "outer": inner };
      let actual1: boolean = record.hasOwnProperty("outer");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0260
     * @tc.name objectHasOwnTest026
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "list"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "list": [1, 2, 3] };
      let actual1: boolean = record.hasOwnProperty("list");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0270
     * @tc.name objectHasOwnTest027
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "key"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "key": 0 };
      let actual1: boolean = record.hasOwnProperty("key");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0280
     * @tc.name objectHasOwnTest028
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "key"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "key": false };
      let actual1: boolean = record.hasOwnProperty("key");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0290
     * @tc.name objectHasOwnTest029
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "a.b"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "a.b": 1 };
      let actual1: boolean = record.hasOwnProperty("a.b");
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty("ab");
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0300
     * @tc.name objectHasOwnTest030
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(0);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0310
     * @tc.name objectHasOwnTest031
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(2);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0320
     * @tc.name objectHasOwnTest032
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 4 on longer array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30, 40];
      const r: boolean = arr.hasOwnProperty(4);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0330
     * @tc.name objectHasOwnTest033
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(arr.length);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0340
     * @tc.name objectHasOwnTest034
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key arr.length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(arr.length - 1);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0350
     * @tc.name objectHasOwnTest035
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key arr.length + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(arr.length + 1);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0360
     * @tc.name objectHasOwnTest036
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10];
      let actual1: boolean = arr.hasOwnProperty(0);
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty(1);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0370
     * @tc.name objectHasOwnTest037
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      let actual1: boolean = arr.hasOwnProperty(2);
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty(3);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0380
     * @tc.name objectHasOwnTest038
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      arr[0] = 99;
      let actual1: boolean = arr.hasOwnProperty(0);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0390
     * @tc.name objectHasOwnTest039
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      arr.push(30);
      let actual1: boolean = arr.hasOwnProperty(2);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0400
     * @tc.name objectHasOwnTest040
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(2);
      expect(actual1).assertFalse();
      arr.push(30);
      let actual2: boolean = arr.hasOwnProperty(2);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0410
     * @tc.name objectHasOwnTest041
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      arr.pop();
      let actual1: boolean = arr.hasOwnProperty(1);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0420
     * @tc.name objectHasOwnTest042
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      arr.splice(1, 1);
      let actual1: boolean = arr.hasOwnProperty(1);
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty(2);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0430
     * @tc.name objectHasOwnTest043
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [20, 10];
      arr.sort();
      let actual1: boolean = arr.hasOwnProperty(0);
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty(1);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0440
     * @tc.name objectHasOwnTest044
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: int[] = [];
      let actual1: boolean = empty.hasOwnProperty(Double.NaN);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0450
     * @tc.name objectHasOwnTest045
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const r: boolean = arr.hasOwnProperty(Double.NaN);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0460
     * @tc.name objectHasOwnTest046
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key nan + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const nan: number = Double.NaN;
      let actual1: boolean = arr.hasOwnProperty(nan + 1);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0470
     * @tc.name objectHasOwnTest047
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(0xffffffff);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0480
     * @tc.name objectHasOwnTest048
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: int[] = [];
      let actual1: boolean = empty.hasOwnProperty(-0);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0490
     * @tc.name objectHasOwnTest049
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: int[] = [];
      const r: boolean = empty.hasOwnProperty(0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0500
     * @tc.name objectHasOwnTest050
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = { '0': 42 };
      let actual1: boolean = rec.hasOwnProperty(1);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0510
     * @tc.name objectHasOwnTest051
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = { '0': 42, '1': 43 };
      let actual1: boolean = rec.hasOwnProperty(2);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0520
     * @tc.name objectHasOwnTest052
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = {};
      let actual1: boolean = rec.hasOwnProperty(0);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0530
     * @tc.name objectHasOwnTest053
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const obj: Object = arr;
      let actual1: boolean = obj.hasOwnProperty(0);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0540
     * @tc.name objectHasOwnTest054
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const obj: Object = arr;
      let actual1: boolean = obj.hasOwnProperty(2);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0550
     * @tc.name objectHasOwnTest055
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: int[] = [];
      const obj: Object = empty;
      let actual1: boolean = obj.hasOwnProperty(0);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0560
     * @tc.name objectHasOwnTest056
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 1 + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(1 + 1);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0570
     * @tc.name objectHasOwnTest057
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(Math.floor(0.9));
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0580
     * @tc.name objectHasOwnTest058
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(Math.ceil(1.1));
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0590
     * @tc.name objectHasOwnTest059
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 0b1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(0b1);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0600
     * @tc.name objectHasOwnTest060
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 0o1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(0o1);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0610
     * @tc.name objectHasOwnTest061
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const hit: boolean = arr.hasOwnProperty(0);
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0620
     * @tc.name objectHasOwnTest062
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(1);
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty(3);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0630
     * @tc.name objectHasOwnTest063
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ["first"];
      let actual1: boolean = arr.hasOwnProperty('0');
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty(0);
      expect(actual2).assertTrue();
      let actual3: string = arr[0];
      let expected3: string = "first";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0640
     * @tc.name objectHasOwnTest064
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Record<string, Any> = {};
      let actual1: boolean = empty.hasOwnProperty('0');
      expect(actual1).assertFalse();
      let actual2: boolean = empty.hasOwnProperty(0);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0650
     * @tc.name objectHasOwnTest065
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "0xFF"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = { "0xFF": "hex" };
      let actual1: boolean = obj.hasOwnProperty("0xFF");
      expect(actual1).assertTrue();
      let actual2: boolean = obj.hasOwnProperty(255);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0660
     * @tc.name objectHasOwnTest066
     * @tc.desc Verify obj.hasOwnProperty returns true for key 'false' and false for key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = { "false": "no" };
      let actual1: boolean = obj.hasOwnProperty("false");
      expect(actual1).assertTrue();
      let actual2: boolean = obj.hasOwnProperty(0);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0670
     * @tc.name objectHasOwnTest067
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "length"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b', 'c'];
      let actual1: boolean = arr.hasOwnProperty("length");
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty(arr.length);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0680
     * @tc.name objectHasOwnTest068
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(2);
      expect(actual1).assertFalse();
      let actual2: boolean = arr.hasOwnProperty('2');
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0690
     * @tc.name objectHasOwnTest069
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ["zero", "one"];
      let actual1: boolean = arr.hasOwnProperty('1');
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty(1);
      expect(actual2).assertTrue();
      let actual3: string = arr[1];
      let expected3: string = "one";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0700
     * @tc.name objectHasOwnTest070
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "val0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item: Item = new Item();
      let actual1: boolean = item.hasOwnProperty("val0");
      expect(actual1).assertTrue();
      let actual2: boolean = item.hasOwnProperty(0);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0710
     * @tc.name objectHasOwnTest071
     * @tc.desc Verify obj.hasOwnProperty returns true for existing keys "name", "version" and "valid"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "arkts", "version": 1, "valid": true };
      let actual1: boolean = record.hasOwnProperty("name");
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty("version");
      expect(actual2).assertTrue();
      let actual3: boolean = record.hasOwnProperty("valid");
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0720
     * @tc.name objectHasOwnTest072
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "outer"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nestedRecord: Record<string, Any> = { "inner": 42 };
      const record: Record<string, Any> = { "outer": nestedRecord };
      let actual1: boolean = record.hasOwnProperty("outer");
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty("inner");
      expect(actual2).assertFalse();
      const inner: Record<string, Any> = record["outer"] as Record<string, Any>;
      let actual3: boolean = inner.hasOwnProperty("inner");
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0730
     * @tc.name objectHasOwnTest073
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ["alpha", "beta"];
      let actual1: boolean = arr.hasOwnProperty(0);
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty(1);
      expect(actual2).assertTrue();
      let actual3: boolean = arr.hasOwnProperty("alpha");
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0740
     * @tc.name objectHasOwnTest074
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b', 'c'];
      arr.length = 1;
      let actual1: boolean = arr.hasOwnProperty('0');
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty('1');
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0750
     * @tc.name objectHasOwnTest075
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const matrix: Array<Array<number>> = [[1], [2], [3]];
      let actual1: boolean = matrix.hasOwnProperty(1);
      expect(actual1).assertTrue();
      let actual2: boolean = matrix.hasOwnProperty('2');
      expect(actual2).assertTrue();
      let actual3: boolean = matrix.hasOwnProperty(3);
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0760
     * @tc.name objectHasOwnTest076
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "0" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = [];
      let actual1: boolean = arr.hasOwnProperty('0');
      expect(actual1).assertFalse();
      let actual2: boolean = arr.hasOwnProperty(0);
      expect(actual2).assertFalse();
      let actual3: int = Object.keys(arr).length;
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: int = Object.values(arr).length;
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
      let actual5: int = Object.entries(arr).length;
      let expected5: int = 0;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0770
     * @tc.name objectHasOwnTest077
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "1" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b', 'c'];
      let actual1: boolean = arr.hasOwnProperty('1');
      expect(actual1).assertTrue();
      let actual2: int = Object.keys(arr).length;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0780
     * @tc.name objectHasOwnTest078
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "toString" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      let actual1: boolean = obj.hasOwnProperty("toString");
      expect(actual1).assertFalse();
      let actual2: int = Object.keys(obj).length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0790
     * @tc.name objectHasOwnTest079
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "tag"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = {};
      obj["tag"] = "obj";
      let actual1: boolean = obj.hasOwnProperty("tag");
      expect(actual1).assertTrue();
      let actual2: boolean = obj.hasOwnProperty("other");
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0800
     * @tc.name objectHasOwnTest080
     * @tc.desc Verify obj.hasOwnProperty returns true for existing keys "x" and "y"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point002 = new Point002(1, 2);
      let actual1: boolean = p.hasOwnProperty('x');
      expect(actual1).assertTrue();
      let actual2: boolean = p.hasOwnProperty('y');
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0810
     * @tc.name objectHasOwnTest081
     * @tc.desc Verify obj.hasOwnProperty distinguishes method key "doubleVal" (false) vs existing field key "num" (true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Calc = new Calc();
      let actual1: boolean = c.hasOwnProperty("doubleVal");
      expect(actual1).assertFalse();
      let actual2: boolean = c.hasOwnProperty("num");
      expect(actual2).assertTrue();
      let actual3: number = c.doubleVal();
      let expected3: int = 20;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0820
     * @tc.name objectHasOwnTest082
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "val"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const g: G = new G();
      let actual1: boolean = g.hasOwnProperty("val");
      expect(actual1).assertFalse();
      let actual2: number = g.val;
      let expected2: int = 6;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0830
     * @tc.name objectHasOwnTest083
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "ownField"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Derived = new Derived();
      let actual1: boolean = d.hasOwnProperty("ownField");
      expect(actual1).assertTrue();
      let actual2: boolean = d.hasOwnProperty("baseField");
      expect(actual2).assertTrue();
      let actual3: boolean = d.hasOwnProperty("baseMethod");
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0840
     * @tc.name objectHasOwnTest084
     * @tc.desc Verify obj.hasOwnProperty returns true for existing keys "a" and "b" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = {};
      obj['a'] = 1;
      obj['b'] = 2;
      let actual1: boolean = obj.hasOwnProperty('a');
      expect(actual1).assertTrue();
      let actual2: boolean = obj.hasOwnProperty('b');
      expect(actual2).assertTrue();
      let actual3: int = Object.keys(obj).length;
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0850
     * @tc.name objectHasOwnTest085
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "name" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Tag = new Tag();
      let actual1: boolean = t.hasOwnProperty("name");
      expect(actual1).assertTrue();
      let actual2: string = Object.keys(t)[0];
      let expected2: string = "name";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0860
     * @tc.name objectHasOwnTest086
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "a" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      let actual1: boolean = record.hasOwnProperty('a');
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty('b');
      expect(actual2).assertTrue();
      let actual3: int = Object.keys(record).length;
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0870
     * @tc.name objectHasOwnTest087
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['x', 'y'];
      const keys: Array<string> = Object.keys(arr);
      let actual1: string = keys[0];
      let expected1: string = '0';
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[1];
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
      let actual3: boolean = arr.hasOwnProperty('0');
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0880
     * @tc.name objectHasOwnTest088
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "type" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "first", "type": "second" };
      let actual1: string = Object.keys(record)[0];
      let expected1: string = "name";
      expect(actual1).assertEqual(expected1);
      let actual2: string = Object.keys(record)[1];
      let expected2: string = "type";
      expect(actual2).assertEqual(expected2);
      let actual3: boolean = record.hasOwnProperty("type");
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0890
     * @tc.name objectHasOwnTest089
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "gone" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "gone": 1, "kept": 2 };
      let actual1: boolean = record.hasOwnProperty("gone");
      expect(actual1).assertTrue();
      let actual2: int = Object.keys(record).length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: string = Object.keys(record)[0];
      let expected3: string = "gone";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0900
     * @tc.name objectHasOwnTest090
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "added" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "init": 0 };
      record["added"] = 1;
      let actual1: boolean = record.hasOwnProperty("added");
      expect(actual1).assertTrue();
      let actual2: string = Object.keys(record)[0];
      let expected2: string = "init";
      expect(actual2).assertEqual(expected2);
      let actual3: string = Object.keys(record)[1];
      let expected3: string = "added";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0910
     * @tc.name objectHasOwnTest091
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key keys[i]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const keys: Array<string> = Object.keys(record);
      for (let i = 0; i < keys.length; i++) {
        let actual1: boolean = record.hasOwnProperty(keys[i]);
        expect(actual1).assertTrue();
      }
      let actual2: boolean = record.hasOwnProperty("nope");
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0920
     * @tc.name objectHasOwnTest092
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "name"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "arkts" };
      let actual1: boolean = record.hasOwnProperty("name");
      expect(actual1).assertTrue();
      const vals: Array<Any> = Object.values(record);
      let actual2: string = vals[0] as string;
      let expected2: string = "arkts";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0930
     * @tc.name objectHasOwnTest093
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "1" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [7, 8, 9];
      let actual1: boolean = arr.hasOwnProperty('1');
      expect(actual1).assertTrue();
      let actual2: string = `${Object.values(arr)[1]}`;
      let expected2: string = `${8}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0940
     * @tc.name objectHasOwnTest094
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "x" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2 };
      let actual1: boolean = record.hasOwnProperty('x');
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty('y');
      expect(actual2).assertTrue();
      let actual3: int = Object.values(record).length;
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0950
     * @tc.name objectHasOwnTest095
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "invisible" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "visible": 'v' };
      record["invisible"] = 'i';
      let actual1: boolean = record.hasOwnProperty("invisible");
      expect(actual1).assertTrue();
      let actual3: string = Object.values(record)[0] as string;
      let expected3: string = 'v';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0960
     * @tc.name objectHasOwnTest096
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "name" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: User = new User();
      let actual1: boolean = u.hasOwnProperty("name");
      expect(actual1).assertTrue();
      let actual2: string = Object.values(u)[0] as string;
      let expected2: string = "tom";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${Object.values(u)[1]}`;
      let expected3: string = `${20}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0970
     * @tc.name objectHasOwnTest097
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "id" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = {};
      obj["id"] = 99;
      let actual1: boolean = obj.hasOwnProperty("id");
      expect(actual1).assertTrue();
      let actual2: string = `${Object.values(obj)[0]}`;
      let expected2: string = `${99}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0980
     * @tc.name objectHasOwnTest098
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "name"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "arkts" };
      let actual1: boolean = record.hasOwnProperty("name");
      expect(actual1).assertTrue();
      const entries: Array<[string, Any] | null | undefined> = Object.entries(record);
      let actual2: string = entries[0]![0];
      let expected2: string = "name";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]}`;
      let expected3: string = "arkts";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_0990
     * @tc.name objectHasOwnTest099
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ["alpha"];
      let actual1: boolean = arr.hasOwnProperty('0');
      expect(actual1).assertTrue();
      const entries: Array<[string, Any] | null | undefined> = Object.entries(arr);
      let actual2: string = entries[0]![0];
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]}`;
      let expected3: string = "alpha";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1000
     * @tc.name objectHasOwnTest100
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "closed"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "open": 1 };
      record["closed"] = 2;
      let actual1: boolean = record.hasOwnProperty("closed");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1010
     * @tc.name objectHasOwnTest101
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key keys[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const keys: Array<string> = Object.keys(record);
      const entries: Array<[string, Any] | null | undefined> = Object.entries(record);
      let actual1: int = keys.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: int = entries.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: boolean = record.hasOwnProperty("a");
      expect(actual3).assertTrue();
      let actual4: boolean = record.hasOwnProperty("b");
      expect(actual4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1020
     * @tc.name objectHasOwnTest102
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "a"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      let actual1: boolean = record.hasOwnProperty('a');
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty('b');
      expect(actual2).assertTrue();
      const entries: Array<[string, Any] | null | undefined> = Object.entries(record);
      let actual3: string = entries[0]![0];
      let expected3: string = 'a';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1030
     * @tc.name objectHasOwnTest103
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "size"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: BoxTest = new BoxTest();
      let actual1: boolean = b.hasOwnProperty("size");
      expect(actual1).assertTrue();
      const entries: Array<[string, Any] | null | undefined> = Object.entries(b);
      let actual2: string = entries[0]![0];
      let expected2: string = "size";
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]}`;
      let expected3: string = `${5}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1040
     * @tc.name objectHasOwnTest104
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "dynamic" plus Object.keys/values consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "init": 0 };
      record["dynamic"] = 1;
      let actual1: boolean = record.hasOwnProperty("dynamic");
      expect(actual1).assertTrue();
      let actual2: int = Object.keys(record).length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      const entries: Array<[string, Any] | null | undefined> = Object.entries(record);
      let actual3: string = entries[1]![0];
      let expected3: string = "dynamic";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1050
     * @tc.name objectHasOwnTest105
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "str"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "str": "text", "num": 42 };
      let actual1: boolean = record.hasOwnProperty("str");
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty("num");
      expect(actual2).assertTrue();
      const entries: Array<[string, Any] | null | undefined> = Object.entries(record);
      let actual3: string = `${entries[0]![1]}`;
      let expected3: string = "text";
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${entries[1]![1]}`;
      let expected4: string = `${42}`;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1060
     * @tc.name objectHasOwnTest106
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key entries[i]![0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const entries: Array<[string, Any] | null | undefined> = Object.entries(record);
      for (let i = 0; i < entries.length; i++) {
        let actual1: boolean = record.hasOwnProperty(entries[i]![0]);
        expect(actual1).assertTrue();
      }
      let actual2: boolean = record.hasOwnProperty("nope");
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1070
     * @tc.name objectHasOwnTest107
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "name"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P = new P();
      let actual1: boolean = p.hasOwnProperty("name");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1080
     * @tc.name objectHasOwnTest108
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "age"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P001 = new P001();
      let actual1: boolean = p.hasOwnProperty("age");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1090
     * @tc.name objectHasOwnTest109
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "active"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P002 = new P002();
      let actual1: boolean = p.hasOwnProperty("active");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1100
     * @tc.name objectHasOwnTest110
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "id"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P004 = new P004();
      let actual1: boolean = p.hasOwnProperty("id");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1110
     * @tc.name objectHasOwnTest111
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "child"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P005 = new P005();
      let actual1: boolean = p.hasOwnProperty("child");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1120
     * @tc.name objectHasOwnTest112
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "data"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P006 = new P006();
      let actual1: boolean = p.hasOwnProperty("data");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1130
     * @tc.name objectHasOwnTest113
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "missing"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P007 = new P007();
      let actual1: boolean = p.hasOwnProperty("missing");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1140
     * @tc.name objectHasOwnTest114
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "anyKey"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P008 = new P008();
      let actual1: boolean = p.hasOwnProperty("anyKey");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1150
     * @tc.name objectHasOwnTest115
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "b"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Child001 = new Child001();
      let actual1: boolean = c.hasOwnProperty('b');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1160
     * @tc.name objectHasOwnTest116
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "g"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leaf: Leaf = new Leaf();
      let actual1: boolean = leaf.hasOwnProperty('g');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1170
     * @tc.name objectHasOwnTest117
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "v"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Child002 = new Child002();
      let actual1: boolean = c.hasOwnProperty('v');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1180
     * @tc.name objectHasOwnTest118
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "zzz"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Child003 = new Child003();
      let actual1: boolean = c.hasOwnProperty("zzz");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1190
     * @tc.name objectHasOwnTest119
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "hello"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Child005 = new Child005();
      let actual1: boolean = c.hasOwnProperty("hello");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1200
     * @tc.name objectHasOwnTest120
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "say"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P009 = new P009();
      let actual1: boolean = p.hasOwnProperty("say");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1210
     * @tc.name objectHasOwnTest121
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "constructor"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P010 = new P010();
      let actual1: boolean = p.hasOwnProperty("constructor");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1220
     * @tc.name objectHasOwnTest122
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "s"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P011 = new P011();
      let actual1: boolean = p.hasOwnProperty('s');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1230
     * @tc.name objectHasOwnTest123
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "v"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P012 = new P012();
      let actual1: boolean = p.hasOwnProperty('v');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1240
     * @tc.name objectHasOwnTest124
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "x"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P013 = new P013();
      let actual1: boolean = p.hasOwnProperty('x');
      expect(actual1).assertTrue();
      let actual2: boolean = p.hasOwnProperty('y');
      expect(actual2).assertTrue();
      let actual3: boolean = p.hasOwnProperty('z');
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1250
     * @tc.name objectHasOwnTest125
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      let actual1: boolean = arr.hasOwnProperty(3);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1260
     * @tc.name objectHasOwnTest126
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "length"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      let actual1: boolean = arr.hasOwnProperty("length");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1270
     * @tc.name objectHasOwnTest127
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      let actual1: boolean = arr.hasOwnProperty('0');
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty(0);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1280
     * @tc.name objectHasOwnTest128
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "x"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      let actual1: boolean = arr.hasOwnProperty('x');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1290
     * @tc.name objectHasOwnTest129
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      let actual1: boolean = arr.hasOwnProperty(0);
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty(1);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1300
     * @tc.name objectHasOwnTest130
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      let actual1: boolean = arr.hasOwnProperty(2);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1310
     * @tc.name objectHasOwnTest131
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const flags: boolean[] = [true, false];
      let actual1: boolean = flags.hasOwnProperty(0);
      expect(actual1).assertTrue();
      let actual2: boolean = flags.hasOwnProperty(1);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1320
     * @tc.name objectHasOwnTest132
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      let actual1: boolean = arr.hasOwnProperty(0);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1330
     * @tc.name objectHasOwnTest133
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "length"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      let actual1: boolean = arr.hasOwnProperty("length");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1340
     * @tc.name objectHasOwnTest134
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [7];
      let actual1: boolean = arr.hasOwnProperty(0);
      expect(actual1).assertTrue();
      let actual2: boolean = arr.hasOwnProperty(1);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1350
     * @tc.name objectHasOwnTest135
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: number[][] = [
        [1, 2],
        [3, 4],
      ];
      let actual1: boolean = m.hasOwnProperty(0);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1360
     * @tc.name objectHasOwnTest136
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: number[][] = [
        [1, 2],
        [3, 4],
      ];
      let actual1: boolean = m[0].hasOwnProperty(1);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1370
     * @tc.name objectHasOwnTest137
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: number[][] = [
        [1, 2],
        [3, 4],
      ];
      let actual1: boolean = m.hasOwnProperty(2);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1380
     * @tc.name objectHasOwnTest138
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      arr.push(3);
      let actual1: boolean = arr.hasOwnProperty(2);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1390
     * @tc.name objectHasOwnTest139
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "push"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      let actual1: boolean = arr.hasOwnProperty("push");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1400
     * @tc.name objectHasOwnTest140
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [];
      let actual1: boolean = arr.hasOwnProperty(0);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1410
     * @tc.name objectHasOwnTest141
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "length"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [];
      let actual1: boolean = arr.hasOwnProperty("length");
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1420
     * @tc.name objectHasOwnTest142
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { '1': 'a', '2': 'b' };
      let actual1: boolean = o.hasOwnProperty(3);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1430
     * @tc.name objectHasOwnTest143
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const symLikeKey: string = "__sym__";
      const o: Record<string, Any> = {};
      o[symLikeKey] = 1;
      const other: string = "__other__";
      let actual1: boolean = o.hasOwnProperty(other);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1440
     * @tc.name objectHasOwnTest144
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "x"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { 'x': 1, 'y': '2', 'z': true };
      let actual1: boolean = o.hasOwnProperty('x');
      expect(actual1).assertTrue();
      let actual2: boolean = o.hasOwnProperty('z');
      expect(actual2).assertTrue();
      let actual3: boolean = o.hasOwnProperty('w');
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1450
     * @tc.name objectHasOwnTest145
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "deep"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nestedRecord: Record<string, Any> = { "deep": 1 };
      const o: Record<string, Any> = { "inner": nestedRecord };
      let actual1: boolean = o.hasOwnProperty("deep");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1460
     * @tc.name objectHasOwnTest146
     * @tc.desc Verify Object.hasOwn returns true for nested key "c" and "b"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nestedRecord: Record<string, Any> = { 'c': 1 };
      const innerRecord: Record<string, Any> = { 'b': nestedRecord };
      const o: Record<string, Any> = { 'a': innerRecord };
      let actual1: boolean = Object.hasOwn((o['a'] as Record<string, Any>)['b'] as Record<string, Any>, 'c');
      expect(actual1).assertTrue();
      let actual2: boolean = Object.hasOwn(o['a'] as Record<string, Any>, 'b');
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1470
     * @tc.name objectHasOwnTest147
     * @tc.desc Verify obj.hasOwnProperty and Object.hasOwn return true for key "k" on object and nested record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nestedRecord: Record<string, Any> = { 'k': 2 };
      const o: Record<string, Any> = { 'k': 1, "inner": nestedRecord };
      let actual1: boolean = o.hasOwnProperty('k');
      expect(actual1).assertTrue();
      let actual2: boolean = Object.hasOwn(o["inner"] as Record<string, Any>, 'k');
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1480
     * @tc.name objectHasOwnTest148
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "n"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: Object | null = null;
      const o: Record<string, Any> = { 'n': n };
      let actual1: boolean = o.hasOwnProperty('n');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1490
     * @tc.name objectHasOwnTest149
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "u"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: number | undefined = undefined;
      const o: Record<string, Any> = { 'u': u };
      let actual1: boolean = o.hasOwnProperty('u');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1500
     * @tc.name objectHasOwnTest150
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "child"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: Node = new Node();
      let actual1: boolean = n.hasOwnProperty("child");
      expect(actual1).assertTrue();
      let actual2: boolean = n.child.hasOwnProperty('k');
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1510
     * @tc.name objectHasOwnTest151
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "a"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { 'a': 1 };
      let actual1: boolean = o.hasOwnProperty('a');
      expect(actual1).assertTrue();
      let actual2: boolean = o.hasOwnProperty('b');
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1520
     * @tc.name objectHasOwnTest152
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "say"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: P014 = new P014();
      let actual1: boolean = p.hasOwnProperty("say");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1530
     * @tc.name objectHasOwnTest153
     * @tc.desc Verify Object.hasOwn returns true for existing keys "a" and "hasOwnProperty" when property shadows Object.prototype method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Record<string, Any> = { 'a': 1, "hasOwnProperty": 3 };
      let actual1: boolean = Object.hasOwn(o, 'a');
      expect(actual1).assertTrue();
      let actual2: boolean = Object.hasOwn(o, "hasOwnProperty");
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1540
     * @tc.name objectHasOwnTest154
     * @tc.desc Verify obj.hasOwnProperty returns true for existing string key __sym__
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const symLikeKey: string = "__sym__";
      const o: Record<string, Any> = {};
      o[symLikeKey] = 1;
      let actual1: boolean = o.hasOwnProperty(symLikeKey);
      expect(actual1).assertTrue();
      let actual2: boolean = o.hasOwnProperty("other");
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1550
     * @tc.name objectHasOwnTest155
     * @tc.desc Verify number array hasOwnProperty accepts indices 0 and 1 for both two-element datasets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputs: number[][] = [[10, 20], [1, 2]];
      for (const arr of inputs) {
        let actual1: boolean = arr.hasOwnProperty(0);
        expect(actual1).assertTrue();
        let actual2: boolean = arr.hasOwnProperty(1);
        expect(actual2).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1560
     * @tc.name objectHasOwnTest156
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      let actual1: boolean = arr.hasOwnProperty(5);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1570
     * @tc.name objectHasOwnTest157
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      let actual1: boolean = record.hasOwnProperty(999999);
      expect(actual1).assertFalse();
      let actual2: boolean = record.hasOwnProperty(-5);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1580
     * @tc.name objectHasOwnTest158
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key keys[i]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const keys: string[] = ["alpha", "beta", "gamma", "delta", "epsilon", "zeta", "eta", "theta", "iota", "kappa"];
      for (let i = 0; i < keys.length; i++) {
        let actual1: boolean = record.hasOwnProperty(keys[i]);
        expect(actual1).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1590
     * @tc.name objectHasOwnTest159
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "alpha"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box: EmptyBox = new EmptyBox();
      let actual1: boolean = box.hasOwnProperty("alpha");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1600
     * @tc.name objectHasOwnTest160
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "greet"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const g: Greeter = new Greeter();
      let actual1: boolean = g.hasOwnProperty("greet");
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1610
     * @tc.name objectHasOwnTest161
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "__proto__"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box: EmptyBox001 = new EmptyBox001();
      let actual1: boolean = box.hasOwnProperty("__proto__");
      expect(actual1).assertFalse();
      let actual2: boolean = box.hasOwnProperty("constructor");
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1620
     * @tc.name objectHasOwnTest162
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box: EmptyBox002 = new EmptyBox002();
      let actual1: boolean = box.hasOwnProperty(0);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1630
     * @tc.name objectHasOwnTest163
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "name"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Owned = new Owned();
      let actual1: boolean = o.hasOwnProperty("name");
      expect(actual1).assertTrue();
      let actual2: boolean = o.hasOwnProperty("age");
      expect(actual2).assertTrue();
      let actual3: boolean = o.hasOwnProperty("other");
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1640
     * @tc.name objectHasOwnTest164
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "x"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const noProto: Record<string, Any> = {};
      noProto['x'] = 1;
      let actual1: boolean = noProto.hasOwnProperty('x');
      expect(actual1).assertTrue();
      let actual2: boolean = noProto.hasOwnProperty('y');
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1650
     * @tc.name objectHasOwnTest165
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "\u200B"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "\u200B": 'w', "alpha": 1 };
      let actual1: boolean = record.hasOwnProperty("\u200B");
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty("alpha");
      expect(actual2).assertTrue();
      let actual3: boolean = record.hasOwnProperty("beta");
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1660
     * @tc.name objectHasOwnTest166
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key pre
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pre: string = "\u00E9";
      const decomp: string = "e\u0301";
      const record: Record<string, Any> = {};
      record[pre] = "pre";
      let actual1: boolean = record.hasOwnProperty(pre);
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty(decomp);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1670
     * @tc.name objectHasOwnTest167
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key composite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const composite: string = "中文😀" + "\u200B";
      const record: Record<string, Any> = {};
      record[composite] = 'c';
      let actual1: boolean = record.hasOwnProperty(composite);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1680
     * @tc.name objectHasOwnTest168
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "\u200B"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "\u200B": 's', "\u200B\u200B": 'd' };
      let actual1: boolean = record.hasOwnProperty("\u200B");
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty("\u200B\u200B");
      expect(actual2).assertTrue();
      let actual3: boolean = record.hasOwnProperty("\u200B\u200B\u200B");
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1690
     * @tc.name objectHasOwnTest169
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key heartVs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const heartBase: string = '❤';
      const heartVs: string = '❤' + "\uFE0F";
      const record: Record<string, Any> = {};
      record[heartVs] = "vs";
      let actual1: boolean = record.hasOwnProperty(heartVs);
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty(heartBase);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1700
     * @tc.name objectHasOwnTest170
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key longKey
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'a'.repeat(100);
      const record: Record<string, Any> = { 'b': 1 };
      let actual1: boolean = record.hasOwnProperty(longKey);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1710
     * @tc.name objectHasOwnTest171
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'a'.repeat(100);
      const prefix: string = longKey.substring(0, 50);
      const record: Record<string, Any> = {};
      record[longKey] = 1;
      let actual1: boolean = record.hasOwnProperty(prefix);
      expect(actual1).assertFalse();
      let actual2: boolean = record.hasOwnProperty(longKey);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1720
     * @tc.name objectHasOwnTest172
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key k1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const k1: string = 'b'.repeat(99) + 'x';
      const k2: string = 'b'.repeat(99) + 'y';
      const record: Record<string, Any> = {};
      record[k1] = 1;
      let actual1: boolean = record.hasOwnProperty(k1);
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty(k2);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1730
     * @tc.name objectHasOwnTest173
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key digitKey
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const digitKey: string = "1234567890".repeat(10);
      const record: Record<string, Any> = {};
      record[digitKey] = 'd';
      let actual1: boolean = record.hasOwnProperty(digitKey);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1740
     * @tc.name objectHasOwnTest174
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key a1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: string = "ab".repeat(50);
      const a2: string = "ba".repeat(50);
      const record: Record<string, Any> = {};
      record[a1] = 1;
      let actual1: boolean = record.hasOwnProperty(a1);
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty(a2);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1750
     * @tc.name objectHasOwnTest175
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key k100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const k100: string = 'a'.repeat(100);
      const k200: string = 'a'.repeat(200);
      const record: Record<string, Any> = {};
      record[k100] = 1;
      record[k200] = 2;
      let actual1: boolean = record.hasOwnProperty(k100);
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty(k200);
      expect(actual2).assertTrue();
      let actual3: boolean = record.hasOwnProperty('a'.repeat(150));
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1760
     * @tc.name objectHasOwnTest176
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key xss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const xss: string = "<script>alert(1)</script>";
      const obf: string = "<scr" + "\u200B" + "ipt>alert(1)</script>";
      const record: Record<string, Any> = {};
      record[xss] = "raw";
      let actual1: boolean = record.hasOwnProperty(xss);
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty(obf);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1770
     * @tc.name objectHasOwnTest177
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: string = '';
      for (let i = 0; i < 10; i++) {
        payload += "<script>alert(1)</script>";
      }
      const record: Record<string, Any> = {};
      record[payload] = 'p';
      let actual1: boolean = record.hasOwnProperty(payload);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1780
     * @tc.name objectHasOwnTest178
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      for (let i = 0; i < 3; i++) {
        let actual1: boolean = arr.hasOwnProperty(i);
        expect(actual1).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1790
     * @tc.name objectHasOwnTest179
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      let actual1: boolean = arr.hasOwnProperty(2);
      expect(actual1).assertTrue();
      arr.pop();
      let actual2: boolean = arr.hasOwnProperty(2);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1800
     * @tc.name objectHasOwnTest180
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "k"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'k': 1 };
      const keys: Array<string> = Object.keys(record);
      for (let i = 0; i < keys.length; i++) {
        let actual1: boolean = record.hasOwnProperty(keys[i]);
        expect(actual1).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1810
     * @tc.name objectHasOwnTest181
     * @tc.desc Verify obj.hasOwnProperty returns false for missing numeric-string keys 0 to 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      for (let i = 0; i < 5; i++) {
        let actual1: boolean = record.hasOwnProperty(i.toString());
        expect(actual1).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1820
     * @tc.name objectHasOwnTest182
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "k"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      let actual1: boolean = record.hasOwnProperty('k');
      expect(actual1).assertFalse();
      record['k'] = 1;
      let actual2: boolean = record.hasOwnProperty('k');
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1830
     * @tc.name objectHasOwnTest183
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "yes"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "yes": 1 };
      let actual1: boolean = record.hasOwnProperty("yes");
      expect(actual1).assertTrue();
      for (let i = 0; i < 5; i++) {
        let actual2: boolean = record.hasOwnProperty(i.toString());
        expect(actual2).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1840
     * @tc.name objectHasOwnTest184
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "a"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const own: boolean = record.hasOwnProperty('a');
      expect(own).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1850
     * @tc.name objectHasOwnTest185
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "missing"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const own: boolean = record.hasOwnProperty("missing");
      expect(own).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1860
     * @tc.name objectHasOwnTest186
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key names[i]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      for (let i = 0; i < names.length; i++) {
        let actual1: boolean = record.hasOwnProperty(names[i]);
        expect(actual1).assertTrue();
      }
      let actual2: boolean = record.hasOwnProperty("nope");
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1870
     * @tc.name objectHasOwnTest187
     * @tc.desc Verify obj.hasOwnProperty checks key names[i] ownership
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      let actual1: boolean = record.hasOwnProperty("a");
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty("b");
      expect(actual2).assertTrue();
      let actual3: boolean = record.hasOwnProperty("c");
      expect(actual3).assertTrue();
      let actual4: boolean = record.hasOwnProperty("nope");
      expect(actual4).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1880
     * @tc.name objectHasOwnTest188
     * @tc.desc Verify obj.hasOwnProperty returns true for existing unicode keys including CJK word, emoji and zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "中文": 1, '😀': 2, "\u200B": 3 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: boolean = names.includes("中文");
      expect(actual1).assertTrue();
      let actual2: boolean = names.includes('😀');
      expect(actual2).assertTrue();
      let actual3: boolean = names.includes("\u200B");
      expect(actual3).assertTrue();
      let actual4: boolean = record.hasOwnProperty("中文");
      expect(actual4).assertTrue();
      let actual5: boolean = record.hasOwnProperty('😀');
      expect(actual5).assertTrue();
      let actual6: boolean = record.hasOwnProperty("\u200B");
      expect(actual6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1890
     * @tc.name objectHasOwnTest189
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "<script>alert(1)</script>"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const xss: string = "<script>alert(1)</script>";
      const record: Record<string, Any> = {};
      record[xss] = 1;
      let actual1: boolean = Object.getOwnPropertyNames(record).includes(xss);
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty(xss);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1900
     * @tc.name objectHasOwnTest190
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key longKey
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'a'.repeat(100);
      const record: Record<string, Any> = {};
      record[longKey] = 1;
      let actual1: boolean = Object.getOwnPropertyNames(record).includes(longKey);
      expect(actual1).assertTrue();
      let actual2: boolean = record.hasOwnProperty(longKey);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1910
     * @tc.name objectHasOwnTest191
     * @tc.desc Verify obj.hasOwnProperty distinguishes existing vs missing key "a"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      let actual1: boolean = record.hasOwnProperty('a');
      expect(actual1).assertTrue();
      let actual2: boolean = Object.getOwnPropertyNames(record).includes('a');
      expect(actual2).assertTrue();
      let actual3: boolean = record.hasOwnProperty("missing");
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1920
     * @tc.name objectHasOwnTest192
     * @tc.desc Verify obj.hasOwnProperty returns true for existing key "z"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      record['z'] = 26;
      let actual1: boolean = record.hasOwnProperty('z');
      expect(actual1).assertTrue();
      let actual2: boolean = Object.getOwnPropertyNames(record).includes('z');
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HASOWN_1930
     * @tc.name objectHasOwnTest193
     * @tc.desc Verify obj.hasOwnProperty returns false for missing key "any"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnTest193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const names: string[] = Object.getOwnPropertyNames(record);
      let actual1: boolean = record.hasOwnProperty("any");
      expect(actual1).assertFalse();
      expect(names.length).assertEqual(0);
    });
  });
}
