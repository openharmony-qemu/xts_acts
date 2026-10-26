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
class Factory {
  build(): Object {
    return new Object();
  }
}
class Point {
  x: number = 3;
  y: number = 4;
  constructor(x: number = 3, y: number = 4) {
    this.x = x;
    this.y = y;
  }
}
class Shape {
  name: string = "shape";
}
class Circle extends Shape {
  radius: number = 1;
}
class NodeA {
  a: number = 1;
}
class NodeB extends NodeA {
  b: number = 2;
}
class NodeC extends NodeB {
  c: number = 3;
}
class NodeC001 extends NodeB {
  c: number = 3;
}
class Empty {}
class Single {
  only: number = 0;
}
class Counter {
  count: number = 0;
}
class Label {
  title: string = "default";
}
class Flag {
  enabled: boolean = true;
}
class Vec2 {
  x: number = 1;
  y: number = 1;
}
class Box002 {
  v: number = 1;
}
class Empty001 {}
class Calculator {
  v: number = 1;
}
class Node {
  v: number = 1;
}
class Node003 {
  v: number = 1;
}
class Demo {
  v: number = 1;
}
class Marker {
  v: number = 1;
}
class Box005 {
  val: string = 'a';
}
class Item004 {
  name: string = "item";
}
class Item005 {
  name: string = "item";
}
class Product {
  name: string = "book";
  price: number = 10;
}
class Cart {
  items: number = 0;
}
class Bag {
  items: string[];
  constructor(items: string[]) {
    this.items = items;
  }
}
class Config {
  data: Record<string, Any>;
  constructor(data: Record<string, Any>) {
    this.data = data;
  }
}
class Item001 {
  id: number;
  constructor(id: number) {
    this.id = id;
  }
}
class Tag {
  name: string;
  constructor(name: string) {
    this.name = name;
  }
}
class Box006 {
  name: string = "box";
}
class Item007 {
  name: string = "item";
}
class Middle {
  mid: string = 'm';
}
class Leaf extends Middle {
  leaf: boolean = true;
}
class Calc {
  total: number = 3;
}
class Built {
  tag: string = "made";
}
class Child extends Point {
  value: number = 9;
}
class BoxTest {
  items: number[] = [1, 2];
}
class Inner1 {
  v: number = 7;
}
class Outer {
  inner: Inner1 = new Inner1();
}
class Holder {
  inner: Object = new Object();
}
class Mutable {
  value: number = 1;
}
class Ordered {
  a: number = 1;
  b: number = 2;
  c: number = 3;
}
class Mixed {
  n: number = 1;
  s: string = 's';
  f: boolean = true;
}
class EmptyStr {
  name: string = '';
}
class Ratio {
  rate: number = 0.5;
}
class Delta {
  offset: number = -1;
}
class Point014 {
  x: number = 1;
  y: number = 2;
}
class Point015 {
  x: number = 1;
}
class Point016 {
  x: number = 1;
}
class Rect {
  w: number;
  h: number;
  constructor(w: number, h: number) {
    this.w = w;
    this.h = h;
  }
}
class Origin {
  originX: number = 0;
}
class Position {
  x: number = 1;
  y: number = 2;
}
class User {
  id: number = 1;
}
class Item {
  id: number = 1;
}
class Item002 {
  name: string = "item";
}
class Flag001 {
  on: boolean = true;
}
class Outer001 {
  v: number = 1;
}
class EmptyData {}
class Dog {
  name: string = "dog";
}
class Node001 {
  v: number = 1;
}
class Node002 {
  v: number = 1;
}
function acceptObject(objArg: Object): number {
  return Object.keys(objArg).length;
}
function keysLength(objArg: Object): number {
  return Object.keys(objArg).length;
}
function safeHash(input: Object): int {
  return input.$_hashCode();
}
function innerHash(input: Object): int {
  return input.$_hashCode();
}
function asObj(v: Any): Object { return v as Object; }
export default function objectConstructorTest2(): void {
  describe("ObjectConstructorTest2", (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0010
     * @tc.name objectConstructorTest001
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      let actual1: int = obj.toString().length;
      let expected1: int = 15;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0020
     * @tc.name objectConstructorTest002
     * @tc.desc Verify new Object() Object.keys returns an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      const keys = Object.keys(obj);
      let actual1: boolean = Array.isArray(keys);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0030
     * @tc.name objectConstructorTest003
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      const h: int = obj.$_hashCode();
      const h2: int = obj.$_hashCode();
      expect(h).assertEqual(h2);
      expect(h).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0040
     * @tc.name objectConstructorTest004
     * @tc.desc Verify new Object() Object.keys returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      const keys: string[] = Object.keys(obj);
      let actual1: int = keys.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = keys.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0050
     * @tc.name objectConstructorTest005
     * @tc.desc Verify two new Object() instances are distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Object();
      const second = new Object();
      expect(first).not().assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0060
     * @tc.name objectConstructorTest006
     * @tc.desc Verify three new Object() instances are pairwise distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Object();
      const b = new Object();
      const c = new Object();
      expect(a).not().assertEqual(b);
      expect(b).not().assertEqual(c);
      expect(a).not().assertEqual(c);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0070
     * @tc.name objectConstructorTest007
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Object();
      const second = new Object();
      const s1: String = first.toString();
      const s2: String = second.toString();
      expect(s1).assertEqual(s2);
      expect(s1).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0080
     * @tc.name objectConstructorTest008
     * @tc.desc Verify two new Object() instances created by a factory are distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const createObject = (): Object => {
        return new Object();
      };
      const first: Object = createObject();
      const second: Object = createObject();
      expect(first).not().assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0090
     * @tc.name objectConstructorTest009
     * @tc.desc Verify two Object instances returned by Factory.build are distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const factory = new Factory();
      const first: Object = factory.build();
      const second: Object = factory.build();
      expect(first).not().assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0100
     * @tc.name objectConstructorTest010
     * @tc.desc Verify strict equality of two new Object() instances is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inspect = (a: Object, b: Object): boolean => {
        return a === b;
      };
      const same: boolean = inspect(new Object(), new Object());
      expect(same).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0110
     * @tc.name objectConstructorTest011
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: Object = new Object();
      const second: Object = new Object();
      const h1: int = first.$_hashCode();
      const h12: int = first.$_hashCode();
      const h2: int = second.$_hashCode();
      const h22: int = second.$_hashCode();
      expect(h1).assertEqual(h12);
      expect(h2).assertEqual(h22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0120
     * @tc.name objectConstructorTest012
     * @tc.desc Verify two new Object() instances each have 0 own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Object();
      const second = new Object();
      let actual1: int = Object.keys(first).length;
      expect(actual1).assertEqual(0);
      let actual2: int = Object.keys(second).length;
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0130
     * @tc.name objectConstructorTest013
     * @tc.desc Verify Point instance Object.keys returns x and y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Object = new Point();
      let actual1: int = Object.keys(p).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0140
     * @tc.name objectConstructorTest014
     * @tc.desc Verify Object.keys of Point instance returns own field names x y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: string[] = Object.keys(new Point());
      let actual1: int = keys.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = 'x';
      expect(actual2).assertEqual(expected2);
      let actual3: string = keys[1]!;
      let expected3: string = 'y';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0150
     * @tc.name objectConstructorTest015
     * @tc.desc Verify Object.getOwnPropertyNames of Point instance returns x and y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const names: string[] = Object.getOwnPropertyNames(new Point());
      let actual1: int = names.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[0]!;
      let expected2: string = 'x';
      expect(actual2).assertEqual(expected2);
      let actual3: string = names[1]!;
      let expected3: string = 'y';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0160
     * @tc.name objectConstructorTest016
     * @tc.desc Verify Object.values of Point instance returns field values 3 and 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Any[] = Object.values(new Point());
      let actual1: int = values.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${values[0]!}`;
      let expected2: string = `${3}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${values[1]!}`;
      let expected3: string = `${4}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0170
     * @tc.name objectConstructorTest017
     * @tc.desc Verify Object.entries of Point instance returns 2 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries = Object.entries(new Point());
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0180
     * @tc.name objectConstructorTest018
     * @tc.desc Verify new Object() hasOwnProperty returns true for own key "x"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual1: boolean = new Point().hasOwnProperty('x');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0190
     * @tc.name objectConstructorTest019
     * @tc.desc Verify new Object() hasOwnProperty returns false for any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual1: boolean = new Point().hasOwnProperty('z');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0200
     * @tc.name objectConstructorTest020
     * @tc.desc Verify Object.hasOwn returns true for own key y of Point instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual1: boolean = Object.hasOwn(new Point(), 'y');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0210
     * @tc.name objectConstructorTest021
     * @tc.desc Verify Object.hasOwn returns false for numeric key 0 on Point instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual1: boolean = Object.hasOwn(new Point(), 0);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0220
     * @tc.name objectConstructorTest022
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual1: string = new Point().toString();
      let expected1: string = "[object Object]";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0230
     * @tc.name objectConstructorTest023
     * @tc.desc Verify new Object() toLocaleString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual1: string = new Point().toLocaleString();
      let expected1: string = "[object Object]";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0240
     * @tc.name objectConstructorTest024
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point = new Point();
      const h: int = p.$_hashCode();
      const h2: int = p.$_hashCode();
      expect(h).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0250
     * @tc.name objectConstructorTest025
     * @tc.desc Verify Object.keys of Circle instance returns inherited and own field names name radius
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: string[] = Object.keys(new Circle());
      let actual1: int = keys.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = "name";
      expect(actual2).assertEqual(expected2);
      let actual3: string = keys[1]!;
      let expected3: string = "radius";
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0260
     * @tc.name objectConstructorTest026
     * @tc.desc Verify NodeC instance exposes inherited fields a b c with default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst = new NodeC();
      let actual1: number = inst.c; let expected1: number = 3; expect(actual1).assertEqual(expected1);
      let actual2: number = inst.b; let expected2: number = 2; expect(actual2).assertEqual(expected2);
      let actual3: number = inst.a; let expected3: number = 1; expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0270
     * @tc.name objectConstructorTest027
     * @tc.desc Verify Object.keys of NodeC001 instance returns inherited field names a b c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: string[] = Object.keys(new NodeC001());
      let actual1: int = keys.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = keys[1]!;
      let expected3: string = 'b';
      expect(actual3).assertEqual(expected3);
      let actual4: string = keys[2]!;
      let expected4: string = 'c';
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0280
     * @tc.name objectConstructorTest028
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref: Object = new Point();
      let actual1: string = ref.toString();
      let expected1: string = "[object Object]";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0290
     * @tc.name objectConstructorTest029
     * @tc.desc Verify Object.keys of Empty instance returns 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: string[] = Object.keys(new Empty());
      let actual1: int = keys.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0300
     * @tc.name objectConstructorTest030
     * @tc.desc Verify Object.keys of Single instance returns own field only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: string[] = Object.keys(new Single());
      let actual1: int = keys.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = "only";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0310
     * @tc.name objectConstructorTest031
     * @tc.desc Verify Counter instance field count has default value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Counter();
      let actual1: number = obj.count;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0320
     * @tc.name objectConstructorTest032
     * @tc.desc Verify Label instance field title has default value default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Label();
      let actual1: string = obj.title;
      let expected1: string = "default";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0330
     * @tc.name objectConstructorTest033
     * @tc.desc Verify Flag instance field enabled is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Flag();
      let actual1: boolean = obj.enabled;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0340
     * @tc.name objectConstructorTest034
     * @tc.desc Verify Calc instance field total has default value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Calc();
      let actual1: number = obj.total;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0350
     * @tc.name objectConstructorTest035
     * @tc.desc Verify Built instance field tag has default value made
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Built();
      let actual1: string = obj.tag;
      let expected1: string = "made";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0360
     * @tc.name objectConstructorTest036
     * @tc.desc Verify Child instance inherits field value with default 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Child();
      let actual1: number = obj.value;
      let expected1: int = 9;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0370
     * @tc.name objectConstructorTest037
     * @tc.desc Verify two BoxTest instances have distinct items arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new BoxTest();
      const second = new BoxTest();
      expect(first.items).not().assertEqual(second.items);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0380
     * @tc.name objectConstructorTest038
     * @tc.desc Verify Outer instance exposes nested Inner1 field v with value 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Outer();
      let actual1: number = obj.inner.v;
      let expected1: int = 7;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0390
     * @tc.name objectConstructorTest039
     * @tc.desc Verify Holder instance inner Object has 0 own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Holder();
      let actual1: int = Object.keys(obj.inner).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0400
     * @tc.name objectConstructorTest040
     * @tc.desc Verify two Mutable instances have independent value fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Mutable();
      const second = new Mutable();
      first.value = 10;
      let actual1: number = first.value;
      let expected1: int = 10;
      expect(actual1).assertEqual(expected1);
      let actual2: number = second.value;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0410
     * @tc.name objectConstructorTest041
     * @tc.desc Verify Object.keys of Ordered instance returns own fields a b c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: string[] = Object.keys(new Ordered());
      let actual1: string = keys[0]!;
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[1]!;
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
      let actual3: string = keys[2]!;
      let expected3: string = 'c';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0420
     * @tc.name objectConstructorTest042
     * @tc.desc Verify Object.values of Mixed instance returns 3 field values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Any[] = Object.values(new Mixed());
      let actual1: int = values.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${values[0]!}`;
      let expected2: string = `${1}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = values[1]! as string;
      let expected3: string = 's';
      expect(actual3).assertEqual(expected3);
      let actual4: boolean = values[2]! as boolean;
      expect(actual4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0430
     * @tc.name objectConstructorTest043
     * @tc.desc Verify EmptyStr instance field name has empty string default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new EmptyStr();
      let actual1: string = obj.name;
      let expected1: string = '';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0440
     * @tc.name objectConstructorTest044
     * @tc.desc Verify Ratio instance field rate has default value 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Ratio();
      let actual1: number = obj.rate;
      let expected1: number = 0.5;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0450
     * @tc.name objectConstructorTest045
     * @tc.desc Verify Delta instance field offset has default value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Delta();
      let actual1: number = obj.offset;
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0460
     * @tc.name objectConstructorTest046
     * @tc.desc Verify number array viewed as Object exposes 2 index keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      const ref: Object = arr;
      const keys: string[] = Object.keys(ref);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0470
     * @tc.name objectConstructorTest047
     * @tc.desc Verify Object.keys of number array viewed as Object returns 2 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      const ref: Object = arr;
      let actual1: int = Object.keys(ref).length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0480
     * @tc.name objectConstructorTest048
     * @tc.desc Verify number array is an Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2];
      let actual1: boolean = Array.isArray(arr);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0490
     * @tc.name objectConstructorTest049
     * @tc.desc Verify Object.keys of empty array returns 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const keys: string[] = Object.keys(arr);
      let actual1: int = keys.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0500
     * @tc.name objectConstructorTest050
     * @tc.desc Verify Object.keys of string array returns index keys 0 to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const keys: string[] = Object.keys(arr);
      let actual1: int = keys.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = keys[2]!;
      let expected3: string = '2';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0510
     * @tc.name objectConstructorTest051
     * @tc.desc Verify number array toString returns "1,2,3"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      let actual1: string = arr.toString();
      let expected1: string = "1,2,3";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0520
     * @tc.name objectConstructorTest052
     * @tc.desc Verify single-element array toString returns "5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [5];
      let actual1: string = arr.toString();
      let expected1: string = '5';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0530
     * @tc.name objectConstructorTest053
     * @tc.desc Verify empty array toString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      let actual1: string = arr.toString();
      let expected1: string = '';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0540
     * @tc.name objectConstructorTest054
     * @tc.desc Verify new Object() hasOwnProperty returns false for any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20];
      let actual1: boolean = arr.hasOwnProperty(2);
      expect(actual1).assertFalse();
      let actual2: boolean = arr.hasOwnProperty(-1);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0550
     * @tc.name objectConstructorTest055
     * @tc.desc Verify Object.values of number array returns 10 20 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      const values: Any[] = Object.values(arr);
      let actual1: int = values.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${values[0]!}`;
      let expected2: string = `${10}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${values[2]!}`;
      let expected3: string = `${30}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0560
     * @tc.name objectConstructorTest056
     * @tc.desc Verify Object.entries of number array returns 2 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0570
     * @tc.name objectConstructorTest057
     * @tc.desc Verify Object.hasOwn returns true for array index key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20];
      let actual1: boolean = Object.hasOwn(arr, 0);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0580
     * @tc.name objectConstructorTest058
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20];
      const h1: int = arr.$_hashCode();
      const h12: int = arr.$_hashCode();
      expect(h1).assertEqual(h12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0590
     * @tc.name objectConstructorTest059
     * @tc.desc Verify string array toString returns "x,y"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['x', 'y'];
      let actual1: string = arr.toString();
      let expected1: string = "x,y";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0600
     * @tc.name objectConstructorTest060
     * @tc.desc Verify new Object() hasOwnProperty returns true for own key "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20];
      const ref: Object = arr;
      let actual1: boolean = ref.hasOwnProperty(0);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0610
     * @tc.name objectConstructorTest061
     * @tc.desc Verify Object.keys of new Object() via helper returns 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      const probe = (o: Object): string[] => {
        return Object.keys(o);
      };
      const keys: string[] = probe(obj);
      let actual1: int = keys.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0620
     * @tc.name objectConstructorTest062
     * @tc.desc Verify Object.keys of Point014 instance via helper returns 2 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const probe = (o: Object): string[] => {
        return Object.keys(o);
      };
      const keys: string[] = probe(new Point014());
      let actual1: int = keys.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0630
     * @tc.name objectConstructorTest063
     * @tc.desc Verify Object.keys of array via helper returns index keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const probe = (o: Object): string[] => {
        return Object.keys(o);
      };
      const keys: string[] = probe([10, 20]);
      let actual1: int = keys.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0640
     * @tc.name objectConstructorTest064
     * @tc.desc Verify reassigning an Object reference to another instance compares equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Object();
      const second = new Object();
      let ref: Object = first;
      ref = second;
      expect(ref).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0650
     * @tc.name objectConstructorTest065
     * @tc.desc Verify Object.keys length of new Object() via helper is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const probe = (o: Object): int => {
        return Object.keys(o).length;
      };
      let actual1: number = probe(new Object());
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0660
     * @tc.name objectConstructorTest066
     * @tc.desc Verify new Object() creates object with 1 own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const flag: boolean = false;
      const obj: Object = flag ? new Object() : new Point015();
      let actual1: int = Object.keys(obj).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0670
     * @tc.name objectConstructorTest067
     * @tc.desc Verify two new Object() instances in array each have 0 own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder: Object[] = [new Object(), new Object()];
      let actual1: int = Object.keys(holder[0]!).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = Object.keys(holder[1]!).length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0680
     * @tc.name objectConstructorTest068
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const build = (): Object => {
        return new Object();
      };
      const obj: Object = build();
      let actual1: string = obj.toString();
      let expected1: string = "[object Object]";
      expect(actual1).assertEqual(expected1);
      let actual2: int = Object.keys(obj).length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0690
     * @tc.name objectConstructorTest069
     * @tc.desc Verify Object reference reassigned to Point016 instance exposes 1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ref: Object = new Object();
      ref = new Point016();
      let actual1: int = Object.keys(ref).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0700
     * @tc.name objectConstructorTest070
     * @tc.desc Verify new Object() keys and getOwnPropertyNames are empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ret: Object = new Object();
      const k: string[] = Object.keys(ret);
      const n: string[] = Object.getOwnPropertyNames(ret);
      let actual1: int = k.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = n.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0710
     * @tc.name objectConstructorTest071
     * @tc.desc Verify new Object() toLocaleString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ret: Object = new Object();
      let actual1: string = ret.toString();
      let expected1: string = "[object Object]";
      expect(actual1).assertEqual(expected1);
      let actual2: string = ret.toLocaleString();
      let expected2: string = "[object Object]";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0720
     * @tc.name objectConstructorTest072
     * @tc.desc Verify Object.keys of new Object() returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ret: Object = new Object();
      const k = Object.keys(ret);
      let actual1: int = k.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = Array.isArray(k);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0730
     * @tc.name objectConstructorTest073
     * @tc.desc Verify new Object() hasOwnProperty returns false for any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ret: Object = new Object();
      let actual1: boolean = ret.hasOwnProperty('a');
      expect(actual1).assertFalse();
      let actual2: boolean = ret.hasOwnProperty('b');
      expect(actual2).assertFalse();
      let actual3: boolean = ret.hasOwnProperty(0);
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0740
     * @tc.name objectConstructorTest074
     * @tc.desc Verify new Object() stored in record exposes 0 own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ret: Object = new Object();
      const record: Record<string, Object> = { "slot": ret };
      const loaded: Object | undefined = record["slot"];
      let actual1: int = Object.keys(loaded!).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0750
     * @tc.name objectConstructorTest075
     * @tc.desc Verify Object.hasOwn returns false for out-of-range numeric keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      let actual1: boolean = Object.hasOwn(obj, -1);
      expect(actual1).assertFalse();
      let actual2: boolean = Object.hasOwn(obj, 9007199254740991);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0760
     * @tc.name objectConstructorTest076
     * @tc.desc Verify new Object() creates object with 0 own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: string[] = Object.keys(new Object());
      const values: Any[] = Object.values(new Object());
      const entries = Object.entries(new Object());
      const names: string[] = Object.getOwnPropertyNames(new Object());
      expect(keys.length).assertEqual(0);
      expect(values.length).assertEqual(0);
      expect(entries.length).assertEqual(0);
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0770
     * @tc.name objectConstructorTest077
     * @tc.desc Verify new Object() as assign source leaves existing target keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const src = new Object();
      const result: Record<string, Any> = Object.assign(target, src);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0780
     * @tc.name objectConstructorTest078
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const alias: Object = obj;
      let expected1: string = "[object Object]";
      let actual1: string = alias.toString();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0790
     * @tc.name objectConstructorTest079
     * @tc.desc Verify new Object() stringified via template literal is [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const anyRef: Any = obj;
      let actual1: string = `${anyRef}`;
      let expected1: string = "[object Object]";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0800
     * @tc.name objectConstructorTest080
     * @tc.desc Verify Object.keys of new Object() has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyCount: number = Object.keys(new Object()).length;
      expect(keyCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0810
     * @tc.name objectConstructorTest081
     * @tc.desc Verify Object.entries of new Object() has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entryCount: number = Object.entries(new Object()).length;
      expect(entryCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0820
     * @tc.name objectConstructorTest082
     * @tc.desc Verify Object.getOwnPropertyNames of new Object() has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nameCount: number = Object.getOwnPropertyNames(new Object()).length;
      expect(nameCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0830
     * @tc.name objectConstructorTest083
     * @tc.desc Verify helper counting Object.keys of new Object() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      let actual1: number = acceptObject(obj);
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0840
     * @tc.name objectConstructorTest084
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        const obj: Object = new Object();
        let actual1: string = obj.toString();
        let expected1: string = "[object Object]";
        expect(actual1).assertEqual(expected1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0850
     * @tc.name objectConstructorTest085
     * @tc.desc Verify new Object() toString returns [object Object] and 0 own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      let actual1: string = obj.toString();
      let expected1: string = "[object Object]";
      expect(actual1).assertEqual(expected1);
      let actual2: int = Object.keys(obj).length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0860
     * @tc.name objectConstructorTest086
     * @tc.desc Verify new Object() creates object with 0 own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const keys: string[] = Object.keys(obj);
      expect(keys.length).assertEqual(0);
      expect(keys.includes("k")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0870
     * @tc.name objectConstructorTest087
     * @tc.desc Verify new Object() values returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const vals: Any[] = Object.values(obj);
      expect(vals.length).assertEqual(0);
      expect(vals.includes(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0880
     * @tc.name objectConstructorTest088
     * @tc.desc Verify new Object() entries returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const entries = Object.entries(obj);
      expect(entries.length).assertEqual(0);
      expect(entries.includes(['a', 1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0890
     * @tc.name objectConstructorTest089
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objA: Object = new Object();
      const objB: Object = new Object();
      expect(objA.toString()).assertEqual("[object Object]");
      expect(objB.toString()).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0900
     * @tc.name objectConstructorTest090
     * @tc.desc Verify new Object() toString returns [object Object] and literal has 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const literal: Object = {};
      expect(obj.toString()).assertEqual("[object Object]");
      expect(Object.keys(literal).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0910
     * @tc.name objectConstructorTest091
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Object().toString()).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0920
     * @tc.name objectConstructorTest092
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const s: string = obj.toString();
      const h: number = obj.$_hashCode();
      const h2: number = obj.$_hashCode();
      expect(h).assertEqual(h2);
      expect(s).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0930
     * @tc.name objectConstructorTest093
     * @tc.desc Verify new Object() toString returns stable value across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const firstStr: string = obj.toString();
      obj.toString();
      let actual1: string = obj.toString();
      let expected1: string = firstStr;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0940
     * @tc.name objectConstructorTest094
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = new Object().toString();
      expect(s).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0950
     * @tc.name objectConstructorTest095
     * @tc.desc Verify new Object() toString returns stable value across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const strBefore: string = obj.toString();
      obj.$_hashCode();
      let actual1: string = obj.toString();
      let expected1: string = strBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0960
     * @tc.name objectConstructorTest096
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const s1: string = obj.toString();
      const s2: string = obj.toString();
      const s3: string = obj.toString();
      expect(s1).assertEqual(s2);
      expect(s2).assertEqual(s3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0970
     * @tc.name objectConstructorTest097
     * @tc.desc Verify Object.toString returns [object Object] after one or two preceding calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const precedingCallCounts: int[] = [2, 1];
      for (const precedingCallCount of precedingCallCounts) {
        const obj: Object = new Object();
        let callIndex: int = 0;
        while (callIndex < precedingCallCount) {
          obj.toString();
          callIndex++;
        }
        const actual: string = obj.toString();
        expect(actual).assertEqual('[object Object]');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0980
     * @tc.name objectConstructorTest098
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      obj.$_hashCode();
      expect(obj.toString()).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_0990
     * @tc.name objectConstructorTest099
     * @tc.desc Verify strict equality of two new Object() instances is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objA: Object = new Object();
      const objB: Object = new Object();
      const isSameInstance: boolean = objA === objB;
      expect(isSameInstance).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1000
     * @tc.name objectConstructorTest100
     * @tc.desc Verify adding a key to one object literal leaves the other empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objA: Record<string, Any> = {};
      const objB: Record<string, Any> = {};
      const recordA: Record<string, Any> = objA;
      recordA["marker"] = 1;
      let actual1: int = Object.keys(objB).length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1010
     * @tc.name objectConstructorTest101
     * @tc.desc Verify two object literals hold independent values for same key k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objA: Record<string, Any> = {};
      const objB: Record<string, Any> = {};
      const recordA: Record<string, Any> = objA;
      const recordB: Record<string, Any> = objB;
      recordA['k'] = 'a';
      recordB['k'] = 'b';
      let actual1: string = recordA['k']! as string;
      let expected1: string = 'a';
      expect(actual1).assertEqual(expected1);
      let actual2: string = recordB['k']! as string;
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1020
     * @tc.name objectConstructorTest102
     * @tc.desc Verify keysLength helper returns 0 for two new Object() instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objA: Object = new Object();
      const objB: Object = new Object();
      const lenA: number = keysLength(objA);
      const lenB: number = keysLength(objB);
      expect(lenA).assertEqual(0);
      expect(lenB).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1030
     * @tc.name objectConstructorTest103
     * @tc.desc Verify new Object() creates object with 0 own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: string[] = Object.keys(new Object());
      expect(keys.length).assertEqual(0);
      expect(keys.includes("x")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1040
     * @tc.name objectConstructorTest104
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objA: Object = new Object();
      const objB: Object = new Object();
      const hashA1: number = objA.$_hashCode();
      const hashA12: int = objA.$_hashCode();
      expect(hashA1).assertEqual(hashA12);
      const hashB1: number = objB.$_hashCode();
      const hashB12: int = objB.$_hashCode();
      expect(hashB1).assertEqual(hashB12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1050
     * @tc.name objectConstructorTest105
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objA: Object = new Object();
      const objB: Object = new Object();
      const hashA1: number = objA.$_hashCode();
      const hashB1: number = objB.$_hashCode();
      const same: boolean = hashA1 === hashB1;
      expect(same).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1060
     * @tc.name objectConstructorTest106
     * @tc.desc Verify keysLength helper returns 0 for new Object()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      let actual1: number = keysLength(obj);
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1070
     * @tc.name objectConstructorTest107
     * @tc.desc Verify new Object() creates object with 0 own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let blockCount: number = -1;
      {
        const obj: Object = new Object();
        blockCount = Object.keys(obj).length;
      }
      expect(blockCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1080
     * @tc.name objectConstructorTest108
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cleaned: boolean = false;
      try {
        const obj: Object = new Object();
        let actual1: string = obj.toString();
        let expected1: string = "[object Object]";
        expect(actual1).assertEqual(expected1);
      } finally {
        cleaned = true;
      }
      expect(cleaned).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1090
     * @tc.name objectConstructorTest109
     * @tc.desc Verify new Object() creates object with 0 own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      let firstRead: number = Object.keys(obj).length;
      let secondRead: number = Object.keys(obj).length;
      let thirdRead: number = Object.keys(obj).length;
      expect(firstRead).assertEqual(0);
      expect(secondRead).assertEqual(0);
      expect(thirdRead).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1100
     * @tc.name objectConstructorTest110
     * @tc.desc Verify new Object() hasOwnProperty returns false for any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const hit: boolean = obj.hasOwnProperty(0);
      expect(hit).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1110
     * @tc.name objectConstructorTest111
     * @tc.desc Verify Object.keys throws on undefined argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.keys(asObj(undefined));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1120
     * @tc.name objectConstructorTest112
     * @tc.desc Verify Object.keys throws on null argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.keys(asObj(null));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1130
     * @tc.name objectConstructorTest113
     * @tc.desc Verify Object.values throws on undefined argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.values(asObj(undefined));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1140
     * @tc.name objectConstructorTest114
     * @tc.desc Verify Object.values throws on null argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.values(asObj(null));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1150
     * @tc.name objectConstructorTest115
     * @tc.desc Verify Object.entries throws on undefined argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.entries(asObj(undefined));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1160
     * @tc.name objectConstructorTest116
     * @tc.desc Verify Object.entries throws on null argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.entries(asObj(null));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1170
     * @tc.name objectConstructorTest117
     * @tc.desc Verify Object.getOwnPropertyNames throws on undefined argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.getOwnPropertyNames(asObj(undefined));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1180
     * @tc.name objectConstructorTest118
     * @tc.desc Verify Object.getOwnPropertyNames throws on null argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.getOwnPropertyNames(asObj(null));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1190
     * @tc.name objectConstructorTest119
     * @tc.desc Verify Object.hasOwn throws on undefined argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.hasOwn(asObj(undefined), 'k');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1200
     * @tc.name objectConstructorTest120
     * @tc.desc Verify Object.hasOwn throws on null argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.hasOwn(asObj(null), 'k');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1210
     * @tc.name objectConstructorTest121
     * @tc.desc Verify Object.assign throws on undefined target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bad: Record<string, Any> = undefined as Record<string, Any>;
        const src: Record<string, Any> = { 'a': 1 };
        Object.assign(bad, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1220
     * @tc.name objectConstructorTest122
     * @tc.desc Verify Object.assign throws on null target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const bad: Record<string, Any> = null as Record<string, Any>;
        const src: Record<string, Any> = { 'a': 1 };
        Object.assign(bad, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1230
     * @tc.name objectConstructorTest123
     * @tc.desc Verify Object.assign throws ClassCastError on null source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const target: Record<string, Any> = {};
        Object.assign(target, asObj(null));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1240
     * @tc.name objectConstructorTest124
     * @tc.desc Verify Object.assign throws ClassCastError on undefined source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const target: Record<string, Any> = {};
        Object.assign(target, asObj(undefined));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1250
     * @tc.name objectConstructorTest125
     * @tc.desc Verify new Object() toLocaleString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString(undefined);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1260
     * @tc.name objectConstructorTest126
     * @tc.desc Verify Object.values returns "NaN" string for NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'n': Double.NaN };
      const vals: Any[] = Object.values(record);
      let actual1: string = `${vals[0]!}`;
      let expected1: string = "NaN";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1270
     * @tc.name objectConstructorTest127
     * @tc.desc Verify Object.values returns "-Infinity" string for -Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'i': -Double.POSITIVE_INFINITY };
      const vals: Any[] = Object.values(record);
      let actual1: string = `${vals[0]!}`;
      let expected1: string = "-Infinity";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1280
     * @tc.name objectConstructorTest128
     * @tc.desc Verify Object.values stringifies -0 as -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'z': -0.0 };
      const vals: Any[] = Object.values(record);
      const n: number = vals[0] as number;
      let actual1: number = 1 / n;
      let expected1: number = -Double.POSITIVE_INFINITY;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1290
     * @tc.name objectConstructorTest129
     * @tc.desc Verify Object.values returns "9007199254740991" string for max safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'm': 9007199254740991 };
      const vals: Any[] = Object.values(record);
      let actual1: string = `${vals[0]!}`;
      let expected1: string = "9007199254740991";
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1300
     * @tc.name objectConstructorTest130
     * @tc.desc Verify Object.values preserves falsy values 0 empty string and false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'z': 0, 's': '', 'b': false };
      const vals: Any[] = Object.values(record);
      let actual1: string = `${vals[0]!}`;
      let expected1: string = `${0}`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = vals[1]! as string;
      let expected2: string = '';
      expect(actual2).assertEqual(expected2);
      let actual3: boolean = vals[2]! as boolean;
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1310
     * @tc.name objectConstructorTest131
     * @tc.desc Verify Object.assign copies null value from source to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'n': null };
      Object.assign(target, source);
      const vals: Any[] = Object.values(target);
      let actualValue1: Any = vals[0];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1320
     * @tc.name objectConstructorTest132
     * @tc.desc Verify Object.assign copies undefined value from source to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'u': undefined };
      Object.assign(target, source);
      const vals: Any[] = Object.values(target);
      let actualValue1: Any = vals[0];
      let actualValue1IsUndefined: boolean = actualValue1 === undefined;
      expect(actualValue1IsUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1330
     * @tc.name objectConstructorTest133
     * @tc.desc Verify new Object() hasOwnProperty returns false for any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const hit: boolean = obj.hasOwnProperty(Double.NaN);
      expect(hit).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1340
     * @tc.name objectConstructorTest134
     * @tc.desc Verify new Object() toLocaleString with invalid locale returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString("not-a-locale!!");
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1350
     * @tc.name objectConstructorTest135
     * @tc.desc Verify new Object() toLocaleString with long locale returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      let locale: string = '';
      for (let i = 0; i < 200; i++) {
        locale = locale + 'a';
      }
      const result: String = obj.toLocaleString(locale);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1360
     * @tc.name objectConstructorTest136
     * @tc.desc Verify new Object() toLocaleString with locale and options returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const options: Object = new Object();
      const result: String = obj.toLocaleString("xx_YY!!", options);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1370
     * @tc.name objectConstructorTest137
     * @tc.desc Verify new Object() creates object with 0 own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const before: string[] = Object.keys(obj);
      obj.toLocaleString("en");
      const after: string[] = Object.keys(obj);
      let actual1: int = before.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = after.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1380
     * @tc.name objectConstructorTest138
     * @tc.desc Verify Object.assign copies source keys a b to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'a': 1, 'b': 2 };
      Object.assign(target, source);
      const keys: string[] = Object.keys(target);
      let actual1: int = keys.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${target['b']!}`;
      let expected3: string = '2';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1390
     * @tc.name objectConstructorTest139
     * @tc.desc Verify Object.assign later source overwrites earlier source key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const s1: Record<string, Any> = { 'k': 1 };
      const s2: Record<string, Any> = { 'k': 9 };
      Object.assign(target, s1, s2);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '9';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1400
     * @tc.name objectConstructorTest140
     * @tc.desc Verify Object.assign copies source key to target without modifying source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'v': 5 };
      const before: string = `${source['v']!}`;
      Object.assign(target, source);
      const after: string = `${source['v']!}`;
      expect(after).assertEqual(before);
      let actual1: int = Object.keys(target).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1410
     * @tc.name objectConstructorTest141
     * @tc.desc Verify Object.assign with no source leaves existing target keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "keep": 1 };
      const result: Record<string, Any> = Object.assign(target);
      const keys: string[] = Object.keys(result);
      let actual1: int = keys.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = "keep";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1420
     * @tc.name objectConstructorTest142
     * @tc.desc Verify new Object() as assign source leaves existing target keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 't': 1 };
      const empty: Object = new Object();
      Object.assign(target, empty);
      const keys: string[] = Object.keys(target);
      let actual1: int = keys.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = 't';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1430
     * @tc.name objectConstructorTest143
     * @tc.desc Verify new Object() as assign source adds no keys to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const empty: Object = new Object();
      const src: Record<string, Any> = { 'x': 7 };
      Object.assign(target, empty, src);
      const vals: Any[] = Object.values(target);
      let actual1: int = vals.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${vals[0]!}`;
      let expected2: string = `${7}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1440
     * @tc.name objectConstructorTest144
     * @tc.desc Verify Object.assign copies array indices as target keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const arr: int[] = [10, 20];
      Object.assign(target, arr);
      let actual1: string = `${target['0']!}`;
      let expected1: string = "10";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['1']!}`;
      let expected2: string = "20";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1450
     * @tc.name objectConstructorTest145
     * @tc.desc Verify Object.assign merges array and object sources into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const arr: int[] = [5];
      const src: Record<string, Any> = { "tag": 'T' };
      Object.assign(target, arr, src);
      let actual1: string = `${target['0']!}`;
      let expected1: string = '5';
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['tag']!}`;
      let expected2: string = 'T';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1460
     * @tc.name objectConstructorTest146
     * @tc.desc Verify Object.assign with empty array source leaves existing target keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'k': 1 };
      const emptyArr: int[] = [];
      Object.assign(target, emptyArr);
      let actual1: int = Object.keys(target).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1470
     * @tc.name objectConstructorTest147
     * @tc.desc Verify Object.assign copies instance own properties to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, new Origin());
      const keys: string[] = Object.keys(target);
      let actual1: string = keys[0]!;
      let expected1: string = "originX";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['originX']!}`;
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1480
     * @tc.name objectConstructorTest148
     * @tc.desc Verify Object.assign merges multiple sources into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const s1: Record<string, Any> = { 'a': 1 };
      const s2: Record<string, Any> = { 'b': 2 };
      const s3: Record<string, Any> = { 'c': 3 };
      Object.assign(target, s1, s2, s3);
      let actual1: int = Object.keys(target).length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${target['c']!}`;
      let expected2: string = '3';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1490
     * @tc.name objectConstructorTest149
     * @tc.desc Verify Object.assign last source wins for duplicate key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const s1: Record<string, Any> = { 'k': 1 };
      const s2: Record<string, Any> = { 'k': 2 };
      const s3: Record<string, Any> = { 'k': 3 };
      Object.assign(target, s1, s2, s3);
      let actual1: string = `${target['k']!}`;
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1500
     * @tc.name objectConstructorTest150
     * @tc.desc Verify Object.assign copies source keys z a m to target preserving order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'z': 26, 'a': 1, 'm': 13 };
      Object.assign(target, source);
      const keys: string[] = Object.keys(target);
      let actual1: string = keys[0]!;
      let expected1: string = 'z';
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[1]!;
      let expected2: string = 'a';
      expect(actual2).assertEqual(expected2);
      let actual3: string = keys[2]!;
      let expected3: string = 'm';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1510
     * @tc.name objectConstructorTest151
     * @tc.desc Verify chained Object.assign merges source keys a b into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t1: Record<string, Any> = {};
      const s1: Record<string, Any> = { 'a': 1 };
      const s2: Record<string, Any> = { 'b': 2 };
      const merged: Record<string, Any> = Object.assign(Object.assign(t1, s1), s2);
      const keys: string[] = Object.keys(merged);
      let actual1: int = keys.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[1]!;
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1520
     * @tc.name objectConstructorTest152
     * @tc.desc Verify Object.assign copies source key n to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'n': 1 };
      Object.assign(target, source);
      let actual1: boolean = Object.hasOwn(target, 'n');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1530
     * @tc.name objectConstructorTest153
     * @tc.desc Verify Record after Object.assign hasOwnProperty returns true for own key n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'n': 1 };
      Object.assign(target, source);
      let actual1: boolean = target.hasOwnProperty('n');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1540
     * @tc.name objectConstructorTest154
     * @tc.desc Verify Object.assign adds 2 source keys to existing target keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "pre": 0 };
      const before: number = Object.keys(target).length;
      const source: Record<string, Any> = { 'x': 1, 'y': 2 };
      Object.assign(target, source);
      const after: number = Object.keys(target).length;
      expect(after).assertEqual(before + 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1550
     * @tc.name objectConstructorTest155
     * @tc.desc Verify Object.assign merges source key k2 into target with existing key k1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "k1": 10 };
      const source: Record<string, Any> = { "k2": 20 };
      Object.assign(target, source);
      const keys: string[] = Object.keys(target);
      const vals: Any[] = Object.values(target);
      let actual1: string = keys[0]!;
      let expected1: string = "k1";
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${vals[0]!}`;
      let expected2: string = `${10}`;
      expect(actual2).assertEqual(expected2);
      let actual3: string = keys[1]!;
      let expected3: string = "k2";
      expect(actual3).assertEqual(expected3);
      let actual4: string = `${vals[1]!}`;
      let expected4: string = `${20}`;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1560
     * @tc.name objectConstructorTest156
     * @tc.desc Verify Object.assign copies source key k to empty target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'k': 1 };
      const keys: string[] = Object.keys(Object.assign(target, source));
      let actual1: int = keys.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = 'k';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1570
     * @tc.name objectConstructorTest157
     * @tc.desc Verify Object.assign copies source value to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'v': 9 };
      const vals: Any[] = Object.values(Object.assign(target, source));
      let actual1: string = `${vals[0]!}`;
      let expected1: string = `${9}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1580
     * @tc.name objectConstructorTest158
     * @tc.desc Verify Object.assign copies source entry e to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'e': 4 };
      const entries = Object.entries(Object.assign(target, source));
      let actual1: int = entries.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = 'e';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]}`;
      let expected3: string = `${4}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1590
     * @tc.name objectConstructorTest159
     * @tc.desc Verify Object.hasOwn returns true for own keys 0 and a of record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero", '1': "one", 'a': 'A' };
      let actual1: boolean = Object.hasOwn(record, '0');
      expect(actual1).assertTrue();
      let actual2: boolean = Object.hasOwn(record, 'a');
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1600
     * @tc.name objectConstructorTest160
     * @tc.desc Verify Object.keys of record returns index-like keys 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': 10, '1': 20 };
      const keys: string[] = Object.keys(record);
      let actual1: int = keys.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = keys[1]!;
      let expected3: string = '1';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1610
     * @tc.name objectConstructorTest161
     * @tc.desc Verify Object.keys of int array returns index keys 0 to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      const keys: string[] = Object.keys(arr);
      let actual1: int = keys.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = keys[1]!;
      let expected3: string = '1';
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1620
     * @tc.name objectConstructorTest162
     * @tc.desc Verify Object.values of int array returns 7 8 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [7, 8, 9];
      const vals: Any[] = Object.values(arr);
      let actual1: int = vals.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${vals[1]!}`;
      let expected2: string = `${8}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1630
     * @tc.name objectConstructorTest163
     * @tc.desc Verify Object.entries of int array returns index entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [4, 5];
      const entries = Object.entries(arr);
      let actual1: int = entries.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = entries[0]![0];
      let expected2: string = '0';
      expect(actual2).assertEqual(expected2);
      let actual3: string = `${entries[0]![1]}`;
      let expected3: string = `${4}`;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1640
     * @tc.name objectConstructorTest164
     * @tc.desc Verify Object.getOwnPropertyNames of int array returns indices and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [1, 2, 3];
      const names: string[] = Object.getOwnPropertyNames(arr);
      let actual1: int = names.length;
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
      let actual2: string = names[1]!;
      let expected2: string = '1';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1650
     * @tc.name objectConstructorTest165
     * @tc.desc Verify int array hasOwnProperty returns false for out-of-range indices 5 and 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputs: int[][] = [[1, 2], [10, 20]];
      const indices: int[] = [5, 999];
      for (let caseIndex: int = 0; caseIndex < inputs.length; caseIndex++) {
        const arr: int[] = inputs[caseIndex];
        const hit: boolean = arr.hasOwnProperty(indices[caseIndex]);
        expect(hit).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1660
     * @tc.name objectConstructorTest166
     * @tc.desc Verify new Object() hasOwnProperty returns true for own key "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [1, 2];
      const hit: boolean = arr.hasOwnProperty(1);
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1670
     * @tc.name objectConstructorTest167
     * @tc.desc Verify Object.values returns nested record reference as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = { "deep": 1 };
      const outer: Record<string, Any> = { "level": inner };
      const vals: Any[] = Object.values(outer);
      let actual1: Object = vals[0]! as Object;
      let expected1: Object = inner;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1680
     * @tc.name objectConstructorTest168
     * @tc.desc Verify Object.keys of nested record returns own keys level and plain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = { "deep": 1 };
      const outer: Record<string, Any> = { "level": inner, "plain": 2 };
      const keys: string[] = Object.keys(outer);
      let actual1: int = keys.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[1]!;
      let expected2: string = "plain";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1690
     * @tc.name objectConstructorTest169
     * @tc.desc Verify nested object record access returns leaf value 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const deep: Record<string, Any> = { "leaf": 9 };
      const mid: Record<string, Any> = { "node": deep };
      const root: Record<string, Any> = { "top": mid };
      const node: Record<string, Any> = root["top"] as Record<string, Any>;
      const child: Record<string, Any> = node["node"] as Record<string, Any>;
      const leaf: string = `${child['leaf']!}`;
      expect(leaf).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1700
     * @tc.name objectConstructorTest170
     * @tc.desc Verify Object.assign copies nested object reference to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = { 'd': 6 };
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "child": inner };
      Object.assign(target, source);
      const child: Record<string, Any> = target["child"] as Record<string, Any>;
      let actual1: string = `${child['d']!}`;
      let expected1: string = `${6}`;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1710
     * @tc.name objectConstructorTest171
     * @tc.desc Verify Object.assign copies source key child to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = { "deep": 3 };
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "child": inner };
      Object.assign(target, source);
      const keys: string[] = Object.keys(target);
      let actual1: int = keys.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = "child";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1720
     * @tc.name objectConstructorTest172
     * @tc.desc Verify Object.assign overwrites existing target key child with source value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const origInner: Record<string, Any> = { 'a': 1 };
      const target: Record<string, Any> = { "child": origInner };
      const inner: Record<string, Any> = { 'b': 2 };
      const source: Record<string, Any> = { "child": inner };
      Object.assign(target, source);
      const child: Record<string, Any> = target["child"] as Record<string, Any>;
      const keys: string[] = Object.keys(child);
      let actual1: int = keys.length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = 'b';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1730
     * @tc.name objectConstructorTest173
     * @tc.desc Verify new Object() toString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const k1: string[] = Object.keys(obj);
      const objValues: Any[] = Object.values(obj);
      const e1 = Object.entries(obj);
      const n1: string[] = Object.getOwnPropertyNames(obj);
      const t1: String = obj.toString();
      let actual1: int = k1.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: int = objValues.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: int = e1.length;
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: int = n1.length;
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
      expect(t1).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1740
     * @tc.name objectConstructorTest174
     * @tc.desc Verify new Object() hasOwnProperty returns false for any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const h1: boolean = Object.hasOwn(obj, 'k');
      const h2: boolean = obj.hasOwnProperty('k');
      expect(h1).assertFalse();
      expect(h2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1750
     * @tc.name objectConstructorTest175
     * @tc.desc Verify new Object() hasOwnProperty returns true for own key "id"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "id": 7 };
      const result: Record<string, Any> = Object.assign(target, source);
      let actual1: int = Object.keys(result).length;
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = Object.hasOwn(result, "id");
      expect(actual2).assertTrue();
      let actual3: boolean = result.hasOwnProperty("id");
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1760
     * @tc.name objectConstructorTest176
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      obj.toLocaleString("en-US");
      const h1: int = obj.$_hashCode();
      const h12: int = obj.$_hashCode();
      expect(h1).assertEqual(h12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1770
     * @tc.name objectConstructorTest177
     * @tc.desc Verify new Object() toString and toLocaleString add no own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      obj.toString();
      obj.toLocaleString();
      const keys: string[] = Object.keys(obj);
      let actual1: int = keys.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1780
     * @tc.name objectConstructorTest178
     * @tc.desc Verify Object.keys of Position instance returns own field names x y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: string[] = Object.keys(new Position());
      let actual1: int = keys.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
      let actual2: string = keys[0]!;
      let expected2: string = 'x';
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1790
     * @tc.name objectConstructorTest179
     * @tc.desc Verify Object.values of Vec2 instance returns 1 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vals: Any[] = Object.values(new Vec2());
      let actual1: string = `${vals[0]!}`;
      let expected1: string = `${1}`;
      expect(actual1).assertEqual(expected1);
      let actual2: string = `${vals[1]!}`;
      let expected2: string = `${1}`;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1800
     * @tc.name objectConstructorTest180
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box: Object = new Box002();
      const h1: int = box.$_hashCode();
      const h12: int = box.$_hashCode();
      expect(h1).assertEqual(h12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1810
     * @tc.name objectConstructorTest181
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const h1: int = arr.$_hashCode();
      const h12: int = arr.$_hashCode();
      expect(h1).assertEqual(h12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1820
     * @tc.name objectConstructorTest182
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Object = new User();
      const hash: int = u.$_hashCode();
      const hash2: int = u.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1830
     * @tc.name objectConstructorTest183
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const it: Item = new Item();
      const hash: int = it.$_hashCode();
      const hash2: int = it.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1840
     * @tc.name objectConstructorTest184
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Object = new Product();
      const hash: int = p.$_hashCode();
      const hash22: int = p.$_hashCode();
      expect(hash).assertEqual(hash22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1850
     * @tc.name objectConstructorTest185
     * @tc.desc Verify $_hashCode of Product instance is stable after name mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Product = new Product();
      const hash1: int = p.$_hashCode();
      p.name = "eraser";
      const hash22: int = p.$_hashCode();
      expect(hash1).assertEqual(hash22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1860
     * @tc.name objectConstructorTest186
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Object = new Flag001();
      const hash: int = f.$_hashCode();
      const hash2: int = f.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1870
     * @tc.name objectConstructorTest187
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Object = new Cart();
      const hash: int = c.$_hashCode();
      const hash2: int = c.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1880
     * @tc.name objectConstructorTest188
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: Object = new Outer001();
      const hash: int = o.$_hashCode();
      const hash2: int = o.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1890
     * @tc.name objectConstructorTest189
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Object = new EmptyData();
      const hash: int = d.$_hashCode();
      const hash2: int = d.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1900
     * @tc.name objectConstructorTest190
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const calc: Calculator = new Calculator();
      const hash: int = calc.$_hashCode();
      const hash2: int = calc.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1910
     * @tc.name objectConstructorTest191
     * @tc.desc Verify Empty001 $_hashCode returns consistent int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e: Empty001 = new Empty001();
      const hash: int = e.$_hashCode();
      const hash2: int = e.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1920
     * @tc.name objectConstructorTest192
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog: Dog = new Dog();
      const hash: int = dog.$_hashCode();
      const hash2: int = dog.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1930
     * @tc.name objectConstructorTest193
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n1: Node = new Node();
      const n2: Node = new Node();
      const h1a: int = n1.$_hashCode();
      const h1b: int = n1.$_hashCode();
      const h2a: int = n2.$_hashCode();
      const h2b: int = n2.$_hashCode();
      expect(h1a).assertEqual(h1b);
      expect(h2a).assertEqual(h2b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1940
     * @tc.name objectConstructorTest194
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: Node001 = new Node001();
      const hash: int = n.$_hashCode();
      const hash2: int = n.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1950
     * @tc.name objectConstructorTest195
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: Node002 = new Node002();
      const hash: int = n.$_hashCode();
      const hash2: int = n.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1960
     * @tc.name objectConstructorTest196
     * @tc.desc Verify $_hashCode of Node003 instance returns stable int hash across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: Node003 = new Node003();
      const hash: int = n.$_hashCode();
      const hash2: int = n.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1970
     * @tc.name objectConstructorTest197
     * @tc.desc Verify boolean array $_hashCode returns consistent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false];
      const hash: int = arr.$_hashCode();
      const hash2: int = arr.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1980
     * @tc.name objectConstructorTest198
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest198", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const matrix: number[][] = [
        [3, 4],
      ];
      const hash: int = matrix.$_hashCode();
      const hash2: int = matrix.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_1990
     * @tc.name objectConstructorTest199
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['x'];
      const obj: Object = arr;
      const hash: int = obj.$_hashCode();
      const hash2: int = obj.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_2000
     * @tc.name objectConstructorTest200
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const hash1: int = arr.$_hashCode();
      arr[0] = 100;
      const hash22: int = arr.$_hashCode();
      expect(hash1).assertEqual(hash22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_2010
     * @tc.name objectConstructorTest201
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const hash: int = obj.$_hashCode();
      const restored: number = Number(hash.toString());
      expect(restored).assertEqual(hash);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_2020
     * @tc.name objectConstructorTest202
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const hash: int = obj.$_hashCode();
      const parsed: number = parseFloat(hash.toString());
      expect(parsed).assertEqual(hash);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_2030
     * @tc.name objectConstructorTest203
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Demo = new Demo();
      const hash: int = d.$_hashCode();
      const hash2: int = d.$_hashCode();
      expect(hash).assertEqual(hash2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_2040
     * @tc.name objectConstructorTest204
     * @tc.desc Verify new Object() $_hashCode returns int hash value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Object = new Object();
      const b: Object = new Object();
      const ha: int = a.$_hashCode();
      const hb: int = b.$_hashCode();
      const ha2: int = a.$_hashCode();
      expect(ha).assertEqual(ha2);
      const hb2: int = b.$_hashCode();
      expect(hb).assertEqual(hb2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR2_2050
     * @tc.name objectConstructorTest205
     * @tc.desc Verify new Object() Object.keys returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectConstructorTest205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Object = new Object();
      const ks: string[] = Object.keys(a);
      expect(ks.length).assertEqual(0);
      expect(ks.includes("x")).assertFalse();
    });
  });
}
