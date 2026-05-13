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
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}
namespace testNS1_1 {
  export abstract class A_1<U, V> {}
  export abstract class B1_1<U, V> extends A_1<U, V> {}
  export class B2_1<U, V> extends A_1<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  export class C1_1<U, V> extends B1_1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  export class C2_1<U, V> extends B1_1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other_1<T> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1_1(a: object) {
    expect(a instanceof C1_1).assertTrue()
    expect((a as C1_1<number, null>).c1_v as number).assertEqual(321)
  }
  function check_C2_1(a: object) {
    expect(a instanceof C2_1).assertTrue()
    expect((a as C2_1<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_B2_1(a: object) {
    expect(a instanceof B2_1).assertTrue()
    expect((a as B2_1<bigint, undefined>).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_1(a: object) {
    expect(a instanceof Other_1).assertTrue()
    expect((a as Other_1<string>).other_v as string).assertEqual("other")
  }
  function foo_1(v: object): void {
    expect(v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1).assertTrue()
  }
  function f1_1(v: C1_1<number, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>): number {
    expect(v instanceof object).assertTrue()
    foo_1(v)
    return f2_1(v)
  }
  function f2_1(v: C1_1<number, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>): number {
    if (v instanceof B1_1 || v instanceof Other_1) {
      check_C1_1(v)
      return 1
    } else {
      expect(v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1).assertTrue()
      expect(v instanceof object).assertTrue()
      foo_1(v)
      check_B2_1(v)
      return 2
    }
  }
  export function runTest(): boolean {
    let res: number = f1_1(new C1_1<number, null>(321))
    expect(res).assertEqual(1)
    res = f1_1(new B2_1<bigint, undefined>(123n))
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_1 {
  export abstract class A_1<U, V> {}
  export abstract class B1_1<U, V> extends A_1<U, V> {}
  export class B2_1<U, V> extends A_1<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  class C1_1<U, V> extends B1_1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_1<U, V> extends B1_1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other_1<T> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1_1(a: object) {
    expect(a instanceof C1_1).assertTrue()
    expect((a as C1_1<number, null>).c1_v as number).assertEqual(321)
  }
  function check_C2_1(a: object) {
    expect(a instanceof C2_1).assertTrue()
    expect((a as C2_1<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_B2_1(a: object) {
    expect(a instanceof B2_1).assertTrue()
    expect((a as B2_1<bigint, undefined>).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_1(a: object) {
    expect(a instanceof Other_1).assertTrue()
    expect((a as Other_1<string>).other_v as string).assertEqual("other")
  }
  function foo_1(v: object): void {
    expect(v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1).assertTrue()
  }
  function f1_1(v: C1_1<number, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>): number {
    expect(v instanceof object).assertTrue()
    foo_1(v)
    return f2_1(v)
  }
  function f2_1(v: C1_1<number, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>): number {
    if (v instanceof B1_1 || v instanceof Other_1) {
      check_C2_1(v)
      return 1
    } else {
      expect(v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1).assertTrue()
      expect(v instanceof object).assertTrue()
      foo_1(v)
      check_B2_1(v)
      return 2
    }
  }
  export function runTest(): boolean {
    let res: number = f1_1(new C2_1<number, string>(6.7))
    expect(res).assertEqual(1)
    res = f1_1(new B2_1<bigint, undefined>(123n))
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS3_1 {
  abstract class A_1<U, V> {}
  abstract class B1_1<U, V> extends A_1<U, V> {}
  class B2_1<U, V> extends A_1<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  class C1_1<U, V> extends B1_1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_1<U, V> extends B1_1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other_1<T> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1_1(a: object) {
    expect(a instanceof C1_1).assertTrue()
    expect((a as C1_1<number, null>).c1_v as number).assertEqual(321)
  }
  function check_C2_1(a: object) {
    expect(a instanceof C2_1).assertTrue()
    expect((a as C2_1<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_B2_1(a: object) {
    expect(a instanceof B2_1).assertTrue()
    expect((a as B2_1<bigint, undefined>).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_1(a: object) {
    expect(a instanceof Other_1).assertTrue()
    expect((a as Other_1<string>).other_v as string).assertEqual("other")
  }
  function foo_1(v: object): void {
    expect(v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1).assertTrue()
  }
  function f1_1(v: C1_1<number, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>): number {
    expect(v instanceof object).assertTrue()
    foo_1(v)
    return f2_1(v)
  }
  function f2_1(v: C1_1<number, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>): number {
    if (v instanceof B1_1 || v instanceof Other_1) {
      check_Other_1(v)
      return 1
    } else {
      expect(v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1).assertTrue()
      expect(v instanceof object).assertTrue()
      foo_1(v)
      check_B2_1(v)
      return 2
    }
  }
  export function runTest(): boolean {
    let res: number = f1_1(new Other_1<string>("other"))
    expect(res).assertEqual(1)
    res = f1_1(new B2_1<bigint, undefined>(123n))
    expect(res).assertEqual(2)
    return true
  }
}

abstract class A_1<U, V> {}
abstract class B1_1<U, V> extends A_1<U, V> {}
class B2_1<U, V> extends A_1<U, V> {
  b2_v: U | V
  constructor (p: U | V) {
    this.b2_v = p
  }
}
class C1_1<U, V> extends B1_1<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_1<U, V> extends B1_1<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class Other_1<T> {
  other_v: T
  constructor (p: T) {
    this.other_v = p
  }
}
function check_C1_1(a: object) {
  expect(a instanceof C1_1).assertTrue()
  expect((a as C1_1<number, null>).c1_v as number).assertEqual(321)
}
function check_C2_1(a: object) {
  expect(a instanceof C2_1).assertTrue()
  expect((a as C2_1<number, string>).c2_v as number).assertEqual(6.7)
}
function check_B2_1(a: object) {
  expect(a instanceof B2_1).assertTrue()
  expect((a as B2_1<bigint, undefined>).b2_v as bigint).assertEqual(123n)
}
function check_Other_1(a: object) {
  expect(a instanceof Other_1).assertTrue()
  expect((a as Other_1<string>).other_v as string).assertEqual("other")
}
function foo_1(v: object): void {
  expect(v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1).assertTrue()
}
function f1_1(v: C1_1<number, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>): number {
  expect(v instanceof object).assertTrue()
  foo_1(v)
  return f2_1(v)
}
function f2_1(v: C1_1<number, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>): number {
  if (v instanceof B1_1 || v instanceof Other_1) {
    check_C1_1(v)
    return 1
  } else {
    expect(v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1).assertTrue()
    expect(v instanceof object).assertTrue()
    foo_1(v)
    check_B2_1(v)
    return 2
  }
}

namespace testNS1_2 {
  abstract class A_2<U, V> {}
  abstract class B1_2<U, V> extends A_2<U, V> {}
  class B2_2<U=bigint, V=undefined> extends A_2<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  class C1_2<U = number, V = null> extends B1_2<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_2<U = number, V = string> extends B1_2<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other_2<T = string> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1_2(a: object) {
    expect(a instanceof C1_2).assertTrue()
    expect((a as C1_2).c1_v as number).assertEqual(321)
  }
  function check_C2_2(a: object) {
    expect(a instanceof C2_2).assertTrue()
    expect((a as C2_2).c2_v as number).assertEqual(6.7)
  }
  function check_B2_2(a: object) {
    expect(a instanceof B2_2).assertTrue()
    expect((a as B2_2).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_2(a: object) {
    expect(a instanceof Other_2).assertTrue()
    expect((a as Other_2).other_v as string).assertEqual("other")
  }
  function foo_2(v: object): void {
    expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue()
  }
  function f1_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
    expect(v instanceof object).assertTrue()
    foo_2(v)
    return f2_2(v)
  }
  function f2_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
    if (v instanceof B1_2 || v instanceof Other_2) {
      check_C1_2(v)
      return 1
    } else {
      expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue()
      expect(v instanceof object).assertTrue()
      foo_2(v)
      check_B2_2(v)
      return 2
    }
  }
  export function runTest(): boolean {
    let res: number = f1_2(new C1_2(321))
    expect(res).assertEqual(1)
    res = f1_2(new B2_2(123n))
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_2 {
  abstract class A_2<U, V> {}
  abstract class B1_2<U, V> extends A_2<U, V> {}
  class B2_2<U=bigint, V=undefined> extends A_2<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  class C1_2<U = number, V = null> extends B1_2<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_2<U = number, V = string> extends B1_2<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other_2<T = string> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1_2(a: object) {
    expect(a instanceof C1_2).assertTrue()
    expect((a as C1_2).c1_v as number).assertEqual(321)
  }
  function check_C2_2(a: object) {
    expect(a instanceof C2_2).assertTrue()
    expect((a as C2_2).c2_v as number).assertEqual(6.7)
  }
  function check_B2_2(a: object) {
    expect(a instanceof B2_2).assertTrue()
    expect((a as B2_2).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_2(a: object) {
    expect(a instanceof Other_2).assertTrue()
    expect((a as Other_2).other_v as string).assertEqual("other")
  }
  function foo_2(v: object): void {
    expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue()
  }
  function f1_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
    expect(v instanceof object).assertTrue()
    foo_2(v)
    return f2_2(v)
  }
  function f2_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
    if (v instanceof B1_2 || v instanceof Other_2) {
      check_C2_2(v)
      return 1
    } else {
      expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue()
      expect(v instanceof object).assertTrue()
      foo_2(v)
      check_B2_2(v)
      return 2
    }
  }
  export function runTest(): boolean {
    let res: number = f1_2(new C2_2(6.7))
    expect(res).assertEqual(1)
    res = f1_2(new B2_2(123n))
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS3_2 {
  abstract class A_2<U, V> {}
  abstract class B1_2<U, V> extends A_2<U, V> {}
  class B2_2<U=bigint, V=undefined> extends A_2<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  class C1_2<U = number, V = null> extends B1_2<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_2<U = number, V = string> extends B1_2<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other_2<T = string> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1_2(a: object) {
    expect(a instanceof C1_2).assertTrue()
    expect((a as C1_2).c1_v as number).assertEqual(321)
  }
  function check_C2_2(a: object) {
    expect(a instanceof C2_2).assertTrue()
    expect((a as C2_2).c2_v as number).assertEqual(6.7)
  }
  function check_B2_2(a: object) {
    expect(a instanceof B2_2).assertTrue()
    expect((a as B2_2).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_2(a: object) {
    expect(a instanceof Other_2).assertTrue()
    expect((a as Other_2).other_v as string).assertEqual("other")
  }
  function foo_2(v: object): void {
    expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue()
  }
  function f1_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
    expect(v instanceof object).assertTrue()
    foo_2(v)
    return f2_2(v)
  }
  function f2_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
    if (v instanceof B1_2 || v instanceof Other_2) {
      check_Other_2(v)
      return 1
    } else {
      expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue()
      expect(v instanceof object).assertTrue()
      foo_2(v)
      check_B2_2(v)
      return 2
    }
  }
  export function runTest(): boolean {
    let res: number = f1_2(new Other_2("other"))
    expect(res).assertEqual(1)
    res = f1_2(new B2_2(123n))
    expect(res).assertEqual(2)
    return true
  }
}

abstract class A_2<U, V> {}
abstract class B1_2<U, V> extends A_2<U, V> {}
class B2_2<U=bigint, V=undefined> extends A_2<U, V> {
  b2_v: U | V
  constructor (p: U | V) {
    this.b2_v = p
  }
}
class C1_2<U = number, V = null> extends B1_2<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_2<U = number, V = string> extends B1_2<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class Other_2<T = string> {
  other_v: T
  constructor (p: T) {
    this.other_v = p
  }
}
function check_C1_2(a: object) {
  expect(a instanceof C1_2).assertTrue()
  expect((a as C1_2).c1_v as number).assertEqual(321)
}
function check_C2_2(a: object) {
  expect(a instanceof C2_2).assertTrue()
  expect((a as C2_2).c2_v as number).assertEqual(6.7)
}
function check_B2_2(a: object) {
  expect(a instanceof B2_2).assertTrue()
  expect((a as B2_2).b2_v as bigint).assertEqual(123n)
}
function check_Other_2(a: object) {
  expect(a instanceof Other_2).assertTrue()
  expect((a as Other_2).other_v as string).assertEqual("other")
}
function foo_2(v: object): void {
  expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue()
}
function f1_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
  expect(v instanceof object).assertTrue()
  foo_2(v)
  return f2_2(v)
}
function f2_2(v: C1_2 | C2_2 | B2_2 | Other_2): number {
  if (v instanceof B1_2 || v instanceof Other_2) {
    check_C1_2(v)
    return 1
  } else {
    expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue()
    expect(v instanceof object).assertTrue()
    foo_2(v)
    check_B2_2(v)
    return 2
  }
}


namespace testNS1_3 {
  interface I1_3<U, V> {}
  interface I2_3<U, V> {}
  interface II1_3<U, V> extends I1_3<U, V>, I2_3<U, V> {}
  interface II2_3<U, V> extends I1_3<U, V>, I2_3<U, V> {}
  interface III1_3<U, V> extends II1_3<U, V> {}
  interface III2_3<U, V> extends II1_3<U, V> {}
  class C1_3<U, V> implements III1_3<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_3<U, V> implements III2_3<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_3<U, V> implements II2_3<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_3(a: object) {
    expect(a instanceof C1_3).assertTrue()
    expect(a instanceof III1_3).assertTrue()
    expect(a instanceof II1_3).assertTrue()
    expect(a instanceof I1_3).assertTrue()
    expect(a instanceof I2_3).assertTrue()
    expect((a as C1_3<number, null>).c1_v as number).assertEqual(123)
  }
  function check_C2_3(a: object) {
    expect(a instanceof C2_3).assertTrue()
    expect(a instanceof III2_3).assertTrue()
    expect(a instanceof II1_3).assertTrue()
    expect(a instanceof I1_3).assertTrue()
    expect(a instanceof I2_3).assertTrue()
    expect((a as C2_3<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_3(a: object) {
    expect(a instanceof C3_3).assertTrue()
    expect(a instanceof II2_3).assertTrue()
    expect(a instanceof I1_3).assertTrue()
    expect(a instanceof I2_3).assertTrue()
    expect((a as C3_3<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function foo_3(v: object): void {
    expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertTrue()
  }
  function f1_3(v: III1_3<number, null> | III2_3<number, string> | II2_3<bigint, undefined>): number {
    expect(v instanceof object).assertTrue()
    foo_3(v)
    return f2_3(v)
  }
  function f2_3(v: III1_3<number, null> | III2_3<number, string> | II2_3<bigint, undefined>): number {
    if (v instanceof II1_3) {
      check_C1_3(v)
      return 1
    }
    else {
      expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertTrue()
      expect(v instanceof object).assertTrue()
      foo_3(v)
      check_C3_3(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1_3(new C1_3<number, null>(123))
    expect(res).assertEqual(1)
    res = f1_3(new C3_3<bigint, undefined>(321n))
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_3 {
  interface I1_3<U, V> {}
  interface I2_3<U, V> {}
  interface II1_3<U, V> extends I1_3<U, V>, I2_3<U, V> {}
  interface II2_3<U, V> extends I1_3<U, V>, I2_3<U, V> {}
  interface III1_3<U, V> extends II1_3<U, V> {}
  interface III2_3<U, V> extends II1_3<U, V> {}
  class C1_3<U, V> implements III1_3<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_3<U, V> implements III2_3<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_3<U, V> implements II2_3<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_3(a: object) {
    expect(a instanceof C1_3).assertTrue()
    expect(a instanceof III1_3).assertTrue()
    expect(a instanceof II1_3).assertTrue()
    expect(a instanceof I1_3).assertTrue()
    expect(a instanceof I2_3).assertTrue()
    expect((a as C1_3<number, null>).c1_v as number).assertEqual(123)
  }
  function check_C2_3(a: object) {
    expect(a instanceof C2_3).assertTrue()
    expect(a instanceof III2_3).assertTrue()
    expect(a instanceof II1_3).assertTrue()
    expect(a instanceof I1_3).assertTrue()
    expect(a instanceof I2_3).assertTrue()
    expect((a as C2_3<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_3(a: object) {
    expect(a instanceof C3_3).assertTrue()
    expect(a instanceof II2_3).assertTrue()
    expect(a instanceof I1_3).assertTrue()
    expect(a instanceof I2_3).assertTrue()
    expect((a as C3_3<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function foo_3(v: object): void {
    expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertTrue()
  }
  function f1_3(v: III1_3<number, null> | III2_3<number, string> | II2_3<bigint, undefined>): number {
    expect(v instanceof object).assertTrue()
    foo_3(v)
    return f2_3(v)
  }
  function f2_3(v: III1_3<number, null> | III2_3<number, string> | II2_3<bigint, undefined>): number {
    if (v instanceof II1_3) {
      check_C2_3(v)
      return 1
    }
    else {
      expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertTrue()
      expect(v instanceof object).assertTrue()
      foo_3(v)
      check_C3_3(v)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1_3(new C2_3<number, string>(6.7))
    expect(res).assertEqual(1)
    res = f1_3(new C3_3<bigint, undefined>(321n))
    expect(res).assertEqual(2)
    return true
  }
}

interface I1_3<U, V> {}
interface I2_3<U, V> {}
interface II1_3<U, V> extends I1_3<U, V>, I2_3<U, V> {}
interface II2_3<U, V> extends I1_3<U, V>, I2_3<U, V> {}
interface III1_3<U, V> extends II1_3<U, V> {}
interface III2_3<U, V> extends II1_3<U, V> {}
class C1_3<U, V> implements III1_3<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_3<U, V> implements III2_3<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class C3_3<U, V> implements II2_3<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_3(a: object) {
  expect(a instanceof C1_3).assertTrue()
  expect(a instanceof III1_3).assertTrue()
  expect(a instanceof II1_3).assertTrue()
  expect(a instanceof I1_3).assertTrue()
  expect(a instanceof I2_3).assertTrue()
  expect((a as C1_3<number, null>).c1_v as number).assertEqual(123)
}
function check_C2_3(a: object) {
  expect(a instanceof C2_3).assertTrue()
  expect(a instanceof III2_3).assertTrue()
  expect(a instanceof II1_3).assertTrue()
  expect(a instanceof I1_3).assertTrue()
  expect(a instanceof I2_3).assertTrue()
  expect((a as C2_3<number, string>).c2_v as number).assertEqual(6.7)
}
function check_C3_3(a: object) {
  expect(a instanceof C3_3).assertTrue()
  expect(a instanceof II2_3).assertTrue()
  expect(a instanceof I1_3).assertTrue()
  expect(a instanceof I2_3).assertTrue()
  expect((a as C3_3<bigint, undefined>).c3_v as bigint).assertEqual(321n)
}
function foo_3(v: object): void {
  expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertTrue()
}
function f1_3(v: III1_3<number, null> | III2_3<number, string> | II2_3<bigint, undefined>): number {
  expect(v instanceof object).assertTrue()
  foo_3(v)
  return f2_3(v)
}
function f2_3(v: III1_3<number, null> | III2_3<number, string> | II2_3<bigint, undefined>): number {
  if (v instanceof II1_3) {
    check_C1_3(v)
    return 1
  }
  else {
    expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertTrue()
    expect(v instanceof object).assertTrue()
    foo_3(v)
    check_C3_3(v)
    return 2
  }
}

namespace testNS1_4 {
  interface I1_4<U, V> {}
  interface I2_4<U, V> {}
  interface II1_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
  interface II2_4<U = bigint, V = undefined> extends I1_4<U, V>, I2_4<U, V> {}
  interface III1_4<U = number, V = null> extends II1_4<U, V> {}
  interface III2_4<U = number, V = string> extends II1_4<U, V> {}
  class C1_4<U = number, V = null> implements III1_4<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_4<U = number, V = string> implements III2_4<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_4<U = bigint, V = undefined> implements II2_4<U, V> {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_4(a: object) {
    expect(a instanceof C1_4).assertTrue();
    expect(a instanceof III1_4).assertTrue();
    expect(a instanceof II1_4).assertTrue();
    expect(a instanceof I1_4).assertTrue();
    expect(a instanceof I2_4).assertTrue();
    expect((a as C1_4).c1_v as number).assertEqual(123);
  }
  function check_C2_4(a: object) {
    expect(a instanceof C2_4).assertTrue();
    expect(a instanceof III2_4).assertTrue();
    expect(a instanceof II1_4).assertTrue();
    expect(a instanceof I1_4).assertTrue();
    expect(a instanceof I2_4).assertTrue();
    expect((a as C2_4).c2_v as number).assertEqual(6.7);
  }
  function check_C3_4(a: object) {
    expect(a instanceof C3_4).assertTrue();
    expect(a instanceof II2_4).assertTrue();
    expect(a instanceof I1_4).assertTrue();
    expect(a instanceof I2_4).assertTrue();
    expect((a as C3_4).c3_v as bigint).assertEqual(321n);
  }
  function foo_4(v: object): void {
    expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertTrue();
  }
  function f1_4(v: III1_4 | III2_4 | II2_4): number {
    expect(v instanceof object).assertTrue();
    foo_4(v);
    return f2_4(v);
  }
  function f2_4(v: III1_4 | III2_4 | II2_4): number {
    if (v instanceof II1_4) {
      check_C1_4(v);
      return 1;
    } else {
      expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertTrue();
      expect(v instanceof object).assertTrue();
      foo_4(v);
      check_C3_4(v);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1_4(new C1_4(123));
    expect(res).assertEqual(1);
    res = f1_4(new C3_4(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_4 {
  interface I1_4<U, V> {}
  interface I2_4<U, V> {}
  interface II1_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
  interface II2_4<U = bigint, V = undefined> extends I1_4<U, V>, I2_4<U, V> {}
  interface III1_4<U = number, V = null> extends II1_4<U, V> {}
  interface III2_4<U = number, V = string> extends II1_4<U, V> {}
  class C1_4<U = number, V = null> implements III1_4<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2_4<U = number, V = string> implements III2_4<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3_4<U = bigint, V = undefined> implements II2_4<U, V> {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1_4(a: object) {
    expect(a instanceof C1_4).assertTrue();
    expect(a instanceof III1_4).assertTrue();
    expect(a instanceof II1_4).assertTrue();
    expect(a instanceof I1_4).assertTrue();
    expect(a instanceof I2_4).assertTrue();
    expect((a as C1_4).c1_v as number).assertEqual(123);
  }
  function check_C2_4(a: object) {
    expect(a instanceof C2_4).assertTrue();
    expect(a instanceof III2_4).assertTrue();
    expect(a instanceof II1_4).assertTrue();
    expect(a instanceof I1_4).assertTrue();
    expect(a instanceof I2_4).assertTrue();
    expect((a as C2_4).c2_v as number).assertEqual(6.7);
  }
  function check_C3_4(a: object) {
    expect(a instanceof C3_4).assertTrue();
    expect(a instanceof II2_4).assertTrue();
    expect(a instanceof I1_4).assertTrue();
    expect(a instanceof I2_4).assertTrue();
    expect((a as C3_4).c3_v as bigint).assertEqual(321n);
  }
  function foo_4(v: object): void {
    expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertTrue();
  }
  function f1_4(v: III1_4 | III2_4 | II2_4): number {
    expect(v instanceof object).assertTrue();
    foo_4(v);
    return f2_4(v);
  }
  function f2_4(v: III1_4 | III2_4 | II2_4): number {
    if (v instanceof II1_4) {
      check_C2_4(v);
      return 1;
    } else {
      expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertTrue();
      expect(v instanceof object).assertTrue();
      foo_4(v);
      check_C3_4(v);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1_4(new C2_4(6.7));
    expect(res).assertEqual(1);
    res = f1_4(new C3_4(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_4<U, V> {}
interface I2_4<U, V> {}
interface II1_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
interface II2_4<U = bigint, V = undefined> extends I1_4<U, V>, I2_4<U, V> {}
interface III1_4<U = number, V = null> extends II1_4<U, V> {}
interface III2_4<U = number, V = string> extends II1_4<U, V> {}
class C1_4<U = number, V = null> implements III1_4<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p;
  }
}
class C2_4<U = number, V = string> implements III2_4<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p;
  }
}
class C3_4<U = bigint, V = undefined> implements II2_4<U, V> {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p;
  }
}
function check_C1_4(a: object) {
  expect(a instanceof C1_4).assertTrue();
  expect(a instanceof III1_4).assertTrue();
  expect(a instanceof II1_4).assertTrue();
  expect(a instanceof I1_4).assertTrue();
  expect(a instanceof I2_4).assertTrue();
  expect((a as C1_4).c1_v as number).assertEqual(123);
}
function check_C2_4(a: object) {
  expect(a instanceof C2_4).assertTrue();
  expect(a instanceof III2_4).assertTrue();
  expect(a instanceof II1_4).assertTrue();
  expect(a instanceof I1_4).assertTrue();
  expect(a instanceof I2_4).assertTrue();
  expect((a as C2_4).c2_v as number).assertEqual(6.7);
}
function check_C3_4(a: object) {
  expect(a instanceof C3_4).assertTrue();
  expect(a instanceof II2_4).assertTrue();
  expect(a instanceof I1_4).assertTrue();
  expect(a instanceof I2_4).assertTrue();
  expect((a as C3_4).c3_v as bigint).assertEqual(321n);
}
function foo_4(v: object): void {
  expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertTrue();
}
function f1_4(v: III1_4 | III2_4 | II2_4): number {
  expect(v instanceof object).assertTrue();
  foo_4(v);
  return f2_4(v);
}
function f2_4(v: III1_4 | III2_4 | II2_4): number {
  if (v instanceof II1_4) {
    check_C1_4(v);
    return 1;
  } else {
    expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertTrue();
    expect(v instanceof object).assertTrue();
    foo_4(v);
    check_C3_4(v);
    return 2;
  }
}

namespace testNS1_5 {
  interface I_5<U, V> {}
  interface II1_5<U, V> extends I_5<U, V> {}
  interface II2_5<U, V> extends I_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V>, III2_5<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_5<U, V> implements II2_5<U, V>, III2_5<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_5<U, V> implements III1_5<U, V> {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_5(a: object) {
    expect(a instanceof C1_5).assertTrue();
    expect(a instanceof III1_5).assertTrue();
    expect(a instanceof III2_5).assertTrue();
    expect(a instanceof II1_5).assertTrue();
    expect(a instanceof I_5).assertTrue();
    expect((a as C1_5<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2_5(a: object) {
    expect(a instanceof C2_5).assertTrue();
    expect(a instanceof II2_5).assertTrue();
    expect(a instanceof III2_5).assertTrue();
    expect(a instanceof II1_5).assertTrue();
    expect(a instanceof I_5).assertTrue();
    expect((a as C2_5<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3_5(a: object) {
    expect(a instanceof C3_5).assertTrue();
    expect(a instanceof III1_5).assertTrue();
    expect(a instanceof II1_5).assertTrue();
    expect(a instanceof I_5).assertTrue();
    expect((a as C3_5<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo_5(v: object): void {
    expect(v instanceof III1_5 || v instanceof II2_5).assertTrue();
  }
  function f1_5(v: III1_5<number, null> | III1_5<bigint, undefined> | II2_5<number, string>): number {
    expect(v instanceof object).assertTrue();
    foo_5(v);
    return f2_5(v);
  }
  function f2_5(v: III1_5<number, null> | III1_5<bigint, undefined> | II2_5<number, string>): number {
    if (v instanceof C1_5 || v instanceof C2_5) {
      check_C1_5(v);
      return 1;
    } else {
      expect(v instanceof III1_5 || v instanceof II2_5).assertTrue();
      expect(v instanceof object).assertTrue();
      foo_5(v);
      check_C3_5(v);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1_5(new C1_5<number, null>(123));
    expect(res).assertEqual(1);
    res = f1_5(new C3_5<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_5 {
  interface I_5<U, V> {}
  interface II1_5<U, V> extends I_5<U, V> {}
  interface II2_5<U, V> extends I_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V>, III2_5<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2_5<U, V> implements II2_5<U, V>, III2_5<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3_5<U, V> implements III1_5<U, V> {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1_5(a: object) {
    expect(a instanceof C1_5).assertTrue();
    expect(a instanceof III1_5).assertTrue();
    expect(a instanceof III2_5).assertTrue();
    expect(a instanceof II1_5).assertTrue();
    expect(a instanceof I_5).assertTrue();
    expect((a as C1_5<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2_5(a: object) {
    expect(a instanceof C2_5).assertTrue();
    expect(a instanceof II2_5).assertTrue();
    expect(a instanceof III2_5).assertTrue();
    expect(a instanceof II1_5).assertTrue();
    expect(a instanceof I_5).assertTrue();
    expect((a as C2_5<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3_5(a: object) {
    expect(a instanceof C3_5).assertTrue();
    expect(a instanceof III1_5).assertTrue();
    expect(a instanceof II1_5).assertTrue();
    expect(a instanceof I_5).assertTrue();
    expect((a as C3_5<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo_5(v: object): void {
    expect(v instanceof III1_5 || v instanceof II2_5).assertTrue();
  }
  function f1_5(v: III1_5<number, null> | III1_5<bigint, undefined> | II2_5<number, string>): number {
    expect(v instanceof object).assertTrue();
    foo_5(v);
    return f2_5(v);
  }
  function f2_5(v: III1_5<number, null> | III1_5<bigint, undefined> | II2_5<number, string>): number {
    if (v instanceof C1_5 || v instanceof C2_5) {
      check_C2_5(v);
      return 1;
    } else {
      expect(v instanceof III1_5 || v instanceof II2_5).assertTrue();
      expect(v instanceof object).assertTrue();
      foo_5(v);
      check_C3_5(v);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1_5(new C2_5<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1_5(new C3_5<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I_5<U, V> {}
interface II1_5<U, V> extends I_5<U, V> {}
interface II2_5<U, V> extends I_5<U, V> {}
interface III1_5<U, V> extends II1_5<U, V> {}
interface III2_5<U, V> extends II1_5<U, V> {}
class C1_5<U, V> implements III1_5<U, V>, III2_5<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p;
  }
}
class C2_5<U, V> implements II2_5<U, V>, III2_5<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p;
  }
}
class C3_5<U, V> implements III1_5<U, V> {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p;
  }
}
function check_C1_5(a: object) {
  expect(a instanceof C1_5).assertTrue();
  expect(a instanceof III1_5).assertTrue();
  expect(a instanceof III2_5).assertTrue();
  expect(a instanceof II1_5).assertTrue();
  expect(a instanceof I_5).assertTrue();
  expect((a as C1_5<number, null>).c1_v as number).assertEqual(123);
}
function check_C2_5(a: object) {
  expect(a instanceof C2_5).assertTrue();
  expect(a instanceof II2_5).assertTrue();
  expect(a instanceof III2_5).assertTrue();
  expect(a instanceof II1_5).assertTrue();
  expect(a instanceof I_5).assertTrue();
  expect((a as C2_5<number, string>).c2_v as number).assertEqual(6.7);
}
function check_C3_5(a: object) {
  expect(a instanceof C3_5).assertTrue();
  expect(a instanceof III1_5).assertTrue();
  expect(a instanceof II1_5).assertTrue();
  expect(a instanceof I_5).assertTrue();
  expect((a as C3_5<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_5(v: object): void {
  expect(v instanceof III1_5 || v instanceof II2_5).assertTrue();
}
function f1_5(v: III1_5<number, null> | III1_5<bigint, undefined> | II2_5<number, string>): number {
  expect(v instanceof object).assertTrue();
  foo_5(v);
  return f2_5(v);
}
function f2_5(v: III1_5<number, null> | III1_5<bigint, undefined> | II2_5<number, string>): number {
  if (v instanceof III2_5) {
    check_C1_5(v);
    return 1;
  } else {
    expect(v instanceof III1_5 || v instanceof II2_5).assertTrue();
    expect(v instanceof object).assertTrue();
    foo_5(v);
    check_C3_5(v);
    return 2;
  }
}

namespace testNS1_6 {
  class C1_6<T1, T2> {
    readonly c1_v: T2;
    constructor(p: T2) {
      this.c1_v = p;
    }
  }

  class C2_6<T1, T2> {
    readonly c2_v: T1;
    constructor(p: T1) {
      this.c2_v = p;
    }
  }

  class Base_6 {
    b_v: bigint;
    constructor(p: bigint) {
      this.b_v = p;
    }
  }

  class Derived_6 extends Base_6 {
    d_v: number;
    constructor(p: number) {
      super(0n);
      this.d_v = p;
    }
  }

  function check_C1_6(a: object) {
    expect(a instanceof C1_6).assertTrue();
    expect(((a as C1_6<Base_6, Base_6>).c1_v as Base_6).b_v).assertEqual(123n);
  }

  function check_C2_6(a: object) {
    expect(a instanceof C2_6).assertTrue();
    expect(((a as C2_6<Derived_6, Base_6>).c2_v as Derived_6).d_v).assertEqual(321);
  }

  function foo_6(v: object): void {
    expect(v instanceof C1_6 || v instanceof C2_6).assertTrue();
  }

  function f1_6(v: C1_6<Derived_6, Base_6> | C2_6<Base_6, Derived_6>): number {
    expect(v instanceof object).assertTrue();
    foo_6(v);
    return f2_6(v);
  }

  function f2_6(v: C1_6<Derived_6, Base_6> | C2_6<Base_6, Derived_6>): number {
    if (v instanceof C2_6) {
      check_C2_6(v);
      return 1;
    } else {
      expect(v instanceof C1_6 || v instanceof C2_6).assertTrue();
      expect(v instanceof object).assertTrue();
      foo_6(v);
      check_C1_6(v);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1_6(new C2_6<Base_6, Derived_6>(new Derived_6(321)));
    expect(res).assertEqual(1);
    res = f1_6(new C1_6<Derived_6, Base_6>(new Base_6(123n)));
    expect(res).assertEqual(2);
    return true;
  }
}

class C1_6<T1, T2> {
  readonly c1_v: T2;
  constructor(p: T2) {
    this.c1_v = p;
  }
}

class C2_6<T1, T2> {
  readonly c2_v: T1;
  constructor(p: T1) {
    this.c2_v = p;
  }
}

class Base_6 {
  b_v: bigint;
  constructor(p: bigint) {
    this.b_v = p;
  }
}

class Derived_6 extends Base_6 {
  d_v: number;
  constructor(p: number) {
    super(0n);
    this.d_v = p;
  }
}

function check_C1_6(a: object) {
  expect(a instanceof C1_6).assertTrue();
  expect(((a as C1_6<Base_6, Base_6>).c1_v as Base_6).b_v).assertEqual(123n);
}

function check_C2_6(a: object) {
  expect(a instanceof C2_6).assertTrue();
  expect(((a as C2_6<Derived_6, Base_6>).c2_v as Derived_6).d_v).assertEqual(321);
}

function foo_6(v: object): void {
  expect(v instanceof C1_6 || v instanceof C2_6).assertTrue();
}

function f1_6(v: C1_6<Derived_6, Base_6> | C2_6<Base_6, Derived_6>): number {
  expect(v instanceof object).assertTrue();
  foo_6(v);
  return f2_6(v);
}

function f2_6(v: C1_6<Derived_6, Base_6> | C2_6<Base_6, Derived_6>): number {
  if (v instanceof C2_6) {
    check_C2_6(v);
    return 1;
  } else {
    expect(v instanceof C1_6 || v instanceof C2_6).assertTrue();
    expect(v instanceof object).assertTrue();
    foo_6(v);
    check_C1_6(v);
    return 2;
  }
}

class C1_12<T1, T2> {
  readonly c1_v: T2;
  constructor(p: T2) {
    this.c1_v = p;
  }
}

class C2_12<T1, T2> {
  readonly c2_v: T1;
  constructor(p: T1) {
    this.c2_v = p;
  }
}

class Base_12 {
  b_v: bigint;
  constructor(p: bigint) {
    this.b_v = p;
  }
}

class Derived_12 extends Base_12 {
  d_v: number;
  constructor(p: number) {
    super(0n);
    this.d_v = p;
  }
}

function check_C1_12(a: object) {
  expect(a instanceof C1_12).assertTrue();
  expect(((a as C1_12<Base_12, Base_12>).c1_v as Base_12).b_v).assertEqual(123n);
}

function check_C2_12(a: object) {
  expect(a instanceof C2_12).assertTrue();
  expect(((a as C2_12<Derived_12, Base_12>).c2_v as Derived_12).d_v).assertEqual(321);
}

function foo_12(v: object): void {
  expect(v instanceof C1_12 || v instanceof C2_12).assertTrue();
}

function f1_12(v: C2_12<Derived_12, Base_12> | C1_12<Base_12, Base_12>): number {
  expect(v instanceof object).assertTrue();
  foo_12(v);
  return f2_12(v);
}

function f2_12(v: C2_12<Derived_12, Base_12> | C1_12<Base_12, Base_12>): number {
  if (v instanceof C2_12) {
    check_C2_12(v);
    return 1;
  } else {
    expect(v instanceof C1_12 || v instanceof C2_12).assertTrue();
    expect(v instanceof object).assertTrue();
    foo_12(v);
    check_C1_12(v);
    return 2;
  }
}

namespace testNS1_12 {
  export function runTest_12(): boolean {
    let res: number = f1_12(new C2_12<Derived_12, Base_12>(new Derived_12(321)));
    expect(res).assertEqual(1);
    res = f1_12(new C1_12<Base_12, Base_12>(new Base_12(123n)));
    expect(res).assertEqual(2);
    return true;
  }
}


export default function DiffTypeIsSubOfTypeObjOnGenTest(): void {
  describe('DiffTypeIsSubOfTypeObjOnGenTest', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0100
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGenTest0001
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGenTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnGenTest0001';


      let res: number = f1_1(new C1_1<number, null>(321))
      expect(res).assertEqual(1)
      res = f1_1(new B2_1<bigint, undefined>(123n))
      expect(res).assertEqual(2)

      expect(testNS1_1.runTest()).assertTrue()
      expect(testNS2_1.runTest()).assertTrue()
      expect(testNS3_1.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0200
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGenTest0002
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGenTest0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnGenTest0002';


      let res: number = f1_2(new C1_2<number, null>(321))
      expect(res).assertEqual(1)
      res = f1_2(new B2_2<bigint, undefined>(123n))
      expect(res).assertEqual(2)

      expect(testNS1_2.runTest()).assertTrue()
      expect(testNS2_2.runTest()).assertTrue()
      expect(testNS3_2.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0300
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGenTest0003
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGenTest0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnGenTest0003';


      let res: number = f1_3(new C1_3<number, null>(123));
      expect(res).assertEqual(1);
      res = f1_3(new C3_3<bigint, undefined>(321n));
      expect(res).assertEqual(2);
      expect(testNS1_3.runTest()).assertTrue();
      expect(testNS2_3.runTest()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0400
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGenTest0004
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGenTest0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnGenTest0004';


      let res: number = f1_4(new C1_4(123));
      expect(res).assertEqual(1);
      res = f1_4(new C3_4(321n));
      expect(res).assertEqual(2);
      expect(testNS1_4.runTest()).assertTrue();
      expect(testNS2_4.runTest()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0600
     * @tc.name      testDiffTypeIsSubOfTypeObjOnGenTest0006
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnGenTest0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnGenTest0006';


      let res: number = f1_12(new C2_12<Derived_12, Base_12>(new Derived_12(321)));
      expect(res).assertEqual(1);
      res = f1_12(new C1_12<Base_12, Base_12>(new Base_12(123n)));
      expect(res).assertEqual(2);
      expect(testNS1_12.runTest_12()).assertEqual(true);
    });
  })
}