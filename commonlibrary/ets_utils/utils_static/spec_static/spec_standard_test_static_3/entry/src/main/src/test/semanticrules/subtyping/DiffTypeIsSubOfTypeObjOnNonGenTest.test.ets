/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class Neg<T extends number> {
  constructor(x: T) {}
}

class Pos<T extends number> {
  constructor(x: T) {}
}

namespace testNS1_1 {
  class Animal_1 {}
  class Cat_1 extends Animal_1 { v: string = "cat" }
  class Dog_1 extends Animal_1 { v: bigint = 123n }
  class Frog_1 extends Animal_1 { v: number = 5 }

  function check_cat_1(a: Object) {
    expect(a instanceof Cat_1).assertTrue();
    expect((a as Cat_1).v).assertEqual("cat");
  }
  function check_dog_1(a: Object) {
    expect(a instanceof Dog_1).assertTrue();
    expect((a as Dog_1).v).assertEqual(123n);
  }
  function check_frog_1(a: Object) {
    expect(a instanceof Frog_1).assertTrue();
    expect((a as Frog_1).v).assertEqual(5);
  }

  function foo_1(v: Object): void {
    expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1).assertTrue();
  }

  function f1_1(v: Cat_1 | Dog_1 | Frog_1): number {
    expect(v instanceof Object).assertTrue();
    foo_1(v);
    return f2_1(v);
  }

  function f2_1(v: Cat_1 | Dog_1 | Frog_1): number {
    if (v instanceof Dog_1) {
      check_dog_1(v);
      return 1;
    } else {
      expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_1(v);
      check_cat_1(v);
      return 2;
    }
  }

  export function runTest_1(): boolean {
    let res: number = f1_1(new Dog_1());
    expect(res).assertEqual(1);
    res = f1_1(new Cat_1());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_1 {
  class Animal_1 {}
  class Cat_1 extends Animal_1 { v: string = "cat" }
  class Dog_1 extends Animal_1 { v: bigint = 123n }
  class Frog_1 extends Animal_1 { v: number = 5 }

  function check_cat_1(a: Object) {
    expect(a instanceof Cat_1).assertTrue();
    expect((a as Cat_1).v).assertEqual("cat");
  }
  function check_dog_1(a: Object) {
    expect(a instanceof Dog_1).assertTrue();
    expect((a as Dog_1).v).assertEqual(123n);
  }
  function check_frog_1(a: Object) {
    expect(a instanceof Frog_1).assertTrue();
    expect((a as Frog_1).v).assertEqual(5);
  }

  function foo_1(v: Object): void {
    expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1).assertTrue();
  }

  function f1_1(v: Cat_1 | Dog_1 | Frog_1): number {
    expect(v instanceof Object).assertTrue();
    foo_1(v);
    return f2_1(v);
  }

  function f2_1(v: Cat_1 | Dog_1 | Frog_1): number {
    if (v instanceof Dog_1) {
      check_dog_1(v);
      return 1;
    } else {
      expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_1(v);
      check_frog_1(v);
      return 2;
    }
  }

  export function runTest_1(): boolean {
    let res: number = f1_1(new Dog_1());
    expect(res).assertEqual(1);
    res = f1_1(new Frog_1());
    expect(res).assertEqual(2);
    return true;
  }
}

class Animal_1 {}
class Cat_1 extends Animal_1 { v: string = "cat" }
class Dog_1 extends Animal_1 { v: bigint = 123n }
class Frog_1 extends Animal_1 { v: number = 5 }

function check_cat_1(a: Object) {
  expect(a instanceof Cat_1).assertTrue();
  expect((a as Cat_1).v).assertEqual("cat");
}
function check_dog_1(a: Object) {
  expect(a instanceof Dog_1).assertTrue();
  expect((a as Dog_1).v).assertEqual(123n);
}
function check_frog_1(a: Object) {
  expect(a instanceof Frog_1).assertTrue();
  expect((a as Frog_1).v).assertEqual(5);
}

function foo_1(v: Object): void {
  expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1).assertTrue();
}

function f1_1(v: Cat_1 | Dog_1 | Frog_1): number {
  expect(v instanceof Object).assertTrue();
  foo_1(v);
  return f2_1(v);
}

function f2_1(v: Cat_1 | Dog_1 | Frog_1): number {
  if (v instanceof Dog_1) {
    check_dog_1(v);
    return 1;
  } else {
    expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1).assertTrue();
    expect(v instanceof Object).assertTrue();
    foo_1(v);
    check_cat_1(v);
    return 2;
  }
}

