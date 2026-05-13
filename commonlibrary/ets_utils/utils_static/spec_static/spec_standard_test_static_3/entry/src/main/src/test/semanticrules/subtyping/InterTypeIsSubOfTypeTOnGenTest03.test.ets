import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}

namespace testNS1_7 {
  interface I1_7<U, V> {}
  interface I2_7<U, V> {}
  interface II1_7<U, V> extends I1_7<U, V>, I2_7<U, V> {}
  interface II2_7<U, V> extends I1_7<U, V>, I2_7<U, V> {}
  interface III1_7<U, V> extends II1_7<U, V> {}
  interface III2_7<U, V> extends II1_7<U, V> {}
  class C1_7<U, V> implements III1_7<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_7<U, V> implements III2_7<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_7<U, V> implements II2_7<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_7(a: Object) {
    expect(a instanceof C1_7).assertTrue()
    expect(a instanceof III1_7).assertTrue()
    expect(a instanceof II1_7).assertTrue()
    expect(a instanceof I1_7).assertTrue()
    expect(a instanceof I2_7).assertTrue()
    expect((a as C1_7<number, null>).c1_v as number).assertEqual(123)
  }
  function check_C2_7(a: Object) {
    expect(a instanceof C2_7).assertTrue()
    expect(a instanceof III2_7).assertTrue()
    expect(a instanceof II1_7).assertTrue()
    expect(a instanceof I1_7).assertTrue()
    expect(a instanceof I2_7).assertTrue()
    expect((a as C2_7<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_7(a: Object) {
    expect(a instanceof C3_7).assertTrue()
    expect(a instanceof II2_7).assertTrue()
    expect(a instanceof I1_7).assertTrue()
    expect(a instanceof I2_7).assertTrue()
    expect((a as C3_7<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_7(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_7(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C1_7(v)
      check_C1_7(v as III1_7<number, null> | III2_7<number, string> | II2_7<bigint, undefined>)
      check_C1_7(v as II1_7<number, null> | II1_7<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_7(v)
      check_C3_7(v as III1_7<number, null> | III2_7<number, string> | II2_7<bigint, undefined>)
    }
    else {
      check_bigint_7(v)
      check_bigint_7(v as II1_7<number, null> | II1_7<number, string> | bigint)
    }
  }
  function check_value_as_type_T_7(v: Object | bigint, v_id: number): void {
    expect(v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7 ||
      v instanceof II1_7 || typeof v === 'bigint').assertTrue()
    check_value_7(v, v_id)
  }
  function check_is_in_T_type_7(v: III1_7<number, null> | III2_7<number, string> | II2_7<bigint, undefined> | II1_7<number, null> | II1_7<number, string> | bigint,
    v_id: number): boolean {
    check_value_7(v, v_id)
    if (v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7) {
      check_value_7(v, v_id)
      if (v instanceof II1_7 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_7(v, v_id)
        expect(v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7).assertTrue()
        check_value_as_type_T_7(v, v_id)
        return true
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_7(v, v_id)
        check_value_as_type_T_7(v, v_id)
        return true
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_7(v, v_id)
      check_value_as_type_T_7(v, v_id)
      return true
    }
  }

  export function runTest_7(): boolean {
    let res1: boolean = check_is_in_T_type_7(
      new C1_7<number, null>(123), 1)
    let res2: boolean = check_is_in_T_type_7(
      new C3_7<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_7(
      5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_7 {
  interface I1_7<U, V> {}
  interface I2_7<U, V> {}
  interface II1_7<U, V> extends I1_7<U, V>, I2_7<U, V> {}
  interface II2_7<U, V> extends I1_7<U, V>, I2_7<U, V> {}
  interface III1_7<U, V> extends II1_7<U, V> {}
  interface III2_7<U, V> extends II1_7<U, V> {}
  class C1_7<U, V> implements III1_7<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_7<U, V> implements III2_7<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_7<U, V> implements II2_7<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_7(a: Object) {
    expect(a instanceof C1_7).assertTrue()
    expect(a instanceof III1_7).assertTrue()
    expect(a instanceof II1_7).assertTrue()
    expect(a instanceof I1_7).assertTrue()
    expect(a instanceof I2_7).assertTrue()
    expect((a as C1_7<number, null>).c1_v as number).assertEqual(123)
  }
  function check_C2_7(a: Object) {
    expect(a instanceof C2_7).assertTrue()
    expect(a instanceof III2_7).assertTrue()
    expect(a instanceof II1_7).assertTrue()
    expect(a instanceof I1_7).assertTrue()
    expect(a instanceof I2_7).assertTrue()
    expect((a as C2_7<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_7(a: Object) {
    expect(a instanceof C3_7).assertTrue()
    expect(a instanceof II2_7).assertTrue()
    expect(a instanceof I1_7).assertTrue()
    expect(a instanceof I2_7).assertTrue()
    expect((a as C3_7<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_7(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_7(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C2_7(v)
      check_C2_7(v as III1_7<number, null> | III2_7<number, string> | II2_7<bigint, undefined>)
      check_C2_7(v as II1_7<number, null> | II1_7<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_7(v)
      check_C3_7(v as III1_7<number, null> | III2_7<number, string> | II2_7<bigint, undefined>)
    }
    else {
      check_bigint_7(v)
      check_bigint_7(v as II1_7<number, null> | II1_7<number, string> | bigint)
    }
  }
  function check_value_as_type_T_7(v: Object | bigint, v_id: number): void {
    expect(v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7 ||
      v instanceof II1_7 || typeof v === 'bigint').assertTrue()
    check_value_7(v, v_id)
  }
  function check_is_in_T_type_7(v: III1_7<number, null> | III2_7<number, string> | II2_7<bigint, undefined> | II1_7<number, null> | II1_7<number, string> | bigint,
    v_id: number): boolean {
    check_value_7(v, v_id)
    if (v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7) {
      check_value_7(v, v_id)
      if (v instanceof II1_7 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_7(v, v_id)
        expect(v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7).assertTrue()
        check_value_as_type_T_7(v, v_id)
        return true
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_7(v, v_id)
        check_value_as_type_T_7(v, v_id)
        return true
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_7(v, v_id)
      check_value_as_type_T_7(v, v_id)
      return true
    }
  }

  export function runTest_7(): boolean {
    let res1: boolean = check_is_in_T_type_7(
      new C2_7<number, string>(6.7), 1)
    let res2: boolean = check_is_in_T_type_7(
      new C3_7<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_7(
      5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

interface I1_7<U, V> {}
interface I2_7<U, V> {}
interface II1_7<U, V> extends I1_7<U, V>, I2_7<U, V> {}
interface II2_7<U, V> extends I1_7<U, V>, I2_7<U, V> {}
interface III1_7<U, V> extends II1_7<U, V> {}
interface III2_7<U, V> extends II1_7<U, V> {}
class C1_7<U, V> implements III1_7<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_7<U, V> implements III2_7<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class C3_7<U, V> implements II2_7<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_7(a: Object) {
  expect(a instanceof C1_7).assertTrue()
  expect(a instanceof III1_7).assertTrue()
  expect(a instanceof II1_7).assertTrue()
  expect(a instanceof I1_7).assertTrue()
  expect(a instanceof I2_7).assertTrue()
  expect((a as C1_7<number, null>).c1_v as number).assertEqual(123)
}
function check_C2_7(a: Object) {
  expect(a instanceof C2_7).assertTrue()
  expect(a instanceof III2_7).assertTrue()
  expect(a instanceof II1_7).assertTrue()
  expect(a instanceof I1_7).assertTrue()
  expect(a instanceof I2_7).assertTrue()
  expect((a as C2_7<number, string>).c2_v as number).assertEqual(6.7)
}
function check_C3_7(a: Object) {
  expect(a instanceof C3_7).assertTrue()
  expect(a instanceof II2_7).assertTrue()
  expect(a instanceof I1_7).assertTrue()
  expect(a instanceof I2_7).assertTrue()
  expect((a as C3_7<bigint, undefined>).c3_v as bigint).assertEqual(321n)
}
function check_bigint_7(a: Object | bigint) {
  expect(typeof a === 'bigint').assertTrue()
  expect(a as bigint).assertEqual(5n)
}
function check_value_7(v: Object | bigint, v_id: number): void {
  if (v_id == 1) {
    check_C1_7(v)
    check_C1_7(v as III1_7<number, null> | III2_7<number, string> | II2_7<bigint, undefined>)
    check_C1_7(v as II1_7<number, null> | II1_7<number, string> | bigint)
  }
  else if (v_id == 2) {
    check_C3_7(v)
    check_C3_7(v as III1_7<number, null> | III2_7<number, string> | II2_7<bigint, undefined>)
  }
  else {
    check_bigint_7(v)
    check_bigint_7(v as II1_7<number, null> | II1_7<number, string> | bigint)
  }
}
function check_value_as_type_T_7(v: Object | bigint, v_id: number): void {
  expect(v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7 ||
    v instanceof II1_7 || typeof v === 'bigint').assertTrue()
  check_value_7(v, v_id)
}
function check_is_in_T_type_7(v: III1_7<number, null> | III2_7<number, string> | II2_7<bigint, undefined> | II1_7<number, null> | II1_7<number, string> | bigint,
  v_id: number): boolean {
  check_value_7(v, v_id)
  if (v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7) {
    check_value_7(v, v_id)
    if (v instanceof II1_7 || typeof v === 'bigint') {
      expect(v_id).assertEqual(1)
      check_value_7(v, v_id)
      expect(v instanceof III1_7 || v instanceof III2_7 || v instanceof II2_7).assertTrue()
      check_value_as_type_T_7(v, v_id)
      return true
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_7(v, v_id)
      check_value_as_type_T_7(v, v_id)
      return true
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_7(v, v_id)
    check_value_as_type_T_7(v, v_id)
    return true
  }
}

namespace testNS1_8 {
  interface I1_8<U, V> {}
  interface I2_8<U, V> {}
  interface II1_8<U, V> extends I1_8<U, V>, I2_8<U, V> {}
  interface II2_8<U = bigint, V = undefined> extends I1_8<U, V>, I2_8<U, V> {}
  interface III1_8<U = number, V = null> extends II1_8<U, V> {}
  interface III2_8<U = number, V = string> extends II1_8<U, V> {}
  class C1_8<U = number, V = null> implements III1_8<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_8<U = number, V = string> implements III2_8<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_8<U = bigint, V = undefined> implements II2_8<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_8(a: Object) {
    expect(a instanceof C1_8).assertTrue()
    expect(a instanceof III1_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C1_8).c1_v as number).assertEqual(123)
  }
  function check_C2_8(a: Object) {
    expect(a instanceof C2_8).assertTrue()
    expect(a instanceof III2_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C2_8).c2_v as number).assertEqual(6.7)
  }
  function check_C3_8(a: Object) {
    expect(a instanceof C3_8).assertTrue()
    expect(a instanceof II2_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C3_8).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_8(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_8(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C1_8(v)
      check_C1_8(v as III1_8 | III2_8 | II2_8)
      check_C1_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_8(v)
      check_C3_8(v as III1_8 | III2_8 | II2_8)
    }
    else {
      check_bigint_8(v)
      check_bigint_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
  }
  function check_value_as_type_T_8(v: III1_8 | III2_8 | II2_8 | number | bigint, v_id: number): void {
    expect(
      v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8 ||
        v instanceof II1_8 || typeof v === 'bigint'
    ).assertTrue()
    check_value_8(v, v_id)
  }
  function check_is_in_T_type_8(
    v: III1_8 | III2_8 | II2_8 | II1_8<number, null> | II1_8<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_8(v, v_id)
    if (v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8) {
      check_value_8(v, v_id)
      if (v instanceof II1_8 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_8(v, v_id)
        expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue()
        expect(
          v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8 || typeof v === 'number'
        ).assertTrue()
        check_value_as_type_T_8(v as III1_8 | III2_8 | II2_8 | number | bigint, v_id)
        return true
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_8(v, v_id)
        check_value_as_type_T_8(v as III1_8 | III2_8 | II2_8 | number | bigint, v_id)
        return true
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_8(v, v_id)
      check_value_as_type_T_8(v as III1_8 | III2_8 | II2_8 | number | bigint, v_id)
      return true
    }
  }

  export function runTest_8(): boolean {
    let res1: boolean = check_is_in_T_type_8(new C1_8(123), 1)
    let res2: boolean = check_is_in_T_type_8(new C3_8(321n), 2)
    let res3: boolean = check_is_in_T_type_8(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}
namespace testNS2_8 {
  interface I1_8<U, V> {}
  interface I2_8<U, V> {}
  interface II1_8<U, V> extends I1_8<U, V>, I2_8<U, V> {}
  interface II2_8<U = bigint, V = undefined> extends I1_8<U, V>, I2_8<U, V> {}
  interface III1_8<U = number, V = null> extends II1_8<U, V> {}
  interface III2_8<U = number, V = string> extends II1_8<U, V> {}
  class C1_8<U = number, V = null> implements III1_8<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_8<U = number, V = string> implements III2_8<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_8<U = bigint, V = undefined> implements II2_8<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_8(a: Object) {
    expect(a instanceof C1_8).assertTrue()
    expect(a instanceof III1_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C1_8).c1_v as number).assertEqual(123)
  }
  function check_C2_8(a: Object) {
    expect(a instanceof C2_8).assertTrue()
    expect(a instanceof III2_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C2_8).c2_v as number).assertEqual(6.7)
  }
  function check_C3_8(a: Object) {
    expect(a instanceof C3_8).assertTrue()
    expect(a instanceof II2_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C3_8).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_8(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_8(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C2_8(v)
      check_C2_8(v as III1_8 | III2_8 | II2_8)
      check_C2_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_8(v)
      check_C3_8(v as III1_8 | III2_8 | II2_8)
    }
    else {
      check_bigint_8(v)
      check_bigint_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
  }
  function check_value_as_type_T_8(v: II1_8<number, null> | II1_8<number, string> | II2_8, v_id: number): void {
    expect(
      v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8 ||
        v instanceof II1_8 || typeof v === 'bigint'
    ).assertTrue()
    check_value_8(v, v_id)
  }
  function check_is_in_T_type_8(
    v: III1_8 | III2_8 | II2_8 | II1_8<number, null> | II1_8<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_8(v, v_id)
    if (v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8) {
      check_value_8(v, v_id)
      if (v instanceof II1_8 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_8(v, v_id)
        expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue()
        expect(v instanceof II1_8 || v instanceof II2_8).assertTrue()
        check_value_as_type_T_8(v as II1_8<number, null> | II1_8<number, string> | II2_8, v_id)
        return true
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_8(v, v_id)
        check_value_as_type_T_8(v as II1_8<number, null> | II1_8<number, string> | II2_8, v_id)
        return true
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_8(v, v_id)
      check_value_as_type_T_8(v as II1_8<number, null> | II1_8<number, string> | II2_8, v_id)
      return true
    }
  }

  export function runTest_8(): boolean {
    let res1: boolean = check_is_in_T_type_8(new C2_8(6.7), 1)
    let res2: boolean = check_is_in_T_type_8(new C3_8(321n), 2)
    let res3: boolean = check_is_in_T_type_8(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS3_8 {
  interface I1_8<U, V> {}
  interface I2_8<U, V> {}
  interface II1_8<U, V> extends I1_8<U, V>, I2_8<U, V> {}
  interface II2_8<U = bigint, V = undefined> extends I1_8<U, V>, I2_8<U, V> {}
  interface III1_8<U = number, V = null> extends II1_8<U, V> {}
  interface III2_8<U = number, V = string> extends II1_8<U, V> {}
  class C1_8<U = number, V = null> implements III1_8<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_8<U = number, V = string> implements III2_8<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_8<U = bigint, V = undefined> implements II2_8<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_8(a: Object) {
    expect(a instanceof C1_8).assertTrue()
    expect(a instanceof III1_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C1_8).c1_v as number).assertEqual(123)
  }
  function check_C2_8(a: Object) {
    expect(a instanceof C2_8).assertTrue()
    expect(a instanceof III2_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C2_8).c2_v as number).assertEqual(6.7)
  }
  function check_C3_8(a: Object) {
    expect(a instanceof C3_8).assertTrue()
    expect(a instanceof II2_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C3_8).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_8(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_8(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C1_8(v)
      check_C1_8(v as III1_8 | III2_8 | II2_8)
      check_C1_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_8(v)
      check_C3_8(v as III1_8 | III2_8 | II2_8)
    }
    else {
      check_bigint_8(v)
      check_bigint_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
  }
  function check_value_as_type_T_8(v: I1_8<number, null> | I1_8<number, string> | I2_8<bigint, undefined>, v_id: number): void {
    expect(
      v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8 ||
        v instanceof II1_8 || typeof v === 'bigint'
    ).assertTrue()
    check_value_8(v, v_id)
  }
  function check_is_in_T_type_8(
    v: III1_8 | III2_8 | II2_8 | II1_8<number, null> | II1_8<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_8(v, v_id)
    if (v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8) {
      check_value_8(v, v_id)
      if (v instanceof II1_8 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_8(v, v_id)
        expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue()
        expect(v instanceof I1_8 || v instanceof I2_8).assertTrue()
        check_value_as_type_T_8(v as I1_8<number, null> | I1_8<number, string> | I2_8<bigint, undefined>, v_id)
        return true
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_8(v, v_id)
        check_value_as_type_T_8(v as I1_8<number, null> | I1_8<number, string> | I2_8<bigint, undefined>, v_id)
        return true
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_8(v, v_id)
      check_value_as_type_T_8(v as I1_8<number, null> | I1_8<number, string> | I2_8<bigint, undefined>, v_id)
      return true
    }
  }

  export function runTest_8(): boolean {
    let res1: boolean = check_is_in_T_type_8(new C1_8(123), 1)
    let res2: boolean = check_is_in_T_type_8(new C3_8(321n), 2)
    let res3: boolean = check_is_in_T_type_8(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS4_8 {
  interface I1_8<U, V> {}
  interface I2_8<U, V> {}
  interface II1_8<U, V> extends I1_8<U, V>, I2_8<U, V> {}
  interface II2_8<U = bigint, V = undefined> extends I1_8<U, V>, I2_8<U, V> {}
  interface III1_8<U = number, V = null> extends II1_8<U, V> {}
  interface III2_8<U = number, V = string> extends II1_8<U, V> {}
  class C1_8<U = number, V = null> implements III1_8<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_8<U = number, V = string> implements III2_8<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_8<U = bigint, V = undefined> implements II2_8<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_8(a: Object) {
    expect(a instanceof C1_8).assertTrue()
    expect(a instanceof III1_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C1_8).c1_v as number).assertEqual(123)
  }
  function check_C2_8(a: Object) {
    expect(a instanceof C2_8).assertTrue()
    expect(a instanceof III2_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C2_8).c2_v as number).assertEqual(6.7)
  }
  function check_C3_8(a: Object) {
    expect(a instanceof C3_8).assertTrue()
    expect(a instanceof II2_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C3_8).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_8(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_8(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C1_8(v)
      check_C1_8(v as III1_8 | III2_8 | II2_8)
      check_C1_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_8(v)
      check_C3_8(v as III1_8 | III2_8 | II2_8)
    }
    else {
      check_bigint_8(v)
      check_bigint_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
  }
  function check_value_as_type_T_8(v: II1_8<number, null> | II1_8<number, string> | bigint | string, v_id: number): void {
    expect(
      v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8 ||
        v instanceof II1_8 || typeof v === 'bigint'
    ).assertTrue()
    check_value_8(v, v_id)
  }
  function check_is_in_T_type_8(
    v: III1_8 | III2_8 | II2_8 | II1_8<number, null> | II1_8<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_8(v, v_id)
    if (v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8) {
      check_value_8(v, v_id)
      if (v instanceof II1_8 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_8(v, v_id)
        expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue()
        expect(
          v instanceof II1_8 || typeof v === 'bigint' || typeof v === 'string'
        ).assertTrue()
        check_value_as_type_T_8(v as II1_8<number, null> | II1_8<number, string> | bigint | string, v_id)
        return true
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_8(v, v_id)
        check_value_as_type_T_8(v as II1_8<number, null> | II1_8<number, string> | bigint | string, v_id)
        return true
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_8(v, v_id)
      check_value_as_type_T_8(v as II1_8<number, null> | II1_8<number, string> | bigint | string, v_id)
      return true
    }
  }

  export function runTest_8(): boolean {
    let res1: boolean = check_is_in_T_type_8(new C1_8(123), 1)
    let res2: boolean = check_is_in_T_type_8(new C3_8(321n), 2)
    let res3: boolean = check_is_in_T_type_8(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS5_8 {
  interface I1_8<U, V> {}
  interface I2_8<U, V> {}
  interface II1_8<U, V> extends I1_8<U, V>, I2_8<U, V> {}
  interface II2_8<U = bigint, V = undefined> extends I1_8<U, V>, I2_8<U, V> {}
  interface III1_8<U = number, V = null> extends II1_8<U, V> {}
  interface III2_8<U = number, V = string> extends II1_8<U, V> {}
  class C1_8<U = number, V = null> implements III1_8<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_8<U = number, V = string> implements III2_8<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_8<U = bigint, V = undefined> implements II2_8<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_8(a: Object) {
    expect(a instanceof C1_8).assertTrue()
    expect(a instanceof III1_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C1_8).c1_v as number).assertEqual(123)
  }
  function check_C2_8(a: Object) {
    expect(a instanceof C2_8).assertTrue()
    expect(a instanceof III2_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C2_8).c2_v as number).assertEqual(6.7)
  }
  function check_C3_8(a: Object) {
    expect(a instanceof C3_8).assertTrue()
    expect(a instanceof II2_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C3_8).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_8(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_8(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C2_8(v)
      check_C2_8(v as III1_8 | III2_8 | II2_8)
      check_C2_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_8(v)
      check_C3_8(v as III1_8 | III2_8 | II2_8)
    }
    else {
      check_bigint_8(v)
      check_bigint_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
  }
  function check_value_as_type_T_8(v: I1_8<number, null> | I2_8<number, string> | bigint, v_id: number): void {
    expect(
      v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8 ||
        v instanceof II1_8 || typeof v === 'bigint'
    ).assertTrue()
    check_value_8(v, v_id)
  }
  function check_is_in_T_type_8(
    v: III1_8 | III2_8 | II2_8 | II1_8<number, null> | II1_8<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_8(v, v_id)
    if (v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8) {
      check_value_8(v, v_id)
      if (v instanceof II1_8 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_8(v, v_id)
        expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue()
        expect(
          v instanceof I1_8 || v instanceof I2_8 || typeof v === 'bigint'
        ).assertTrue()
        check_value_as_type_T_8(v as I1_8<number, null> | I2_8<number, string> | bigint, v_id)
        return true
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_8(v, v_id)
        check_value_as_type_T_8(v as I1_8<number, null> | I2_8<number, string> | bigint, v_id)
        return true
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_8(v, v_id)
      check_value_as_type_T_8(v as I1_8<number, null> | I2_8<number, string> | bigint, v_id)
      return true
    }
  }

  export function runTest_8(): boolean {
    let res1: boolean = check_is_in_T_type_8(new C2_8(6.7), 1)
    let res2: boolean = check_is_in_T_type_8(new C3_8(321n), 2)
    let res3: boolean = check_is_in_T_type_8(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS6_8 {
  interface I1_8<U, V> {}
  interface I2_8<U, V> {}
  interface II1_8<U, V> extends I1_8<U, V>, I2_8<U, V> {}
  interface II2_8<U = bigint, V = undefined> extends I1_8<U, V>, I2_8<U, V> {}
  interface III1_8<U = number, V = null> extends II1_8<U, V> {}
  interface III2_8<U = number, V = string> extends II1_8<U, V> {}
  class C1_8<U = number, V = null> implements III1_8<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_8<U = number, V = string> implements III2_8<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_8<U = bigint, V = undefined> implements II2_8<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_8(a: Object) {
    expect(a instanceof C1_8).assertTrue()
    expect(a instanceof III1_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C1_8).c1_v as number).assertEqual(123)
  }
  function check_C2_8(a: Object) {
    expect(a instanceof C2_8).assertTrue()
    expect(a instanceof III2_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C2_8).c2_v as number).assertEqual(6.7)
  }
  function check_C3_8(a: Object) {
    expect(a instanceof C3_8).assertTrue()
    expect(a instanceof II2_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C3_8).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_8(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_8(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C1_8(v)
      check_C1_8(v as III1_8 | III2_8 | II2_8)
      check_C1_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_8(v)
      check_C3_8(v as III1_8 | III2_8 | II2_8)
    }
    else {
      check_bigint_8(v)
      check_bigint_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
  }
  function check_value_as_type_T_8(v: I1_8<number, null> | I1_8<number, string> | bigint, v_id: number): void {
    expect(
      v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8 ||
        v instanceof II1_8 || typeof v === 'bigint'
    ).assertTrue()
    check_value_8(v, v_id)
  }
  function check_is_in_T_type_8(
    v: III1_8 | III2_8 | II2_8 | II1_8<number, null> | II1_8<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_8(v, v_id)
    if (v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8) {
      check_value_8(v, v_id)
      if (v instanceof II1_8 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_8(v, v_id)
        expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue()
        expect(
          v instanceof I1_8 || typeof v === 'bigint'
        ).assertTrue()
        check_value_as_type_T_8(v as I1_8<number, null> | I1_8<number, string> | bigint, v_id)
        return true
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_8(v, v_id)
        check_value_as_type_T_8(v as I1_8<number, null> | I1_8<number, string> | bigint, v_id)
        return true
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_8(v, v_id)
      check_value_as_type_T_8(v as I1_8<number, null> | I1_8<number, string> | bigint, v_id)
      return true
    }
  }

  export function runTest_8(): boolean {
    let res1: boolean = check_is_in_T_type_8(new C1_8(123), 1)
    let res2: boolean = check_is_in_T_type_8(new C3_8(321n), 2)
    let res3: boolean = check_is_in_T_type_8(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS7_8 {
  interface I1_8<U, V> {}
  interface I2_8<U, V> {}
  interface II1_8<U, V> extends I1_8<U, V>, I2_8<U, V> {}
  interface II2_8<U = bigint, V = undefined> extends I1_8<U, V>, I2_8<U, V> {}
  interface III1_8<U = number, V = null> extends II1_8<U, V> {}
  interface III2_8<U = number, V = string> extends II1_8<U, V> {}
  class C1_8<U = number, V = null> implements III1_8<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_8<U = number, V = string> implements III2_8<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_8<U = bigint, V = undefined> implements II2_8<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_8(a: Object) {
    expect(a instanceof C1_8).assertTrue()
    expect(a instanceof III1_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C1_8).c1_v as number).assertEqual(123)
  }
  function check_C2_8(a: Object) {
    expect(a instanceof C2_8).assertTrue()
    expect(a instanceof III2_8).assertTrue()
    expect(a instanceof II1_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C2_8).c2_v as number).assertEqual(6.7)
  }
  function check_C3_8(a: Object) {
    expect(a instanceof C3_8).assertTrue()
    expect(a instanceof II2_8).assertTrue()
    expect(a instanceof I1_8).assertTrue()
    expect(a instanceof I2_8).assertTrue()
    expect((a as C3_8).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_8(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_8(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C2_8(v)
      check_C2_8(v as III1_8 | III2_8 | II2_8)
      check_C2_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_8(v)
      check_C3_8(v as III1_8 | III2_8 | II2_8)
    }
    else {
      check_bigint_8(v)
      check_bigint_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
    }
  }
  function check_value_as_type_T_8(v: I2_8<number, null> | I2_8<number, string> | bigint, v_id: number): void {
    expect(
      v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8 ||
        v instanceof II1_8 || typeof v === 'bigint'
    ).assertTrue()
    check_value_8(v, v_id)
  }
  function check_is_in_T_type_8(
    v: III1_8 | III2_8 | II2_8 | II1_8<number, null> | II1_8<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_8(v, v_id)
    if (v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8) {
      check_value_8(v, v_id)
      if (v instanceof II1_8 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_8(v, v_id)
        expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue()
        expect(
          v instanceof I2_8 || typeof v === 'bigint'
        ).assertTrue()
        check_value_as_type_T_8(v as I2_8<number, null> | I2_8<number, string> | bigint, v_id)
        return true
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_8(v, v_id)
        check_value_as_type_T_8(v as I2_8<number, null> | I2_8<number, string> | bigint, v_id)
        return true
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_8(v, v_id)
      check_value_as_type_T_8(v as I2_8<number, null> | I2_8<number, string> | bigint, v_id)
      return true
    }
  }

  export function runTest_8(): boolean {
    let res1: boolean = check_is_in_T_type_8(new C2_8(6.7), 1)
    let res2: boolean = check_is_in_T_type_8(new C3_8(321n), 2)
    let res3: boolean = check_is_in_T_type_8(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

interface I1_8<U, V> {}
interface I2_8<U, V> {}
interface II1_8<U, V> extends I1_8<U, V>, I2_8<U, V> {}
interface II2_8<U = bigint, V = undefined> extends I1_8<U, V>, I2_8<U, V> {}
interface III1_8<U = number, V = null> extends II1_8<U, V> {}
interface III2_8<U = number, V = string> extends II1_8<U, V> {}
class C1_8<U = number, V = null> implements III1_8<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_8<U = number, V = string> implements III2_8<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class C3_8<U = bigint, V = undefined> implements II2_8<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_8(a: Object) {
  expect(a instanceof C1_8).assertTrue()
  expect(a instanceof III1_8).assertTrue()
  expect(a instanceof II1_8).assertTrue()
  expect(a instanceof I1_8).assertTrue()
  expect(a instanceof I2_8).assertTrue()
  expect((a as C1_8).c1_v as number).assertEqual(123)
}
function check_C2_8(a: Object) {
  expect(a instanceof C2_8).assertTrue()
  expect(a instanceof III2_8).assertTrue()
  expect(a instanceof II1_8).assertTrue()
  expect(a instanceof I1_8).assertTrue()
  expect(a instanceof I2_8).assertTrue()
  expect((a as C2_8).c2_v as number).assertEqual(6.7)
}
function check_C3_8(a: Object) {
  expect(a instanceof C3_8).assertTrue()
  expect(a instanceof II2_8).assertTrue()
  expect(a instanceof I1_8).assertTrue()
  expect(a instanceof I2_8).assertTrue()
  expect((a as C3_8).c3_v as bigint).assertEqual(321n)
}
function check_bigint_8(a: Object | bigint) {
  expect(typeof a === 'bigint').assertTrue()
  expect(a as bigint).assertEqual(5n)
}
function check_value_8(v: Object | bigint, v_id: number): void {
  if (v_id == 1) {
    check_C1_8(v)
    check_C1_8(v as III1_8 | III2_8 | II2_8)
    check_C1_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
  }
  else if (v_id == 2) {
    check_C3_8(v)
    check_C3_8(v as III1_8 | III2_8 | II2_8)
  }
  else {
    check_bigint_8(v)
    check_bigint_8(v as II1_8<number, null> | II1_8<number, string> | bigint)
  }
}
function check_value_as_type_T_8(v: III1_8 | III2_8 | II2_8 | number | bigint, v_id: number): void {
  expect(
    v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8 ||
      v instanceof II1_8 || typeof v === 'bigint'
  ).assertTrue()
  check_value_8(v, v_id)
}
function check_is_in_T_type_8(
  v: III1_8 | III2_8 | II2_8 | II1_8<number, null> | II1_8<number, string> | bigint,
  v_id: number
): boolean {
  check_value_8(v, v_id)
  if (v instanceof III1_8 | III2_8 | II2_8 | number | bigint) {
    check_value_8(v, v_id)
    if (v instanceof II1_8 || typeof v === 'bigint') {
      expect(v_id).assertEqual(1)
      check_value_8(v, v_id)
      expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue()
      expect(
        v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8 || typeof v === 'number'
      ).assertTrue()
      check_value_as_type_T_8(v as III1_8 | III2_8 | II2_8 | number | bigint, v_id)
      return true
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_8(v, v_id)
      check_value_as_type_T_8(v as III1_8 | III2_8 | II2_8 | number | bigint, v_id)
      return true
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_8(v, v_id)
    check_value_as_type_T_8(v as III1_8 | III2_8 | II2_8 | number | bigint, v_id)
    return true
  }
}

export default function InterTypeIsSubOfTypeTOnGenTest(): void {
  describe('InterTypeIsSubOfTypeTOnGenTest', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0700
     * @tc.name      testInterTypeIsSubOfTypeTOnGen0007
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on generic custom
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnGen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnGen0007';


      let res1: boolean = check_is_in_T_type_7(
        new C1_7<number, null>(123) as III1_7<number, null>, 1
      );
      let res2: boolean = check_is_in_T_type_7(
        new C3_7<bigint, undefined>(321n) as II2_7<bigint, undefined>, 2
      );
      let res3: boolean = check_is_in_T_type_7(
        5n, 3
      );
      expect(res1 && (res2 || res3)).assertTrue();

      expect(testNS1_7.runTest_7()).assertTrue();
      expect(testNS2_7.runTest_7()).assertTrue();

    });
  })
}