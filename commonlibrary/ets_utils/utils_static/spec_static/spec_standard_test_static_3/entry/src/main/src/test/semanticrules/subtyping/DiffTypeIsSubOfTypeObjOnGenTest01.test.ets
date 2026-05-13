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


export interface I1_9<U, V> {}
export interface I2_9<U, V> {}
export interface II1_9<U, V> extends I1_9<U, V>, I2_9<U, V> {}
export interface II2_9<U, V> extends I1_9<U, V>, I2_9<U, V> {}
export interface III1_9<U, V> extends II1_9<U, V> {}
export interface III2_9<U, V> extends II1_9<U, V> {}


export interface I1_10<U, V> {}
export interface I2_10<U, V> {}
export interface II1_10<U, V> extends I1_10<U, V>, I2_10<U, V> {}
export interface II2_10<U = bigint, V = undefined> extends I1_10<U, V>, I2_10<U, V> {}
export interface III1_10<U = number, V = null> extends II1_10<U, V> {}
export interface III2_10<U = number, V = string> extends II1_10<U, V> {}


export interface I_11<U, V> {}
export interface II1_11<U, V> extends I_11<U, V> {}
export interface II2_11<U, V> extends I_11<U, V> {}
export interface III1_11<U, V> extends II1_11<U, V> {}
export interface III2_11<U, V> extends II1_11<U, V> {}


