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
  function check_C1_1(a: Any) {
    expect(a instanceof C1_1).assertEqual(true)
    expect((a as C1_1<number, null>).c1_v as number).assertEqual(321)
  }
  function check_C2_1(a: Any) {
    expect(a instanceof C2_1).assertEqual(true)
    expect((a as C2_1<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_B2_1(a: Any) {
    expect(a instanceof B2_1).assertEqual(true)
    expect((a as B2_1<bigint, undefined>).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_1(a: Any) {
    expect(a instanceof Other_1).assertEqual(true)
    expect((a as Other_1<string>).other_v as string).assertEqual("other")
  }
  function check_1(v: B2_1<bigint, undefined> | Other_1<string> | C1_1<number, null>,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof C1_1 | C2_1 | B2_1 | Other_1).assertEqual(is_subtype_of_A)
    if (v instanceof C1_1 | C2_1 | B2_1 | Other_1) {
      res = check_is_in_diff_type_1(v as C1_1<number, null> | C2_1<number, string> |
      B2_1<bigint, undefined> | Other_1<string>, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C1_1(v)
    }
    else {
      check_B2_1(v)
    }
  }
  function check_is_in_diff_type_1(v: C1_1<number, null> | C2_1<number, string> |
  B2_1<bigint, undefined> | Other_1<string>,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v instanceof B1_1) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v instanceof B1_1).assertEqual(false)
  }

  export function runTest_1(): boolean {
    let v1: B2_1<bigint, undefined> | Other_1<string> | C1_1<number, null> = new C1_1<number, null>(321)
    let v2: B2_1<bigint, undefined> | Other_1<string> | C1_1<number, null> = new B2_1<bigint, undefined>(123n)
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_1 {
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
  function check_C1_1(a: Any) {
    expect(a instanceof C1_1).assertEqual(true)
    expect((a as C1_1<number, null>).c1_v as number).assertEqual(321)
  }
  function check_C2_1(a: Any) {
    expect(a instanceof C2_1).assertEqual(true)
    expect((a as C2_1<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_B2_1(a: Any) {
    expect(a instanceof B2_1).assertEqual(true)
    expect((a as B2_1<bigint, undefined>).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_1(a: Any) {
    expect(a instanceof Other_1).assertEqual(true)
    expect((a as Other_1<string>).other_v as string).assertEqual("other")
  }
  function check_1(v: B1_1<number, null> | B1_1<number, string> | B2_1<bigint, undefined> | Other_1<string>,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof C1_1 | C2_1 | B2_1 | Other_1).assertEqual(is_subtype_of_A)
    if (v instanceof C1_1 | C2_1 | B2_1 | Other_1) {
      res = check_is_in_diff_type_1(v as C1_1<number, null> | C2_1<number, string> |
      B2_1<bigint, undefined> | Other_1<string>, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C2_1(v)
    }
    else {
      check_B2_1(v)
    }
  }
  function check_is_in_diff_type_1(v: C1_1<number, null> | C2_1<number, string> |
  B2_1<bigint, undefined> | Other_1<string>,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v instanceof B1_1) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v instanceof B1_1).assertEqual(false)
  }

  export function runTest_1(): boolean {
    let v1: B1_1<number, null> | B1_1<number, string> | B2_1<bigint, undefined> |
    Other_1<string> = new C2_1<number, string>(6.7)
    let v2: B1_1<number, null> | B1_1<number, string> | B2_1<bigint, undefined> |
    Other_1<string> = new B2_1<bigint, undefined>(123n)
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(false)
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
  function check_C1_1(a: Any) {
    expect(a instanceof C1_1).assertEqual(true)
    expect((a as C1_1<number, null>).c1_v as number).assertEqual(321)
  }
  function check_C2_1(a: Any) {
    expect(a instanceof C2_1).assertEqual(true)
    expect((a as C2_1<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_B2_1(a: Any) {
    expect(a instanceof B2_1).assertEqual(true)
    expect((a as B2_1<bigint, undefined>).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_1(a: Any) {
    expect(a instanceof Other_1).assertEqual(true)
    expect((a as Other_1<string>).other_v as string).assertEqual("other")
  }
  function check_1(v: A_1<number, null> | A_1<number, string> | A_1<bigint, undefined> | Other_1<string>,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof C1_1 | C2_1 | B2_1 | Other_1).assertEqual(is_subtype_of_A)
    if (v instanceof C1_1 | C2_1 | B2_1 | Other_1) {
      res = check_is_in_diff_type_1(v as C1_1<number, null> | C2_1<number, string> |
      B2_1<bigint, undefined> | Other_1<string>, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C2_1(v)
    }
    else {
      check_B2_1(v)
    }
  }
  function check_is_in_diff_type_1(v: C1_1<number, null> | C2_1<number, string> |
  B2_1<bigint, undefined> | Other_1<string>,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v instanceof B1_1) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v instanceof B1_1).assertEqual(false)
  }

  export function runTest_1(): boolean {
    let v1: A_1<number, null> | A_1<number, string> | A_1<bigint, undefined> |
    Other_1<string> = new C2_1<number, string>(6.7)
    let v2: A_1<number, null> | A_1<number, string> | A_1<bigint, undefined> |
    Other_1<string> = new B2_1<bigint, undefined>(123n)
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_1 {
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
  function check_C1_1(a: Any) {
    expect(a instanceof C1_1).assertEqual(true)
    expect((a as C1_1<number, null>).c1_v as number).assertEqual(321)
  }
  function check_C2_1(a: Any) {
    expect(a instanceof C2_1).assertEqual(true)
    expect((a as C2_1<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_B2_1(a: Any) {
    expect(a instanceof B2_1).assertEqual(true)
    expect((a as B2_1<bigint, undefined>).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_1(a: Any) {
    expect(a instanceof Other_1).assertEqual(true)
    expect((a as Other_1<string>).other_v as string).assertEqual("other")
  }
  function check_1(v: B2_1<bigint, undefined> | Other_1<string>,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof C1_1 | C2_1 | B2_1 | Other_1).assertEqual(is_subtype_of_A)
    if (v instanceof C1_1 | C2_1 | B2_1 | Other_1) {
      res = check_is_in_diff_type_1(v as C1_1<number, null> | C2_1<number, string> |
      B2_1<bigint, undefined> | Other_1<string>, v_id)
    }
    if (res) {
      check_is_not_in_B_type_1(v, v_id)
    }
    return res
  }
  function check_value_1(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_Other_1(v)
    }
    else {
      check_B2_1(v)
    }
  }
  function check_is_in_diff_type_1(v: C1_1<number, null> | C2_1<number, string> |
  B2_1<bigint, undefined> | Other_1<string>,
    v_id: number): boolean {
    check_value_1(v, v_id)
    if (v instanceof B1_1) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_1(v: Any, v_id: number): void {
    check_value_1(v, v_id)
    expect(v instanceof B1_1).assertEqual(false)
  }

  export function runTest_1(): boolean {
    let v1: B2_1<bigint, undefined> | Other_1<string> = new Other_1<string>("other")
    let v2: B2_1<bigint, undefined> | Other_1<string> = new B2_1<bigint, undefined>(123n)
    let res: boolean =
      check_1(v1, true, 1) &
      check_1(v2, true, 2)
    expect(res).assertEqual(true)
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
function check_C1_1(a: Any) {
  expect(a instanceof C1_1).assertEqual(true)
  expect((a as C1_1<number, null>).c1_v as number).assertEqual(321)
}
function check_C2_1(a: Any) {
  expect(a instanceof C2_1).assertEqual(true)
  expect((a as C2_1<number, string>).c2_v as number).assertEqual(6.7)
}
function check_B2_1(a: Any) {
  expect(a instanceof B2_1).assertEqual(true)
  expect((a as B2_1<bigint, undefined>).b2_v as bigint).assertEqual(123n)
}
function check_Other_1(a: Any) {
  expect(a instanceof Other_1).assertEqual(true)
  expect((a as Other_1<string>).other_v as string).assertEqual("other")
}
function check_1(v: B2_1<bigint, undefined> | Other_1<string> | C1_1<number, null>,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof C1_1 | C2_1 | B2_1 | Other_1).assertEqual(is_subtype_of_A)
  if (v instanceof C1_1 | C2_1 | B2_1 | Other_1) {
    res = check_is_in_diff_type_1(v as C1_1<number, null> | C2_1<number, string> |
    B2_1<bigint, undefined> | Other_1<string>, v_id)
  }
  if (res) {
    check_is_not_in_B_type_1(v, v_id)
  }
  return res
}
function check_value_1(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_1(v)
  }
  else {
    check_B2_1(v)
  }
}
function check_is_in_diff_type_1(v: C1_1<number, null> | C2_1<number, string> |
B2_1<bigint, undefined> | Other_1<string>,
  v_id: number): boolean {
  check_value_1(v, v_id)
  if (v instanceof B1_1) {
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_1(v: Any, v_id: number): void {
  check_value_1(v, v_id)
  expect(v instanceof B1_1).assertEqual(false)
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
  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).c1_v as number).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).c2_v as number).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).other_v as string).assertEqual("other")
  }
  function check_2(v: B2_2 | Other_2 | C1_2,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(is_subtype_of_A)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
      res = check_is_in_diff_type_2(v as C1_2 | C2_2 | B2_2 | Other_2, v_id)
    }
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }
  function check_value_2(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C1_2(v)
    }
    else {
      check_B2_2(v)
    }
  }
  function check_is_in_diff_type_2(v: C1_2 | C2_2| B2_2 | Other_2,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof B1_2) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_2(v: Any, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof B1_2).assertEqual(false)
  }

  export function runTest_2(): boolean {
    let v1: B2_2 | Other_2 | C1_2 = new C1_2(321)
    let v2: B2_2 | Other_2 | C1_2 = new B2_2(123n)
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(false)
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
  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).c1_v as number).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).c2_v as number).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).other_v as string).assertEqual("other")
  }
  function check_2(v: B1_2<number, null> | B1_2<number, string> | B2_2 | Other_2,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(is_subtype_of_A)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
      res = check_is_in_diff_type_2(v as C1_2 | C2_2 | B2_2 | Other_2, v_id)
    }
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }
  function check_value_2(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C2_2(v)
    }
    else {
      check_B2_2(v)
    }
  }
  function check_is_in_diff_type_2(v: C1_2 | C2_2| B2_2 | Other_2,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof B1_2) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_2(v: Any, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof B1_2).assertEqual(false)
  }

  export function runTest_2(): boolean {
    let v1: B1_2<number, null> | B1_2<number, string> | B2_2 | Other_2 = new C2_2(6.7)
    let v2: B1_2<number, null> | B1_2<number, string> | B2_2 | Other_2 = new B2_2(123n)
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(false)
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
  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).c1_v as number).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).c2_v as number).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).other_v as string).assertEqual("other")
  }
  function check_2(v: A_2<number, null> | A_2<number, string> | A_2<bigint, undefined> | Other_2,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(is_subtype_of_A)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
      res = check_is_in_diff_type_2(v as C1_2 | C2_2 | B2_2 | Other_2, v_id)
    }
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }
  function check_value_2(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C2_2(v)
    }
    else {
      check_B2_2(v)
    }
  }
  function check_is_in_diff_type_2(v: C1_2 | C2_2| B2_2 | Other_2,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof B1_2) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_2(v: Any, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof B1_2).assertEqual(false)
  }

  export function runTest_2(): boolean {
    let v1: A_2<number, null> | A_2<number, string> | A_2<bigint, undefined> | Other_2 = new C2_2(6.7)
    let v2: A_2<number, null> | A_2<number, string> | A_2<bigint, undefined> | Other_2 = new B2_2(123n)
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_2 {
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
  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).c1_v as number).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).c2_v as number).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).other_v as string).assertEqual("other")
  }
  function check_2(v: B2_2 | Other_2,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(is_subtype_of_A)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
      res = check_is_in_diff_type_2(v as C1_2 | C2_2 | B2_2 | Other_2, v_id)
    }
    if (res) {
      check_is_not_in_B_type_2(v, v_id)
    }
    return res
  }
  function check_value_2(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_Other_2(v)
    }
    else {
      check_B2_2(v)
    }
  }
  function check_is_in_diff_type_2(v: C1_2 | C2_2| B2_2 | Other_2,
    v_id: number): boolean {
    check_value_2(v, v_id)
    if (v instanceof B1_2) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_2(v: Any, v_id: number): void {
    check_value_2(v, v_id)
    expect(v instanceof B1_2).assertEqual(false)
  }

  export function runTest_2(): boolean {
    let v1: B2_2 | Other_2 = new Other_2("other")
    let v2: B2_2 | Other_2 = new B2_2(123n)
    let res: boolean =
      check_2(v1, true, 1) &
      check_2(v2, true, 2)
    expect(res).assertEqual(true)
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
function check_C1_2(a: Any) {
  expect(a instanceof C1_2).assertEqual(true)
  expect((a as C1_2).c1_v as number).assertEqual(321)
}
function check_C2_2(a: Any) {
  expect(a instanceof C2_2).assertEqual(true)
  expect((a as C2_2).c2_v as number).assertEqual(6.7)
}
function check_B2_2(a: Any) {
  expect(a instanceof B2_2).assertEqual(true)
  expect((a as B2_2).b2_v as bigint).assertEqual(123n)
}
function check_Other_2(a: Any) {
  expect(a instanceof Other_2).assertEqual(true)
  expect((a as Other_2).other_v as string).assertEqual("other")
}
function check_2(v: B2_2 | Other_2 | C1_2,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(is_subtype_of_A)
  if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
    res = check_is_in_diff_type_2(v as C1_2 | C2_2 | B2_2 | Other_2, v_id)
  }
  if (res) {
    check_is_not_in_B_type_2(v, v_id)
  }
  return res
}
function check_value_2(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_2(v)
  }
  else {
    check_B2_2(v)
  }
}
function check_is_in_diff_type_2(v: C1_2 | C2_2| B2_2 | Other_2,
  v_id: number): boolean {
  check_value_2(v, v_id)
  if (v instanceof B1_2) {
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_2(v: Any, v_id: number): void {
  check_value_2(v, v_id)
  expect(v instanceof B1_2).assertEqual(false)
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
  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3<number, null>).c1_v as number).assertEqual(123)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_int_3(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }
  function check_3(v: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string>,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
    if (v instanceof III1_3 | III2_3 | II2_3 | number) {
      res = check_is_in_diff_type_3(v as III1_3<number, null> | III2_3<number, string> |
      II2_3<bigint, undefined> | number, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C1_3(v)
    }
    else {
      check_C3_3(v)
    }
  }
  function check_is_in_diff_type_3(v: III1_3<number, null> | III2_3<number, string> |
  II2_3<bigint, undefined> | number,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof II1_3) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof II1_3).assertEqual(false)
  }

  export function runTest_3(): boolean {
    let v1: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string> =
      new C1_3<number, null>(123)
    let v2: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string> =
      new C3_3<bigint, undefined>(321n)
    let res: boolean =
      check_3(v1, true, 1) &
      check_3(v2, true, 2)
    expect(res).assertEqual(false)
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
  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3<number, null>).c1_v as number).assertEqual(123)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_int_3(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }
  function check_3(v: II1_3<number, null> | II1_3<number, string> | II2_3<bigint, undefined>,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
    if (v instanceof III1_3 | III2_3 | II2_3 | number) {
      res = check_is_in_diff_type_3(v as III1_3<number, null> | III2_3<number, string> |
      II2_3<bigint, undefined> | number, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C2_3(v)
    }
    else {
      check_C3_3(v)
    }
  }
  function check_is_in_diff_type_3(v: III1_3<number, null> | III2_3<number, string> |
  II2_3<bigint, undefined> | number,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof II1_3) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof II1_3).assertEqual(false)
  }

  export function runTest_3(): boolean {
    let v1: II1_3<number, null> | II1_3<number, string> | II2_3<bigint, undefined> =
      new C2_3<number, string>(6.7)
    let v2: II1_3<number, null> | II1_3<number, string> | II2_3<bigint, undefined> =
      new C3_3<bigint, undefined>(321n)
    let res: boolean =
      check_3(v1, true, 1) &
      check_3(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_3 {
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
  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3<number, null>).c1_v as number).assertEqual(123)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_int_3(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }
  function check_3(v: I1_3<number, null> | I2_3<bigint, undefined>,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
    if (v instanceof III1_3 | III2_3 | II2_3 | number) {
      res = check_is_in_diff_type_3(v as III1_3<number, null> | III2_3<number, string> |
      II2_3<bigint, undefined> | number, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C1_3(v)
    }
    else {
      check_C3_3(v)
    }
  }
  function check_is_in_diff_type_3(v: III1_3<number, null> | III2_3<number, string> |
  II2_3<bigint, undefined> | number,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof II1_3) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof II1_3).assertEqual(false)
  }

  export function runTest_3(): boolean {
    let v1: I1_3<number, null> | I2_3<bigint, undefined> = new C1_3<number, null>(123)
    let v2: I1_3<number, null> | I2_3<bigint, undefined> = new C3_3<bigint, undefined>(321n)
    let res: boolean =
      check_3(v1, true, 1) &
      check_3(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_3 {
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
  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3<number, null>).c1_v as number).assertEqual(123)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_int_3(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }
  function check_3(v: I1_3<number, string> | I1_3<bigint, undefined>,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
    if (v instanceof III1_3 | III2_3 | II2_3 | number) {
      res = check_is_in_diff_type_3(v as III1_3<number, null> | III2_3<number, string> |
      II2_3<bigint, undefined> | number, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_C2_3(v)
    }
    else {
      check_C3_3(v)
    }
  }
  function check_is_in_diff_type_3(v: III1_3<number, null> | III2_3<number, string> |
  II2_3<bigint, undefined> | number,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof II1_3) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof II1_3).assertEqual(false)
  }

  export function runTest_3(): boolean {
    let v1: I1_3<number, string> | I1_3<bigint, undefined> = new C2_3<number, string>(6.7)
    let v2: I1_3<number, string> | I1_3<bigint, undefined> = new C3_3<bigint, undefined>(321n)
    let res: boolean =
      check_3(v1, true, 1) &
      check_3(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_3 {
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
  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3<number, null>).c1_v as number).assertEqual(123)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_int_3(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(123)
  }
  function check_3(v: C3_3<bigint, undefined> | number,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = false
    expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
    if (v instanceof III1_3 | III2_3 | II2_3 | number) {
      res = check_is_in_diff_type_3(v as III1_3<number, null> | III2_3<number, string> |
      II2_3<bigint, undefined> | number, v_id)
    }
    if (res) {
      check_is_not_in_B_type_3(v, v_id)
    }
    return res
  }
  function check_value_3(v: Any, v_id: number): void {
    if (v_id == 1) {
      check_int_3(v)
    }
    else {
      check_C3_3(v)
    }
  }
  function check_is_in_diff_type_3(v: III1_3<number, null> | III2_3<number, string> |
  II2_3<bigint, undefined> | number,
    v_id: number): boolean {
    check_value_3(v, v_id)
    if (v instanceof II1_3) {
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type_3(v: Any, v_id: number): void {
    check_value_3(v, v_id)
    expect(v instanceof II1_3).assertEqual(false)
  }

  export function runTest_3(): boolean {
    let v1: C3_3<bigint, undefined> | number = 123
    let v2: C3_3<bigint, undefined> | number = new C3_3<bigint, undefined>(321n)
    let res: boolean =
      check_3(v1, true, 1) &
      check_3(v2, true, 2)
    expect(res).assertEqual(true)
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
function check_C1_3(a: Any) {
  expect(a instanceof C1_3).assertEqual(true)
  expect(a instanceof III1_3).assertEqual(true)
  expect(a instanceof II1_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C1_3<number, null>).c1_v as number).assertEqual(123)
}
function check_C2_3(a: Any) {
  expect(a instanceof C2_3).assertEqual(true)
  expect(a instanceof III2_3).assertEqual(true)
  expect(a instanceof II1_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C2_3<number, string>).c2_v as number).assertEqual(6.7)
}
function check_C3_3(a: Any) {
  expect(a instanceof C3_3).assertEqual(true)
  expect(a instanceof II2_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C3_3<bigint, undefined>).c3_v as bigint).assertEqual(321n)
}
function check_int_3(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(123)
}
function check_3(v: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string>,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
  if (v instanceof III1_3 | III2_3 | II2_3 | number) {
    res = check_is_in_diff_type_3(v as III1_3<number, null> | III2_3<number, string> |
    II2_3<bigint, undefined> | number, v_id)
  }
  if (res) {
    check_is_not_in_B_type_3(v, v_id)
  }
  return res
}
function check_value_3(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_3(v)
  }
  else {
    check_C3_3(v)
  }
}
function check_is_in_diff_type_3(v: III1_3<number, null> | III2_3<number, string> |
II2_3<bigint, undefined> | number,
  v_id: number): boolean {
  check_value_3(v, v_id)
  if (v instanceof II1_3) {
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_3(v: Any, v_id: number): void {
  check_value_3(v, v_id)
  expect(v instanceof II1_3).assertEqual(false)
}

export default function TypeTIsSubOfDiffOnGenTest(): void {
  describe('TypeTIsSubOfDiffOnGenTest', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_GEN_0100
     * @tc.name      testTypeTIsSubOfDiffOnGen0001
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTypeTIsSubOfDiffOnGen0001';

      let v1: B2_1<bigint, undefined> | Other_1<string> | C1_1<number, null> = new C1_1<number, null>(321)
      let v2: B2_1<bigint, undefined> | Other_1<string> | C1_1<number, null> = new B2_1<bigint, undefined>(123n)
      let res: boolean = check_1(v1, true, 1) & check_1(v2, true, 2)
      expect(res).assertEqual(false)

      expect(testNS1_1.runTest_1()).assertEqual(true)
      expect(testNS2_1.runTest_1()).assertEqual(true)
      expect(testNS3_1.runTest_1()).assertEqual(true)
      expect(testNS4_1.runTest_1()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_GEN_0200
     * @tc.name      testTypeTIsSubOfDiffOnGen0002
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTypeTIsSubOfDiffOnGen0002';

      let v1: B2_2 | Other_2 | C1_2 = new C1_2(321)
      let v2: B2_2 | Other_2 | C1_2 = new B2_2(123n)
      let res: boolean =
        check_2(v1, true, 1) &
        check_2(v2, true, 2)
      expect(res).assertEqual(false)

      expect(testNS1_2.runTest_2()).assertEqual(true)
      expect(testNS2_2.runTest_2()).assertEqual(true)
      expect(testNS3_2.runTest_2()).assertEqual(true)
      expect(testNS4_2.runTest_2()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_GEN_0300
     * @tc.name      testTypeTIsSubOfDiffOnGen0003
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnGen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTypeTIsSubOfDiffOnGen0003';

      let v1: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string> = new C1_3<number, null>(123)
      let v2: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string> = new C3_3<bigint, undefined>(321n)
      let res: boolean =
        check_3(v1, true, 1) &
        check_3(v2, true, 2)
      expect(res).assertEqual(false)

      expect(testNS1_3.runTest_3()).assertEqual(true)
      expect(testNS2_3.runTest_3()).assertEqual(true)
      expect(testNS3_3.runTest_3()).assertEqual(true)
      expect(testNS4_3.runTest_3()).assertEqual(true)
      expect(testNS5_3.runTest_3()).assertEqual(true)
    });
  })
}