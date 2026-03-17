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
} from '../../../../hypium/index';

class A {
  public fld_1: boolean;
  public fld_2: boolean;

  public constructor(p1: boolean, p2: boolean) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }

  public foo(p1: boolean, p2: boolean): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}

enum Color {
  Red,
  Green,
  Blue
}
class A1 {
  public fld_1: byte;
  public fld_2: byte;
  public fld_3: byte;
  public constructor(p1: byte, p2: byte, p3: byte) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: byte, p2: byte, p3: byte): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A2 {
  public fld_1: char;
  public fld_2: char;
  public fld_3: char;
  public constructor(p1: char, p2: char, p3: char) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: char, p2: char, p3: char): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A3 {
  public fld_1: short;
  public fld_2: short;
  public constructor(p1: short, p2: short) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: short, p2: short): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A4 {
  public fld_1: int;
  public fld_2: int;
  public fld_3: int;
  public constructor(p1: int, p2: int, p3: int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: int, p2: int, p3: int): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A5 {
  public fld_1: long;
  public fld_2: long;
  public constructor(p1: long, p2: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: long, p2: long): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A6 {
  public fld_1: float;
  public fld_2: float;
  public constructor(p1: float, p2: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: float, p2: float): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A7 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A8 {
  public fld_1: short;
  public fld_2: short;
  public fld_3: short;
  public constructor(p1: short, p2: short, p3: short) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: short, p2: short, p3: short): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A9 {
  public fld_1: int;
  public fld_2: int;
  public fld_3: int;
  public constructor(p1: int, p2: int, p3: int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: int, p2: int, p3: int): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A10 {
  public fld_1: long;
  public fld_2: long;
  public fld_3: long;
  public constructor(p1: long, p2: long, p3: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: long, p2: long, p3: long): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A11 {
  public fld_1: float;
  public fld_2: float;
  public fld_3: float;
  public constructor(p1: float, p2: float, p3: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: float, p2: float, p3: float): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A12 {
  public fld_1: double;
  public fld_2: double;
  public fld_3: double;
  public constructor(p1: double, p2: double, p3: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: double, p2: double, p3: double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A13 {
  public fld_1: int;
  public fld_2: int;
  public constructor(p1: int, p2: int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: int, p2: int): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A14 {
  public fld_1: long;
  public fld_2: long;
  public constructor(p1: long, p2: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: long, p2: long): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A15 {
  public fld_1: float;
  public fld_2: float;
  public constructor(p1: float, p2: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: float, p2: float): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A16 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A17 {
  public fld_1: long;
  public fld_2: long;
  public fld_3: long;
  public constructor(p1: long, p2: long, p3: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: long, p2: long, p3: long): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A18 {
  public fld_1: float;
  public fld_2: float;
  public fld_3: float;
  public constructor(p1: float, p2: float, p3: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: float, p2: float, p3: float): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A19 {
  public fld_1: double;
  public fld_2: double;
  public fld_3: double;
  public constructor(p1: double, p2: double, p3: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: double, p2: double, p3: double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A20 {
  public fld_1: float;
  public fld_2: float;
  public constructor(p1: float, p2: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: float, p2: float): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A21 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A22 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A23 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A24 {
  public fld_1: Object;
  public fld_2: Object;
  public fld_3: Object;
  public constructor(p1: Object, p2: Object, p3: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Object, p2: Object, p3: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
    expect(this.fld_3).not().assertNull();
  }
}
class A25 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A26 {
  public fld_1: Floating;
  public fld_2: Floating;
  public constructor(p1: Floating, p2: Floating) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Floating, p2: Floating): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A27 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A28 {
  public fld_1: Floating;
  public fld_2: Floating;
  public constructor(p1: Floating, p2: Floating) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Floating, p2: Floating): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A29 {
  public fld_1: Object;
  public fld_2: Object;
  public fld_3: Object;
  public constructor(p1: Object, p2: Object, p3: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Object, p2: Object, p3: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
    expect(this.fld_3).not().assertNull();
  }
}
class A30 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A31 {
  public fld_1: Integral;
  public fld_2: Integral;
  public constructor(p1: Integral, p2: Integral) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Integral, p2: Integral): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A32 {
  public fld_1: Object;
  public fld_2: Object;
  public fld_3: Object;
  public constructor(p1: Object, p2: Object, p3: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Object, p2: Object, p3: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
    expect(this.fld_3).not().assertNull();
  }
}
class A33 {
  public fld_1: Integral;
  public fld_2: Integral;
  public fld_3: Integral;
  public constructor(p1: Integral, p2: Integral, p3: Integral) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Integral, p2: Integral, p3: Integral): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
    expect(this.fld_3).not().assertNull();
  }
}
class A34 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A35 {
  public fld_1: Integral;
  public fld_2: Integral;
  public constructor(p1: Integral, p2: Integral) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Integral, p2: Integral): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A36 {
  public fld_1: Boolean;
  public fld_2: Boolean;
  public constructor(p1: Boolean, p2: Boolean) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Boolean, p2: Boolean): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A37 {
  public fld_1: Byte;
  public fld_2: Byte;
  public fld_3: Byte;
  public constructor(p1: Byte, p2: Byte, p3: Byte) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Byte, p2: Byte, p3: Byte): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A38 {
  public fld_1: Char;
  public fld_2: Char;
  public fld_3: Char;
  public constructor(p1: Char, p2: Char, p3: Char) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Char, p2: Char, p3: Char): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A39 {
  public fld_1: Short;
  public fld_2: Short;
  public constructor(p1: Short, p2: Short) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Short, p2: Short): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A40 {
  public fld_1: Int;
  public fld_2: Int;
  public fld_3: Int;
  public constructor(p1: Int, p2: Int, p3: Int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Int, p2: Int, p3: Int): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A41 {
  public fld_1: Long;
  public fld_2: Long;
  public constructor(p1: Long, p2: Long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Long, p2: Long): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A42 {
  public fld_1: Float;
  public fld_2: Float;
  public constructor(p1: Float, p2: Float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Float, p2: Float): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A43 {
  public fld_1: Double;
  public fld_2: Double;
  public constructor(p1: Double, p2: Double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Double, p2: Double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
interface I {}
class A44 implements I {}
class A45 {}
class B<A45> {}
class B1<T extends A45> {}
type Barfunc = (a: Object) => Object;
function bar(a: Object): Object {
  return new Object();
}

class A46 {
  public fld_1: boolean;
  public fld_2: byte;
  public fld_3: short;
  public fld_4: int;
  public fld_5: long;
  public fld_6: float;
  public fld_7: double;
  public fld_8: char;
  public fld_9: Boolean|null;
  public fld_10: Byte|null;
  public fld_11: Char|null;
  public fld_12: Error|null;
  public fld_13: Barfunc|null;
  public fld_14: Barfunc[]|null;

  public constructor(
    p1: boolean,
    p2: byte,
    p3: short,
    p4: int,
    p5: long,
    p6: float,
    p7: double,
    p8: char,
    p9: Boolean|null,
    p10: Byte|null,
    p11: Char|null,
    p12: Error|null,
    p13: Barfunc|null,
    p14: Barfunc[]|null
  ) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
    this.fld_4 = p4;
    this.fld_5 = p5;
    this.fld_6 = p6;
    this.fld_7 = p7;
    this.fld_8 = p8;
    this.fld_9 = p9;
    this.fld_10 = p10;
    this.fld_11 = p11;
    this.fld_12 = p12;
    this.fld_13 = p13;
    this.fld_14 = p14;
  }

  public foo(
    p1: boolean,
    p2: byte,
    p3: short,
    p4: int,
    p5: long,
    p6: float,
    p7: double,
    p8: char,
    p9: Boolean|null,
    p10: Byte|null,
    p11: Char|null,
    p12: Error|null,
    p13: Barfunc|null,
    p14: Barfunc[]|null
  ): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
    expect(this.fld_4).assertEqual(p4);
    expect(this.fld_5).assertEqual(p5);
    expect(this.fld_6).assertEqual(p6);
    expect(this.fld_7).assertEqual(p7);
    expect(this.fld_8).assertEqual(p8);
    expect(this.fld_9).assertEqual(p9);
    expect(this.fld_10).assertEqual(p10);
    expect(this.fld_11).assertEqual(p11);
    expect(this.fld_12).assertEqual(p12);
    expect(this.fld_13).assertEqual(p13);
    expect(this.fld_14).assertEqual(p14);
  }
}
class B2<T> {}
class C<T> extends B2<T> {}
class C1<T> extends B<B<T>> {}
interface J {}
type Func = (a: int, b: string) => Boolean|null;
class C3<T> extends B2<A45> {}
class C4<T> {}
function foo<T extends Byte>(p: T): byte {
  let src: T = p;
  let dst: byte = src;
  return dst;
}
function foo1<T extends Short>(p: T): short {
  let src: T = p;
  let dst: short = src;
  return dst;
}
function foo2<T extends Int>(p: T): int {
  let src: T = p;
  let dst: int = src;
  return dst;
}
function foo3<T extends Long>(p: T): long {
  let src: T = p;
  let dst: long = src;
  return dst;
}
class A47 {
  public fld: short;
  constructor(p: Short) {
    this.fld = p;
  }
  public foo(p: Short): void {
    this.fld = p;
  }
}
class A48 {
  public fld: int;
  constructor(p: Int) {
    this.fld = p;
  }
  public foo(p: Int): void {
    this.fld = p;
  }
}
class A49 {
  public fld: long;
  constructor(p: Long) {
    this.fld = p;
  }
  public foo(p: Long): void {
    this.fld = p;
  }
}
function foo5(p: Object): void {
  expect(p).not().assertNull();
}
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function AssignmentLikeContextsTest() {

  describe("AssignmentLikeContextsTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0100
     * @tc.name      testAssignmentLikeContexts0001
     * @tc.desc      Assignment contexts allow using aliases: from 'Boolean' to 'boolean'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Boolean = new Boolean(true);
      let dst_1: boolean = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Boolean = new Boolean(false);
      let dst_2: boolean = src_2;
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0200
     * @tc.name      testAssignmentLikeContexts0002
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Boolean' to 'boolean'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Boolean = new Boolean(true);
      let v2: Boolean = new Boolean(false);
      let c: A = new A(v1, v2);
      c.foo(v1, v2);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0300
     * @tc.name      testAssignmentLikeContexts0003
     * @tc.desc      Assignment contexts: Conversion from boolean to Boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: boolean = true;
      let dst_1: Boolean = new Boolean(src_1);
      expect(dst_1).assertEqual(src_1);

      let src_2: boolean = false;
      let dst_2: Boolean = new Boolean(src_2);
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0400
     * @tc.name      testAssignmentLikeContexts0004
     * @tc.desc      Assignment contexts allow the use of conversion followed by a widening reference conversion: from 'boolean' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: boolean = true;
      let dst_1: Object = src_1 as Object;
      expect(dst_1).not().assertUndefined();

      let src_2: boolean = false;
      let dst_2: Object = src_2 as Object;
      expect(dst_2).not().assertUndefined();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0500
     * @tc.name      testAssignmentLikeContexts0005
     * @tc.desc      A widening reference conversion exists from any reference type S to any reference type T (S is subtype of T)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Object[] = [];
      let dst: Object = src as Object;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0600
     * @tc.name      testAssignmentLikeContexts0006
     * @tc.desc      Widening reference conversion: Object[][] to Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Object[][] = [[], []];
      let dst: Object = src as Object;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0700
     * @tc.name      testAssignmentLikeContexts0007
     * @tc.desc      Assignment contexts allow conversion followed by a widening reference conversion (from 'boolean' to 'Object')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: boolean = true;
      let dst_1: Object = src_1 as Object;
      expect(dst_1).not().assertNull();

      let src_2: boolean = false;
      let dst_2: Object = src_2 as Object;
      expect(dst_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0800
     * @tc.name      testAssignmentLikeContexts0008
     * @tc.desc      Assignment contexts allow the use of conversion followed by a widening reference conversion: from 'string' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: string = '\u0000';
      let dst_1: Object = src_1 as Object;
      expect(dst_1).not().assertNull();

      let src_2: string = 'X';
      let dst_2: Object = src_2 as Object;
      expect(dst_2).not().assertNull();

      let src_3: string = '\uffff';
      let dst_3: Object = src_3 as Object;
      expect(dst_3).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0900
     * @tc.name      testAssignmentLikeContexts0009
     * @tc.desc      A conversion from a type to that same type is permitted for any type: enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Color = Color.Red;
      let dst: Color = src;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1000
     * @tc.name      testAssignmentLikeContexts0010
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Byte = new Byte(-128 as byte);
      let dst_1: Short = new Short(src_1.toShort());
      expect(dst_1).assertEqual(src_1.toShort());

      let src_2: Byte = new Byte(0 as byte);
      let dst_2: Short = new Short(src_2.toShort());
      expect(dst_2).assertEqual(src_2.toShort());

      let src_3: Byte = new Byte(127 as byte);
      let dst_3: Short = new Short(src_3.toShort());
      expect(dst_3).assertEqual(src_3.toShort());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1100
     * @tc.name      testAssignmentLikeContexts0011
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Byte = new Byte(-128 as byte);
      let dst_1: Int = new Int(src_1.toInt());
      expect(dst_1).assertEqual(src_1.toInt());

      let src_2: Byte = new Byte(0 as byte);
      let dst_2: Int = new Int(src_2.toInt());
      expect(dst_2).assertEqual(src_2.toInt());

      let src_3: Byte = new Byte(127 as byte);
      let dst_3: Int = new Int(src_3.toInt());
      expect(dst_3).assertEqual(src_3.toInt());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1200
     * @tc.name      testAssignmentLikeContexts0012
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Byte = new Byte(-128 as byte);
      let dst_1: Long = new Long(src_1.toLong());
      expect(dst_1).assertEqual(src_1.toLong());

      let src_2: Byte = new Byte(0 as byte);
      let dst_2: Long = new Long(src_2.toLong());
      expect(dst_2).assertEqual(src_2.toLong());

      let src_3: Byte = new Byte(127 as byte);
      let dst_3: Long = new Long(src_3.toLong());
      expect(dst_3).assertEqual(src_3.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1300
     * @tc.name      testAssignmentLikeContexts0013
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Byte = new Byte(-128 as byte);
      let dst_1: Float = new Float(src_1.toFloat());
      expect(dst_1).assertEqual(src_1.toFloat());

      let src_2: Byte = new Byte(0 as byte);
      let dst_2: Float = new Float(src_2.toFloat());
      expect(dst_2).assertEqual(src_2.toFloat());

      let src_3: Byte = new Byte(127 as byte);
      let dst_3: Float = new Float(src_3.toFloat());
      expect(dst_3).assertEqual(src_3.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1400
     * @tc.name      testAssignmentLikeContexts0014
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Byte = new Byte(-128 as byte);
      let dst_1: Double = new Double(src_1.toDouble());
      expect(dst_1).assertEqual(src_1.toDouble());

      let src_2: Byte = new Byte(0 as byte);
      let dst_2: Double = new Double(src_2.toDouble());
      expect(dst_2).assertEqual(src_2.toDouble());

      let src_3: Byte = new Byte(127 as byte);
      let dst_3: Double = new Double(src_3.toDouble());
      expect(dst_3).assertEqual(src_3.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1500
     * @tc.name      testAssignmentLikeContexts0015
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Short = new Short((-32768).toShort());
      let dst_1: Int = new Int(src_1.toInt());
      expect(dst_1).assertEqual(src_1.toInt());

      let src_2: Short = new Short((-128).toShort());
      let dst_2: Int = new Int(src_2.toInt());
      expect(dst_2).assertEqual(src_2.toInt());

      let src_3: Short = new Short((0).toShort());
      let dst_3: Int = new Int(src_3.toInt());
      expect(dst_3).assertEqual(src_3.toInt());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1600
     * @tc.name      testAssignmentLikeContexts0016
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Short = new Short((-32768).toShort());
      let dst_1: Long = new Long(src_1.toLong());
      expect(dst_1).assertEqual(src_1.toLong());

      let src_2: Short = new Short((-128).toShort());
      let dst_2: Long = new Long(src_2.toLong());
      expect(dst_2).assertEqual(src_2.toLong());

      let src_3: Short = new Short((0).toShort());
      let dst_3: Long = new Long(src_3.toLong());
      expect(dst_3).assertEqual(src_3.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1700
     * @tc.name      testAssignmentLikeContexts0017
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Short = new Short((-32768).toShort());
      let dst_1: Float = new Float(src_1.toFloat());
      expect(dst_1).assertEqual(src_1.toFloat());

      let src_2: Short = new Short((-128).toShort());
      let dst_2: Float = new Float(src_2.toFloat());
      expect(dst_2).assertEqual(src_2.toFloat());

      let src_3: Short = new Short((0).toShort());
      let dst_3: Float = new Float(src_3.toFloat());
      expect(dst_3).assertEqual(src_3.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1800
     * @tc.name      testAssignmentLikeContexts0018
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Short = new Short((-32768).toShort());
      let dst_1: Double = new Double(src_1.toDouble());
      expect(dst_1).assertEqual(src_1.toDouble());

      let src_2: Short = new Short((-128).toShort());
      let dst_2: Double = new Double(src_2.toDouble());
      expect(dst_2).assertEqual(src_2.toDouble());

      let src_3: Short = new Short((0).toShort());
      let dst_3: Double = new Double(src_3.toDouble());
      expect(dst_3).assertEqual(src_3.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1900
     * @tc.name      testAssignmentLikeContexts0019
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Int' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Int = new Int(127);
      let dst_1: Long = new Long(src_1.toLong());
      expect(dst_1).assertEqual(src_1.toLong());

      let src_2: Int = new Int(32767);
      let dst_2: Long = new Long(src_2.toLong());
      expect(dst_2).assertEqual(src_2.toLong());

      let src_3: Int = new Int(2147483647);
      let dst_3: Long = new Long(src_3.toLong());
      expect(dst_3).assertEqual(src_3.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2000
     * @tc.name      testAssignmentLikeContexts0020
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Int' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Int = new Int(127);
      let dst_1: Float = new Float(src_1.toFloat());
      expect(dst_1).assertEqual(src_1.toFloat());

      let src_2: Int = new Int(32767);
      let dst_2: Float = new Float(src_2.toFloat());
      expect(dst_2).assertEqual(src_2.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2100
     * @tc.name      testAssignmentLikeContexts0021
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Int' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Int = new Int(127);
      let dst_1: Double = new Double(src_1.toDouble());
      expect(dst_1).assertEqual(src_1.toDouble());

      let src_2: Int = new Int(32768);
      let dst_2: Double = new Double(src_2.toDouble());
      expect(dst_2).assertEqual(src_2.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2200
     * @tc.name      testAssignmentLikeContexts0022
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Long' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Long = new Long((-1).toLong());
      let dst_1: Float = new Float(src_1.toFloat());
      expect(dst_1).assertEqual(src_1.toFloat());

      let src_2: Long = new Long((0).toLong());
      let dst_2: Float = new Float(src_2.toFloat());
      expect(dst_2).assertEqual(src_2.toFloat());

      let src_3: Long = new Long((1).toLong());
      let dst_3: Float = new Float(src_3.toFloat());
      expect(dst_3).assertEqual(src_3.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2300
     * @tc.name      testAssignmentLikeContexts0023
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Long' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Long = new Long((-128).toLong());
      let dst_1: Double = new Double(src_1.toDouble());
      expect(dst_1).assertEqual(src_1.toDouble());

      let src_2: Long = new Long((127).toLong());
      let dst_2: Double = new Double(src_2.toDouble());
      expect(dst_2).assertEqual(src_2.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2400
     * @tc.name      testAssignmentLikeContexts0024
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Float' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Float = new Float(1.4e-10f);
      let dst_1: Double = new Double(src_1.toDouble());
      expect(dst_1).assertEqual(src_1.toDouble());

      let src_2: Float = new Float(0.0000001f);
      let dst_2: Double = new Double(src_2.toDouble());
      expect(dst_2).assertEqual(src_2.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2500
     * @tc.name      testAssignmentLikeContexts0025
     * @tc.desc      Assignment contexts allow using aliases: from 'Byte' to 'byte'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Byte = new Byte(-128 as byte);
      let dst_1: byte = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Byte = new Byte(0 as byte);
      let dst_2: byte = src_2;
      expect(dst_2).assertEqual(src_2);

      let src_3: Byte = new Byte(127 as byte);
      let dst_3: byte = src_3;
      expect(dst_3).assertEqual(src_3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2600
     * @tc.name      testAssignmentLikeContexts0026
     * @tc.desc      Assignment contexts allow using aliases: from 'Char' to 'char'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Char = new Char(c'\u0000');
      let dst_1: char = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Char = new Char(c'X');
      let dst_2: char = src_2;
      expect(dst_2).assertEqual(src_2);

      let src_3: Char = new Char(c'\uffff');
      let dst_3: char = src_3;
      expect(dst_3).assertEqual(src_3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2700
     * @tc.name      testAssignmentLikeContexts0027
     * @tc.desc      Assignment contexts allow using aliases: from 'Short' to 'short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Short = new Short((-32768).toShort());
      let dst_1: short = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Short = new Short((-128).toShort());
      let dst_2: short = src_2;
      expect(dst_2).assertEqual(src_2);

      let src_3: Short = new Short((0).toShort());
      let dst_3: short = src_3;
      expect(dst_3).assertEqual(src_3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2800
     * @tc.name      testAssignmentLikeContexts0028
     * @tc.desc      Assignment contexts allow using aliases: from 'Int' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Int = new Int(127);
      let dst_1: int = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Int = new Int(32767);
      let dst_2: int = src_2;
      expect(dst_2).assertEqual(src_2);

      let src_3: Int = new Int(2147483647);
      let dst_3: int = src_3;
      expect(dst_3).assertEqual(src_3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2900
     * @tc.name      testAssignmentLikeContexts0029
     * @tc.desc      Assignment contexts allow using aliases: from 'Long' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Long = new Long((-9223372036854775808).toLong());
      let dst_1: long = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Long = new Long((9223372036854775807).toLong());
      let dst_2: long = src_2;
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3000
     * @tc.name      testAssignmentLikeContexts0030
     * @tc.desc      Assignment contexts allow using aliases: from 'Float' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Float = new Float(1.401298464324817e-45f);
      let dst_1: float = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Float = new Float(0.00000001f);
      let dst_2: float = src_2;
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3100
     * @tc.name      testAssignmentLikeContexts0031
     * @tc.desc      Assignment contexts allow using aliases: from 'Double' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Double = new Double(-1.401298464324817e-45);
      let dst_1: double = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Double = new Double(1.000000000000001);
      let dst_2: double = src_2;
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3200
     * @tc.name      testAssignmentLikeContexts0032
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Byte' to 'byte'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Byte = new Byte(-128 as byte);
      let v2: Byte = new Byte(0 as byte);
      let v3: Byte = new Byte(127 as byte);
      let c: A1 = new A1(v1, v2, v3);
      c.foo(v1, v2, v3);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
      expect(c.fld_3).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3300
     * @tc.name      testAssignmentLikeContexts0033
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Char' to 'char'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Char = new Char(c'\u0000');
      let v2: Char = new Char(c'X');
      let v3: Char = new Char(c'\uffff');
      let c: A2 = new A2(v1, v2, v3);
      c.foo(v1, v2, v3);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
      expect(c.fld_3).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3400
     * @tc.name      testAssignmentLikeContexts0034
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Short' to 'short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Short = new Short(Short.MIN_VALUE);
      let v2: Short = new Short((255).toShort());
      let c: A3 = new A3(v1, v2);
      c.foo(v1, v2);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3500
     * @tc.name      testAssignmentLikeContexts0035
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Int' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Int = new Int(127);
      let v2: Int = new Int(32767);
      let v3: Int = new Int(Int.MAX_VALUE);
      let c: A4 = new A4(v1, v2, v3);
      c.foo(v1, v2, v3);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
      expect(c.fld_3).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3600
     * @tc.name      testAssignmentLikeContexts0036
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Long' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(Long.MIN_VALUE);
      let v2: Long = new Long((9223372036854775807).toLong());
      let c: A5 = new A5(v1, v2);
      c.foo(v1, v2);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3700
     * @tc.name      testAssignmentLikeContexts0037
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Float' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Float = new Float(1.401298464324817e-45f);
      let v2: Float = new Float(Float.MAX_VALUE);
      let c: A6 = new A6(v1, v2);
      c.foo(v1, v2);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3800
     * @tc.name      testAssignmentLikeContexts0038
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Double' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Double = new Double(-1.401298464324817e-45);
      let v2: Double = new Double(Double.MAX_VALUE);
      let c: A7 = new A7(v1, v2);
      c.foo(v1, v2);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3900
     * @tc.name      testAssignmentLikeContexts0039
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Byte = new Byte(-128 as byte);
      let v2: Byte = new Byte(0 as byte);
      let v3: Byte = new Byte(127 as byte);
      let c: A8 = new A8(v1.toShort(), v2.toShort(), v3.toShort());
      c.foo(v1.toShort(), v2.toShort(), v3.toShort());
      expect(c.fld_1).assertEqual(v1.toShort());
      expect(c.fld_2).assertEqual(v2.toShort());
      expect(c.fld_3).assertEqual(v3.toShort());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4000
     * @tc.name      testAssignmentLikeContexts0040
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Byte = new Byte(-128 as byte);
      let v2: Byte = new Byte(0 as byte);
      let v3: Byte = new Byte(127 as byte);
      let c: A9 = new A9(v1.toInt(), v2.toInt(), v3.toInt());
      c.foo(v1.toInt(), v2.toInt(), v3.toInt());
      expect(c.fld_1).assertEqual(v1.toInt());
      expect(c.fld_2).assertEqual(v2.toInt());
      expect(c.fld_3).assertEqual(v3.toInt());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4100
     * @tc.name      testAssignmentLikeContexts0041
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Byte = new Byte(-128 as byte);
      let v2: Byte = new Byte(0 as byte);
      let v3: Byte = new Byte(127 as byte);
      let c: A10 = new A10(v1.toLong(), v2.toLong(), v3.toLong());
      c.foo(v1.toLong(), v2.toLong(), v3.toLong());
      expect(c.fld_1).assertEqual(v1.toLong());
      expect(c.fld_2).assertEqual(v2.toLong());
      expect(c.fld_3).assertEqual(v3.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4200
     * @tc.name      testAssignmentLikeContexts0042
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Byte = new Byte(-128 as byte);
      let v2: Byte = new Byte(0 as byte);
      let v3: Byte = new Byte(127 as byte);
      let c: A11 = new A11(v1.toFloat(), v2.toFloat(), v3.toFloat());
      c.foo(v1.toFloat(), v2.toFloat(), v3.toFloat());
      expect(c.fld_1).assertEqual(v1.toFloat());
      expect(c.fld_2).assertEqual(v2.toFloat());
      expect(c.fld_3).assertEqual(v3.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4300
     * @tc.name      testAssignmentLikeContexts0043
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Byte = new Byte(-128 as byte);
      let v2: Byte = new Byte(0 as byte);
      let v3: Byte = new Byte(127 as byte);
      let c: A12 = new A12(v1.toDouble(), v2.toDouble(), v3.toDouble());
      c.foo(v1.toDouble(), v2.toDouble(), v3.toDouble());
      expect(c.fld_1).assertEqual(v1.toDouble());
      expect(c.fld_2).assertEqual(v2.toDouble());
      expect(c.fld_3).assertEqual(v3.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4400
     * @tc.name      testAssignmentLikeContexts0044
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Short = new Short(Short.MIN_VALUE);
      let v2: Short = new Short((255).toShort());
      let c: A13 = new A13(v1.toInt(), v2.toInt());
      c.foo(v1.toInt(), v2.toInt());
      expect(c.fld_1).assertEqual(v1.toInt());
      expect(c.fld_2).assertEqual(v2.toInt());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4500
     * @tc.name      testAssignmentLikeContexts0045
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Short = new Short(Short.MIN_VALUE);
      let v2: Short = new Short((255).toShort());
      let c: A14 = new A14(v1.toLong(), v2.toLong());
      c.foo(v1.toLong(), v2.toLong());
      expect(c.fld_1).assertEqual(v1.toLong());
      expect(c.fld_2).assertEqual(v2.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4600
     * @tc.name      testAssignmentLikeContexts0046
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Short = new Short(Short.MIN_VALUE);
      let v2: Short = new Short((255).toShort());
      let c: A15 = new A15(v1.toFloat(), v2.toFloat());
      c.foo(v1.toFloat(), v2.toFloat());
      expect(c.fld_1).assertEqual(v1.toFloat());
      expect(c.fld_2).assertEqual(v2.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4700
     * @tc.name      testAssignmentLikeContexts0047
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Short = new Short(Short.MIN_VALUE);
      let v2: Short = new Short((255).toShort());
      let c: A16 = new A16(v1.toDouble(), v2.toDouble());
      c.foo(v1.toDouble(), v2.toDouble());
      expect(c.fld_1).assertEqual(v1.toDouble());
      expect(c.fld_2).assertEqual(v2.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4800
     * @tc.name      testAssignmentLikeContexts0048
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Int' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Int = new Int(127);
      let v2: Int = new Int(32767);
      let v3: Int = new Int(Int.MAX_VALUE);
      let c: A17 = new A17(v1.toLong(), v2.toLong(), v3.toLong());
      c.foo(v1.toLong(), v2.toLong(), v3.toLong());
      expect(c.fld_1).assertEqual(v1.toLong());
      expect(c.fld_2).assertEqual(v2.toLong());
      expect(c.fld_3).assertEqual(v3.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4900
     * @tc.name      testAssignmentLikeContexts0049
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Int' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Int = new Int(127);
      let v2: Int = new Int(32767);
      let v3: Int = new Int(Int.MAX_VALUE);
      let c: A18 = new A18(v1.toFloat(), v2.toFloat(), v3.toFloat());
      c.foo(v1.toFloat(), v2.toFloat(), v3.toFloat());
      expect(c.fld_1).assertEqual(v1.toFloat());
      expect(c.fld_2).assertEqual(v2.toFloat());
      expect(c.fld_3).assertEqual(v3.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5000
     * @tc.name      testAssignmentLikeContexts0050
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Int' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Int = new Int(127);
      let v2: Int = new Int(32767);
      let v3: Int = new Int(Int.MAX_VALUE);
      let c: A19 = new A19(v1.toDouble(), v2.toDouble(), v3.toDouble());
      c.foo(v1.toDouble(), v2.toDouble(), v3.toDouble());
      expect(c.fld_1).assertEqual(v1.toDouble());
      expect(c.fld_2).assertEqual(v2.toDouble());
      expect(c.fld_3).assertEqual(v3.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5100
     * @tc.name      testAssignmentLikeContexts0051
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Long' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(Long.MIN_VALUE);
      let v2: Long = new Long((9223372036854775807).toLong());
      let c: A20 = new A20(v1.toFloat(), v2.toFloat());
      c.foo(v1.toFloat(), v2.toFloat());
      expect(c.fld_1).assertEqual(v1.toFloat());
      expect(c.fld_2).assertEqual(v2.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5200
     * @tc.name      testAssignmentLikeContexts0052
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Long' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(Long.MIN_VALUE);
      let v2: Long = new Long((9223372036854775807).toLong());
      let c: A21 = new A21(v1.toDouble(), v2.toDouble());
      c.foo(v1.toDouble(), v2.toDouble());
      expect(c.fld_1).assertEqual(v1.toDouble());
      expect(c.fld_2).assertEqual(v2.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5300
     * @tc.name      testAssignmentLikeContexts0053
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Float' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Float = new Float(1.401298464324817e-45f);
      let v2: Float = new Float(Float.MAX_VALUE);
      let c: A22 = new A22(v1.toDouble(), v2.toDouble());
      c.foo(v1.toDouble(), v2.toDouble());
      expect(c.fld_1).assertEqual(v1.toDouble());
      expect(c.fld_2).assertEqual(v2.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5400
     * @tc.name      testAssignmentLikeContexts0054
     * @tc.desc      Assignment contexts followed by a widening primitive conversion (negative): from 'Char' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Char = new Char(c'\u0000');
      let dst_1: Int = new Int(src_1.toInt());
      expect(dst_1).assertEqual(src_1.toInt());

      let src_2: Char = new Char(c'X');
      let dst_2: Int = new Int(src_2.toInt());
      expect(dst_2).assertEqual(src_2.toInt());

      let src_3: Char = new Char(c'\uffff');
      let dst_3: Int = new Int(src_3.toInt());
      expect(dst_3).assertEqual(src_3.toInt());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5500
     * @tc.name      testAssignmentLikeContexts0055
     * @tc.desc      Assignment contexts followed by a widening primitive conversion (negative): from 'Char' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Char = new Char(c'\u0000');
      let dst_1: Long = new Long(src_1.toLong());
      expect(dst_1).assertEqual(src_1.toLong());

      let src_2: Char = new Char(c'X');
      let dst_2: Long = new Long(src_2.toLong());
      expect(dst_2).assertEqual(src_2.toLong());

      let src_3: Char = new Char(c'\uffff');
      let dst_3: Long = new Long(src_3.toLong());
      expect(dst_3).assertEqual(src_3.toLong());
    });

  })
}