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

namespace testNS1_7 {
  interface I<U, V> {}
  interface II1<U, V> extends I<U, V> {}
  interface II2<U, V> extends I<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V>, III2<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> implements II2<U, V>, III2<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U, V> implements III1<U, V> {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: Any) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: III1<number, null> | III1<bigint, undefined> |
  II2<number, string> | III2<number, string> | number): void {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
  }
  function f1(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2 || typeof v === 'number').assertTrue();
    foo(v as III1<number, null> | III1<bigint, undefined> | II2<number, string> | III2<number, string> | number);
    return f2(v);
  }
  function f2(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2 || typeof v === 'number').assertTrue();
      foo(v as III1<number, null> | III1<bigint, undefined> | II2<number, string> | III2<number, string> | number);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_7(): boolean {
    let res: number = f1(new C1<number, null>(123));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_7 {
  interface I<U, V> {}
  interface II1<U, V> extends I<U, V> {}
  interface II2<U, V> extends I<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V>, III2<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> implements II2<U, V>, III2<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U, V> implements III1<U, V> {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: Any) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: II1<number, null> | II1<bigint, undefined> | II2<number, string>): void {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
  }
  function f1(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
    foo(v as II1<number, null> | II1<bigint, undefined> | II2<number, string>);
    return f2(v);
  }
  function f2(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
      foo(v as II1<number, null> | II1<bigint, undefined> | II2<number, string>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_7(): boolean {
    let res: number = f1(new C2<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I_7<U, V> {}
interface II1_7<U, V> extends I_7<U, V> {}
interface II2_7<U, V> extends I_7<U, V> {}
interface III1_7<U, V> extends II1_7<U, V> {}
interface III2_7<U, V> extends II1_7<U, V> {}
class C1_7<U, V> implements III1_7<U, V>, III2_7<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p;
  }
}
class C2_7<U, V> implements II2_7<U, V>, III2_7<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p;
  }
}
class C3_7<U, V> implements III1_7<U, V> {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p;
  }
}
function check_C1_7(a: Any) {
  expect(a instanceof C1_7).assertTrue();
  expect((a as C1_7<number, null>).c1_v as number).assertEqual(123);
}
function check_C2_7(a: Any) {
  expect(a instanceof C2_7).assertTrue();
  expect((a as C2_7<number, string>).c2_v as number).assertEqual(6.7);
}
function check_C3_7(a: Any) {
  expect(a instanceof C3_7).assertTrue();
  expect((a as C3_7<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_7(v: III1_7<number, null> | III1_7<bigint, undefined> |
II2_7<number, string> | III2_7<number, string> | number): void {
  expect(v instanceof C1_7 || v instanceof C3_7 || v instanceof C2_7).assertTrue();
}
function f1_7(v: III1_7<number, null> | III1_7<bigint, undefined> | II2_7<number, string>): number {
  expect(v instanceof C1_7 || v instanceof C3_7 || v instanceof C2_7 || typeof v === 'number').assertTrue();
  foo_7(v as III1_7<number, null> | III1_7<bigint, undefined> |
  II2_7<number, string> | III2_7<number, string> | number);
  return f2_7(v);
}
function f2_7(v: III1_7<number, null> | III1_7<bigint, undefined> | II2_7<number, string>): number {
  if (v instanceof C1_7 || v instanceof C2_7) {
    check_C1_7(v);
    return 1;
  }
  else {
    expect(v instanceof C1_7 || v instanceof C3_7 || v instanceof C2_7).assertTrue();
    expect(v instanceof C1_7 || v instanceof C3_7 || v instanceof C2_7 || typeof v === 'number').assertTrue();
    foo_7(v as III1_7<number, null> | III1_7<bigint, undefined> |
    II2_7<number, string> | III2_7<number, string> | number);
    check_C3_7(v);
    return 2;
  }
}

namespace testNS1_8 {
  interface I<U, V> {}
  interface II1<U, V> extends I<U, V> {}
  interface II2<U, V> extends I<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V>, III2<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> implements II2<U, V>, III2<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U, V> implements III1<U, V> {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: Any) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: I<number, null> | I<bigint, undefined> | I<number, string>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
    foo(v as I<number, null> | I<bigint, undefined> | I<number, string>);
    return f2(v);
  }
  function f2(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v as I<number, null> | I<bigint, undefined> | I<number, string>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_8(): boolean {
    let res: number = f1(new C1<number, null>(123));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I_8<U, V> {}
interface II1_8<U, V> extends I_8<U, V> {}
interface II2_8<U, V> extends I_8<U, V> {}
interface III1_8<U, V> extends II1_8<U, V> {}
interface III2_8<U, V> extends II1_8<U, V> {}
class C1_8<U, V> implements III1_8<U, V>, III2_8<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p;
  }
}
class C2_8<U, V> implements II2_8<U, V>, III2_8<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p;
  }
}
class C3_8<U, V> implements III1_8<U, V> {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p;
  }
}
function check_C1_8(a: Any) {
  expect(a instanceof C1_8).assertTrue();
  expect((a as C1_8<number, null>).c1_v as number).assertEqual(123);
}
function check_C2_8(a: Any) {
  expect(a instanceof C2_8).assertTrue();
  expect((a as C2_8<number, string>).c2_v as number).assertEqual(6.7);
}
function check_C3_8(a: Any) {
  expect(a instanceof C3_8).assertTrue();
  expect((a as C3_8<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_8(v: I_8<number, null> | I_8<bigint, undefined> | I_8<number, string>): void {
  expect(v instanceof C1_8 || v instanceof C2_8 || v instanceof C3_8).assertTrue();
}
function f1_8(v: III1_8<number, null> | III1_8<bigint, undefined> | II2_8<number, string>): number {
  expect(v instanceof C1_8 || v instanceof C2_8 || v instanceof C3_8).assertTrue();
  foo_8(v as I_8<number, null> | I_8<bigint, undefined> | I_8<number, string>);
  return f2_8(v);
}
function f2_8(v: III1_8<number, null> | III1_8<bigint, undefined> | II2_8<number, string>): number {
  if (v instanceof C1_8 || v instanceof C2_8) {
    check_C1_8(v);
    return 1;
  }
  else {
    expect(v instanceof C1_8 || v instanceof C3_8 || v instanceof C2_8).assertTrue();
    expect(v instanceof C1_8 || v instanceof C2_8 || v instanceof C3_8).assertTrue();
    foo_8(v as I_8<number, null> | I_8<bigint, undefined> | I_8<number, string>);
    check_C3_8(v);
    return 2;
  }
}

namespace testNS1_9 {
  class C1<in T1, out T2> {
    readonly c1_v: T2
    constructor (p: T2) {
      this.c1_v = p
    }
  }
  class C2<out T1, in T2> {
    readonly c2_v: T1
    constructor (p: T1) {
      this.c2_v = p
    }
  }
  class Base {
    b_v: bigint
    constructor (p: bigint) {
      this.b_v = p
    }
  }
  class Derived extends Base {
    d_v: number
    constructor (p: number) {
      super(0n)
      this.d_v = p
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect(((a as C1<Base, Base>).c1_v as Base).b_v).assertEqual(123n);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect(((a as C2<Derived, Base>).c2_v as Derived).d_v).assertEqual(321);
  }
  function foo(v: C1<Derived, Base> | C2<Base, Derived> | number): void {
    expect(v instanceof C1 || v instanceof C2).assertTrue();
  }
  function f1(v: C1<Derived, Base> | C2<Base, Derived>): number {
    expect(v instanceof C1 || v instanceof C2 || typeof v === 'number').assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: C1<Derived, Base> | C2<Base, Derived>): number {
    if (v instanceof C2) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || typeof v === 'number').assertTrue();
      foo(v);
      check_C1(v);
      return 2;
    }
  }

  export function runTest_9(): boolean {
    let res: number = f1(new C2<Derived, Base>(new Derived(321)))
    expect(res).assertEqual(1);
    res = f1(new C1<Base, Base>(new Base(123n)));
    expect(res).assertEqual(2);
    return true;
  }
}

class C1_9<in T1, out T2> {
  readonly c1_v: T2
  constructor (p: T2) {
    this.c1_v = p
  }
}
class C2_9<out T1, in T2> {
  readonly c2_v: T1
  constructor (p: T1) {
    this.c2_v = p
  }
}
class Base_9 {
  b_v: bigint
  constructor (p: bigint) {
    this.b_v = p
  }
}
class Derived_9 extends Base_9 {
  d_v: number
  constructor (p: number) {
    super(0n)
    this.d_v = p
  }
}
function check_C1_9(a: Any) {
  expect(a instanceof C1_9).assertTrue();
  expect(((a as C1_9<Base_9, Base_9>).c1_v as Base_9).b_v).assertEqual(123n);
}
function check_C2_9(a: Any) {
  expect(a instanceof C2_9).assertTrue();
  expect(((a as C2_9<Derived_9, Base_9>).c2_v as Derived_9).d_v).assertEqual(321);
}
function foo_9(v: C1_9<Derived_9, Base_9> | C2_9<Base_9, Derived_9> | number): void {
  expect(v instanceof C1_9 || v instanceof C2_9).assertTrue();
}
function f1_9(v: C1_9<Derived_9, Base_9> | C2_9<Base_9, Derived_9>): number {
  expect(v instanceof C1_9 || v instanceof C2_9 || typeof v === 'number').assertTrue();
  foo_9(v);
  return f2_9(v);
}
function f2_9(v: C1_9<Derived_9, Base_9> | C2_9<Base_9, Derived_9>): number {
  if (v instanceof C2_9) {
    check_C2_9(v);
    return 1;
  }
  else {
    expect(v instanceof C1_9 || v instanceof C2_9).assertTrue();
    expect(v instanceof C1_9 || v instanceof C2_9 || typeof v === 'number').assertTrue();
    foo_9(v);
    check_C1_9(v);
    return 2;
  }
}

namespace testNS1_10 {
  class C1<in T1, out T2> {
    readonly c1_v: T2
    constructor (p: T2) {
      this.c1_v = p
    }
  }
  class C2<out T1, in T2> {
    readonly c2_v: T1
    constructor (p: T1) {
      this.c2_v = p
    }
  }
  class Base {
    b_v: bigint
    constructor (p: bigint) {
      this.b_v = p
    }
  }
  class Derived extends Base {
    d_v: number
    constructor (p: number) {
      super(0n)
      this.d_v = p
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect(((a as C1<Base, Base>).c1_v as Base).b_v).assertEqual(123n);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect(((a as C2<Derived, Base>).c2_v as Derived).d_v).assertEqual(321);
  }
  function foo(v: Any): void {
    expect(v instanceof C1 || v instanceof C2).assertTrue();
  }
  function f1(v: C1<Derived, Base> | C2<Base, Derived>): number {
    expect(v instanceof Object).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: C1<Derived, Base> | C2<Base, Derived>): number {
    if (v instanceof C2) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2).assertTrue();
      expect(v instanceof Object).assertTrue();
      foo(v);
      check_C1(v);
      return 2;
    }
  }

  export function runTest_10(): boolean {
    let res: number = f1(new C2<Derived, Base>(new Derived(321)))
    expect(res).assertEqual(1);
    res = f1(new C1<Base, Base>(new Base(123n)));
    expect(res).assertEqual(2);
    return true;
  }
}

class C1_10<in T1, out T2> {
  readonly c1_v: T2
  constructor (p: T2) {
    this.c1_v = p
  }
}
class C2_10<out T1, in T2> {
  readonly c2_v: T1
  constructor (p: T1) {
    this.c2_v = p
  }
}
class Base_10 {
  b_v: bigint
  constructor (p: bigint) {
    this.b_v = p
  }
}
class Derived_10 extends Base_10 {
  d_v: number
  constructor (p: number) {
    super(0n)
    this.d_v = p
  }
}
function check_C1_10(a: Any) {
  expect(a instanceof C1_10).assertTrue();
  expect(((a as C1_10<Base_10, Base_10>).c1_v as Base_10).b_v).assertEqual(123n);
}
function check_C2_10(a: Any) {
  expect(a instanceof C2_10).assertTrue();
  expect(((a as C2_10<Derived_10, Base_10>).c2_v as Derived_10).d_v).assertEqual(321);
}
function foo_10(v: Any): void {
  expect(v instanceof C1_10 || v instanceof C2_10).assertTrue();
}
function f1_10(v: C1_10<Derived_10, Base_10> | C2_10<Base_10, Derived_10>): number {
  expect(v instanceof Object).assertTrue();
  foo_10(v);
  return f2_10(v);
}
function f2_10(v: C1_10<Derived_10, Base_10> | C2_10<Base_10, Derived_10>): number {
  if (v instanceof C2_10) {
    check_C2_10(v);
    return 1;
  }
  else {
    expect(v instanceof C1_10 || v instanceof C2_10).assertTrue();
    expect(v instanceof Object).assertTrue();
    foo_10(v);
    check_C1_10(v);
    return 2;
  }
}

namespace testNS1_11 {
  abstract class A<U, V> {}
  abstract class B1<U, V> extends A<U, V> {}
  class B2<U, V> extends A<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  class C1<U, V> extends B1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U, V> extends B1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other<T> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(321);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_B2(a: Any) {
    expect(a instanceof B2).assertTrue();
    expect((a as B2<bigint, undefined>).b2_v as bigint).assertEqual(123n);
  }
  function check_Other(a: Any) {
    expect(a instanceof Other).assertTrue();
    expect((a as Other<string>).other_v as string).assertEqual("other");
  }
  function foo(v: B2<bigint, undefined> | Other<string> | C1<number, null> | C2<number, string> | number): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
  }
  function f1(v: C1<number, null> | C2<number, string> | B2<bigint, undefined> | Other<string>): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: C1<number, null> | C2<number, string> | B2<bigint, undefined> | Other<string>): number {
    if (v instanceof B1 || v instanceof Other) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
      expect(v instanceof B2 || v instanceof Other || v instanceof C1 ||
        v instanceof C2 || typeof v === 'number').assertTrue();
      foo(v as B2<bigint, undefined> | Other<string> | C1<number, null> | C2<number, string> | number);
      check_B2(v);
      return 2;
    }
  }

  export function runTest_11(): boolean {
    let res: number = f1(new C1<number, null>(321));
    expect(res).assertEqual(1);
    res = f1(new B2<bigint, undefined>(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_11 {
  abstract class A<U, V> {}
  abstract class B1<U, V> extends A<U, V> {}
  class B2<U, V> extends A<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  class C1<U, V> extends B1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U, V> extends B1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other<T> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(321);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_B2(a: Any) {
    expect(a instanceof B2).assertTrue();
    expect((a as B2<bigint, undefined>).b2_v as bigint).assertEqual(123n);
  }
  function check_Other(a: Any) {
    expect(a instanceof Other).assertTrue();
    expect((a as Other<string>).other_v as string).assertEqual("other");
  }
  function foo(v: B1<number, null> | B1<number, string> | B2<bigint, undefined> | Other<string>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
  }
  function f1(v: C1<number, null> | C2<number, string> | B2<bigint, undefined> | Other<string>): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other) {
      foo(v as B1<number, null> | B1<number, string> | B2<bigint, undefined> | Other<string>);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: C1<number, null> | C2<number, string> | B2<bigint, undefined> | Other<string>): number {
    if (v instanceof B1 || v instanceof Other) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
      expect(v instanceof B1 || v instanceof B2 || v instanceof Other).assertTrue();
      foo(v as B1<number, null> | B1<number, string> | B2<bigint, undefined> | Other<string>);
      check_B2(v);
      return 2;
    }
  }

  export function runTest_11(): boolean {
    let res: number = f1(new C2<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1(new B2<bigint, undefined>(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_11 {
  abstract class A<U, V> {}
  abstract class B1<U, V> extends A<U, V> {}
  class B2<U, V> extends A<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  class C1<U, V> extends B1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U, V> extends B1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other<T> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(321);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_B2(a: Any) {
    expect(a instanceof B2).assertTrue();
    expect((a as B2<bigint, undefined>).b2_v as bigint).assertEqual(123n);
  }
  function check_Other(a: Any) {
    expect(a instanceof Other).assertTrue();
    expect((a as Other<string>).other_v as string).assertEqual("other");
  }
  function foo(v: A<number, null> | A<number, string> | A<bigint, undefined> | Other<string>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
  }
  function f1(v: C1<number, null> | C2<number, string> | B2<bigint, undefined> | Other<string>): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other) {
      foo(v as A<number, null> | A<number, string> | A<bigint, undefined> | Other<string>);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: C1<number, null> | C2<number, string> | B2<bigint, undefined> | Other<string>): number {
    if (v instanceof B1 || v instanceof Other) {
      check_Other(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
      expect(v instanceof A || v instanceof Other).assertTrue();
      foo(v as A<number, null> | A<number, string> | A<bigint, undefined> | Other<string>);
      check_B2(v);
      return 2;
    }
  }

  export function runTest_11(): boolean {
    let res: number = f1(new Other<string>("other"));
    expect(res).assertEqual(1);
    res = f1(new B2<bigint, undefined>(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

abstract class A_11<U, V> {}
abstract class B1_11<U, V> extends A_11<U, V> {}
class B2_11<U, V> extends A_11<U, V> {
  b2_v: U | V
  constructor (p: U | V) {
    this.b2_v = p
  }
}
class C1_11<U, V> extends B1_11<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_11<U, V> extends B1_11<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class Other_11<T> {
  other_v: T
  constructor (p: T) {
    this.other_v = p
  }
}
function check_C1_11(a: Any) {
  expect(a instanceof C1_11).assertTrue();
  expect((a as C1_11<number, null>).c1_v as number).assertEqual(321);
}
function check_C2_11(a: Any) {
  expect(a instanceof C2_11).assertTrue();
  expect((a as C2_11<number, string>).c2_v as number).assertEqual(6.7);
}
function check_B2_11(a: Any) {
  expect(a instanceof B2_11).assertTrue();
  expect((a as B2_11<bigint, undefined>).b2_v as bigint).assertEqual(123n);
}
function check_Other_11(a: Any) {
  expect(a instanceof Other_11).assertTrue();
  expect((a as Other_11<string>).other_v as string).assertEqual("other");
}
function foo_11(v: B2_11<bigint, undefined> | Other_11<string> |
C1_11<number, null> | C2_11<number, string> | number): void {
  expect(v instanceof C1_11 || v instanceof C2_11 || v instanceof B2_11 || v instanceof Other_11).assertTrue();
}
function f1_11(v: C1_11<number, null> | C2_11<number, string> | B2_11<bigint, undefined> | Other_11<string>): number {
  if (v instanceof C1_11 || v instanceof C2_11 || v instanceof B2_11 || v instanceof Other_11) {
    foo_11(v);
    return f2_11(v);
  }
  else {
    return 0;
  }
}
function f2_11(v: C1_11<number, null> | C2_11<number, string> | B2_11<bigint, undefined> | Other_11<string>): number {
  if (v instanceof B1_11 || v instanceof Other_11) {
    check_C1_11(v);
    return 1;
  }
  else {
    expect(v instanceof C1_11 || v instanceof C2_11 || v instanceof B2_11 || v instanceof Other_11).assertTrue();
    expect(v instanceof B2_11 || v instanceof Other_11 || v instanceof C1_11 ||
      v instanceof C2_11 || typeof v === 'number').assertTrue();
    foo_11(v as B2_11<bigint, undefined> | Other_11<string> | C1_11<number, null> | C2_11<number, string> | number);
    check_B2_11(v);
    return 2;
  }
}

namespace testNS1_12 {
  abstract class A<U, V> {}
  abstract class B1<U, V> extends A<U, V> {}
  class B2<U=bigint, V=undefined> extends A<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  class C1<U = number, V = null> extends B1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U = number, V = string> extends B1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other<T = string> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(321);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_B2(a: Any) {
    expect(a instanceof B2).assertTrue();
    expect((a as B2).b2_v as bigint).assertEqual(123n);
  }
  function check_Other(a: Any) {
    expect(a instanceof Other).assertTrue();
    expect((a as Other).other_v as string).assertEqual("other");
  }
  function foo(v: B2 | Other | C1 | C2 | number): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
  }
  function f1(v: C1 | C2| B2 | Other): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: C1 | C2| B2 | Other): number {
    if (v instanceof B1 || v instanceof Other) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
      expect(v instanceof B2 || v instanceof Other || v instanceof C1 ||
        v instanceof C2 || typeof v === 'number').assertTrue();
      foo(v as B2 | Other | C1 | C2 | number);
      check_B2(v);
      return 2;
    }
  }

  export function runTest_12(): boolean {
    let res: number = f1(new C1(321));
    expect(res).assertEqual(1);
    res = f1(new B2(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_12 {
  abstract class A<U, V> {}
  abstract class B1<U, V> extends A<U, V> {}
  class B2<U=bigint, V=undefined> extends A<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  class C1<U = number, V = null> extends B1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U = number, V = string> extends B1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other<T = string> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(321);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_B2(a: Any) {
    expect(a instanceof B2).assertTrue();
    expect((a as B2).b2_v as bigint).assertEqual(123n);
  }
  function check_Other(a: Any) {
    expect(a instanceof Other).assertTrue();
    expect((a as Other).other_v as string).assertEqual("other");
  }
  function foo(v: B1<number, null> | B1<number, string> | B2 | Other): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
  }
  function f1(v: C1 | C2| B2 | Other): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other) {
      foo(v as B1<number, null> | B1<number, string> | B2 | Other);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: C1 | C2| B2 | Other): number {
    if (v instanceof B1 || v instanceof Other) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
      expect(v instanceof B1 || v instanceof B2 || v instanceof Other).assertTrue();
      foo(v as B1<number, null> | B1<number, string> | B2 | Other);
      check_B2(v);
      return 2;
    }
  }

  export function runTest_12(): boolean {
    let res: number = f1(new C2(6.7));
    expect(res).assertEqual(1);
    res = f1(new B2(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_12 {
  abstract class A<U, V> {}
  abstract class B1<U, V> extends A<U, V> {}
  class B2<U=bigint, V=undefined> extends A<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  class C1<U = number, V = null> extends B1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U = number, V = string> extends B1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other<T = string> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(321);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_B2(a: Any) {
    expect(a instanceof B2).assertTrue();
    expect((a as B2).b2_v as bigint).assertEqual(123n);
  }
  function check_Other(a: Any) {
    expect(a instanceof Other).assertTrue();
    expect((a as Other).other_v as string).assertEqual("other");
  }
  function foo(v: A<number, null> | A<number, string> | A<bigint, undefined> | Other): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
  }
  function f1(v: C1 | C2| B2 | Other): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other) {
      foo(v as A<number, null> | A<number, string> | A<bigint, undefined> | Other);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: C1 | C2| B2 | Other): number {
    if (v instanceof B1 || v instanceof Other) {
      check_Other(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
      expect(v instanceof A || v instanceof Other).assertTrue();
      foo(v as A<number, null> | A<number, string> | A<bigint, undefined> | Other);
      check_B2(v);
      return 2;
    }
  }

  export function runTest_12(): boolean {
    let res: number = f1(new Other("other"));
    expect(res).assertEqual(1);
    res = f1(new B2(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

abstract class A_12<U, V> {}
abstract class B1_12<U, V> extends A_12<U, V> {}
class B2_12<U=bigint, V=undefined> extends A_12<U, V> {
  b2_v: U | V
  constructor (p: U | V) {
    this.b2_v = p
  }
}
class C1_12<U = number, V = null> extends B1_12<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_12<U = number, V = string> extends B1_12<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class Other_12<T = string> {
  other_v: T
  constructor (p: T) {
    this.other_v = p
  }
}
function check_C1_12(a: Any) {
  expect(a instanceof C1_12).assertTrue();
  expect((a as C1_12).c1_v as number).assertEqual(321);
}
function check_C2_12(a: Any) {
  expect(a instanceof C2_12).assertTrue();
  expect((a as C2_12).c2_v as number).assertEqual(6.7);
}
function check_B2_12(a: Any) {
  expect(a instanceof B2_12).assertTrue();
  expect((a as B2_12).b2_v as bigint).assertEqual(123n);
}
function check_Other_12(a: Any) {
  expect(a instanceof Other_12).assertTrue();
  expect((a as Other_12).other_v as string).assertEqual("other");
}
function foo_12(v: B2_12 | Other_12 | C1_12 | C2_12 | number): void {
  expect(v instanceof C1_12 || v instanceof C2_12 || v instanceof B2_12 || v instanceof Other_12).assertTrue();
}
function f1_12(v: C1_12 | C2_12| B2_12 | Other_12): number {
  if (v instanceof C1_12 || v instanceof C2_12 || v instanceof B2_12 || v instanceof Other_12) {
    foo_12(v);
    return f2_12(v);
  }
  else {
    return 0;
  }
}
function f2_12(v: C1_12 | C2_12| B2_12 | Other_12): number {
  if (v instanceof B1_12 || v instanceof Other_12) {
    check_C1_12(v);
    return 1;
  }
  else {
    expect(v instanceof C1_12 || v instanceof C2_12 || v instanceof B2_12 || v instanceof Other_12).assertTrue();
    expect(v instanceof B2_12 || v instanceof Other_12 || v instanceof C1_12 ||
      v instanceof C2_12 || typeof v === 'number').assertTrue();
    foo_12(v as B2_12 | Other_12 | C1_12 | C2_12 | number);
    check_B2_12(v);
    return 2;
  }
}

namespace testNS1_13 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U, V> extends I1<U, V>, I2<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U, V> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3<U, V> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: Any) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: III1<number, null> | II2<bigint, undefined> | III2<number, string> | number): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v as III1<number, null> | II2<bigint, undefined> | III2<number, string> | number);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3 || typeof v === 'number').assertTrue();
      foo(v as III1<number, null> | II2<bigint, undefined> | III2<number, string> | number);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_13(): boolean {
    let res: number = f1(new C1<number, null>(123));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_13 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U, V> extends I1<U, V>, I2<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U, V> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3<U, V> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: Any) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: II1<number, null> | II1<number, string> | II2<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v as II1<number, null> | II1<number, string> | II2<bigint, undefined>);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v as II1<number, null> | II1<number, string> | II2<bigint, undefined>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_13(): boolean {
    let res: number = f1(new C2<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_13 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U, V> extends I1<U, V>, I2<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U, V> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3<U, V> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: Any) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: I1<number, null> | I1<number, string> | I2<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v as I1<number, null> | I1<number, string> | I2<bigint, undefined>);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v as I1<number, null> | I1<number, string> | I2<bigint, undefined>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_13(): boolean {
    let res: number = f1(new C1<number, null>(123));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_13<U, V> {}
interface I2_13<U, V> {}
interface II1_13<U, V> extends I1_13<U, V>, I2_13<U, V> {}
interface II2_13<U, V> extends I1_13<U, V>, I2_13<U, V> {}
interface III1_13<U, V> extends II1_13<U, V> {}
interface III2_13<U, V> extends II1_13<U, V> {}
class C1_13<U, V> implements III1_13<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_13<U, V> implements III2_13<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class C3_13<U, V> implements II2_13<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_13(a: Any) {
  expect(a instanceof C1_13).assertTrue();
  expect((a as C1_13<number, null>).c1_v as number).assertEqual(123);
}
function check_C2_13(a: Any) {
  expect(a instanceof C2_13).assertTrue();
  expect((a as C2_13<number, string>).c2_v as number).assertEqual(6.7);
}
function check_C3_13(a: Any) {
  expect(a instanceof C3_13).assertTrue();
  expect((a as C3_13<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_13(v: III1_13<number, null> | II2_13<bigint, undefined> | III2_13<number, string> | number): void {
  expect(v instanceof C1_13 || v instanceof C2_13 || v instanceof C3_13).assertTrue();
}
function f1_13(v: III1_13<number, null> | III2_13<number, string> | II2_13<bigint, undefined>): number {
  if (v instanceof C1_13 || v instanceof C2_13 || v instanceof C3_13) {
    foo_13(v as III1_13<number, null> | II2_13<bigint, undefined> | III2_13<number, string> | number);
    return f2_13(v);
  }
  else {
    return 0;
  }
}
function f2_13(v: III1_13<number, null> | III2_13<number, string> | II2_13<bigint, undefined>): number {
  if (v instanceof C1_13 || v instanceof C2_13) {
    check_C1_13(v);
    return 1;
  }
  else {
    expect(v instanceof C1_13 || v instanceof C2_13 || v instanceof C3_13).assertTrue();
    expect(v instanceof C1_13 || v instanceof C2_13 || v instanceof C3_13 || typeof v === 'number').assertTrue();
    foo_13(v as III1_13<number, null> | II2_13<bigint, undefined> | III2_13<number, string> | number);
    check_C3_13(v);
    return 2;
  }
}


export default function DiffTypeIsSubOfTypeTOnGenTest01(): void {
  describe('DiffTypeIsSubOfTypeTOnGenTest01', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0700
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0007
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0007';
      let res: number = f1_7(new C1_7<number, null>(123))
      expect(res).assertEqual(1)
      res = f1_7(new C3_7<bigint, undefined>(321n))
      expect(res).assertEqual(2)
      expect(testNS1_7.runTest_7()).assertTrue()
      expect(testNS2_7.runTest_7()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0800
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0008
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0008';
      let res: number = f1_8(new C1_8<number, null>(123))
      expect(res).assertEqual(1)
      res = f1_8(new C3_8<bigint, undefined>(321n))
      expect(res).assertEqual(2)
      expect(testNS1_8.runTest_8()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0900
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0009
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0009';
      let res: number = f1_9(new C2_9<Derived_9, Base_9>(new Derived_9(321)))
      expect(res).assertEqual(1)
      res = f1_9(new C1_9<Base_9, Base_9>(new Base_9(123n)))
      expect(res).assertEqual(2)
      expect(testNS1_9.runTest_9()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1000
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0010
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0010';
      let res: number = f1_10(new C2_10<Derived_10, Base_10>(new Derived_10(321)))
      expect(res).assertEqual(1)
      res = f1_10(new C1_10<Base_10, Base_10>(new Base_10(123n)))
      expect(res).assertEqual(2)
      expect(testNS1_10.runTest_10()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1100
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0011
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0011';
      let res: number = f1_11(new C1_11<number, null>(321))
      expect(res).assertEqual(1)
      res = f1_11(new B2_11<bigint, undefined>(123n))
      expect(res).assertEqual(2)
      expect(testNS1_11.runTest_11()).assertTrue()
      expect(testNS2_11.runTest_11()).assertTrue()
      expect(testNS3_11.runTest_11()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1200
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0012
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0012';
      let res: number = f1_12(new C1_12(321))
      expect(res).assertEqual(1)
      res = f1_12(new B2_12(123n))
      expect(res).assertEqual(2)
      expect(testNS1_12.runTest_12()).assertTrue()
      expect(testNS2_12.runTest_12()).assertTrue()
      expect(testNS3_12.runTest_12()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1300
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0013
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0013';
      let res: number = f1_13(new C1_13<number, null>(123))
      expect(res).assertEqual(1)
      res = f1_13(new C3_13<bigint, undefined>(321n))
      expect(res).assertEqual(2)
      expect(testNS1_13.runTest_13()).assertTrue()
      expect(testNS2_13.runTest_13()).assertTrue()
      expect(testNS3_13.runTest_13()).assertTrue()
    });
  })
}