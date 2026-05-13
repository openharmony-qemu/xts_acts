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

namespace testNS1_13 {
  interface I_13<U, V> {}
  interface II1_13<U, V> extends I_13<U, V> {}
  interface II2_13<U, V> extends I_13<U, V> {}
  interface III1_13<U, V> extends II1_13<U, V> {}
  interface III2_13<U, V> extends II1_13<U, V> {}
  class C1_13<U, V> implements III1_13<U, V>, III2_13<U, V> {
    c1_v: U | V
    constructor(p: U | V) {
      this.c1_v = p
    }
  }
  class C2_13<U, V> implements II2_13<U, V>, III2_13<U, V> {
    c2_v: U | V
    constructor(p: U | V) {
      this.c2_v = p
    }
  }
  class C3_13<U, V> implements III1_13<U, V> {
    c3_v: U | V
    constructor(p: U | V) {
      this.c3_v = p
    }
  }

  type T13 = C1_13<number, null> | C2_13<number, string> | C3_13<bigint, undefined> | bigint;

  function check_C1_13(a: C1_13<number, null>) {
    expect(a instanceof C1_13).assertTrue()
    expect(a instanceof III1_13).assertTrue()
    expect(a instanceof III2_13).assertTrue()
    expect(a instanceof II1_13).assertTrue()
    expect(a instanceof I_13).assertTrue()
    expect((a as C1_13<number, null>).c1_v).assertEqual(123)
  }
  function check_C2_13(a: C2_13<number, string>) {
    expect(a instanceof C2_13).assertTrue()
    expect(a instanceof II2_13).assertTrue()
    expect(a instanceof III2_13).assertTrue()
    expect(a instanceof II1_13).assertTrue()
    expect(a instanceof I_13).assertTrue()
    expect((a as C2_13<number, string>).c2_v).assertEqual(6.7)
  }
  function check_C3_13(a: C3_13<bigint, undefined>) {
    expect(a instanceof C3_13).assertTrue()
    expect(a instanceof III1_13).assertTrue()
    expect(a instanceof II1_13).assertTrue()
    expect(a instanceof I_13).assertTrue()
    expect((a as C3_13<bigint, undefined>).c3_v).assertEqual(321n)
  }
  function check_bigint_13(a: bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a).assertEqual(5n)
  }
  function check_value_13(v: T13, v_id: number): void {
    if (v_id == 1) {
      check_C1_13(v as C1_13<number, null>)
      check_C1_13(v as C1_13<number, null>)
      check_C1_13(v as C1_13<number, null>)
    } else if (v_id == 2) {
      check_C3_13(v as C3_13<bigint, undefined>)
      check_C3_13(v as C3_13<bigint, undefined>)
    } else {
      check_bigint_13(v as bigint)
      check_bigint_13(v as bigint)
    }
  }
  function check_value_as_type_T_13(v: T13, v_id: number): void {
    expect(
      v instanceof III1_13 || v instanceof II2_13 ||
        v instanceof III2_13 || typeof v === 'bigint'
    ).assertTrue()
    check_value_13(v, v_id)
  }function check_is_in_T_type_13(
    v: T13,
    v_id: number
  ): boolean {
    check_value_13(v, v_id)
    if (v instanceof III1_13 || v instanceof II2_13) {
      check_value_13(v as T13, v_id)                     
      if (v instanceof III2_13 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_13(v as T13, v_id)
        expect(v instanceof III1_13 || v instanceof II2_13).assertTrue()
        check_value_as_type_T_13(v as T13, v_id)         
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_13(v as T13, v_id)
        check_value_as_type_T_13(v as T13, v_id)
        return true
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_13(v as T13, v_id)
      check_value_as_type_T_13(v as T13, v_id)
      return true
    }
  }

  export function runTest_13(): boolean {
    const res1 = check_is_in_T_type_13(new C1_13<number, null>(123), 1)
    const res2 = check_is_in_T_type_13(new C3_13<bigint, undefined>(321n), 2)
    const res3 = check_is_in_T_type_13(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_13 {
  interface I_13<U, V> {}
  interface II1_13<U, V> extends I_13<U, V> {}
  interface II2_13<U, V> extends I_13<U, V> {}
  interface III1_13<U, V> extends II1_13<U, V> {}
  interface III2_13<U, V> extends II1_13<U, V> {}
  class C1_13<U, V> implements III1_13<U, V>, III2_13<U, V> {
    c1_v: U | V
    constructor(p: U | V) {
      this.c1_v = p
    }
  }
  class C2_13<U, V> implements II2_13<U, V>, III2_13<U, V> {
    c2_v: U | V
    constructor(p: U | V) {
      this.c2_v = p
    }
  }
  class C3_13<U, V> implements III1_13<U, V> {
    c3_v: U | V
    constructor(p: U | V) {
      this.c3_v = p
    }
  }

  type T13b = C1_13<number, null> | C2_13<number, string> | C3_13<bigint, undefined> | bigint;

  function check_C1_13(a: C1_13<number, null>) {
    expect(a instanceof C1_13).assertTrue()
    expect(a instanceof III1_13).assertTrue()
    expect(a instanceof III2_13).assertTrue()
    expect(a instanceof II1_13).assertTrue()
    expect(a instanceof I_13).assertTrue()
    expect((a as C1_13<number, null>).c1_v).assertEqual(123)
  }
  function check_C2_13(a: C2_13<number, string>) {
    expect(a instanceof C2_13).assertTrue()
    expect(a instanceof II2_13).assertTrue()
    expect(a instanceof III2_13).assertTrue()
    expect(a instanceof II1_13).assertTrue()
    expect(a instanceof I_13).assertTrue()
    expect((a as C2_13<number, string>).c2_v).assertEqual(6.7)
  }
  function check_C3_13(a: C3_13<bigint, undefined>) {
    expect(a instanceof C3_13).assertTrue()
    expect(a instanceof III1_13).assertTrue()
    expect(a instanceof II1_13).assertTrue()
    expect(a instanceof I_13).assertTrue()
    expect((a as C3_13<bigint, undefined>).c3_v).assertEqual(321n)
  }
  function check_bigint_13(a: bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a).assertEqual(5n)
  }
  function check_value_13(v: T13b, v_id: number): void {
    if (v_id == 1) {
      check_C2_13(v as C2_13<number, string>)
      check_C2_13(v as C2_13<number, string>)
      check_C2_13(v as C2_13<number, string>)
    } else if (v_id == 2) {
      check_C3_13(v as C3_13<bigint, undefined>)
      check_C3_13(v as C3_13<bigint, undefined>)
    } else {
      check_bigint_13(v as bigint)
      check_bigint_13(v as bigint)
    }
  }
  function check_value_as_type_T_13(v: T13b, v_id: number): void {
    expect(
      v instanceof III1_13 || v instanceof II2_13 ||
        v instanceof III2_13 || typeof v === 'bigint'
    ).assertTrue()
    check_value_13(v, v_id)
  }function check_is_in_T_type_13(
    v: T13b,
    v_id: number
  ): boolean {
    check_value_13(v, v_id)
    if (v instanceof III1_13 || v instanceof II2_13) {
      check_value_13(v as T13b, v_id)                     
      if (v instanceof III2_13 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_13(v as T13b, v_id)
        expect(v instanceof III1_13 || v instanceof II2_13).assertTrue()
        check_value_as_type_T_13(v as T13b, v_id)
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_13(v as T13b, v_id)
        check_value_as_type_T_13(v as T13b, v_id)
        return true
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_13(v as T13b, v_id)
      check_value_as_type_T_13(v as T13b, v_id)
      return true
    }
  }

  export function runTest_13(): boolean {
    const res1 = check_is_in_T_type_13(new C2_13<number, string>(6.7), 1)
    const res2 = check_is_in_T_type_13(new C3_13<bigint, undefined>(321n), 2)
    const res3 = check_is_in_T_type_13(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

// 全局部分（重复定义，但保留）
interface I_13<U, V> {}
interface II1_13<U, V> extends I_13<U, V> {}
interface II2_13<U, V> extends I_13<U, V> {}
interface III1_13<U, V> extends II1_13<U, V> {}
interface III2_13<U, V> extends II1_13<U, V> {}
class C1_13<U, V> implements III1_13<U, V>, III2_13<U, V> {
  c1_v: U | V
  constructor(p: U | V) {
    this.c1_v = p
  }
}
class C2_13<U, V> implements II2_13<U, V>, III2_13<U, V> {
  c2_v: U | V
  constructor(p: U | V) {
    this.c2_v = p
  }
}
class C3_13<U, V> implements III1_13<U, V> {
  c3_v: U | V
  constructor(p: U | V) {
    this.c3_v = p
  }
}
type T13g = C1_13<number, null> | C2_13<number, string> | C3_13<bigint, undefined> | bigint;

function check_C1_13(a: C1_13<number, null>) {
  expect(a instanceof C1_13).assertTrue()
  expect(a instanceof III1_13).assertTrue()
  expect(a instanceof III2_13).assertTrue()
  expect(a instanceof II1_13).assertTrue()
  expect(a instanceof I_13).assertTrue()
  expect((a as C1_13<number, null>).c1_v).assertEqual(123)
}
function check_C2_13(a: C2_13<number, string>) {
  expect(a instanceof C2_13).assertTrue()
  expect(a instanceof II2_13).assertTrue()
  expect(a instanceof III2_13).assertTrue()
  expect(a instanceof II1_13).assertTrue()
  expect(a instanceof I_13).assertTrue()
  expect((a as C2_13<number, string>).c2_v).assertEqual(6.7)
}
function check_C3_13(a: C3_13<bigint, undefined>) {
  expect(a instanceof C3_13).assertTrue()
  expect(a instanceof III1_13).assertTrue()
  expect(a instanceof II1_13).assertTrue()
  expect(a instanceof I_13).assertTrue()
  expect((a as C3_13<bigint, undefined>).c3_v).assertEqual(321n)
}
function check_bigint_13(a: bigint) {
  expect(typeof a === 'bigint').assertTrue()
  expect(a).assertEqual(5n)
}
function check_value_13(v: T13g, v_id: number): void {
  if (v_id == 1) {
    check_C1_13(v as C1_13<number, null>)
    check_C1_13(v as C1_13<number, null>)
    check_C1_13(v as C1_13<number, null>)
  } else if (v_id == 2) {
    check_C3_13(v as C3_13<bigint, undefined>)
    check_C3_13(v as C3_13<bigint, undefined>)
  } else {
    check_bigint_13(v as bigint)
    check_bigint_13(v as bigint)
  }
}
function check_value_as_type_T_13(v: T13g, v_id: number): void {
  expect(
    v instanceof III1_13 || v instanceof II2_13 ||
      v instanceof III2_13 || typeof v === 'bigint'
  ).assertTrue()
  check_value_13(v, v_id)
}function check_is_in_T_type_13(
  v: T13g,
  v_id: number
): boolean {
  check_value_13(v, v_id)
  if (v instanceof III1_13 || v instanceof II2_13) {
    check_value_13(v as T13g, v_id)
    if (v instanceof III2_13 || typeof v === 'bigint') {
      expect(v_id).assertEqual(1)
      check_value_13(v as T13g, v_id)
      expect(v instanceof III1_13 || v instanceof II2_13).assertTrue()
      check_value_as_type_T_13(v as T13g, v_id)
      return true
    } else {
      expect(v_id).assertEqual(2)
      check_value_13(v as T13g, v_id)
      check_value_as_type_T_13(v as T13g, v_id)
      return true
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_13(v as T13g, v_id)
    check_value_as_type_T_13(v as T13g, v_id)
    return true
  }
}

namespace testNS1_14 {
  class C1_14<in T1, out T2> {
    readonly c1_v: T2
    constructor(p: T2) {
      this.c1_v = p
    }
  }
  class C2_14<out T1, in T2> {
    readonly c2_v: T1
    constructor(p: T1) {
      this.c2_v = p
    }
  }
  class Base_14 {
    b_v: bigint
    constructor(p: bigint) {
      this.b_v = p
    }
  }
  class Derived_14 extends Base_14 {
    d_v: number
    constructor(p: number) {
      super(0n)
      this.d_v = p
    }
  }

  type T14 = C1_14<Base_14, Base_14> | C2_14<Derived_14, Base_14> | bigint;

  function check_C1_14(a: C1_14<Base_14, Base_14>) {
    expect(a instanceof C1_14).assertTrue()
    expect(((a as C1_14<Base_14, Base_14>).c1_v as Base_14).b_v).assertEqual(123n)
  }
  function check_C2_14(a: C2_14<Derived_14, Base_14>) {
    expect(a instanceof C2_14).assertTrue()
    expect(((a as C2_14<Derived_14, Base_14>).c2_v as Derived_14).d_v).assertEqual(321)
  }
  function check_bigint_14(a: bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_14(v: T14, v_id: number): void {
    if (v_id == 1) {
      check_C2_14(v as C2_14<Derived_14, Base_14>)
      check_C2_14(v as C2_14<Derived_14, Base_14>)
      check_C2_14(v as C2_14<Derived_14, Base_14>)
    } else if (v_id == 2) {
      check_C1_14(v as C1_14<Base_14, Base_14>)
      check_C1_14(v as C1_14<Base_14, Base_14>)
    } else {
      check_bigint_14(v as bigint)
      check_bigint_14(v as bigint)
    }
  }
  function check_value_as_type_T_14(v: T14, v_id: number): void {
    expect(
      v instanceof C1_14 || v instanceof C2_14 ||
        v instanceof C2_14 || typeof v === 'bigint'
    ).assertTrue()
    check_value_14(v, v_id)
  }
  function check_is_in_T_type_14(
    v: T14,
    v_id: number
  ): boolean {
    check_value_14(v, v_id)
    if (v instanceof C1_14 || v instanceof C2_14) {
      check_value_14(v, v_id)
      if (v instanceof C2_14 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_14(v, v_id)
        expect(v instanceof C1_14 || v instanceof C2_14).assertTrue()
        check_value_as_type_T_14(v, v_id)
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_14(v, v_id)
        check_value_as_type_T_14(v, v_id)
        return true
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_14(v, v_id)
      check_value_as_type_T_14(v, v_id)
      return true
    }
  }

  export function runTest_14(): boolean {
    const res1 = check_is_in_T_type_14(new C2_14<Derived_14, Base_14>(new Derived_14(321)), 1)
    const res2 = check_is_in_T_type_14(new C1_14<Base_14, Base_14>(new Base_14(123n)), 2)
    const res3 = check_is_in_T_type_14(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_14 {
  class C1_14<in T1, out T2> {
    readonly c1_v: T2
    constructor(p: T2) {
      this.c1_v = p
    }
  }
  class C2_14<out T1, in T2> {
    readonly c2_v: T1
    constructor(p: T1) {
      this.c2_v = p
    }
  }
  class Base_14 {
    b_v: bigint
    constructor(p: bigint) {
      this.b_v = p
    }
  }
  class Derived_14 extends Base_14 {
    d_v: number
    constructor(p: number) {
      super(0n)
      this.d_v = p
    }
  }

  type T14b = C1_14<Base_14, Base_14> | C2_14<Derived_14, Base_14> | bigint;

  function check_C1_14(a: C1_14<Base_14, Base_14>) {
    expect(a instanceof C1_14).assertTrue()
    expect(((a as C1_14<Base_14, Base_14>).c1_v as Base_14).b_v).assertEqual(123n)
  }
  function check_C2_14(a: C2_14<Derived_14, Base_14>) {
    expect(a instanceof C2_14).assertTrue()
    expect(((a as C2_14<Derived_14, Base_14>).c2_v as Derived_14).d_v).assertEqual(321)
  }
  function check_bigint_14(a: bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_14(v: T14b, v_id: number): void {
    if (v_id == 1) {
      check_C2_14(v as C2_14<Derived_14, Base_14>)
      check_C2_14(v as C2_14<Derived_14, Base_14>)
      check_C2_14(v as C2_14<Derived_14, Base_14>)
    } else if (v_id == 2) {
      check_C1_14(v as C1_14<Base_14, Base_14>)
      check_C1_14(v as C1_14<Base_14, Base_14>)
    } else {
      check_bigint_14(v as bigint)
      check_bigint_14(v as bigint)
    }
  }
  function check_value_as_type_T_14(v: T14b, v_id: number): void {
    expect(
      v instanceof C1_14 || v instanceof C2_14 ||
        v instanceof C2_14 || typeof v === 'bigint'
    ).assertTrue()
    check_value_14(v, v_id)
  }
  function check_is_in_T_type_14(
    v: T14b,
    v_id: number
  ): boolean {
    check_value_14(v, v_id)
    if (v instanceof C1_14 || v instanceof C2_14) {
      check_value_14(v, v_id)
      if (v instanceof C2_14 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_14(v, v_id)
        expect(v instanceof C1_14 || v instanceof C2_14).assertTrue()
        check_value_as_type_T_14(v, v_id)
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_14(v, v_id)
        check_value_as_type_T_14(v, v_id)
        return true
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_14(v, v_id)
      check_value_as_type_T_14(v, v_id)
      return true
    }
  }

  export function runTest_14(): boolean {
    const res1 = check_is_in_T_type_14(new C2_14<Derived_14, Base_14>(new Derived_14(321)), 1)
    const res2 = check_is_in_T_type_14(new C1_14<Base_14, Base_14>(new Base_14(123n)), 2)
    const res3 = check_is_in_T_type_14(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

// 全局 14 系列（重复定义，同理）
class C1_14<in T1, out T2> {
  readonly c1_v: T2
  constructor(p: T2) {
    this.c1_v = p
  }
}
class C2_14<out T1, in T2> {
  readonly c2_v: T1
  constructor(p: T1) {
    this.c2_v = p
  }
}
class Base_14 {
  b_v: bigint
  constructor(p: bigint) {
    this.b_v = p
  }
}
class Derived_14 extends Base_14 {
  d_v: number
  constructor(p: number) {
    super(0n)
    this.d_v = p
  }
}
type T14g = C1_14<Base_14, Base_14> | C2_14<Derived_14, Base_14> | bigint;

function check_C1_14(a: C1_14<Base_14, Base_14>) {
  expect(a instanceof C1_14).assertTrue()
  expect(((a as C1_14<Base_14, Base_14>).c1_v as Base_14).b_v).assertEqual(123n)
}
function check_C2_14(a: C2_14<Derived_14, Base_14>) {
  expect(a instanceof C2_14).assertTrue()
  expect(((a as C2_14<Derived_14, Base_14>).c2_v as Derived_14).d_v).assertEqual(321)
}
function check_bigint_14(a: bigint) {
  expect(typeof a === 'bigint').assertTrue()
  expect(a as bigint).assertEqual(5n)
}
function check_value_14(v: T14g, v_id: number): void {
  if (v_id == 1) {
    check_C2_14(v as C2_14<Derived_14, Base_14>)
    check_C2_14(v as C2_14<Derived_14, Base_14>)
    check_C2_14(v as C2_14<Derived_14, Base_14>)
  } else if (v_id == 2) {
    check_C1_14(v as C1_14<Base_14, Base_14>)
    check_C1_14(v as C1_14<Base_14, Base_14>)
  } else {
    check_bigint_14(v as bigint)
    check_bigint_14(v as bigint)
  }
}
function check_value_as_type_T_14(v: T14g, v_id: number): void {
  expect(
    v instanceof C1_14 || v instanceof C2_14 ||
      v instanceof C2_14 || typeof v === 'bigint'
  ).assertTrue()
  check_value_14(v, v_id)
}
function check_is_in_T_type_14(
  v: T14g,
  v_id: number
): boolean {
  check_value_14(v, v_id)
  if (v instanceof C1_14 || v instanceof C2_14) {
    check_value_14(v, v_id)
    if (v instanceof C2_14 || typeof v === 'bigint') {
      expect(v_id).assertEqual(1)
      check_value_14(v, v_id)
      expect(v instanceof C1_14 || v instanceof C2_14).assertTrue()
      check_value_as_type_T_14(v, v_id)
      return true
    } else {
      expect(v_id).assertEqual(2)
      check_value_14(v, v_id)
      check_value_as_type_T_14(v, v_id)
      return true
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_14(v, v_id)
    check_value_as_type_T_14(v, v_id)
    return true
  }
}

namespace testNS1_15 {
  class C1_15<in T1, out T2> {
    readonly c1_v: T2
    constructor(p: T2) {
      this.c1_v = p
    }
  }
  class C2_15<out T1, in T2> {
    readonly c2_v: T1
    constructor(p: T1) {
      this.c2_v = p
    }
  }
  class Base_15 {
    b_v: bigint
    constructor(p: bigint) {
      this.b_v = p
    }
  }
  class Derived_15 extends Base_15 {
    d_v: number
    constructor(p: number) {
      super(0n)
      this.d_v = p
    }
  }

  type T15 = C1_15<Base_15, Base_15> | C2_15<Derived_15, Base_15> | bigint;

  function check_C1_15(a: C1_15<Base_15, Base_15>) {
    expect(a instanceof C1_15).assertTrue();
    expect(((a as C1_15<Base_15, Base_15>).c1_v as Base_15).b_v).assertEqual(123n);
  }
  function check_C2_15(a: C2_15<Derived_15, Base_15>) {
    expect(a instanceof C2_15).assertTrue();
    expect(((a as C2_15<Derived_15, Base_15>).c2_v as Derived_15).d_v).assertEqual(321);
  }
  function check_bigint_15(a: bigint) {
    expect(typeof a === 'bigint').assertTrue();
    expect(a as bigint).assertEqual(5n);
  }
  function check_value_15(v: T15, v_id: number): void {
    if (v_id == 1) {
      check_C2_15(v as C2_15<Derived_15, Base_15>);
      check_C2_15(v as C2_15<Derived_15, Base_15>);
      check_C2_15(v as C2_15<Derived_15, Base_15>);
    } else if (v_id == 2) {
      check_C1_15(v as C1_15<Base_15, Base_15>);
      check_C1_15(v as C1_15<Base_15, Base_15>);
    } else {
      check_bigint_15(v as bigint);
      check_bigint_15(v as bigint);
    }
  }
  function check_value_as_type_T_15(v: T15, v_id: number): void {
    expect(
      v instanceof C1_15 || v instanceof C2_15 ||
        v instanceof C2_15 || typeof v === 'bigint'
    ).assertTrue();
    check_value_15(v, v_id);
  }
  function check_is_in_T_type_15(
    v: T15,
    v_id: number
  ): boolean {
    check_value_15(v, v_id);
    if (v instanceof C1_15 || v instanceof C2_15) {
      check_value_15(v, v_id);
      if (v instanceof C2_15 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1);
        check_value_15(v, v_id);
        expect(v instanceof C1_15 || v instanceof C2_15).assertTrue();
        check_value_as_type_T_15(v, v_id);
        return true;
      } else {
        expect(v_id).assertEqual(2);
        check_value_15(v, v_id);
        check_value_as_type_T_15(v, v_id);
        return true;
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_15(v, v_id);
      check_value_as_type_T_15(v, v_id);
      return true;
    }
  }

  export function runTest_15(): boolean {
    const res1 = check_is_in_T_type_15(new C2_15<Derived_15, Base_15>(new Derived_15(321)), 1);
    const res2 = check_is_in_T_type_15(new C1_15<Base_15, Base_15>(new Base_15(123n)), 2);
    const res3 = check_is_in_T_type_15(5n, 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

// 全局 15 系列
class C1_15<in T1, out T2> {
  readonly c1_v: T2
  constructor(p: T2) {
    this.c1_v = p
  }
}
class C2_15<out T1, in T2> {
  readonly c2_v: T1
  constructor(p: T1) {
    this.c2_v = p
  }
}
class Base_15 {
  b_v: bigint
  constructor(p: bigint) {
    this.b_v = p
  }
}
class Derived_15 extends Base_15 {
  d_v: number
  constructor(p: number) {
    super(0n)
    this.d_v = p
  }
}
type T15g = C1_15<Base_15, Base_15> | C2_15<Derived_15, Base_15> | bigint;

function check_C1_15(a: C1_15<Base_15, Base_15>) {
  expect(a instanceof C1_15).assertTrue();
  expect(((a as C1_15<Base_15, Base_15>).c1_v as Base_15).b_v).assertEqual(123n);
}
function check_C2_15(a: C2_15<Derived_15, Base_15>) {
  expect(a instanceof C2_15).assertTrue();
  expect(((a as C2_15<Derived_15, Base_15>).c2_v as Derived_15).d_v).assertEqual(321);
}
function check_bigint_15(a: bigint) {
  expect(typeof a === 'bigint').assertTrue();
  expect(a as bigint).assertEqual(5n);
}
function check_value_15(v: T15g, v_id: number): void {
  if (v_id == 1) {
    check_C2_15(v as C2_15<Derived_15, Base_15>);
    check_C2_15(v as C2_15<Derived_15, Base_15>);
    check_C2_15(v as C2_15<Derived_15, Base_15>);
  } else if (v_id == 2) {
    check_C1_15(v as C1_15<Base_15, Base_15>);
    check_C1_15(v as C1_15<Base_15, Base_15>);
  } else {
    check_bigint_15(v as bigint);
    check_bigint_15(v as bigint);
  }
}
function check_value_as_type_T_15(v: T15g, v_id: number): void {
  expect(
    v instanceof C1_15 || v instanceof C2_15 ||
      v instanceof C2_15 || typeof v === 'bigint'
  ).assertTrue();
  check_value_15(v, v_id);
}
function check_is_in_T_type_15(
  v: T15g,
  v_id: number
): boolean {
  check_value_15(v, v_id);
  if (v instanceof C1_15 || v instanceof C2_15) {
    check_value_15(v, v_id);
    if (v instanceof C2_15 || typeof v === 'bigint') {
      expect(v_id).assertEqual(1);
      check_value_15(v, v_id);
      expect(v instanceof C1_15 || v instanceof C2_15).assertTrue();
      check_value_as_type_T_15(v, v_id);
      return true;
    } else {
      expect(v_id).assertEqual(2);
      check_value_15(v, v_id);
      check_value_as_type_T_15(v, v_id);
      return true;
    }
  } else {
    expect(v_id).assertEqual(3);
    check_value_15(v, v_id);
    check_value_as_type_T_15(v, v_id);
    return true;
  }
}



export default function InterTypeIsSubOfTypeTOnGenTest05(): void {
  describe('InterTypeIsSubOfTypeTOnGenTest05', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1300
     * @tc.name      testInterTypeIsSubOfTypeTOnGen0013
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on generic custom
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnGen0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnGen0013';
      

      let res1: boolean = check_is_in_T_type_13(
        new C1_13<number, null>(123), 1)
      let res2: boolean = check_is_in_T_type_13(
        new C3_13<bigint, undefined>(321n), 2)
      let res3: boolean = check_is_in_T_type_13(
        5n, 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_13.runTest_13()).assertTrue()
      expect(testNS2_13.runTest_13()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1400
     * @tc.name      testInterTypeIsSubOfTypeTOnGen0014
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on generic custom
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnGen0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnGen0014';
      

      let res1: boolean = check_is_in_T_type_14(
        new C2_14<Derived_14, Base_14>(new Derived_14(321)), 1)
      let res2: boolean = check_is_in_T_type_14(
        new C1_14<Base_14, Base_14>(new Base_14(123n)), 2)
      let res3: boolean = check_is_in_T_type_14(
        5n, 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_14.runTest_14()).assertTrue()
      expect(testNS2_14.runTest_14()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1500
     * @tc.name      testInterTypeIsSubOfTypeTOnGen0015
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on generic custom
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnGen0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnGen0015';
      

      let res1: boolean = check_is_in_T_type_15(
        new C2_15<Derived_15, Base_15>(new Derived_15(321)), 1)
      let res2: boolean = check_is_in_T_type_15(
        new C1_15<Base_15, Base_15>(new Base_15(123n)), 2)
      let res3: boolean = check_is_in_T_type_15(
        5n, 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_15.runTest_15()).assertTrue()

    });
  })
}