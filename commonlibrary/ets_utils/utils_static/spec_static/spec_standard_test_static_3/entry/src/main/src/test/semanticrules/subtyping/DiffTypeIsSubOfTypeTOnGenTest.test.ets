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
    expect(v instanceof C1 || v instanceof C2 ||
      v instanceof B2 || v instanceof Other).assertTrue();
  }
  function f1(v: C1<number, null> | C2<number, string> | B2<bigint, undefined> | Other<string>): number {
    expect(v instanceof B2 || v instanceof Other ||
      v instanceof C1 || v instanceof C2 || typeof v === 'number').assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: C1<number, null> | C2<number, string> | B2<bigint, undefined> | Other<string>): number {
    if (v instanceof B1 || v instanceof Other) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
      expect(v instanceof B2 || v instanceof Other ||
        v instanceof C1 || v instanceof C2 || typeof v === 'number').assertTrue();
      foo(v);
      check_B2(v);
      return 2;
    }
  }

  export function runTest_1(): boolean {
    let res: number = f1(new C1<number, null>(321));
    expect(res).assertEqual(1);
    res = f1(new B2<bigint, undefined>(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_1 {
  abstract class A<U, V> {}
  abstract class B1<U, V> extends A<U, V> {}
  class B2<U, V> extends A<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p;
    }
  }
  class C1<U, V> extends B1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> extends B1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class Other<T> {
    other_v: T
    constructor (p: T) {
      this.other_v = p;
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
    expect(v instanceof B1 || v instanceof B2 || v instanceof Other).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: C1<number, null> | C2<number, string> | B2<bigint, undefined> | Other<string>): number {
    if (v instanceof B1 || v instanceof Other) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
      expect(v instanceof B1 || v instanceof B2 || v instanceof Other).assertTrue();
      foo(v);
      check_B2(v);
      return 2;
    }
  }

  export function runTest_1(): boolean {
    let res: number = f1(new C2<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1(new B2<bigint, undefined>(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_1 {
  abstract class A<U, V> {}
  abstract class B1<U, V> extends A<U, V> {}
  class B2<U, V> extends A<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p;
    }
  }
  class C1<U, V> extends B1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> extends B1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class Other<T> {
    other_v: T
    constructor (p: T) {
      this.other_v = p;
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
    expect(v instanceof A || v instanceof Other).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: C1<number, null> | C2<number, string> | B2<bigint, undefined> | Other<string>): number {
    if (v instanceof B1 || v instanceof Other) {
      check_Other(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
      expect(v instanceof A || v instanceof Other).assertTrue();
      foo(v);
      check_B2(v);
      return 2;
    }
  }

  export function runTest_1(): boolean {
    let res: number = f1(new Other<string>("other"));
    expect(res).assertEqual(1);
    res = f1(new B2<bigint, undefined>(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

abstract class A_1<U, V> {}
abstract class B1_1<U, V> extends A_1<U, V> {}
class B2_1<U, V> extends A_1<U, V> {
  b2_v: U | V
  constructor (p: U | V) {
    this.b2_v = p;
  }
}
class C1_1<U, V> extends B1_1<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p;
  }
}
class C2_1<U, V> extends B1_1<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p;
  }
}
class Other_1<T> {
  other_v: T
  constructor (p: T) {
    this.other_v = p;
  }
}
function check_C1_1(a: Any) {
  expect(a instanceof C1_1).assertTrue();
  expect((a as C1_1<number, null>).c1_v as number).assertEqual(321);
}
function check_C2_1(a: Any) {
  expect(a instanceof C2_1).assertTrue();
  expect((a as C2_1<number, string>).c2_v as number).assertEqual(6.7);
}
function check_B2_1(a: Any) {
  expect(a instanceof B2_1).assertTrue();
  expect((a as B2_1<bigint, undefined>).b2_v as bigint).assertEqual(123n);
}
function check_Other_1(a: Any) {
  expect(a instanceof Other_1).assertTrue();
  expect((a as Other_1<string>).other_v as string).assertEqual("other");
}
function foo_1(v: B2_1<bigint, undefined> | Other_1<string> |
C1_1<number, null> | C2_1<number, string> | number): void {
  expect(v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1).assertTrue();
}
function f1_1(v: C1_1<number, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>): number {
  expect(v instanceof B2_1 || v instanceof Other_1 || v instanceof C1_1 ||
    v instanceof C2_1 || typeof v === 'number').assertTrue();
  foo_1(v);
  return f2_1(v);
}
function f2_1(v: C1_1<number, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>): number {
  if (v instanceof B1_1 || v instanceof Other_1) {
    check_C1_1(v);
    return 1;
  }
  else {
    expect(v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1).assertTrue();
    expect(v instanceof B2_1 || v instanceof Other_1 || v instanceof C1_1 ||
      v instanceof C2_1 || typeof v === 'number').assertTrue();
    foo_1(v);
    check_B2_1(v);
    return 2;
  }
}

namespace testNS1_2 {
  abstract class A<U, V> {}
  abstract class B1<U, V> extends A<U, V> {}
  class B2<U=bigint, V=undefined> extends A<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p;
    }
  }
  class C1<U = number, V = null> extends B1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U = number, V = string> extends B1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class Other<T = string> {
    other_v: T
    constructor (p: T) {
      this.other_v = p;
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
    expect(v instanceof B2 || v instanceof Other || v instanceof C1 ||
      v instanceof C2 || typeof v === 'number').assertTrue();
    foo(v);
    return f2(v);
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
      foo(v);
      check_B2(v);
      return 2;
    }
  }

  export function runTest_2(): boolean {
    let res: number = f1(new C1(321));
    expect(res).assertEqual(1);
    res = f1(new B2(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_2 {
  abstract class A<U, V> {}
  abstract class B1<U, V> extends A<U, V> {}
  class B2<U=bigint, V=undefined> extends A<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p;
    }
  }
  class C1<U = number, V = null> extends B1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U = number, V = string> extends B1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class Other<T = string> {
    other_v: T
    constructor (p: T) {
      this.other_v = p;
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
    expect(v instanceof B1 || v instanceof B2 || v instanceof Other).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: C1 | C2| B2 | Other): number {
    if (v instanceof B1 || v instanceof Other) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
      expect(v instanceof B1 || v instanceof B2 || v instanceof Other).assertTrue();
      foo(v);
      check_B2(v);
      return 2;
    }
  }

  export function runTest_2(): boolean {
    let res: number = f1(new C2(6.7));
    expect(res).assertEqual(1);
    res = f1(new B2(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_2 {
  abstract class A<U, V> {}
  abstract class B1<U, V> extends A<U, V> {}
  class B2<U=bigint, V=undefined> extends A<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p;
    }
  }
  class C1<U = number, V = null> extends B1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U = number, V = string> extends B1<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class Other<T = string> {
    other_v: T
    constructor (p: T) {
      this.other_v = p;
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
    expect(v instanceof A || v instanceof Other).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: C1 | C2| B2 | Other): number {
    if (v instanceof B1 || v instanceof Other) {
      check_Other(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof B2 || v instanceof Other).assertTrue();
      expect(v instanceof A || v instanceof Other).assertTrue();
      foo(v);
      check_B2(v);
      return 2;
    }
  }

  export function runTest_2(): boolean {
    let res: number = f1(new Other("other"));
    expect(res).assertEqual(1);
    res = f1(new B2(123n));
    expect(res).assertEqual(2);
    return true;
  }
}

abstract class A_2<U, V> {}
abstract class B1_2<U, V> extends A_2<U, V> {}
class B2_2<U=bigint, V=undefined> extends A_2<U, V> {
  b2_v: U | V
  constructor (p: U | V) {
    this.b2_v = p;
  }
}
class C1_2<U = number, V = null> extends B1_2<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p;
  }
}
class C2_2<U = number, V = string> extends B1_2<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p;
  }
}
class Other_2<T = string> {
  other_v: T
  constructor (p: T) {
    this.other_v = p;
  }
}
function check_C1_2(a: Any) {
  expect(a instanceof C1_2).assertTrue();
  expect((a as C1_2).c1_v as number).assertEqual(321);
}
function check_C2_2(a: Any) {
  expect(a instanceof C2_2).assertTrue();
  expect((a as C2_2).c2_v as number).assertEqual(6.7);
}
function check_B2_2(a: Any) {
  expect(a instanceof B2_2).assertTrue();
  expect((a as B2_2).b2_v as bigint).assertEqual(123n);
}
function check_Other_2(a: Any) {
  expect(a instanceof Other_2).assertTrue();
  expect((a as Other_2).other_v as string).assertEqual("other");
}
function foo_2(v: B2_2 | Other_2 | C1_2 | C2_2 | number): void {
  expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertTrue();
}
function f1_2(v: C1_2 | C2_2| B2_2 | Other_2): number {
  expect(
    v instanceof B2_2 ||
      v instanceof C1_2 ||
      v instanceof C2_2 ||
      v instanceof Other_2
  ).assertTrue();
  foo_2(v);
  return f2_2(v);
}
function f2_2(v: C1_2 | C2_2| B2_2 | Other_2): number {
  if (v instanceof B1_2 || v instanceof Other_2) {
    check_C1_2(v);
    return 1;
  }
  else {
    expect(v instanceof C1_2 ||
      v instanceof C2_2 ||
      v instanceof B2_2 ||
      v instanceof Other_2
    ).assertTrue();
    expect(v instanceof B2_2 ||
      v instanceof  Other_2 ||
      v instanceof  C1_2 ||
      v instanceof C2_2 ||
      typeof v === 'number').assertTrue();
    foo_2(v);
    check_B2_2(v);
    return 2;
  }
}

namespace testNS1_3 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U, V> extends I1<U, V>, I2<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U, V> implements II2<U, V>  {
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
  function foo(v: III1<number, null> | II2<bigint, undefined> | III2<number, string> | number): void {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
  }
  function f1(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2 || typeof v === 'number').assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2 || typeof v === 'number').assertTrue();
      foo(v);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_3(): boolean {
    let res: number = f1(new C1<number, null>(123));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_3 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U, V> extends I1<U, V>, I2<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U, V> implements II2<U, V>  {
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
  function foo(v: II1<number, null> | II1<number, string> | II2<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_3(): boolean {
    let res: number = f1(new C2<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_3 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U, V> extends I1<U, V>, I2<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U, V> implements II2<U, V>  {
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
  function foo(v: I1<number, null> | I1<number, string> | I2<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_3(): boolean {
    let res: number = f1(new C1<number, null>(123));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
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
    this.c1_v = p;
  }
}
class C2_3<U, V> implements III2_3<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p;
  }
}
class C3_3<U, V> implements II2_3<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p;
  }
}
function check_C1_3(a: Any) {
  expect(a instanceof C1_3).assertTrue();
  expect((a as C1_3<number, null>).c1_v as number).assertEqual(123);
}
function check_C2_3(a: Any) {
  expect(a instanceof C2_3).assertTrue();
  expect((a as C2_3<number, string>).c2_v as number).assertEqual(6.7);
}
function check_C3_3(a: Any) {
  expect(a instanceof C3_3).assertTrue();
  expect((a as C3_3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_3(v: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string> | number): void {
  expect(v instanceof C1_3 || v instanceof C2_3 || v instanceof C3_3).assertTrue();
}
function f1_3(v: III1_3<number, null> | III2_3<number, string> | II2_3<bigint, undefined>): number {
  expect(v instanceof C1_3 || v instanceof C3_3 || v instanceof C2_3 || typeof v === 'number').assertTrue();
  foo_3(v);
  return f2_3(v);
}
function f2_3(v: III1_3<number, null> | III2_3<number, string> | II2_3<bigint, undefined>): number {
  if (v instanceof C1_3 || v instanceof C2_3) {
    check_C1_3(v);
    return 1;
  }
  else {
    expect(v instanceof C1_3 || v instanceof C2_3 || v instanceof C3_3).assertTrue();
    expect(v instanceof C1_3 || v instanceof C3_3 || v instanceof C2_3 || typeof v === 'number').assertTrue();
    foo_3(v);
    check_C3_3(v);
    return 2;
  }
}

namespace testNS1_4 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U, V> extends I1<U, V>, I2<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U, V> implements II2<U, V>  {
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
  function foo(v: I1<number, null> | I1<number, string> | I1<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_4(): boolean {
    let res: number = f1(new C2<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_4 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U, V> extends I1<U, V>, I2<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U, V> implements II2<U, V>  {
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
  function foo(v: I2<number, null> | I2<number, string> | I2<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_4(): boolean {
    let res: number = f1(new C1<number, null>(123));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_4<U, V> {}
interface I2_4<U, V> {}
interface II1_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
interface II2_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
interface III1_4<U, V> extends II1_4<U, V> {}
interface III2_4<U, V> extends II1_4<U, V> {}
class C1_4<U, V> implements III1_4<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p;
  }
}
class C2_4<U, V> implements III2_4<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p;
  }
}
class C3_4<U, V> implements II2_4<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p;
  }
}
function check_C1_4(a: Any) {
  expect(a instanceof C1_4).assertTrue();
  expect((a as C1_4<number, null>).c1_v as number).assertEqual(123);
}
function check_C2_4(a: Any) {
  expect(a instanceof C2_4).assertTrue();
  expect((a as C2_4<number, string>).c2_v as number).assertEqual(6.7);
}
function check_C3_4(a: Any) {
  expect(a instanceof C3_4).assertTrue();
  expect((a as C3_4<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_4(v: I1_4<number, null> | I1_4<number, string> | I1_4<bigint, undefined>): void {
  expect(v instanceof C1_4 || v instanceof C2_4 || v instanceof C3_4).assertTrue();
}
function f1_4(v: III1_4<number, null> | III2_4<number, string> | II2_4<bigint, undefined>): number {
  expect(v instanceof C1_4 || v instanceof C2_4 || v instanceof C3_4).assertTrue();
  foo_4(v);
  return f2_4(v);
}
function f2_4(v: III1_4<number, null> | III2_4<number, string> | II2_4<bigint, undefined>): number {
  if (v instanceof C1_4 || v instanceof C2_4) {
    check_C2_4(v);
    return 1;
  }
  else {
    expect(v instanceof C1_4 || v instanceof C2_4 || v instanceof C3_4).assertTrue();
    expect(v instanceof C1_4 || v instanceof C2_4 || v instanceof C3_4).assertTrue();
    foo_4(v);
    check_C3_4(v);
    return 2;
  }
}

namespace testNS1_5 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U = bigint, V = undefined> extends I1<U, V>, I2<U, V> {}
  interface III1<U = number, V = null> extends II1<U, V> {}
  interface III2<U = number, V = string> extends II1<U, V> {}
  class C1<U = number, V = null> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U = number, V = string> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U = bigint, V = undefined> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(123);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: Any) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: III1 | II2 | III2 | number): void {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof C1 || v instanceof C3 || v instanceof C2 || typeof v === 'number').assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2 || typeof v === 'number').assertTrue();
      foo(v);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_5(): boolean {
    let res: number = f1(new C1(123));
    expect(res).assertEqual(1);
    res = f1(new C3(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_5 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U = bigint, V = undefined> extends I1<U, V>, I2<U, V> {}
  interface III1<U = number, V = null> extends II1<U, V> {}
  interface III2<U = number, V = string> extends II1<U, V> {}
  class C1<U = number, V = null> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U = number, V = string> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U = bigint, V = undefined> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(123);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: Any) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: II1<number, null> | II1<number, string> | II2): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
      foo(v);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_5(): boolean {
    let res: number = f1(new C2(6.7));
    expect(res).assertEqual(1);
    res = f1(new C3(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_5 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U = bigint, V = undefined> extends I1<U, V>, I2<U, V> {}
  interface III1<U = number, V = null> extends II1<U, V> {}
  interface III2<U = number, V = string> extends II1<U, V> {}
  class C1<U = number, V = null> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U = number, V = string> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U = bigint, V = undefined> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(123);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: Any) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: I1<number, null> | I1<number, string> | I2<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_5(): boolean {
    let res: number = f1(new C1(123));
    expect(res).assertEqual(1);
    res = f1(new C3(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_5<U, V> {}
interface I2_5<U, V> {}
interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
interface II2_5<U = bigint, V = undefined> extends I1_5<U, V>, I2_5<U, V> {}
interface III1_5<U = number, V = null> extends II1_5<U, V> {}
interface III2_5<U = number, V = string> extends II1_5<U, V> {}
class C1_5<U = number, V = null> implements III1_5<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p;
  }
}
class C2_5<U = number, V = string> implements III2_5<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p;
  }
}
class C3_5<U = bigint, V = undefined> implements II2_5<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p;
  }
}
function check_C1_5(a: Any) {
  expect(a instanceof C1_5).assertTrue();
  expect((a as C1_5).c1_v as number).assertEqual(123);
}
function check_C2_5(a: Any) {
  expect(a instanceof C2_5).assertTrue();
  expect((a as C2_5).c2_v as number).assertEqual(6.7);
}
function check_C3_5(a: Any) {
  expect(a instanceof C3_5).assertTrue();
  expect((a as C3_5).c3_v as bigint).assertEqual(321n);
}
function foo_5(v: III1_5 | II2_5 | III2_5 | number): void {
  expect(v instanceof C1_5 || v instanceof C2_5 || v instanceof C3_5).assertTrue();
}
function f1_5(v: III1_5 | III2_5 | II2_5): number {
  expect(v instanceof C1_5 || v instanceof C3_5 || v instanceof C2_5 || typeof v === 'number').assertTrue();
  foo_5(v);
  return f2_5(v);
}
function f2_5(v: III1_5 | III2_5 | II2_5): number {
  if (v instanceof C1_5 || v instanceof C2_5) {
    check_C1_5(v);
    return 1;
  }
  else {
    expect(v instanceof C1_5 || v instanceof C2_5 || v instanceof C3_5).assertTrue();
    expect(v instanceof C1_5 || v instanceof C3_5 || v instanceof C2_5 || typeof v === 'number').assertTrue();
    foo_5(v);
    check_C3_5(v);
    return 2;
  }
}

namespace testNS1_6 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U = bigint, V = undefined> extends I1<U, V>, I2<U, V> {}
  interface III1<U = number, V = null> extends II1<U, V> {}
  interface III2<U = number, V = string> extends II1<U, V> {}
  class C1<U = number, V = null> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U = number, V = string> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U = bigint, V = undefined> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(123);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: Any) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: I1<number, null> | I1<number, string> | I1<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_6(): boolean {
    let res: number = f1(new C2(6.7));
    expect(res).assertEqual(1);
    res = f1(new C3(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_6 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U = bigint, V = undefined> extends I1<U, V>, I2<U, V> {}
  interface III1<U = number, V = null> extends II1<U, V> {}
  interface III2<U = number, V = string> extends II1<U, V> {}
  class C1<U = number, V = null> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U = number, V = string> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U = bigint, V = undefined> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1(a: Any) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(123);
  }
  function check_C2(a: Any) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: Any) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: I2<number, null> | I2<number, string> | I2<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) {
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_6(): boolean {
    let res: number = f1(new C1(123));
    expect(res).assertEqual(1);
    res = f1(new C3(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_6<U, V> {}
interface I2_6<U, V> {}
interface II1_6<U, V> extends I1_6<U, V>, I2_6<U, V> {}
interface II2_6<U = bigint, V = undefined> extends I1_6<U, V>, I2_6<U, V> {}
interface III1_6<U = number, V = null> extends II1_6<U, V> {}
interface III2_6<U = number, V = string> extends II1_6<U, V> {}
class C1_6<U = number, V = null> implements III1_6<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p;
  }
}
class C2_6<U = number, V = string> implements III2_6<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p;
  }
}
class C3_6<U = bigint, V = undefined> implements II2_6<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p;
  }
}
function check_C1_6(a: Any) {
  expect(a instanceof C1_6).assertTrue();
  expect((a as C1_6).c1_v as number).assertEqual(123);
}
function check_C2_6(a: Any) {
  expect(a instanceof C2_6).assertTrue();
  expect((a as C2_6).c2_v as number).assertEqual(6.7);
}
function check_C3_6(a: Any) {
  expect(a instanceof C3_6).assertTrue();
  expect((a as C3_6).c3_v as bigint).assertEqual(321n);
}
function foo_6(v: I1_6<number, null> | I1_6<number, string> | I1_6<bigint, undefined>): void {
  expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof C3_6).assertTrue();
}
function f1_6(v: III1_6 | III2_6 | II2_6): number {
  expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof C3_6).assertTrue();
  foo_6(v);
  return f2_6(v);
}
function f2_6(v: III1_6 | III2_6 | II2_6): number {
  if (v instanceof C1_6 || v instanceof C2_6) {
    check_C2_6(v);
    return 1;
  }
  else {
    expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof C3_6).assertTrue();
    expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof C3_6).assertTrue();
    foo_6(v);
    check_C3_6(v);
    return 2;
  }
}


export default function DiffTypeIsSubOfTypeTOnGenTest(): void {
  describe('DiffTypeIsSubOfTypeTOnGenTest', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0100
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0001
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0001';


      let res: number = f1_1(new C1_1<number, null>(321))
      expect(res).assertEqual(1)
      res = f1_1(new B2_1<bigint, undefined>(123n))
      expect(res).assertEqual(2)

      expect(testNS1_1.runTest_1()).assertTrue()
      expect(testNS2_1.runTest_1()).assertTrue()
      expect(testNS3_1.runTest_1()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0200
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0002
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0002';


      let res: number = f1_2(new C1_2(321))
      expect(res).assertEqual(1)
      res = f1_2(new B2_2(123n))
      expect(res).assertEqual(2)

      expect(testNS1_2.runTest_2()).assertTrue()
      expect(testNS2_2.runTest_2()).assertTrue()
      expect(testNS3_2.runTest_2()).assertTrue()

    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0300
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0003
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0003';



      let res: number = f1_3(new C1_3<number, null>(123))
      expect(res).assertEqual(1)
      res = f1_3(new C3_3<bigint, undefined>(321n))
      expect(res).assertEqual(2)

      expect(testNS1_3.runTest_3()).assertTrue()
      expect(testNS2_3.runTest_3()).assertTrue()
      expect(testNS3_3.runTest_3()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0400
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0004
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0004';



      let res: number = f1_4(new C2_4<number, string>(6.7))
      expect(res).assertEqual(1)
      res = f1_4(new C3_4<bigint, undefined>(321n))
      expect(res).assertEqual(2)

      expect(testNS1_4.runTest_4()).assertTrue()
      expect(testNS2_4.runTest_4()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0500
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0005
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0005';


      let res: number = f1_5(new C1_5(123))
      expect(res).assertEqual(1)
      res = f1_5(new C3_5(321n))
      expect(res).assertEqual(2)

      expect(testNS1_5.runTest_5()).assertTrue()
      expect(testNS2_5.runTest_5()).assertTrue()
      expect(testNS3_5.runTest_5()).assertTrue()

    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0600
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0006
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0006';

      let res: number = f1_6(new C2_6(6.7))
      expect(res).assertEqual(1)
      res = f1_6(new C3_6(321n))
      expect(res).assertEqual(2)

      expect(testNS1_6.runTest_6()).assertTrue()
      expect(testNS2_6.runTest_6()).assertTrue()
    });
  })
}