namespace testNS1_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 { v: bigint = 123n }
  class C1_2 extends B1_2 { v: number = 321 }
  class C2_2 extends B1_2 { v: number = 6.7 }
  class Other_2 { v: string = "other" }

  function check_C1_2(a: Object) {
    expect(a instanceof C1_2).assertTrue();
    expect((a as C1_2).v).assertEqual(321);
  }
  function check_C2_2(a: Object) {
    expect(a instanceof C2_2).assertTrue();
    expect((a as C2_2).v).assertEqual(6.7);
  }
  function check_B2_2(a: Object) {
    expect(a instanceof B2_2).assertTrue();
    expect((a as B2_2).v).assertEqual(123n);
  }
  function check_Other_2(a: Object) {
    expect(a instanceof Other_2).assertTrue();
    expect((a as Other_2).v).assertEqual("other");
  }

  function foo_2(v: Object): void {
    expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue();
  }

  function f1_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
    expect(v instanceof Object).assertTrue();
    foo_2(v);
    return f2_2(v);
  }

  function f2_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
    if (v instanceof B1_2 || v instanceof Other_2) {
      check_C1_2(v);
      return 1;
    } else {
      expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_2(v);
      check_B2_2(v);
      return 2;
    }
  }

  export function runTest_2(): boolean {
    let res: number = f1_2(new C1_2());
    expect(res).assertEqual(1);
    res = f1_2(new B2_2());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 { v: bigint = 123n }
  class C1_2 extends B1_2 { v: number = 321 }
  class C2_2 extends B1_2 { v: number = 6.7 }
  class Other_2 { v: string = "other" }

  function check_C1_2(a: Object) {
    expect(a instanceof C1_2).assertTrue();
    expect((a as C1_2).v).assertEqual(321);
  }
  function check_C2_2(a: Object) {
    expect(a instanceof C2_2).assertTrue();
    expect((a as C2_2).v).assertEqual(6.7);
  }
  function check_B2_2(a: Object) {
    expect(a instanceof B2_2).assertTrue();
    expect((a as B2_2).v).assertEqual(123n);
  }
  function check_Other_2(a: Object) {
    expect(a instanceof Other_2).assertTrue();
    expect((a as Other_2).v).assertEqual("other");
  }

  function foo_2(v: Object): void {
    expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue();
  }

  function f1_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
    expect(v instanceof Object).assertTrue();
    foo_2(v);
    return f2_2(v);
  }

  function f2_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
    if (v instanceof B1_2 || v instanceof Other_2) {
      check_C2_2(v);
      return 1;
    } else {
      expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_2(v);
      check_B2_2(v);
      return 2;
    }
  }

  export function runTest_2(): boolean {
    let res: number = f1_2(new C2_2());
    expect(res).assertEqual(1);
    res = f1_2(new B2_2());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 { v: bigint = 123n }
  class C1_2 extends B1_2 { v: number = 321 }
  class C2_2 extends B1_2 { v: number = 6.7 }
  class Other_2 { v: string = "other" }

  function check_C1_2(a: Object) {
    expect(a instanceof C1_2).assertTrue();
    expect((a as C1_2).v).assertEqual(321);
  }
  function check_C2_2(a: Object) {
    expect(a instanceof C2_2).assertTrue();
    expect((a as C2_2).v).assertEqual(6.7);
  }
  function check_B2_2(a: Object) {
    expect(a instanceof B2_2).assertTrue();
    expect((a as B2_2).v).assertEqual(123n);
  }
  function check_Other_2(a: Object) {
    expect(a instanceof Other_2).assertTrue();
    expect((a as Other_2).v).assertEqual("other");
  }

  function foo_2(v: Object): void {
    expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue();
  }

  function f1_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
    expect(v instanceof Object).assertTrue();
    foo_2(v);
    return f2_2(v);
  }

  function f2_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
    if (v instanceof B1_2 || v instanceof Other_2) {
      check_Other_2(v);
      return 1;
    } else {
      expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_2(v);
      check_B2_2(v);
      return 2;
    }
  }

  export function runTest_2(): boolean {
    let res: number = f1_2(new Other_2());
    expect(res).assertEqual(1);
    res = f1_2(new B2_2());
    expect(res).assertEqual(2);
    return true;
  }
}

abstract class A_2 {}
abstract class B1_2 extends A_2 {}
class B2_2 extends A_2 { v: bigint = 123n }
class C1_2 extends B1_2 { v: number = 321 }
class C2_2 extends B1_2 { v: number = 6.7 }
class Other_2 { v: string = "other" }

function check_C1_2(a: Object) {
  expect(a instanceof C1_2).assertTrue();
  expect((a as C1_2).v).assertEqual(321);
}
function check_C2_2(a: Object) {
  expect(a instanceof C2_2).assertTrue();
  expect((a as C2_2).v).assertEqual(6.7);
}
function check_B2_2(a: Object) {
  expect(a instanceof B2_2).assertTrue();
  expect((a as B2_2).v).assertEqual(123n);
}
function check_Other_2(a: Object) {
  expect(a instanceof Other_2).assertTrue();
  expect((a as Other_2).v).assertEqual("other");
}

function foo_2(v: Object): void {
  expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue();
}

function f1_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
  expect(v instanceof Object).assertTrue();
  foo_2(v);
  return f2_2(v);
}

function f2_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
  if (v instanceof B1_2 || v instanceof Other_2) {
    check_C1_2(v);
    return 1;
  } else {
    expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue();
    expect(v instanceof Object).assertTrue();
    foo_2(v);
    check_B2_2(v);
    return 2;
  }
}

namespace testNS1_3 {
  interface I1_3 {}
  interface I2_3 {}
  interface II1_3 extends I1_3, I2_3 {}
  interface II2_3 extends I1_3, I2_3 {}
  interface III1_3 extends II1_3 {}
  interface III2_3 extends II1_3 {}
  class C1_3 implements III1_3 { v: bigint = 123n }
  class C2_3 implements III2_3 { v: number = 321 }
  class C3_3 implements II2_3 { v: number = 7.8 }

  function check_C1_3(a: Object) {
    expect(a instanceof C1_3).assertTrue();
    expect(a instanceof III1_3).assertTrue();
    expect(a instanceof II1_3).assertTrue();
    expect(a instanceof I1_3).assertTrue();
    expect(a instanceof I2_3).assertTrue();
    expect((a as C1_3).v).assertEqual(123n);
  }

  function check_C2_3(a: Object) {
    expect(a instanceof C2_3).assertTrue();
    expect(a instanceof III2_3).assertTrue();
    expect(a instanceof II1_3).assertTrue();
    expect(a instanceof I1_3).assertTrue();
    expect(a instanceof I2_3).assertTrue();
    expect((a as C2_3).v).assertEqual(321);
  }

  function check_C3_3(a: Object) {
    expect(a instanceof C3_3).assertTrue();
    expect(a instanceof II2_3).assertTrue();
    expect(a instanceof I1_3).assertTrue();
    expect(a instanceof I2_3).assertTrue();
    expect((a as C3_3).v).assertEqual(7.8);
  }

  function foo_3(v: Object): void {
    expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertTrue();
  }

  function f1_3(v: III1_3 | III2_3 | II2_3): number {
    expect(v instanceof Object).assertTrue();
    foo_3(v);
    return f2_3(v);
  }

  function f2_3(v: III1_3 | III2_3 | II2_3): number {
    if (v instanceof II1_3) {
      check_C1_3(v);
      return 1;
    } else {
      expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_3(v);
      check_C3_3(v);
      return 2;
    }
  }