namespace testNS1_7 {
  abstract class A_7<U, V> {}
  abstract class B1_7<U, V> extends A_7<U, V> {}
  class B2_7<U, V> extends A_7<U, V> {
    b2_v: U | V;
    constructor(p: U | V) {
      super();
      this.b2_v = p;
    }
  }
  class C1_7<U, V> extends B1_7<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      super();
      this.c1_v = p;
    }
  }
  class C2_7<U, V> extends B1_7<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      super();
      this.c2_v = p;
    }
  }
  class Other_7<T> {
    other_v: T;
    constructor(p: T) {
      this.other_v = p;
    }
  }

  function check_C1_7(a: object) {
    expect(a instanceof C1_7).assertTrue();
    expect((a as C1_7<number, null>).c1_v as number).assertEqual(321);
  }
  function check_C2_7(a: object) {
    expect(a instanceof C2_7).assertTrue();
    expect((a as C2_7<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_B2_7(a: object) {
    expect(a instanceof B2_7).assertTrue();
    expect((a as B2_7<bigint, undefined>).b2_v as bigint).assertEqual(123n);
  }
  function check_Other_7(a: object) {
    expect(a instanceof Other_7).assertTrue();
    expect((a as Other_7<string>).other_v as string).assertEqual("other");
  }

  function foo_7(v: object): void {
    expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof B2_7 || v instanceof Other_7).assertTrue();
  }

  function f1_7(v: C1_7<number, null> | C2_7<number, string> | B2_7<bigint, undefined> | Other_7<string>): number {
    foo_7(v);
    return f2_7(v);
  }

  function f2_7(v: C1_7<number, null> | C2_7<number, string> | B2_7<bigint, undefined> | Other_7<string>): number {
    if (v instanceof B1_7 || v instanceof Other_7) {
      check_C1_7(v);
      return 1;
    } else {
      expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof B2_7 || v instanceof Other_7).assertTrue();
      expect(v instanceof object).assertTrue();
      foo_7(v);
      check_B2_7(v);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1_7(new C1_7<number, null>(321));
    expect(res).assertEqual(1);
    res = f1_7(new B2_7<bigint, undefined>(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_7 {
  abstract class A_7<U, V> {}
  abstract class B1_7<U, V> extends A_7<U, V> {}
  class B2_7<U, V> extends A_7<U, V> {
    b2_v: U | V;
    constructor(p: U | V) {
      super();
      this.b2_v = p;
    }
  }
  class C1_7<U, V> extends B1_7<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      super();
      this.c1_v = p;
    }
  }
  class C2_7<U, V> extends B1_7<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      super();
      this.c2_v = p;
    }
  }
  class Other_7<T> {
    other_v: T;
    constructor(p: T) {
      this.other_v = p;
    }
  }

  function check_C1_7(a: object) {
    expect(a instanceof C1_7).assertTrue();
    expect((a as C1_7<number, null>).c1_v as number).assertEqual(321);
  }
  function check_C2_7(a: object) {
    expect(a instanceof C2_7).assertTrue();
    expect((a as C2_7<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_B2_7(a: object) {
    expect(a instanceof B2_7).assertTrue();
    expect((a as B2_7<bigint, undefined>).b2_v as bigint).assertEqual(123n);
  }
  function check_Other_7(a: object) {
    expect(a instanceof Other_7).assertTrue();
    expect((a as Other_7<string>).other_v as string).assertEqual("other");
  }

  function foo_7(v: object): void {
    expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof B2_7 || v instanceof Other_7).assertTrue();
  }

  function f1_7(v: C1_7<number, null> | C2_7<number, string> | B2_7<bigint, undefined> | Other_7<string>): number {
    foo_7(v);
    return f2_7(v);
  }

  function f2_7(v: C1_7<number, null> | C2_7<number, string> | B2_7<bigint, undefined> | Other_7<string>): number {
    if (v instanceof B1_7 || v instanceof Other_7) {
      check_C2_7(v);
      return 1;
    } else {
      expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof B2_7 || v instanceof Other_7).assertTrue();
      expect(v instanceof object).assertTrue();
      foo_7(v);
      check_B2_7(v);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1_7(new C2_7<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1_7(new B2_7<bigint, undefined>(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_7 {
  abstract class A_7<U, V> {}
  abstract class B1_7<U, V> extends A_7<U, V> {}
  class B2_7<U, V> extends A_7<U, V> {
    b2_v: U | V;
    constructor(p: U | V) {
      super();
      this.b2_v = p;
    }
  }
  class C1_7<U, V> extends B1_7<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      super();
      this.c1_v = p;
    }
  }
  class C2_7<U, V> extends B1_7<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      super();
      this.c2_v = p;
    }
  }
  class Other_7<T> {
    other_v: T;
    constructor(p: T) {
      this.other_v = p;
    }
  }

  function check_C1_7(a: object) {
    expect(a instanceof C1_7).assertTrue();
    expect((a as C1_7<number, null>).c1_v as number).assertEqual(321);
  }
  function check_C2_7(a: object) {
    expect(a instanceof C2_7).assertTrue();
    expect((a as C2_7<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_B2_7(a: object) {
    expect(a instanceof B2_7).assertTrue();
    expect((a as B2_7<bigint, undefined>).b2_v as bigint).assertEqual(123n);
  }
  function check_Other_7(a: object) {
    expect(a instanceof Other_7).assertTrue();
    expect((a as Other_7<string>).other_v as string).assertEqual("other");
  }

  function foo_7(v: object): void {
    expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof B2_7 || v instanceof Other_7).assertTrue();
  }

  function f1_7(v: C1_7<number, null> | C2_7<number, string> | B2_7<bigint, undefined> | Other_7<string>): number {
    foo_7(v);
    return f2_7(v);
  }

  function f2_7(v: C1_7<number, null> | C2_7<number, string> | B2_7<bigint, undefined> | Other_7<string>): number {
    if (v instanceof B1_7 || v instanceof Other_7) {
      check_Other_7(v);
      return 1;
    } else {
      expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof B2_7 || v instanceof Other_7).assertTrue();
      expect(v instanceof object).assertTrue();
      foo_7(v);
      check_B2_7(v);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1_7(new Other_7<string>("other"));
    expect(res).assertEqual(1);
    res = f1_7(new B2_7<bigint, undefined>(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

abstract class A_7<U, V> {}
abstract class B1_7<U, V> extends A_7<U, V> {}
class B2_7<U, V> extends A_7<U, V> {
  b2_v: U | V;
  constructor(p: U | V) {
    super();
    this.b2_v = p;
  }
}
class C1_7<U, V> extends B1_7<U, V> {
  c1_v: U | V;
  constructor(p: U | V) {
    super();
    this.c1_v = p;
  }
}
class C2_7<U, V> extends B1_7<U, V> {
  c2_v: U | V;
  constructor(p: U | V) {
    super();
    this.c2_v = p;
  }
}
class Other_7<T> {
  other_v: T;
  constructor(p: T) {
    this.other_v = p;
  }
}

function check_C1_7(a: object) {
  expect(a instanceof C1_7).assertTrue();
  expect((a as C1_7<number, null>).c1_v as number).assertEqual(321);
}
function check_C2_7(a: object) {
  expect(a instanceof C2_7).assertTrue();
  expect((a as C2_7<number, string>).c2_v as number).assertEqual(6.7);
}
function check_B2_7(a: object) {
  expect(a instanceof B2_7).assertTrue();
  expect((a as B2_7<bigint, undefined>).b2_v as bigint).assertEqual(123n);
}
function check_Other_7(a: object) {
  expect(a instanceof Other_7).assertTrue();
  expect((a as Other_7<string>).other_v as string).assertEqual("other");
}

function foo_7(v: object): void {
  expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof B2_7 || v instanceof Other_7).assertTrue();
}

function f1_7(v: C1_7<number, null> | C2_7<number, string> | B2_7<bigint, undefined> | Other_7<string>): number {
  foo_7(v);
  return f2_7(v);
}

function f2_7(v: C1_7<number, null> | C2_7<number, string> | B2_7<bigint, undefined> | Other_7<string>): number {
  if (v instanceof B1_7 || v instanceof Other_7) {
    check_C1_7(v);
    return 1;
  } else {
    expect(v instanceof C1_7 || v instanceof C2_7 || v instanceof B2_7 || v instanceof Other_7).assertTrue();
    expect(v instanceof object).assertTrue();
    foo_7(v);
    check_B2_7(v);
    return 2;
  }
}


namespace testNS1_8 {
  abstract class A_8<U, V> {}
  abstract class B1_8<U, V> extends A_8<U, V> {}
  class B2_8<U = bigint, V = undefined> extends A_8<U, V> {
    b2_v: U | V;
    constructor(p: U | V) {
      super();
      this.b2_v = p;
    }
  }
  class C1_8<U = number, V = null> extends B1_8<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      super();
      this.c1_v = p;
    }
  }
  class C2_8<U = number, V = string> extends B1_8<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      super();
      this.c2_v = p;
    }
  }
  class Other_8<T = string> {
    other_v: T;
    constructor(p: T) {
      this.other_v = p;
    }
  }

  function check_C1_8(a: object) {
    expect(a instanceof C1_8).assertTrue();
    expect((a as C1_8).c1_v as number).assertEqual(321);
  }
  function check_C2_8(a: object) {
    expect(a instanceof C2_8).assertTrue();
    expect((a as C2_8).c2_v as number).assertEqual(6.7);
  }
  function check_B2_8(a: object) {
    expect(a instanceof B2_8).assertTrue();
    expect((a as B2_8).b2_v as bigint).assertEqual(123n);
  }
  function check_Other_8(a: object) {
    expect(a instanceof Other_8).assertTrue();
    expect((a as Other_8).other_v as string).assertEqual("other");
  }

  function foo_8(v: object): void {
    expect(v instanceof C1_8 || v instanceof C2_8 || v instanceof B2_8 || v instanceof Other_8).assertTrue();
  }

  function f1_8(v: C1_8 | C2_8 | B2_8 | Other_8): number {
    foo_8(v);
    return f2_8(v);
  }

  function f2_8(v: C1_8 | C2_8 | B2_8 | Other_8): number {
    if (v instanceof B1_8 || v instanceof Other_8) {
      check_C1_8(v);
      return 1;
    } else {
      expect(v instanceof C1_8 || v instanceof C2_8 || v instanceof B2_8 || v instanceof Other_8).assertTrue();
      expect(v instanceof object).assertTrue();
      foo_8(v);
      check_B2_8(v);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1_8(new C1_8(321));
    expect(res).assertEqual(1);
    res = f1_8(new B2_8(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_8 {
  abstract class A_8<U, V> {}
  abstract class B1_8<U, V> extends A_8<U, V> {}
  class B2_8<U = bigint, V = undefined> extends A_8<U, V> {
    b2_v: U | V;
    constructor(p: U | V) {
      super();
      this.b2_v = p;
    }
  }
  class C1_8<U = number, V = null> extends B1_8<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      super();
      this.c1_v = p;
    }
  }
  class C2_8<U = number, V = string> extends B1_8<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      super();
      this.c2_v = p;
    }
  }
  class Other_8<T = string> {
    other_v: T;
    constructor(p: T) {
      this.other_v = p;
    }
  }

  function check_C1_8(a: object) {
    expect(a instanceof C1_8).assertTrue();
    expect((a as C1_8).c1_v as number).assertEqual(321);
  }
  function check_C2_8(a: object) {
    expect(a instanceof C2_8).assertTrue();
    expect((a as C2_8).c2_v as number).assertEqual(6.7);
  }
  function check_B2_8(a: object) {
    expect(a instanceof B2_8).assertTrue();
    expect((a as B2_8).b2_v as bigint).assertEqual(123n);
  }
  function check_Other_8(a: object) {
    expect(a instanceof Other_8).assertTrue();
    expect((a as Other_8).other_v as string).assertEqual("other");
  }

  function foo_8(v: object): void {
    expect(v instanceof C1_8 || v instanceof C2_8 || v instanceof B2_8 || v instanceof Other_8).assertTrue();
  }

  function f1_8(v: C1_8 | C2_8 | B2_8 | Other_8): number {
    foo_8(v);
    return f2_8(v);
  }

  function f2_8(v: C1_8 | C2_8 | B2_8 | Other_8): number {
    if (v instanceof B1_8 || v instanceof Other_8) {
      check_C2_8(v);
      return 1;
    } else {
      expect(v instanceof C1_8 || v instanceof C2_8 || v instanceof B2_8 || v instanceof Other_8).assertTrue();
      expect(v instanceof object).assertTrue();
      foo_8(v);
      check_B2_8(v);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1_8(new C2_8(6.7));
    expect(res).assertEqual(1);
    res = f1_8(new B2_8(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_8 {
  abstract class A_8<U, V> {}
  abstract class B1_8<U, V> extends A_8<U, V> {}
  class B2_8<U = bigint, V = undefined> extends A_8<U, V> {
    b2_v: U | V;
    constructor(p: U | V) {
      super();
      this.b2_v = p;
    }
  }
  class C1_8<U = number, V = null> extends B1_8<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      super();
      this.c1_v = p;
    }
  }
  class C2_8<U = number, V = string> extends B1_8<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      super();
      this.c2_v = p;
    }
  }
  class Other_8<T = string> {
    other_v: T;
    constructor(p: T) {
      this.other_v = p;
    }
  }

  function check_C1_8(a: object) {
    expect(a instanceof C1_8).assertTrue();
    expect((a as C1_8).c1_v as number).assertEqual(321);
  }
  function check_C2_8(a: object) {
    expect(a instanceof C2_8).assertTrue();
    expect((a as C2_8).c2_v as number).assertEqual(6.7);
  }
  function check_B2_8(a: object) {
    expect(a instanceof B2_8).assertTrue();
    expect((a as B2_8).b2_v as bigint).assertEqual(123n);
  }
  function check_Other_8(a: object) {
    expect(a instanceof Other_8).assertTrue();
    expect((a as Other_8).other_v as string).assertEqual("other");
  }

  function foo_8(v: object): void {
    expect(v instanceof C1_8 || v instanceof C2_8 || v instanceof B2_8 || v instanceof Other_8).assertTrue();
  }

  function f1_8(v: C1_8 | C2_8 | B2_8 | Other_8): number {
    foo_8(v);
    return f2_8(v);
  }

  function f2_8(v: C1_8 | C2_8 | B2_8 | Other_8): number {
    if (v instanceof B1_8 || v instanceof Other_8) {
      check_Other_8(v);
      return 1;
    } else {
      expect(v instanceof C1_8 || v instanceof C2_8 || v instanceof B2_8 || v instanceof Other_8).assertTrue();
      expect(v instanceof object).assertTrue();
      foo_8(v);
      check_B2_8(v);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1_8(new Other_8("other"));
    expect(res).assertEqual(1);
    res = f1_8(new B2_8(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

abstract class A_8<U, V> {}
abstract class B1_8<U, V> extends A_8<U, V> {}
class B2_8<U = bigint, V = undefined> extends A_8<U, V> {
  b2_v: U | V;
  constructor(p: U | V) {
    super();
    this.b2_v = p;
  }
}
class C1_8<U = number, V = null> extends B1_8<U, V> {
  c1_v: U | V;
  constructor(p: U | V) {
    super();
    this.c1_v = p;
  }
}
class C2_8<U = number, V = string> extends B1_8<U, V> {
  c2_v: U | V;
  constructor(p: U | V) {
    super();
    this.c2_v = p;
  }
}
class Other_8<T = string> {
  other_v: T;
  constructor(p: T) {
    this.other_v = p;
  }
}

function check_C1_8(a: object) {
  expect(a instanceof C1_8).assertTrue();
  expect((a as C1_8).c1_v as number).assertEqual(321);
}
function check_C2_8(a: object) {
  expect(a instanceof C2_8).assertTrue();
  expect((a as C2_8).c2_v as number).assertEqual(6.7);
}
function check_B2_8(a: object) {
  expect(a instanceof B2_8).assertTrue();
  expect((a as B2_8).b2_v as bigint).assertEqual(123n);
}
function check_Other_8(a: object) {
  expect(a instanceof Other_8).assertTrue();
  expect((a as Other_8).other_v as string).assertEqual("other");
}

function foo_8(v: object): void {
  expect(v instanceof C1_8 || v instanceof C2_8 || v instanceof B2_8 || v instanceof Other_8).assertTrue();
}

function f1_8(v: C1_8 | C2_8 | B2_8 | Other_8): number {
  foo_8(v);
  return f2_8(v);
}

function f2_8(v: C1_8 | C2_8 | B2_8 | Other_8): number {
  if (v instanceof B1_8 || v instanceof Other_8) {
    check_C1_8(v);
    return 1;
  } else {
    expect(v instanceof C1_8 || v instanceof C2_8 || v instanceof B2_8 || v instanceof Other_8).assertTrue();
    expect(v instanceof object).assertTrue();
    foo_8(v);
    check_B2_8(v);
    return 2;
  }
}


namespace testNS1_9 {
  class C1_9<U, V> implements III1_9<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }

  class C2_9<U, V> implements III2_9<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }

  class C3_9<U, V> implements II2_9<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }

  function check_C1_9(a: object) {
    expect(a instanceof C1_9).assertEqual(true);
    expect(a instanceof C1_9).assertEqual(true); // 原接口检查改为类检查
    expect((a as C1_9<number, null>).c1_v as number).assertEqual(123);
  }

  function check_C2_9(a: object) {
    expect(a instanceof C2_9).assertEqual(true);
    expect((a as C2_9<number, string>).c2_v as number).assertEqual(6.7);
  }

  function check_C3_9(a: object) {
    expect(a instanceof C3_9).assertEqual(true);
    expect((a as C3_9<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }

  function foo_9(v: object): void {
    expect(v instanceof C1_9 || v instanceof C2_9 || v instanceof C3_9).assertEqual(true);
  }

  export function f1_9(v: III1_9<number, null> | III2_9<number, string> | II2_9<bigint, undefined>): number {
    foo_9(v);
    return f2_9(v);
  }

  export function f2_9(v: III1_9<number, null> | III2_9<number, string> | II2_9<bigint, undefined>): number {
    // 原条件 v instanceof II1_9 改为具体类检查
    if (v instanceof C1_9 || v instanceof C2_9) {
      check_C1_9(v);
      return 1;
    } else {
      expect(v instanceof C1_9 || v instanceof C2_9 || v instanceof C3_9).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_9(v);
      check_C3_9(v);
      return 2;
    }
  }

  export function runTest_9(): boolean {
    let res: number = f1_9(new C1_9<number, null>(123));
    expect(res).assertEqual(1);
    res = f1_9(new C3_9<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_9 {
  class C1_9<U, V> implements III1_9<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }

  class C2_9<U, V> implements III2_9<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }

  class C3_9<U, V> implements II2_9<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }

  function check_C1_9(a: object) {
    expect(a instanceof C1_9).assertEqual(true);
    expect((a as C1_9<number, null>).c1_v as number).assertEqual(123);
  }

  function check_C2_9(a: object) {
    expect(a instanceof C2_9).assertEqual(true);
    expect((a as C2_9<number, string>).c2_v as number).assertEqual(6.7);
  }

  function check_C3_9(a: object) {
    expect(a instanceof C3_9).assertEqual(true);
    expect((a as C3_9<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }

  function foo_9(v: object): void {
    expect(v instanceof C1_9 || v instanceof C2_9 || v instanceof C3_9).assertEqual(true);
  }

  export function f1_9(v: III1_9<number, null> | III2_9<number, string> | II2_9<bigint, undefined>): number {
    foo_9(v);
    return f2_9(v);
  }

  export function f2_9(v: III1_9<number, null> | III2_9<number, string> | II2_9<bigint, undefined>): number {
    if (v instanceof C1_9 || v instanceof C2_9) {
      check_C2_9(v);
      return 1;
    } else {
      expect(v instanceof C1_9 || v instanceof C2_9 || v instanceof C3_9).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_9(v);
      check_C3_9(v);
      return 2;
    }
  }

  export function runTest_9(): boolean {
    let res: number = f1_9(new C2_9<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1_9(new C3_9<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_9 {
  export class C1_9<U, V> implements III1_9<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }

  export class C2_9<U, V> implements III2_9<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }

  export class C3_9<U, V> implements II2_9<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }

  function check_C1_9(a: object) {
    expect(a instanceof C1_9).assertEqual(true);
    expect((a as C1_9<number, null>).c1_v as number).assertEqual(123);
  }

  function check_C2_9(a: object) {
    expect(a instanceof C2_9).assertEqual(true);
    expect((a as C2_9<number, string>).c2_v as number).assertEqual(6.7);
  }

  function check_C3_9(a: object) {
    expect(a instanceof C3_9).assertEqual(true);
    expect((a as C3_9<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }

  function foo_9(v: object): void {
    expect(v instanceof C1_9 || v instanceof C2_9 || v instanceof C3_9).assertEqual(true);
  }

  export function f1_9(v: III1_9<number, null> | III2_9<number, string> | II2_9<bigint, undefined>): number {
    foo_9(v);
    return f2_9(v);
  }

  export function f2_9(v: III1_9<number, null> | III2_9<number, string> | II2_9<bigint, undefined>): number {
    if (v instanceof C1_9 || v instanceof C2_9) {
      check_C1_9(v);
      return 1;
    } else {
      expect(v instanceof C1_9 || v instanceof C2_9 || v instanceof C3_9).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_9(v);
      check_C3_9(v);
      return 2;
    }
  }

  export function runTest_9(): boolean {
    let res: number = f1_9(new C1_9<number, null>(123));
    expect(res).assertEqual(1);
    res = f1_9(new C3_9<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}


namespace testNS1_10 {
  export class C1_10<U = number, V = null> implements III1_10<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }

  export class C2_10<U = number, V = string> implements III2_10<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }

  export class C3_10<U = bigint, V = undefined> implements II2_10<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }

  function check_C1_10(a: object) {
    expect(a instanceof C1_10).assertEqual(true);
    expect((a as C1_10).c1_v as number).assertEqual(123);
  }

  function check_C2_10(a: object) {
    expect(a instanceof C2_10).assertEqual(true);
    expect((a as C2_10).c2_v as number).assertEqual(6.7);
  }

  function check_C3_10(a: object) {
    expect(a instanceof C3_10).assertEqual(true);
    expect((a as C3_10).c3_v as bigint).assertEqual(321n);
  }

  function foo_10(v: object): void {
    expect(v instanceof C1_10 || v instanceof C2_10 || v instanceof C3_10).assertEqual(true);
  }

  export function f1_10(v: III1_10 | III2_10 | II2_10): number {
    foo_10(v);
    return f2_10(v);
  }

  export function f2_10(v: III1_10 | III2_10 | II2_10): number {
    if (v instanceof C1_10 || v instanceof C2_10) {
      check_C1_10(v);
      return 1;
    } else {
      expect(v instanceof C1_10 || v instanceof C2_10 || v instanceof C3_10).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_10(v);
      check_C3_10(v);
      return 2;
    }
  }

  export function runTest_10(): boolean {
    let res: number = f1_10(new C1_10(123));
    expect(res).assertEqual(1);
    res = f1_10(new C3_10(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_10 {
  class C1_10<U = number, V = null> implements III1_10<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }

  class C2_10<U = number, V = string> implements III2_10<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }

  class C3_10<U = bigint, V = undefined> implements II2_10<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }

  function check_C1_10(a: object) {
    expect(a instanceof C1_10).assertEqual(true);
    expect((a as C1_10).c1_v as number).assertEqual(123);
  }

  function check_C2_10(a: object) {
    expect(a instanceof C2_10).assertEqual(true);
    expect((a as C2_10).c2_v as number).assertEqual(6.7);
  }

  function check_C3_10(a: object) {
    expect(a instanceof C3_10).assertEqual(true);
    expect((a as C3_10).c3_v as bigint).assertEqual(321n);
  }

  function foo_10(v: object): void {
    expect(v instanceof C1_10 || v instanceof C2_10 || v instanceof C3_10).assertEqual(true);
  }

  export function f1_10(v: III1_10 | III2_10 | II2_10): number {
    foo_10(v);
    return f2_10(v);
  }

  export function f2_10(v: III1_10 | III2_10 | II2_10): number {
    if (v instanceof C1_10 || v instanceof C2_10) {
      check_C2_10(v);
      return 1;
    } else {
      expect(v instanceof C1_10 || v instanceof C2_10 || v instanceof C3_10).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_10(v);
      check_C3_10(v);
      return 2;
    }
  }

  export function runTest_10(): boolean {
    let res: number = f1_10(new C2_10(6.7));
    expect(res).assertEqual(1);
    res = f1_10(new C3_10(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_10 {
  export class C1_10<U = number, V = null> implements III1_10<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }

  export class C2_10<U = number, V = string> implements III2_10<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }

  export class C3_10<U = bigint, V = undefined> implements II2_10<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }

  function check_C1_10(a: object) {
    expect(a instanceof C1_10).assertEqual(true);
    expect((a as C1_10).c1_v as number).assertEqual(123);
  }

  function check_C2_10(a: object) {
    expect(a instanceof C2_10).assertEqual(true);
    expect((a as C2_10).c2_v as number).assertEqual(6.7);
  }

  function check_C3_10(a: object) {
    expect(a instanceof C3_10).assertEqual(true);
    expect((a as C3_10).c3_v as bigint).assertEqual(321n);
  }

  function foo_10(v: object): void {
    expect(v instanceof C1_10 || v instanceof C2_10 || v instanceof C3_10).assertEqual(true);
  }

  export function f1_10(v: III1_10 | III2_10 | II2_10): number {
    foo_10(v);
    return f2_10(v);
  }

  export function f2_10(v: III1_10 | III2_10 | II2_10): number {
    if (v instanceof C1_10 || v instanceof C2_10) {
      check_C1_10(v);
      return 1;
    } else {
      expect(v instanceof C1_10 || v instanceof C2_10 || v instanceof C3_10).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_10(v);
      check_C3_10(v);
      return 2;
    }
  }

  export function runTest_10(): boolean {
    let res: number = f1_10(new C1_10(123));
    expect(res).assertEqual(1);
    res = f1_10(new C3_10(321n));
    expect(res).assertEqual(2);
    return true;
  }
}


namespace testNS1_11 {
  class C1_11<U, V> implements III1_11<U, V>, III2_11<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }

  class C2_11<U, V> implements II2_11<U, V>, III2_11<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }

  class C3_11<U, V> implements III1_11<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }

  function check_C1_11(a: object) {
    expect(a instanceof C1_11).assertEqual(true);
    expect((a as C1_11<number, null>).c1_v as number).assertEqual(123);
  }

  function check_C2_11(a: object) {
    expect(a instanceof C2_11).assertEqual(true);
    expect((a as C2_11<number, string>).c2_v as number).assertEqual(6.7);
  }

  function check_C3_11(a: object) {
    expect(a instanceof C3_11).assertEqual(true);
    expect((a as C3_11<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }

  function foo_11(v: object): void {
    expect(v instanceof C1_11 || v instanceof C2_11 || v instanceof C3_11).assertEqual(true);
  }

  export function f1_11(v: III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>): number {
    foo_11(v);
    return f2_11(v);
  }

  export function f2_11(v: III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>): number {
    if (v instanceof C1_11 || v instanceof C2_11) {
      check_C1_11(v);
      return 1;
    } else {
      expect(v instanceof C1_11 || v instanceof C2_11 || v instanceof C3_11).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_11(v);
      check_C3_11(v);
      return 2;
    }
  }

  export function runTest_11(): boolean {
    let res: number = f1_11(new C1_11<number, null>(123));
    expect(res).assertEqual(1);
    res = f1_11(new C3_11<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_11 {
  class C1_11<U, V> implements III1_11<U, V>, III2_11<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }

  class C2_11<U, V> implements II2_11<U, V>, III2_11<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }

  class C3_11<U, V> implements III1_11<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }

  function check_C1_11(a: object) {
    expect(a instanceof C1_11).assertEqual(true);
    expect((a as C1_11<number, null>).c1_v as number).assertEqual(123);
  }

  function check_C2_11(a: object) {
    expect(a instanceof C2_11).assertEqual(true);
    expect((a as C2_11<number, string>).c2_v as number).assertEqual(6.7);
  }

  function check_C3_11(a: object) {
    expect(a instanceof C3_11).assertEqual(true);
    expect((a as C3_11<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }

  function foo_11(v: object): void {
    expect(v instanceof C1_11 || v instanceof C2_11 || v instanceof C3_11).assertEqual(true);
  }

  export function f1_11(v: III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>): number {
    foo_11(v);
    return f2_11(v);
  }

  export function f2_11(v: III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>): number {
    if (v instanceof C1_11 || v instanceof C2_11) {
      check_C2_11(v);
      return 1;
    } else {
      expect(v instanceof C1_11 || v instanceof C2_11 || v instanceof C3_11).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_11(v);
      check_C3_11(v);
      return 2;
    }
  }

  export function runTest_11(): boolean {
    let res: number = f1_11(new C2_11<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1_11(new C3_11<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_11 {
  export class C1_11<U, V> implements III1_11<U, V>, III2_11<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }

  export class C2_11<U, V> implements II2_11<U, V>, III2_11<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }

  export class C3_11<U, V> implements III1_11<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }

  function check_C1_11(a: object) {
    expect(a instanceof C1_11).assertEqual(true);
    expect((a as C1_11<number, null>).c1_v as number).assertEqual(123);
  }

  function check_C2_11(a: object) {
    expect(a instanceof C2_11).assertEqual(true);
    expect((a as C2_11<number, string>).c2_v as number).assertEqual(6.7);
  }

  function check_C3_11(a: object) {
    expect(a instanceof C3_11).assertEqual(true);
    expect((a as C3_11<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }

  function foo_11(v: object): void {
    expect(v instanceof C1_11 || v instanceof C2_11 || v instanceof C3_11).assertEqual(true);
  }

  export function f1_11(v: III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>): number {
    foo_11(v);
    return f2_11(v);
  }

  export function f2_11(v: III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>): number {
    if (v instanceof C1_11 || v instanceof C2_11) {
      check_C1_11(v);
      return 1;
    } else {
      expect(v instanceof C1_11 || v instanceof C2_11 || v instanceof C3_11).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_11(v);
      check_C3_11(v);
      return 2;
    }
  }

  export function runTest_11(): boolean {
    let res: number = f1_11(new C1_11<number, null>(123));
    expect(res).assertEqual(1);
    res = f1_11(new C3_11<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}


namespace testNS1_12 {
  export class C1_12<in T1, out T2> {
    readonly c1_v: T2;
    constructor(p: T2) {
      this.c1_v = p;
    }
  }
  export class C2_12<out T1, in T2> {
    readonly c2_v: T1;
    constructor(p: T1) {
      this.c2_v = p;
    }
  }
  export class Base_12 {
    b_v: bigint;
    constructor(p: bigint) {
      this.b_v = p;
    }
  }
  export class Derived_12 extends Base_12 {
    d_v: number;
    constructor(p: number) {
      super(0n);
      this.d_v = p;
    }
  }
  function check_C1_12(a: object) {
    expect(a instanceof C1_12).assertEqual(true);
    expect(((a as C1_12<Base_12, Base_12>).c1_v as Base_12).b_v).assertEqual(123n);
  }
  function check_C2_12(a: object) {
    expect(a instanceof C2_12).assertEqual(true);
    expect(((a as C2_12<Derived_12, Base_12>).c2_v as Derived_12).d_v).assertEqual(321);
  }
  function foo_12(v: object): void {
    expect(v instanceof C1_12 || v instanceof C2_12).assertEqual(true);
  }
  export function f1_12(v: C1_12<Derived_12, Base_12> | C2_12<Base_12, Derived_12>): number {
    foo_12(v);
    return f2_12(v);
  }
  export function f2_12(v: C1_12<Derived_12, Base_12> | C2_12<Base_12, Derived_12>): number {
    if (v instanceof C2_12) {
      check_C2_12(v);
      return 1;
    } else {
      expect(v instanceof C1_12 || v instanceof C2_12).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_12(v);
      check_C1_12(v);
      return 2;
    }
  }

  export function runTest_12(): boolean {
    let res: number = f1_12(new C2_12<Derived_12, Base_12>(new Derived_12(321)));
    expect(res).assertEqual(1);
    res = f1_12(new C1_12<Base_12, Base_12>(new Base_12(123n)));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_12 {
  export class C1_12<in T1, out T2> {
    readonly c1_v: T2;
    constructor(p: T2) {
      this.c1_v = p;
    }
  }
  export class C2_12<out T1, in T2> {
    readonly c2_v: T1;
    constructor(p: T1) {
      this.c2_v = p;
    }
  }
  export class Base_12 {
    b_v: bigint;
    constructor(p: bigint) {
      this.b_v = p;
    }
  }
  export class Derived_12 extends Base_12 {
    d_v: number;
    constructor(p: number) {
      super(0n);
      this.d_v = p;
    }
  }
  function check_C1_12(a: object) {
    expect(a instanceof C1_12).assertEqual(true);
    expect(((a as C1_12<Base_12, Base_12>).c1_v as Base_12).b_v).assertEqual(123n);
  }
  function check_C2_12(a: object) {
    expect(a instanceof C2_12).assertEqual(true);
    expect(((a as C2_12<Derived_12, Base_12>).c2_v as Derived_12).d_v).assertEqual(321);
  }
  function foo_12(v: object): void {
    expect(v instanceof C1_12 || v instanceof C2_12).assertEqual(true);
  }
  export function f1_12(v: C1_12<Derived_12, Base_12> | C2_12<Base_12, Derived_12>): number {
    foo_12(v);
    return f2_12(v);
  }
  export function f2_12(v: C1_12<Derived_12, Base_12> | C2_12<Base_12, Derived_12>): number {
    if (v instanceof C2_12) {
      check_C2_12(v);
      return 1;
    } else {
      expect(v instanceof C1_12 || v instanceof C2_12).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_12(v);
      check_C1_12(v);
      return 2;
    }
  }

  export function runTest_12(): boolean {
    let res: number = f1_12(new C2_12<Derived_12, Base_12>(new Derived_12(321)));
    expect(res).assertEqual(1);
    res = f1_12(new C1_12<Base_12, Base_12>(new Base_12(123n)));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_12 {
  export class C1_12<in T1, out T2> {
    readonly c1_v: T2;
    constructor(p: T2) {
      this.c1_v = p;
    }
  }
  export class C2_12<out T1, in T2> {
    readonly c2_v: T1;
    constructor(p: T1) {
      this.c2_v = p;
    }
  }
  export class Base_12 {
    b_v: bigint;
    constructor(p: bigint) {
      this.b_v = p;
    }
  }
  export class Derived_12 extends Base_12 {
    d_v: number;
    constructor(p: number) {
      super(0n);
      this.d_v = p;
    }
  }
  function check_C1_12(a: object) {
    expect(a instanceof C1_12).assertEqual(true);
    expect(((a as C1_12<Base_12, Base_12>).c1_v as Base_12).b_v).assertEqual(123n);
  }
  function check_C2_12(a: object) {
    expect(a instanceof C2_12).assertEqual(true);
    expect(((a as C2_12<Derived_12, Base_12>).c2_v as Derived_12).d_v).assertEqual(321);
  }
  function foo_12(v: object): void {
    expect(v instanceof C1_12 || v instanceof C2_12).assertEqual(true);
  }
  export function f1_12(v: C1_12<Derived_12, Base_12> | C2_12<Base_12, Derived_12>): number {
    foo_12(v);
    return f2_12(v);
  }
  export function f2_12(v: C1_12<Derived_12, Base_12> | C2_12<Base_12, Derived_12>): number {
    if (v instanceof C2_12) {
      check_C2_12(v);
      return 1;
    } else {
      expect(v instanceof C1_12 || v instanceof C2_12).assertEqual(true);
      expect(v instanceof Object).assertEqual(true);
      foo_12(v);
      check_C1_12(v);
      return 2;
    }
  }

  export function runTest_12(): boolean {
    let res: number = f1_12(new C2_12<Derived_12, Base_12>(new Derived_12(321)));
    expect(res).assertEqual(1);
    res = f1_12(new C1_12<Base_12, Base_12>(new Base_12(123n)));
    expect(res).assertEqual(2);
    return true;
  }
}
export default function DiffTypeIsSubOfTypeObjOnGenTest01(): void {
  describe('DiffTypeIsSubOfTypeObjOnGenTest01', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0700
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGen0007
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnGen0007';

      let res: number = f1_7(new C1_7<number, null>(321));
      expect(res).assertEqual(1);
      res = f1_7(new B2_7<bigint, undefined>(123n));
      expect(res).assertEqual(2);
      expect(testNS1_7.runTest()).assertTrue();
      expect(testNS2_7.runTest()).assertTrue();
      expect(testNS3_7.runTest()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0800
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGen0008
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGen0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnGen0008';

      let res: number = f1_8(new C1_8(321));
      expect(res).assertEqual(1);
      res = f1_8(new B2_8(123n));
      expect(res).assertEqual(2);
      expect(testNS1_8.runTest()).assertTrue();
      expect(testNS2_8.runTest()).assertTrue();
      expect(testNS3_8.runTest()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0900
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGen0009
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGen0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnGen0009';

      let res: number = testNS3_9.f1_9(new testNS3_9.C1_9<number, null>(123));
      expect(res).assertEqual(1);
      res = testNS3_9.f1_9(new testNS3_9.C3_9<bigint, undefined>(321n));
      expect(res).assertEqual(2);
      expect(testNS1_9.runTest_9()).assertEqual(true);
      expect(testNS2_9.runTest_9()).assertEqual(true);
      expect(testNS3_9.runTest_9()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_1000
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGen0010
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGen0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnGen0010';

      let res: number = testNS3_10.f1_10(new testNS3_10.C1_10(123));
      expect(res).assertEqual(1);
      res = testNS3_10.f1_10(new testNS3_10.C3_10(321n));
      expect(res).assertEqual(2);
      expect(testNS1_10.runTest_10()).assertEqual(true);
      expect(testNS2_10.runTest_10()).assertEqual(true);
      expect(testNS3_10.runTest_10()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_1100
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGen0011
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGen0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnGen0011';

      let res: number = testNS3_11.f1_11(new testNS3_11.C1_11<number, null>(123));
      expect(res).assertEqual(1);
      res = testNS3_11.f1_11(new testNS3_11.C3_11<bigint, undefined>(321n));
      expect(res).assertEqual(2);
      expect(testNS1_11.runTest_11()).assertEqual(true);
      expect(testNS2_11.runTest_11()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_1200
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGen0012
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGen0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnGen0012';

      let res: number =
        testNS3_12.f1_12(new testNS3_12.C2_12<testNS3_12.Derived_12, testNS3_12.Base_12>(new testNS3_12.Derived_12(321)));
      expect(res).assertEqual(1);
      res = testNS3_12.f1_12(new testNS3_12.C1_12<testNS3_12.Base_12, testNS3_12.Base_12>(new testNS3_12.Base_12(123n)));
      expect(res).assertEqual(2);
      expect(testNS1_12.runTest_12()).assertEqual(true);
    });
  });
}