  export function runTest_3(): boolean {
    let res: number = f1_3(new C1_3());
    expect(res).assertEqual(1);
    res = f1_3(new C3_3());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_3 {
  interface I1_3 {}
  interface I2_3 {}
  interface II1_3 extends I1_3, I2_3 {}
  interface II2_3 extends I1_3, I2_3 {}
  interface III1_3 extends II1_3 {}
  interface III2_3 extends II1_3 {}
  class C1_3 implements III1_3 { v: bigint = 123n }
  class C2_3 implements III2_3 { v: number = 321 }
  class C3_3 implements II2_3 { v: number = 7.8 }

  function check_C1_3(a: Object) {
    expect(a instanceof C1_3).assertTrue();
    expect(a instanceof III1_3).assertTrue();
    expect(a instanceof II1_3).assertTrue();
    expect(a instanceof I1_3).assertTrue();
    expect(a instanceof I2_3).assertTrue();
    expect((a as C1_3).v).assertEqual(123n);
  }

  function check_C2_3(a: Object) {
    expect(a instanceof C2_3).assertTrue();
    expect(a instanceof III2_3).assertTrue();
    expect(a instanceof II1_3).assertTrue();
    expect(a instanceof I1_3).assertTrue();
    expect(a instanceof I2_3).assertTrue();
    expect((a as C2_3).v).assertEqual(321);
  }

  function check_C3_3(a: Object) {
    expect(a instanceof C3_3).assertTrue();
    expect(a instanceof II2_3).assertTrue();
    expect(a instanceof I1_3).assertTrue();
    expect(a instanceof I2_3).assertTrue();
    expect((a as C3_3).v).assertEqual(7.8);
  }

  function foo_3(v: Object): void {
    expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertTrue();
  }

  function f1_3(v: III1_3 | III2_3 | II2_3): number {
    expect(v instanceof Object).assertTrue();
    foo_3(v);
    return f2_3(v);
  }

  function f2_3(v: III1_3 | III2_3 | II2_3): number {
    if (v instanceof II1_3) {
      check_C2_3(v);
      return 1;
    } else {
      expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_3(v);
      check_C3_3(v);
      return 2;
    }
  }

  export function runTest_3(): boolean {
    let res: number = f1_3(new C2_3());
    expect(res).assertEqual(1);
    res = f1_3(new C3_3());
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_3 {}
interface I2_3 {}
interface II1_3 extends I1_3, I2_3 {}
interface II2_3 extends I1_3, I2_3 {}
interface III1_3 extends II1_3 {}
interface III2_3 extends II1_3 {}
class C1_3 implements III1_3 { v: bigint = 123n }
class C2_3 implements III2_3 { v: number = 321 }
class C3_3 implements II2_3 { v: number = 7.8 }

function check_C1_3(a: Object) {
  expect(a instanceof C1_3).assertTrue();
  expect(a instanceof III1_3).assertTrue();
  expect(a instanceof II1_3).assertTrue();
  expect(a instanceof I1_3).assertTrue();
  expect(a instanceof I2_3).assertTrue();
  expect((a as C1_3).v).assertEqual(123n);
}

function check_C2_3(a: Object) {
  expect(a instanceof C2_3).assertTrue();
  expect(a instanceof III2_3).assertTrue();
  expect(a instanceof II1_3).assertTrue();
  expect(a instanceof I1_3).assertTrue();
  expect(a instanceof I2_3).assertTrue();
  expect((a as C2_3).v).assertEqual(321);
}

function check_C3_3(a: Object) {
  expect(a instanceof C3_3).assertTrue();
  expect(a instanceof II2_3).assertTrue();
  expect(a instanceof I1_3).assertTrue();
  expect(a instanceof I2_3).assertTrue();
  expect((a as C3_3).v).assertEqual(7.8);
}

function foo_3(v: Object): void {
  expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertTrue();
}

function f1_3(v: III1_3 | III2_3 | II2_3): number {
  expect(v instanceof Object).assertTrue();
  foo_3(v);
  return f2_3(v);
}

function f2_3(v: III1_3 | III2_3 | II2_3): number {
  if (v instanceof II1_3) {
    check_C1_3(v);
    return 1;
  } else {
    expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertTrue();
    expect(v instanceof Object).assertTrue();
    foo_3(v);
    check_C3_3(v);
    return 2;
  }
}

namespace testNS1_4 {
  interface I_4 {}
  interface II1_4 extends I_4 {}
  interface II2_4 extends I_4 {}
  interface III1_4 extends II1_4 {}
  interface III2_4 extends II1_4 {}
  class C1_4 implements III1_4, III2_4 { v: bigint = 123n }
  class C2_4 implements II2_4, III2_4 { v: number = 321 }
  class C3_4 implements III1_4 { v: number = 7.8 }

  function check_C1_4(a: Object) {
    expect(a instanceof C1_4).assertTrue();
    expect(a instanceof III1_4).assertTrue();
    expect(a instanceof III2_4).assertTrue();
    expect(a instanceof II1_4).assertTrue();
    expect(a instanceof I_4).assertTrue();
    expect((a as C1_4).v).assertEqual(123n);
  }

  function check_C2_4(a: Object) {
    expect(a instanceof C2_4).assertTrue();
    expect(a instanceof II2_4).assertTrue();
    expect(a instanceof III2_4).assertTrue();
    expect(a instanceof II1_4).assertTrue();
    expect(a instanceof I_4).assertTrue();
    expect((a as C2_4).v).assertEqual(321);
  }

  function check_C3_4(a: Object) {
    expect(a instanceof C3_4).assertTrue();
    expect(a instanceof III1_4).assertTrue();
    expect(a instanceof II1_4).assertTrue();
    expect(a instanceof I_4).assertTrue();
    expect((a as C3_4).v).assertEqual(7.8);
  }

  function foo_4(v: Object): void {
    expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertTrue();
  }

  function f1_4(v: III1_4 | III2_4 | II2_4): number {
    expect(v instanceof Object).assertTrue();
    foo_4(v);
    return f2_4(v);
  }

  function f2_4(v: III1_4 | III2_4 | II2_4): number {
    if (v instanceof III2_4) {
      check_C1_4(v);
      return 1;
    } else {
      expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_4(v);
      check_C3_4(v);
      return 2;
    }
  }

  export function runTest_4(): boolean {
    let res: number = f1_4(new C1_4());
    expect(res).assertEqual(1);
    res = f1_4(new C3_4());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_4 {
  interface I_4 {}
  interface II1_4 extends I_4 {}
  interface II2_4 extends I_4 {}
  interface III1_4 extends II1_4 {}
  interface III2_4 extends II1_4 {}
  class C1_4 implements III1_4, III2_4 { v: bigint = 123n }
  class C2_4 implements II2_4, III2_4 { v: number = 321 }
  class C3_4 implements III1_4 { v: number = 7.8 }

  function check_C1_4(a: Object) {
    expect(a instanceof C1_4).assertTrue();
    expect(a instanceof III1_4).assertTrue();
    expect(a instanceof III2_4).assertTrue();
    expect(a instanceof II1_4).assertTrue();
    expect(a instanceof I_4).assertTrue();
    expect((a as C1_4).v).assertEqual(123n);
  }

  function check_C2_4(a: Object) {
    expect(a instanceof C2_4).assertTrue();
    expect(a instanceof II2_4).assertTrue();
    expect(a instanceof III2_4).assertTrue();
    expect(a instanceof II1_4).assertTrue();
    expect(a instanceof I_4).assertTrue();
    expect((a as C2_4).v).assertEqual(321);
  }

  function check_C3_4(a: Object) {
    expect(a instanceof C3_4).assertTrue();
    expect(a instanceof III1_4).assertTrue();
    expect(a instanceof II1_4).assertTrue();
    expect(a instanceof I_4).assertTrue();
    expect((a as C3_4).v).assertEqual(7.8);
  }

  function foo_4(v: Object): void {
    expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertTrue();
  }

  function f1_4(v: III1_4 | III2_4 | II2_4): number {
    expect(v instanceof Object).assertTrue();
    foo_4(v);
    return f2_4(v);
  }

  function f2_4(v: III1_4 | III2_4 | II2_4): number {
    if (v instanceof III2_4) {
      check_C2_4(v);
      return 1;
    } else {
      expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_4(v);
      check_C3_4(v);
      return 2;
    }
  }

  export function runTest_4(): boolean {
    let res: number = f1_4(new C2_4());
    expect(res).assertEqual(1);
    res = f1_4(new C3_4());
    expect(res).assertEqual(2);
    return true;
  }
}

interface I_4 {}
interface II1_4 extends I_4 {}
interface II2_4 extends I_4 {}
interface III1_4 extends II1_4 {}
interface III2_4 extends II1_4 {}
class C1_4 implements III1_4, III2_4 { v: bigint = 123n }
class C2_4 implements II2_4, III2_4 { v: number = 321 }
class C3_4 implements III1_4 { v: number = 7.8 }

function check_C1_4(a: Object) {
  expect(a instanceof C1_4).assertTrue();
  expect(a instanceof III1_4).assertTrue();
  expect(a instanceof III2_4).assertTrue();
  expect(a instanceof II1_4).assertTrue();
  expect(a instanceof I_4).assertTrue();
  expect((a as C1_4).v).assertEqual(123n);
}

function check_C2_4(a: Object) {
  expect(a instanceof C2_4).assertTrue();
  expect(a instanceof II2_4).assertTrue();
  expect(a instanceof III2_4).assertTrue();
  expect(a instanceof II1_4).assertTrue();
  expect(a instanceof I_4).assertTrue();
  expect((a as C2_4).v).assertEqual(321);
}

function check_C3_4(a: Object) {
  expect(a instanceof C3_4).assertTrue();
  expect(a instanceof III1_4).assertTrue();
  expect(a instanceof II1_4).assertTrue();
  expect(a instanceof I_4).assertTrue();
  expect((a as C3_4).v).assertEqual(7.8);
}

function foo_4(v: Object): void {
  expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertTrue();
}

function f1_4(v: III1_4 | III2_4 | II2_4): number {
  expect(v instanceof Object).assertTrue();
  foo_4(v);
  return f2_4(v);
}

function f2_4(v: III1_4 | III2_4 | II2_4): number {
  if (v instanceof III2_4) {
    check_C1_4(v);
    return 1;
  } else {
    expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertTrue();
    expect(v instanceof Object).assertTrue();
    foo_4(v);
    check_C3_4(v);
    return 2;
  }
}

namespace testNS1_5 {
  class Animal_5 {}
  class Cat_5 extends Animal_5 { v: string = "cat" }
  class Dog_5 extends Animal_5 { v: bigint = 123n }
  class Frog_5 extends Animal_5 { v: number = 5 }

  function check_cat_5(a: Object) {
    expect(a instanceof Cat_5).assertTrue();
    expect((a as Cat_5).v).assertEqual("cat");
  }

  function check_dog_5(a: Object) {
    expect(a instanceof Dog_5).assertTrue();
    expect((a as Dog_5).v).assertEqual(123n);
  }

  function check_frog_5(a: Object) {
    expect(a instanceof Frog_5).assertTrue();
    expect((a as Frog_5).v).assertEqual(5);
  }

  function foo_5(v: Object): void {
    expect(v instanceof Cat_5 || v instanceof Dog_5 || v instanceof Frog_5).assertTrue();
  }

  function f1_5(v: Cat_5 | Dog_5 | Frog_5): number {
    foo_5(v);
    return f2_5(v);
  }

  function f2_5(v: Cat_5 | Dog_5 | Frog_5): number {
    if (v instanceof Dog_5) {
      check_dog_5(v);
      return 1;
    } else {
      expect(v instanceof Cat_5 || v instanceof Dog_5 || v instanceof Frog_5).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_5(v);
      check_cat_5(v);
      return 2;
    }
  }

  export function runTest_5(): boolean {
    let res: number = f1_5(new Dog_5());
    expect(res).assertEqual(1);
    res = f1_5(new Cat_5());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_5 {
  class Animal_5 {}
  class Cat_5 extends Animal_5 { v: string = "cat" }
  class Dog_5 extends Animal_5 { v: bigint = 123n }
  class Frog_5 extends Animal_5 { v: number = 5 }

  function check_cat_5(a: Object) {
    expect(a instanceof Cat_5).assertTrue();
    expect((a as Cat_5).v).assertEqual("cat");
  }

  function check_dog_5(a: Object) {
    expect(a instanceof Dog_5).assertTrue();
    expect((a as Dog_5).v).assertEqual(123n);
  }

  function check_frog_5(a: Object) {
    expect(a instanceof Frog_5).assertTrue();
    expect((a as Frog_5).v).assertEqual(5);
  }

  function foo_5(v: Object): void {
    expect(v instanceof Cat_5 || v instanceof Dog_5 || v instanceof Frog_5).assertTrue();
  }

  function f1_5(v: Cat_5 | Dog_5 | Frog_5): number {
    foo_5(v);
    return f2_5(v);
  }

  function f2_5(v: Cat_5 | Dog_5 | Frog_5): number {
    if (v instanceof Dog_5) {
      check_dog_5(v);
      return 1;
    } else {
      expect(v instanceof Cat_5 || v instanceof Dog_5 || v instanceof Frog_5).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_5(v);
      check_frog_5(v);
      return 2;
    }
  }

  export function runTest_5(): boolean {
    let res: number = f1_5(new Dog_5());
    expect(res).assertEqual(1);
    res = f1_5(new Frog_5());
    expect(res).assertEqual(2);
    return true;
  }
}

class Animal_5 {}
class Cat_5 extends Animal_5 { v: string = "cat" }
class Dog_5 extends Animal_5 { v: bigint = 123n }
class Frog_5 extends Animal_5 { v: number = 5 }

function check_cat_5(a: Object) {
  expect(a instanceof Cat_5).assertTrue();
  expect((a as Cat_5).v).assertEqual("cat");
}

function check_dog_5(a: Object) {
  expect(a instanceof Dog_5).assertTrue();
  expect((a as Dog_5).v).assertEqual(123n);
}

function check_frog_5(a: Object) {
  expect(a instanceof Frog_5).assertTrue();
  expect((a as Frog_5).v).assertEqual(5);
}

function foo_5(v: Object): void {
  expect(v instanceof Cat_5 || v instanceof Dog_5 || v instanceof Frog_5).assertTrue();
}

function f1_5(v: Cat_5 | Dog_5 | Frog_5): number {
  foo_5(v);
  return f2_5(v);
}

function f2_5(v: Cat_5 | Dog_5 | Frog_5): number {
  if (v instanceof Dog_5) {
    check_dog_5(v);
    return 1;
  } else {
    expect(v instanceof Cat_5 || v instanceof Dog_5 || v instanceof Frog_5).assertTrue();
    expect(v instanceof Object).assertTrue();
    foo_5(v);
    check_cat_5(v);
    return 2;
  }
}

namespace testNS1_6 {
  abstract class A_6 {}
  abstract class B1_6 extends A_6 {}
  class B2_6 extends A_6 { v: bigint = 123n }
  class C1_6 extends B1_6 { v: number = 321 }
  class C2_6 extends B1_6 { v: number = 6.7 }
  class Other_6 { v: string = "other" }

  function check_C1_6(a: Object) {
    expect(a instanceof C1_6).assertTrue();
    expect((a as C1_6).v).assertEqual(321);
  }

  function check_C2_6(a: Object) {
    expect(a instanceof C2_6).assertTrue();
    expect((a as C2_6).v).assertEqual(6.7);
  }

  function check_B2_6(a: Object) {
    expect(a instanceof B2_6).assertTrue();
    expect((a as B2_6).v).assertEqual(123n);
  }

  function check_Other_6(a: Object) {
    expect(a instanceof Other_6).assertTrue();
    expect((a as Other_6).v).assertEqual("other");
  }

  function foo_6(v: Object): void {
    expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof B2_6 || v instanceof Other_6).assertTrue();
  }

  function f1_6(v: C1_6 | C2_6 | B2_6 | Other_6): number {
    foo_6(v);
    return f2_6(v);
  }

  function f2_6(v: C1_6 | C2_6 | B2_6 | Other_6): number {
    if (v instanceof B1_6 || v instanceof Other_6) {
      check_C1_6(v);
      return 1;
    } else {
      expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof B2_6 || v instanceof Other_6).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_6(v);
      check_B2_6(v);
      return 2;
    }
  }

  export function runTest_6(): boolean {
    let res: number = f1_6(new C1_6());
    expect(res).assertEqual(1);
    res = f1_6(new B2_6());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_6 {
  abstract class A_6 {}
  abstract class B1_6 extends A_6 {}
  class B2_6 extends A_6 { v: bigint = 123n }
  class C1_6 extends B1_6 { v: number = 321 }
  class C2_6 extends B1_6 { v: number = 6.7 }
  class Other_6 { v: string = "other" }

  function check_C1_6(a: Object) {
    expect(a instanceof C1_6).assertTrue();
    expect((a as C1_6).v).assertEqual(321);
  }

  function check_C2_6(a: Object) {
    expect(a instanceof C2_6).assertTrue();
    expect((a as C2_6).v).assertEqual(6.7);
  }

  function check_B2_6(a: Object) {
    expect(a instanceof B2_6).assertTrue();
    expect((a as B2_6).v).assertEqual(123n);
  }

  function check_Other_6(a: Object) {
    expect(a instanceof Other_6).assertTrue();
    expect((a as Other_6).v).assertEqual("other");
  }

  function foo_6(v: Object): void {
    expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof B2_6 || v instanceof Other_6).assertTrue();
  }

  function f1_6(v: C1_6 | C2_6 | B2_6 | Other_6): number {
    foo_6(v);
    return f2_6(v);
  }

  function f2_6(v: C1_6 | C2_6 | B2_6 | Other_6): number {
    if (v instanceof B1_6 || v instanceof Other_6) {
      check_C2_6(v);
      return 1;
    } else {
      expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof B2_6 || v instanceof Other_6).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_6(v);
      check_B2_6(v);
      return 2;
    }
  }

  export function runTest_6(): boolean {
    let res: number = f1_6(new C2_6());
    expect(res).assertEqual(1);
    res = f1_6(new B2_6());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_6 {
  abstract class A_6 {}
  abstract class B1_6 extends A_6 {}
  class B2_6 extends A_6 { v: bigint = 123n }
  class C1_6 extends B1_6 { v: number = 321 }
  class C2_6 extends B1_6 { v: number = 6.7 }
  class Other_6 { v: string = "other" }

  function check_C1_6(a: Object) {
    expect(a instanceof C1_6).assertTrue();
    expect((a as C1_6).v).assertEqual(321);
  }

  function check_C2_6(a: Object) {
    expect(a instanceof C2_6).assertTrue();
    expect((a as C2_6).v).assertEqual(6.7);
  }

  function check_B2_6(a: Object) {
    expect(a instanceof B2_6).assertTrue();
    expect((a as B2_6).v).assertEqual(123n);
  }

  function check_Other_6(a: Object) {
    expect(a instanceof Other_6).assertTrue();
    expect((a as Other_6).v).assertEqual("other");
  }

  function foo_6(v: Object): void {
    expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof B2_6 || v instanceof Other_6).assertTrue();
  }

  function f1_6(v: C1_6 | C2_6 | B2_6 | Other_6): number {
    foo_6(v);
    return f2_6(v);
  }

  function f2_6(v: C1_6 | C2_6 | B2_6 | Other_6): number {
    if (v instanceof B1_6 || v instanceof Other_6) {
      check_Other_6(v);
      return 1;
    } else {
      expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof B2_6 || v instanceof Other_6).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_6(v);
      check_B2_6(v);
      return 2;
    }
  }

  export function runTest_6(): boolean {
    let res: number = f1_6(new Other_6());
    expect(res).assertEqual(1);
    res = f1_6(new B2_6());
    expect(res).assertEqual(2);
    return true;
  }
}

abstract class A_6 {}
abstract class B1_6 extends A_6 {}
class B2_6 extends A_6 { v: bigint = 123n }
class C1_6 extends B1_6 { v: number = 321 }
class C2_6 extends B1_6 { v: number = 6.7 }
class Other_6 { v: string = "other" }

function check_C1_6(a: Object) {
  expect(a instanceof C1_6).assertTrue();
  expect((a as C1_6).v).assertEqual(321);
}

function check_C2_6(a: Object) {
  expect(a instanceof C2_6).assertTrue();
  expect((a as C2_6).v).assertEqual(6.7);
}

function check_B2_6(a: Object) {
  expect(a instanceof B2_6).assertTrue();
  expect((a as B2_6).v).assertEqual(123n);
}

function check_Other_6(a: Object) {
  expect(a instanceof Other_6).assertTrue();
  expect((a as Other_6).v).assertEqual("other");
}

function foo_6(v: Object): void {
  expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof B2_6 || v instanceof Other_6).assertTrue();
}

function f1_6(v: C1_6 | C2_6 | B2_6 | Other_6): number {
  foo_6(v);
  return f2_6(v);
}

function f2_6(v: C1_6 | C2_6 | B2_6 | Other_6): number {
  if (v instanceof B1_6 || v instanceof Other_6) {
    check_C1_6(v);
    return 1;
  } else {
    expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof B2_6 || v instanceof Other_6).assertTrue();
    expect(v instanceof Object).assertTrue();
    foo_6(v);
    check_B2_6(v);
    return 2;
  }
}

namespace testNS1_7 {
  interface I1_7 {}
  interface I2_7 {}
  interface II1_7 extends I1_7, I2_7 {}
  interface II2_7 extends I1_7, I2_7 {}
  interface III1_7 extends II1_7 {}
  interface III2_7 extends II1_7 {}
  class C1_7 implements III1_7 { v: bigint = 123n }
  class C2_7 implements III2_7 { v: number = 321 }
  class C3_7 implements II2_7 { v: number = 7.8 }

  function check_C1_7(a: Object) {
    expect(a instanceof C1_7).assertTrue();
    expect(a instanceof III1_7).assertTrue();
    expect(a instanceof II1_7).assertTrue();
    expect(a instanceof I1_7).assertTrue();
    expect(a instanceof I2_7).assertTrue();
    expect((a as C1_7).v).assertEqual(123n);
  }

  function check_C2_7(a: Object) {
    expect(a instanceof C2_7).assertTrue();
    expect(a instanceof III2_7).assertTrue();
    expect(a instanceof II1_7).assertTrue();
    expect(a instanceof I1_7).assertTrue();
    expect(a instanceof I2_7).assertTrue();
    expect((a as C2_7).v).assertEqual(321);
  }

  function check_C3_7(a: Object) {
    expect(a instanceof C3_7).assertTrue();
    expect(a instanceof II2_7).assertTrue();
    expect(a instanceof I1_7).assertTrue();
    expect(a instanceof I2_7).assertTrue();
    expect((a as C3_7).v).assertEqual(7.8);
  }

  function foo_7(v: Object): void {
    expect(v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7).assertTrue();
  }

  function f1_7(v: III1_7 | III2_7 | II2_7): number {
    foo_7(v);
    return f2_7(v);
  }

  function f2_7(v: III1_7 | III2_7 | II2_7): number {
    if (v instanceof II1_7) {
      check_C1_7(v);
      return 1;
    } else {
      expect(v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_7(v);
      check_C3_7(v);
      return 2;
    }
  }

  export function runTest_7(): boolean {
    let res: number = f1_7(new C1_7());
    expect(res).assertEqual(1);
    res = f1_7(new C3_7());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_7 {
  interface I1_7 {}
  interface I2_7 {}
  interface II1_7 extends I1_7, I2_7 {}
  interface II2_7 extends I1_7, I2_7 {}
  interface III1_7 extends II1_7 {}
  interface III2_7 extends II1_7 {}
  class C1_7 implements III1_7 { v: bigint = 123n }
  class C2_7 implements III2_7 { v: number = 321 }
  class C3_7 implements II2_7 { v: number = 7.8 }

  function check_C1_7(a: Object) {
    expect(a instanceof C1_7).assertTrue();
    expect(a instanceof III1_7).assertTrue();
    expect(a instanceof II1_7).assertTrue();
    expect(a instanceof I1_7).assertTrue();
    expect(a instanceof I2_7).assertTrue();
    expect((a as C1_7).v).assertEqual(123n);
  }

  function check_C2_7(a: Object) {
    expect(a instanceof C2_7).assertTrue();
    expect(a instanceof III2_7).assertTrue();
    expect(a instanceof II1_7).assertTrue();
    expect(a instanceof I1_7).assertTrue();
    expect(a instanceof I2_7).assertTrue();
    expect((a as C2_7).v).assertEqual(321);
  }

  function check_C3_7(a: Object) {
    expect(a instanceof C3_7).assertTrue();
    expect(a instanceof II2_7).assertTrue();
    expect(a instanceof I1_7).assertTrue();
    expect(a instanceof I2_7).assertTrue();
    expect((a as C3_7).v).assertEqual(7.8);
  }

  function foo_7(v: Object): void {
    expect(v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7).assertTrue();
  }

  function f1_7(v: III1_7 | III2_7 | II2_7): number {
    foo_7(v);
    return f2_7(v);
  }

  function f2_7(v: III1_7 | III2_7 | II2_7): number {
    if (v instanceof II1_7) {
      check_C2_7(v);
      return 1;
    } else {
      expect(v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_7(v);
      check_C3_7(v);
      return 2;
    }
  }

  export function runTest_7(): boolean {
    let res: number = f1_7(new C2_7());
    expect(res).assertEqual(1);
    res = f1_7(new C3_7());
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_7 {}
interface I2_7 {}
interface II1_7 extends I1_7, I2_7 {}
interface II2_7 extends I1_7, I2_7 {}
interface III1_7 extends II1_7 {}
interface III2_7 extends II1_7 {}
class C1_7 implements III1_7 { v: bigint = 123n }
class C2_7 implements III2_7 { v: number = 321 }
class C3_7 implements II2_7 { v: number = 7.8 }

function check_C1_7(a: Object) {
  expect(a instanceof C1_7).assertTrue();
  expect(a instanceof III1_7).assertTrue();
  expect(a instanceof II1_7).assertTrue();
  expect(a instanceof I1_7).assertTrue();
  expect(a instanceof I2_7).assertTrue();
  expect((a as C1_7).v).assertEqual(123n);
}

function check_C2_7(a: Object) {
  expect(a instanceof C2_7).assertTrue();
  expect(a instanceof III2_7).assertTrue();
  expect(a instanceof II1_7).assertTrue();
  expect(a instanceof I1_7).assertTrue();
  expect(a instanceof I2_7).assertTrue();
  expect((a as C2_7).v).assertEqual(321);
}

function check_C3_7(a: Object) {
  expect(a instanceof C3_7).assertTrue();
  expect(a instanceof II2_7).assertTrue();
  expect(a instanceof I1_7).assertTrue();
  expect(a instanceof I2_7).assertTrue();
  expect((a as C3_7).v).assertEqual(7.8);
}

function foo_7(v: Object): void {
  expect(v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7).assertTrue();
}

function f1_7(v: III1_7 | III2_7 | II2_7): number {
  foo_7(v);
  return f2_7(v);
}

function f2_7(v: III1_7 | III2_7 | II2_7): number {
  if (v instanceof II1_7) {
    check_C1_7(v);
    return 1;
  } else {
    expect(v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7).assertTrue();
    expect(v instanceof Object).assertTrue();
    foo_7(v);
    check_C3_7(v);
    return 2;
  }
}

namespace testNS1_8 {
  interface I_8 {}
  interface II1_8 extends I_8 {}
  interface II2_8 extends I_8 {}
  interface III1_8 extends II1_8 {}
  interface III2_8 extends II1_8 {}
  class C1_8 implements III1_8, III2_8 { v: bigint = 123n }
  class C2_8 implements II2_8, III2_8 { v: number = 321 }
  class C3_8 implements III1_8 { v: number = 7.8 }

  function check_C1_8(a: Object) {
    expect(a instanceof C1_8).assertTrue();
    expect(a instanceof III1_8).assertTrue();
    expect(a instanceof III2_8).assertTrue();
    expect(a instanceof II1_8).assertTrue();
    expect(a instanceof I_8).assertTrue();
    expect((a as C1_8).v).assertEqual(123n);
  }

  function check_C2_8(a: Object) {
    expect(a instanceof C2_8).assertTrue();
    expect(a instanceof II2_8).assertTrue();
    expect(a instanceof III2_8).assertTrue();
    expect(a instanceof II1_8).assertTrue();
    expect(a instanceof I_8).assertTrue();
    expect((a as C2_8).v).assertEqual(321);
  }

  function check_C3_8(a: Object) {
    expect(a instanceof C3_8).assertTrue();
    expect(a instanceof III1_8).assertTrue();
    expect(a instanceof II1_8).assertTrue();
    expect(a instanceof I_8).assertTrue();
    expect((a as C3_8).v).assertEqual(7.8);
  }

  function foo_8(v: Object): void {
    expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue();
  }

  function f1_8(v: III1_8 | III2_8 | II2_8): number {
    foo_8(v);
    return f2_8(v);
  }

  function f2_8(v: III1_8 | III2_8 | II2_8): number {
    if (v instanceof III2_8) {
      check_C1_8(v);
      return 1;
    } else {
      expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_8(v);
      check_C3_8(v);
      return 2;
    }
  }

  export function runTest_8(): boolean {
    let res: number = f1_8(new C1_8());
    expect(res).assertEqual(1);
    res = f1_8(new C3_8());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_8 {
  interface I_8 {}
  interface II1_8 extends I_8 {}
  interface II2_8 extends I_8 {}
  interface III1_8 extends II1_8 {}
  interface III2_8 extends II1_8 {}
  class C1_8 implements III1_8, III2_8 { v: bigint = 123n }
  class C2_8 implements II2_8, III2_8 { v: number = 321 }
  class C3_8 implements III1_8 { v: number = 7.8 }

  function check_C1_8(a: Object) {
    expect(a instanceof C1_8).assertTrue();
    expect(a instanceof III1_8).assertTrue();
    expect(a instanceof III2_8).assertTrue();
    expect(a instanceof II1_8).assertTrue();
    expect(a instanceof I_8).assertTrue();
    expect((a as C1_8).v).assertEqual(123n);
  }

  function check_C2_8(a: Object) {
    expect(a instanceof C2_8).assertTrue();
    expect(a instanceof II2_8).assertTrue();
    expect(a instanceof III2_8).assertTrue();
    expect(a instanceof II1_8).assertTrue();
    expect(a instanceof I_8).assertTrue();
    expect((a as C2_8).v).assertEqual(321);
  }

  function check_C3_8(a: Object) {
    expect(a instanceof C3_8).assertTrue();
    expect(a instanceof III1_8).assertTrue();
    expect(a instanceof II1_8).assertTrue();
    expect(a instanceof I_8).assertTrue();
    expect((a as C3_8).v).assertEqual(7.8);
  }

  function foo_8(v: Object): void {
    expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue();
  }

  function f1_8(v: III1_8 | III2_8 | II2_8): number {
    foo_8(v);
    return f2_8(v);
  }

  function f2_8(v: III1_8 | III2_8 | II2_8): number {
    if (v instanceof III2_8) {
      check_C2_8(v);
      return 1;
    } else {
      expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo_8(v);
      check_C3_8(v);
      return 2;
    }
  }

  export function runTest_8(): boolean {
    let res: number = f1_8(new C2_8());
    expect(res).assertEqual(1);
    res = f1_8(new C3_8());
    expect(res).assertEqual(2);
    return true;
  }
}

interface I_8 {}
interface II1_8 extends I_8 {}
interface II2_8 extends I_8 {}
interface III1_8 extends II1_8 {}
interface III2_8 extends II1_8 {}
class C1_8 implements III1_8, III2_8 { v: bigint = 123n }
class C2_8 implements II2_8, III2_8 { v: number = 321 }
class C3_8 implements III1_8 { v: number = 7.8 }

function check_C1_8(a: Object) {
  expect(a instanceof C1_8).assertTrue();
  expect(a instanceof III1_8).assertTrue();
  expect(a instanceof III2_8).assertTrue();
  expect(a instanceof II1_8).assertTrue();
  expect(a instanceof I_8).assertTrue();
  expect((a as C1_8).v).assertEqual(123n);
}

function check_C2_8(a: Object) {
  expect(a instanceof C2_8).assertTrue();
  expect(a instanceof II2_8).assertTrue();
  expect(a instanceof III2_8).assertTrue();
  expect(a instanceof II1_8).assertTrue();
  expect(a instanceof I_8).assertTrue();
  expect((a as C2_8).v).assertEqual(321);
}

function check_C3_8(a: Object) {
  expect(a instanceof C3_8).assertTrue();
  expect(a instanceof III1_8).assertTrue();
  expect(a instanceof II1_8).assertTrue();
  expect(a instanceof I_8).assertTrue();
  expect((a as C3_8).v).assertEqual(7.8);
}

function foo_8(v: Object): void {
  expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue();
}

function f1_8(v: III1_8 | III2_8 | II2_8): number {
  foo_8(v);
  return f2_8(v);
}

function f2_8(v: III1_8 | III2_8 | II2_8): number {
  if (v instanceof III2_8) {
    check_C1_8(v);
    return 1;
  } else {
    expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue();
    expect(v instanceof Object).assertTrue();
    foo_8(v);
    check_C3_8(v);
    return 2;
  }
}

export default function DiffTypeIsSubOfTypeObjOnNonGenTest(): void{
  describe('DiffTypeIsSubOfTypeObjOnNonGenTest', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_NON_GEN_0100
     * @tc.name      testDiffTypeIsSubOfTypeObjOnNonGen0001
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnNonGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnNonGen0001';
      let res: number = f1_1(new Dog_1());
      expect(res).assertEqual(1);
      res = f1_1(new Cat_1());
      expect(res).assertEqual(2);
      expect(testNS1_1.runTest_1()).assertTrue();
      expect(testNS2_1.runTest_1()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_NON_GEN_0200
     * @tc.name      testDiffTypeIsSubOfTypeObjOnNonGen0002
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnNonGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnNonGen0002';
      let res: number = f1_2(new C1_2());
      expect(res).assertEqual(1);
      res = f1_2(new B2_2());
      expect(res).assertEqual(2);
      expect(testNS1_2.runTest_2()).assertTrue();
      expect(testNS2_2.runTest_2()).assertTrue();
      expect(testNS3_2.runTest_2()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_NON_GEN_0300
     * @tc.name      testDiffTypeIsSubOfTypeObjOnNonGen0003
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnNonGen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnNonGen0003';
      let res: number = f1_3(new C1_3());
      expect(res).assertEqual(1);
      res = f1_3(new C3_3());
      expect(res).assertEqual(2);
      expect(testNS1_3.runTest_3()).assertTrue();
      expect(testNS2_3.runTest_3()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_NON_GEN_0400
     * @tc.name      testDiffTypeIsSubOfTypeObjOnNonGen0004
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnNonGen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnNonGen0004';
      let res: number = f1_4(new C1_4());
      expect(res).assertEqual(1);
      res = f1_4(new C3_4());
      expect(res).assertEqual(2);
      expect(testNS1_4.runTest_4()).assertTrue();
      expect(testNS2_4.runTest_4()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_NON_GEN_0500
     * @tc.name      testDiffTypeIsSubOfTypeObjOnNonGen0005
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnNonGen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnNonGen0005';
      let res: number = f1_5(new Dog_5());
      expect(res).assertEqual(1);
      res = f1_5(new Cat_5());
      expect(res).assertEqual(2);
      expect(testNS1_5.runTest_5()).assertTrue();
      expect(testNS2_5.runTest_5()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_NON_GEN_0600
     * @tc.name      testDiffTypeIsSubOfTypeObjOnNonGen0006
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnNonGen0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnNonGen0006';
      let res: number = f1_6(new C1_6());
      expect(res).assertEqual(1);
      res = f1_6(new B2_6());
      expect(res).assertEqual(2);
      expect(testNS1_6.runTest_6()).assertTrue();
      expect(testNS2_6.runTest_6()).assertTrue();
      expect(testNS3_6.runTest_6()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_NON_GEN_0700
     * @tc.name      testDiffTypeIsSubOfTypeObjOnNonGen0007
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnNonGen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnNonGen0007';
      let res: number = f1_7(new C1_7());
      expect(res).assertEqual(1);
      res = f1_7(new C3_7());
      expect(res).assertEqual(2);
      expect(testNS1_7.runTest_7()).assertTrue();
      expect(testNS2_7.runTest_7()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_NON_GEN_0800
     * @tc.name      testDiffTypeIsSubOfTypeObjOnNonGen0008
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnNonGen0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnNonGen0008';
      let res: number = f1_8(new C1_8());
      expect(res).assertEqual(1);
      res = f1_8(new C3_8());
      expect(res).assertEqual(2);
      expect(testNS1_8.runTest_8()).assertTrue();
      expect(testNS2_8.runTest_8()).assertTrue();
    });
  });
}