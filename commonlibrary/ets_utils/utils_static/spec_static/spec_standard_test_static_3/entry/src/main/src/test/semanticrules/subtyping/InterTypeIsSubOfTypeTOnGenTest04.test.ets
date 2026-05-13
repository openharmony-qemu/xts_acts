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
  constructor(x: T) {}
}
class Pos<T extends number> {
  constructor(x: T) {}
}

namespace testNS1_9 {
  interface I1_9<U, V> {}
  interface I2_9<U, V> {}
  interface II1_9<U, V> extends I1_9<U, V>, I2_9<U, V> {}
  interface II2_9<U = bigint, V = undefined> extends I1_9<U, V>, I2_9<U, V> {}
  interface III1_9<U = number, V = null> extends II1_9<U, V> {}
  interface III2_9<U = number, V = string> extends II1_9<U, V> {}
  class C1_9<U = number, V = null> implements III1_9<U, V> {
    c1_v: U | V
    constructor(p: U | V) { this.c1_v = p }
  }
  class C2_9<U = number, V = string> implements III2_9<U, V> {
    c2_v: U | V
    constructor(p: U | V) { this.c2_v = p }
  }
  class C3_9<U = bigint, V = undefined> implements II2_9<U, V> {
    c3_v: U | V
    constructor(p: U | V) { this.c3_v = p }
  }
  function check_C1_9(a: Object) {
    expect(a instanceof C1_9).assertTrue();
    expect(a instanceof III1_9).assertTrue();
    expect(a instanceof II1_9).assertTrue();
    expect(a instanceof I1_9).assertTrue();
    expect(a instanceof I2_9).assertTrue();
    expect((a as C1_9).c1_v as number).assertEqual(123);
  }
  function check_C2_9(a: Object) {
    expect(a instanceof C2_9).assertTrue();
    expect(a instanceof III2_9).assertTrue();
    expect(a instanceof II1_9).assertTrue();
    expect(a instanceof I1_9).assertTrue();
    expect(a instanceof I2_9).assertTrue();
    expect((a as C2_9).c2_v as number).assertEqual(6.7);
  }
  function check_C3_9(a: Object) {
    expect(a instanceof C3_9).assertTrue();
    expect(a instanceof II2_9).assertTrue();
    expect(a instanceof I1_9).assertTrue();
    expect(a instanceof I2_9).assertTrue();
    expect((a as C3_9).c3_v as bigint).assertEqual(321n);
  }
  function check_bigint_9(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue();
    expect(a as bigint).assertEqual(5n);
  }
  function check_value_9(v: Object | bigint, v_id: number): void {
    if (v_id === 1) {
      check_C2_9(v);
      check_C2_9(v as III1_9 | III2_9 | II2_9);
      check_C2_9(v as II1_9<number, null> | II1_9<number, string> | bigint);
    } else if (v_id === 2) {
      check_C3_9(v);
      check_C3_9(v as III1_9 | III2_9 | II2_9);
    } else {
      check_bigint_9(v);
      check_bigint_9(v as II1_9<number, null> | II1_9<number, string> | bigint);
    }
  }
  // 关键修改：参数类型统一为 Object | bigint
  function check_value_as_type_T_9(v: Object | bigint, v_id: number): void {
    expect(
      v instanceof III1_9 || v instanceof III2_9 || v instanceof II2_9 ||
        v instanceof II1_9 || typeof v === 'bigint'
    ).assertTrue();
    check_value_9(v, v_id);
  }
  function check_is_in_T_type_9(
    v: III1_9 | III2_9 | II2_9 | II1_9<number, null> | II1_9<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_9(v, v_id);
    if (v instanceof III1_9 || v instanceof III2_9 || v instanceof II2_9) {
      check_value_9(v, v_id);
      if (v instanceof II1_9 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1);
        check_value_9(v, v_id);
        expect(v instanceof III1_9 || v instanceof III2_9 || v instanceof II2_9).assertTrue();
        expect(v instanceof I1_9).assertTrue();
        check_value_as_type_T_9(v, v_id);
        return true;
      } else {
        expect(v_id).assertEqual(2);
        check_value_9(v, v_id);
        check_value_as_type_T_9(v, v_id);
        return true;
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_9(v, v_id);
      check_value_as_type_T_9(v, v_id);
      return true;
    }
  }
  export function runTest_9(): boolean {
    const res1 = check_is_in_T_type_9(new C2_9(6.7), 1);
    const res2 = check_is_in_T_type_9(new C3_9(321n), 2);
    const res3 = check_is_in_T_type_9(5n, 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

// ========================= namespace testNS2_9 =========================
namespace testNS2_9 {
  interface I1_9<U, V> {}
  interface I2_9<U, V> {}
  interface II1_9<U, V> extends I1_9<U, V>, I2_9<U, V> {}
  interface II2_9<U = bigint, V = undefined> extends I1_9<U, V>, I2_9<U, V> {}
  interface III1_9<U = number, V = null> extends II1_9<U, V> {}
  interface III2_9<U = number, V = string> extends II1_9<U, V> {}
  class C1_9<U = number, V = null> implements III1_9<U, V> {
    c1_v: U | V
    constructor(p: U | V) { this.c1_v = p; }
  }
  class C2_9<U = number, V = string> implements III2_9<U, V> {
    c2_v: U | V
    constructor(p: U | V) { this.c2_v = p; }
  }
  class C3_9<U = bigint, V = undefined> implements II2_9<U, V> {
    c3_v: U | V
    constructor(p: U | V) { this.c3_v = p; }
  }
  function check_C1_9(a: Object) {
    expect(a instanceof C1_9).assertTrue();
    expect(a instanceof III1_9).assertTrue();
    expect(a instanceof II1_9).assertTrue();
    expect(a instanceof I1_9).assertTrue();
    expect(a instanceof I2_9).assertTrue();
    expect((a as C1_9).c1_v as number).assertEqual(123);
  }
  function check_C2_9(a: Object) {
    expect(a instanceof C2_9).assertTrue();
    expect(a instanceof III2_9).assertTrue();
    expect(a instanceof II1_9).assertTrue();
    expect(a instanceof I1_9).assertTrue();
    expect(a instanceof I2_9).assertTrue();
    expect((a as C2_9).c2_v as number).assertEqual(6.7);
  }
  function check_C3_9(a: Object) {
    expect(a instanceof C3_9).assertTrue();
    expect(a instanceof II2_9).assertTrue();
    expect(a instanceof I1_9).assertTrue();
    expect(a instanceof I2_9).assertTrue();
    expect((a as C3_9).c3_v as bigint).assertEqual(321n);
  }
  function check_bigint_9(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue();
    expect(a as bigint).assertEqual(5n);
  }
  function check_value_9(v: Object | bigint, v_id: number): void {
    if (v_id === 1) {
      check_C1_9(v);
      check_C1_9(v as III1_9 | III2_9 | II2_9);
      check_C1_9(v as II1_9<number, null> | II1_9<number, string> | bigint);
    } else if (v_id === 2) {
      check_C3_9(v);
      check_C3_9(v as III1_9 | III2_9 | II2_9);
    } else {
      check_bigint_9(v);
      check_bigint_9(v as II1_9<number, null> | II1_9<number, string> | bigint);
    }
  }
  function check_value_as_type_T_9(v: Object | bigint, v_id: number): void {
    expect(
      v instanceof III1_9 || v instanceof III2_9 || v instanceof II2_9 ||
        v instanceof II1_9 || typeof v === 'bigint'
    ).assertTrue();
    check_value_9(v, v_id);
  }
  function check_is_in_T_type_9(
    v: III1_9 | III2_9 | II2_9 | II1_9<number, null> | II1_9<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_9(v, v_id);
    if (v instanceof III1_9 || v instanceof III2_9 || v instanceof II2_9) {
      check_value_9(v, v_id);
      if (v instanceof II1_9 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1);
        check_value_9(v, v_id);
        expect(v instanceof III1_9 || v instanceof III2_9 || v instanceof II2_9).assertTrue();
        expect(v instanceof I2_9).assertTrue();
        check_value_as_type_T_9(v, v_id);
        return true;
      } else {
        expect(v_id).assertEqual(2);
        check_value_9(v, v_id);
        check_value_as_type_T_9(v, v_id);
        return true;
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_9(v, v_id);
      check_value_as_type_T_9(v, v_id);
      return true;
    }
  }
  export function runTest_9(): boolean {
    const res1 = check_is_in_T_type_9(new C1_9(123), 1);
    const res2 = check_is_in_T_type_9(new C3_9(321n), 2);
    const res3 = check_is_in_T_type_9(5n, 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

// ========================= 全局 9 =========================
interface I1_9<U, V> {}
interface I2_9<U, V> {}
interface II1_9<U, V> extends I1_9<U, V>, I2_9<U, V> {}
interface II2_9<U = bigint, V = undefined> extends I1_9<U, V>, I2_9<U, V> {}
interface III1_9<U = number, V = null> extends II1_9<U, V> {}
interface III2_9<U = number, V = string> extends II1_9<U, V> {}
class C1_9<U = number, V = null> implements III1_9<U, V> {
  c1_v: U | V
  constructor(p: U | V) { this.c1_v = p; }
}
class C2_9<U = number, V = string> implements III2_9<U, V> {
  c2_v: U | V
  constructor(p: U | V) { this.c2_v = p; }
}
class C3_9<U = bigint, V = undefined> implements II2_9<U, V> {
  c3_v: U | V
  constructor(p: U | V) { this.c3_v = p; }
}
function check_C1_9(a: Object) {
  expect(a instanceof C1_9).assertTrue();
  expect(a instanceof III1_9).assertTrue();
  expect(a instanceof II1_9).assertTrue();
  expect(a instanceof I1_9).assertTrue();
  expect(a instanceof I2_9).assertTrue();
  expect((a as C1_9).c1_v as number).assertEqual(123);
}
function check_C2_9(a: Object) {
  expect(a instanceof C2_9).assertTrue();
  expect(a instanceof III2_9).assertTrue();
  expect(a instanceof II1_9).assertTrue();
  expect(a instanceof I1_9).assertTrue();
  expect(a instanceof I2_9).assertTrue();
  expect((a as C2_9).c2_v as number).assertEqual(6.7);
}
function check_C3_9(a: Object) {
  expect(a instanceof C3_9).assertTrue();
  expect(a instanceof II2_9).assertTrue();
  expect(a instanceof I1_9).assertTrue();
  expect(a instanceof I2_9).assertTrue();
  expect((a as C3_9).c3_v as bigint).assertEqual(321n);
}
function check_bigint_9(a: Object | bigint) {
  expect(typeof a === 'bigint').assertTrue();
  expect(a as bigint).assertEqual(5n);
}
function check_value_9(v: Object | bigint, v_id: number): void {
  if (v_id === 1) {
    check_C2_9(v);
    check_C2_9(v as III1_9 | III2_9 | II2_9);
    check_C2_9(v as II1_9<number, null> | II1_9<number, string> | bigint);
  } else if (v_id === 2) {
    check_C3_9(v);
    check_C3_9(v as III1_9 | III2_9 | II2_9);
  } else {
    check_bigint_9(v);
    check_bigint_9(v as II1_9<number, null> | II1_9<number, string> | bigint);
  }
}
function check_value_as_type_T_9(v: Object | bigint, v_id: number): void {
  expect(
    v instanceof III1_9 || v instanceof III2_9 || v instanceof II2_9 ||
      v instanceof II1_9 || typeof v === 'bigint'
  ).assertTrue();
  check_value_9(v, v_id);
}
function check_is_in_T_type_9(
  v: III1_9 | III2_9 | II2_9 | II1_9<number, null> | II1_9<number, string> | bigint,
  v_id: number
): boolean {
  check_value_9(v, v_id);
  if (v instanceof III1_9 || v instanceof III2_9 || v instanceof II2_9) {
    check_value_9(v, v_id);
    if (v instanceof II1_9 || typeof v === 'bigint') {
      expect(v_id).assertEqual(1);
      check_value_9(v, v_id);
      expect(v instanceof III1_9 || v instanceof III2_9 || v instanceof II2_9).assertTrue();
      expect(v instanceof I1_9).assertTrue();
      check_value_as_type_T_9(v, v_id);
      return true;
    } else {
      expect(v_id).assertEqual(2);
      check_value_9(v, v_id);
      check_value_as_type_T_9(v, v_id);
      return true;
    }
  } else {
    expect(v_id).assertEqual(3);
    check_value_9(v, v_id);
    check_value_as_type_T_9(v, v_id);
    return true;
  }
}

// ========================= testNS1_10 =========================
namespace testNS1_10 {
  interface I1_10<U, V> {}
  interface I2_10<U, V> {}
  interface II1_10<U, V> extends I1_10<U, V>, I2_10<U, V> {}
  interface II2_10<U = bigint, V = undefined> extends I1_10<U, V>, I2_10<U, V> {}
  interface III1_10<U = number, V = null> extends II1_10<U, V> {}
  interface III2_10<U = number, V = string> extends II1_10<U, V> {}
  class C1_10<U = number, V = null> implements III1_10<U, V> {
    c1_v: U | V
    constructor(p: U | V) { this.c1_v = p }
  }
  class C2_10<U = number, V = string> implements III2_10<U, V> {
    c2_v: U | V
    constructor(p: U | V) { this.c2_v = p }
  }
  class C3_10<U = bigint, V = undefined> implements II2_10<U, V> {
    c3_v: U | V
    constructor(p: U | V) { this.c3_v = p }
  }
  function check_C1_10(a: Object) {
    expect(a instanceof C1_10).assertTrue()
    expect(a instanceof III1_10).assertTrue()
    expect(a instanceof II1_10).assertTrue()
    expect(a instanceof I1_10).assertTrue()
    expect(a instanceof I2_10).assertTrue()
    expect((a as C1_10).c1_v as number).assertEqual(123)
  }
  function check_C2_10(a: Object) {
    expect(a instanceof C2_10).assertTrue()
    expect(a instanceof III2_10).assertTrue()
    expect(a instanceof II1_10).assertTrue()
    expect(a instanceof I1_10).assertTrue()
    expect(a instanceof I2_10).assertTrue()
    expect((a as C2_10).c2_v as number).assertEqual(6.7)
  }
  function check_C3_10(a: Object) {
    expect(a instanceof C3_10).assertTrue()
    expect(a instanceof II2_10).assertTrue()
    expect(a instanceof I1_10).assertTrue()
    expect(a instanceof I2_10).assertTrue()
    expect((a as C3_10).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_10(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_10(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C1_10(v)
      check_C1_10(v as III1_10 | III2_10 | II2_10)
      check_C1_10(v as II1_10<number, null> | II1_10<number, string> | bigint)
    } else if (v_id == 2) {
      check_C3_10(v)
      check_C3_10(v as III1_10 | III2_10 | II2_10)
    } else {
      check_bigint_10(v)
      check_bigint_10(v as II1_10<number, null> | II1_10<number, string> | bigint)
    }
  }
  function check_value_as_type_T_10(v: Object | bigint, v_id: number): void {
    expect(v instanceof III1_10 || v instanceof III2_10 || v instanceof II2_10 ||
      v instanceof II1_10 || typeof v === 'bigint').assertTrue()
    check_value_10(v, v_id)
  }
  function check_is_in_T_type_10(v: III1_10 | III2_10 | II2_10 | II1_10<number, null> | II1_10<number, string> | bigint,
    v_id: number): boolean {
    check_value_10(v, v_id)
    if (v instanceof III1_10 || v instanceof III2_10 || v instanceof II2_10) {
      check_value_10(v, v_id)
      if (v instanceof II1_10 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_10(v, v_id)
        expect(v instanceof III1_10 || v instanceof III2_10 || v instanceof II2_10).assertTrue()
        check_value_as_type_T_10(v, v_id)
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_10(v, v_id)
        check_value_as_type_T_10(v, v_id)
        return true
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_10(v, v_id)
      check_value_as_type_T_10(v, v_id)
      return true
    }
  }
  export function runTest_10(): boolean {
    let res1: boolean = check_is_in_T_type_10(new C1_10(123), 1)
    let res2: boolean = check_is_in_T_type_10(new C3_10(321n), 2)
    let res3: boolean = check_is_in_T_type_10(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

// ========================= testNS2_10 =========================
namespace testNS2_10 {
  interface I1_10<U, V> {}
  interface I2_10<U, V> {}
  interface II1_10<U, V> extends I1_10<U, V>, I2_10<U, V> {}
  interface II2_10<U = bigint, V = undefined> extends I1_10<U, V>, I2_10<U, V> {}
  interface III1_10<U = number, V = null> extends II1_10<U, V> {}
  interface III2_10<U = number, V = string> extends II1_10<U, V> {}
  class C1_10<U = number, V = null> implements III1_10<U, V> {
    c1_v: U | V
    constructor(p: U | V) { this.c1_v = p }
  }
  class C2_10<U = number, V = string> implements III2_10<U, V> {
    c2_v: U | V
    constructor(p: U | V) { this.c2_v = p }
  }
  class C3_10<U = bigint, V = undefined> implements II2_10<U, V> {
    c3_v: U | V
    constructor(p: U | V) { this.c3_v = p }
  }
  function check_C1_10(a: Object) {
    expect(a instanceof C1_10).assertTrue()
    expect(a instanceof III1_10).assertTrue()
    expect(a instanceof II1_10).assertTrue()
    expect(a instanceof I1_10).assertTrue()
    expect(a instanceof I2_10).assertTrue()
    expect((a as C1_10).c1_v as number).assertEqual(123)
  }
  function check_C2_10(a: Object) {
    expect(a instanceof C2_10).assertTrue()
    expect(a instanceof III2_10).assertTrue()
    expect(a instanceof II1_10).assertTrue()
    expect(a instanceof I1_10).assertTrue()
    expect(a instanceof I2_10).assertTrue()
    expect((a as C2_10).c2_v as number).assertEqual(6.7)
  }
  function check_C3_10(a: Object) {
    expect(a instanceof C3_10).assertTrue()
    expect(a instanceof II2_10).assertTrue()
    expect(a instanceof I1_10).assertTrue()
    expect(a instanceof I2_10).assertTrue()
    expect((a as C3_10).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_10(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_10(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C2_10(v)
      check_C2_10(v as III1_10 | III2_10 | II2_10)
      check_C2_10(v as II1_10<number, null> | II1_10<number, string> | bigint)
    } else if (v_id == 2) {
      check_C3_10(v)
      check_C3_10(v as III1_10 | III2_10 | II2_10)
    } else {
      check_bigint_10(v)
      check_bigint_10(v as II1_10<number, null> | II1_10<number, string> | bigint)
    }
  }
  function check_value_as_type_T_10(v: Object | bigint, v_id: number): void {
    expect(v instanceof III1_10 || v instanceof III2_10 || v instanceof II2_10 ||
      v instanceof II1_10 || typeof v === 'bigint').assertTrue()
    check_value_10(v, v_id)
  }
  function check_is_in_T_type_10(v: III1_10 | III2_10 | II2_10 | II1_10<number, null> | II1_10<number, string> | bigint,
    v_id: number): boolean {
    check_value_10(v, v_id)
    if (v instanceof III1_10 || v instanceof III2_10 || v instanceof II2_10) {
      check_value_10(v, v_id)
      if (v instanceof II1_10 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_10(v, v_id)
        expect(v instanceof III1_10 || v instanceof III2_10 || v instanceof II2_10).assertTrue()
        check_value_as_type_T_10(v, v_id)
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_10(v, v_id)
        check_value_as_type_T_10(v, v_id)
        return true
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_10(v, v_id)
      check_value_as_type_T_10(v, v_id)
      return true
    }
  }
  export function runTest_10(): boolean {
    let res1: boolean = check_is_in_T_type_10(new C2_10(6.7), 1)
    let res2: boolean = check_is_in_T_type_10(new C3_10(321n), 2)
    let res3: boolean = check_is_in_T_type_10(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

// ========================= 全局 10 =========================
interface I1_10<U, V> {}
interface I2_10<U, V> {}
interface II1_10<U, V> extends I1_10<U, V>, I2_10<U, V> {}
interface II2_10<U = bigint, V = undefined> extends I1_10<U, V>, I2_10<U, V> {}
interface III1_10<U = number, V = null> extends II1_10<U, V> {}
interface III2_10<U = number, V = string> extends II1_10<U, V> {}
class C1_10<U = number, V = null> implements III1_10<U, V> {
  c1_v: U | V
  constructor(p: U | V) { this.c1_v = p }
}
class C2_10<U = number, V = string> implements III2_10<U, V> {
  c2_v: U | V
  constructor(p: U | V) { this.c2_v = p }
}
class C3_10<U = bigint, V = undefined> implements II2_10<U, V> {
  c3_v: U | V
  constructor(p: U | V) { this.c3_v = p }
}
function check_C1_10(a: Object) {
  expect(a instanceof C1_10).assertTrue()
  expect(a instanceof III1_10).assertTrue()
  expect(a instanceof II1_10).assertTrue()
  expect(a instanceof I1_10).assertTrue()
  expect(a instanceof I2_10).assertTrue()
  expect((a as C1_10).c1_v as number).assertEqual(123)
}
function check_C2_10(a: Object) {
  expect(a instanceof C2_10).assertTrue()
  expect(a instanceof III2_10).assertTrue()
  expect(a instanceof II1_10).assertTrue()
  expect(a instanceof I1_10).assertTrue()
  expect(a instanceof I2_10).assertTrue()
  expect((a as C2_10).c2_v as number).assertEqual(6.7)
}
function check_C3_10(a: Object) {
  expect(a instanceof C3_10).assertTrue()
  expect(a instanceof II2_10).assertTrue()
  expect(a instanceof I1_10).assertTrue()
  expect(a instanceof I2_10).assertTrue()
  expect((a as C3_10).c3_v as bigint).assertEqual(321n)
}
function check_bigint_10(a: Object | bigint) {
  expect(typeof a === 'bigint').assertTrue()
  expect(a as bigint).assertEqual(5n)
}
function check_value_10(v: Object | bigint, v_id: number): void {
  if (v_id == 1) {
    check_C1_10(v)
    check_C1_10(v as III1_10 | III2_10 | II2_10)
    check_C1_10(v as II1_10<number, null> | II1_10<number, string> | bigint)
  } else if (v_id == 2) {
    check_C3_10(v)
    check_C3_10(v as III1_10 | III2_10 | II2_10)
  } else {
    check_bigint_10(v)
    check_bigint_10(v as II1_10<number, null> | II1_10<number, string> | bigint)
  }
}
function check_value_as_type_T_10(v: Object | bigint, v_id: number): void {
  expect(v instanceof III1_10 || v instanceof III2_10 || v instanceof II2_10 ||
    v instanceof II1_10 || typeof v === 'bigint').assertTrue()
  check_value_10(v, v_id)
}
function check_is_in_T_type_10(v: III1_10 | III2_10 | II2_10 | II1_10<number, null> | II1_10<number, string> | bigint,
  v_id: number): boolean {
  check_value_10(v, v_id)
  if (v instanceof III1_10 || v instanceof III2_10 || v instanceof II2_10) {
    check_value_10(v, v_id)
    if (v instanceof II1_10 || typeof v === 'bigint') {
      expect(v_id).assertEqual(1)
      check_value_10(v, v_id)
      expect(v instanceof III1_10 || v instanceof III2_10 || v instanceof II2_10).assertTrue()
      check_value_as_type_T_10(v, v_id)
      return true
    } else {
      expect(v_id).assertEqual(2)
      check_value_10(v, v_id)
      check_value_as_type_T_10(v, v_id)
      return true
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_10(v, v_id)
    check_value_as_type_T_10(v, v_id)
    return true
  }
}

// ========================= testNS1_11 =========================
namespace testNS1_11 {
  interface I_11<U, V> {}
  interface II1_11<U, V> extends I_11<U, V> {}
  interface II2_11<U, V> extends I_11<U, V> {}
  interface III1_11<U, V> extends II1_11<U, V> {}
  interface III2_11<U, V> extends II1_11<U, V> {}
  class C1_11<U, V> implements III1_11<U, V>, III2_11<U, V> {
    c1_v: U | V
    constructor(p: U | V) { this.c1_v = p }
  }
  class C2_11<U, V> implements II2_11<U, V>, III2_11<U, V> {
    c2_v: U | V
    constructor(p: U | V) { this.c2_v = p }
  }
  class C3_11<U, V> implements III1_11<U, V> {
    c3_v: U | V
    constructor(p: U | V) { this.c3_v = p }
  }
  function check_C1_11(a: Object) {
    expect(a instanceof C1_11).assertTrue()
    expect(a instanceof III1_11).assertTrue()
    expect(a instanceof III2_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C1_11<number, null>).c1_v).assertEqual(123)
  }
  function check_C2_11(a: Object) {
    expect(a instanceof C2_11).assertTrue()
    expect(a instanceof II2_11).assertTrue()
    expect(a instanceof III2_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C2_11<number, string>).c2_v).assertEqual(6.7)
  }
  function check_C3_11(a: Object) {
    expect(a instanceof C3_11).assertTrue()
    expect(a instanceof III1_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C3_11<bigint, undefined>).c3_v).assertEqual(321n)
  }
  function check_bigint_11(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a).assertEqual(5n)
  }
  function check_value_11(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C1_11(v)
      check_C1_11(v as III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>)
      check_C1_11(v as III2_11<number, null> | III2_11<number, string> | bigint)
    } else if (v_id == 2) {
      check_C3_11(v)
      check_C3_11(v as III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>)
    } else {
      check_bigint_11(v)
      check_bigint_11(v as III2_11<number, null> | III2_11<number, string> | bigint)
    }
  }
  // 统一为 Object | bigint
  function check_value_as_type_T_11(v: Object | bigint, v_id: number): void {
    expect(
      v instanceof III1_11 || v instanceof II2_11 ||
        v instanceof III2_11 || typeof v === 'bigint'
    ).assertTrue()
    check_value_11(v, v_id)
  }
  function check_is_in_T_type_11(
    v: III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string> | III2_11<number, null> | III2_11<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_11(v, v_id)
    if (v instanceof III1_11 || v instanceof II2_11) {
      check_value_11(v, v_id)
      if (v instanceof III2_11 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_11(v, v_id)
        expect(v instanceof III1_11 || v instanceof II2_11).assertTrue()
        check_value_as_type_T_11(v, v_id)
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_11(v, v_id)
        check_value_as_type_T_11(v, v_id)
        return true
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_11(v, v_id)
      check_value_as_type_T_11(v, v_id)
      return true
    }
  }
  export function runTest_11(): boolean {
    const res1 = check_is_in_T_type_11(new C1_11<number, null>(123), 1)
    const res2 = check_is_in_T_type_11(new C3_11<bigint, undefined>(321n), 2)
    const res3 = check_is_in_T_type_11(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

// ========================= testNS2_11 =========================
namespace testNS2_11 {
  interface I_11<U, V> {}
  interface II1_11<U, V> extends I_11<U, V> {}
  interface II2_11<U, V> extends I_11<U, V> {}
  interface III1_11<U, V> extends II1_11<U, V> {}
  interface III2_11<U, V> extends II1_11<U, V> {}
  class C1_11<U, V> implements III1_11<U, V>, III2_11<U, V> {
    c1_v: U | V
    constructor(p: U | V) { this.c1_v = p }
  }
  class C2_11<U, V> implements II2_11<U, V>, III2_11<U, V> {
    c2_v: U | V
    constructor(p: U | V) { this.c2_v = p }
  }
  class C3_11<U, V> implements III1_11<U, V> {
    c3_v: U | V
    constructor(p: U | V) { this.c3_v = p }
  }
  function check_C1_11(a: Object) {
    expect(a instanceof C1_11).assertTrue()
    expect(a instanceof III1_11).assertTrue()
    expect(a instanceof III2_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C1_11<number, null>).c1_v).assertEqual(123)
  }
  function check_C2_11(a: Object) {
    expect(a instanceof C2_11).assertTrue()
    expect(a instanceof II2_11).assertTrue()
    expect(a instanceof III2_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C2_11<number, string>).c2_v).assertEqual(6.7)
  }
  function check_C3_11(a: Object) {
    expect(a instanceof C3_11).assertTrue()
    expect(a instanceof III1_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C3_11<bigint, undefined>).c3_v).assertEqual(321n)
  }
  function check_bigint_11(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a).assertEqual(5n)
  }
  function check_value_11(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C2_11(v)
      check_C2_11(v as III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>)
      check_C2_11(v as III2_11<number, null> | III2_11<number, string> | bigint)
    } else if (v_id == 2) {
      check_C3_11(v)
      check_C3_11(v as III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>)
    } else {
      check_bigint_11(v)
      check_bigint_11(v as III2_11<number, null> | III2_11<number, string> | bigint)
    }
  }
  function check_value_as_type_T_11(v: Object | bigint, v_id: number): void {
    expect(
      v instanceof III1_11 || v instanceof II2_11 ||
        v instanceof III2_11 || typeof v === 'bigint'
    ).assertTrue()
    check_value_11(v, v_id)
  }
  function check_is_in_T_type_11(
    v: III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string> | III2_11<number, null> | III2_11<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_11(v, v_id)
    if (v instanceof III1_11 || v instanceof II2_11) {
      check_value_11(v, v_id)
      if (v instanceof III2_11 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_11(v, v_id)
        expect(v instanceof III1_11 || v instanceof II2_11).assertTrue()
        check_value_as_type_T_11(v, v_id)
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_11(v, v_id)
        check_value_as_type_T_11(v, v_id)
        return true
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_11(v, v_id)
      check_value_as_type_T_11(v, v_id)
      return true
    }
  }
  export function runTest_11(): boolean {
    const res1 = check_is_in_T_type_11(new C2_11<number, string>(6.7), 1)
    const res2 = check_is_in_T_type_11(new C3_11<bigint, undefined>(321n), 2)
    const res3 = check_is_in_T_type_11(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

// ========================= testNS3_11 =========================
namespace testNS3_11 {
  interface I_11<U, V> {}
  interface II1_11<U, V> extends I_11<U, V> {}
  interface II2_11<U, V> extends I_11<U, V> {}
  interface III1_11<U, V> extends II1_11<U, V> {}
  interface III2_11<U, V> extends II1_11<U, V> {}
  class C1_11<U, V> implements III1_11<U, V>, III2_11<U, V> {
    c1_v: U | V
    constructor(p: U | V) { this.c1_v = p }
  }
  class C2_11<U, V> implements II2_11<U, V>, III2_11<U, V> {
    c2_v: U | V
    constructor(p: U | V) { this.c2_v = p }
  }
  class C3_11<U, V> implements III1_11<U, V> {
    c3_v: U | V
    constructor(p: U | V) { this.c3_v = p }
  }
  function check_C1_11(a: Object) {
    expect(a instanceof C1_11).assertTrue()
    expect(a instanceof III1_11).assertTrue()
    expect(a instanceof III2_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C1_11<number, null>).c1_v).assertEqual(123)
  }
  function check_C2_11(a: Object) {
    expect(a instanceof C2_11).assertTrue()
    expect(a instanceof II2_11).assertTrue()
    expect(a instanceof III2_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C2_11<number, string>).c2_v).assertEqual(6.7)
  }
  function check_C3_11(a: Object) {
    expect(a instanceof C3_11).assertTrue()
    expect(a instanceof III1_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C3_11<bigint, undefined>).c3_v).assertEqual(321n)
  }
  function check_bigint_11(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a).assertEqual(5n)
  }
  function check_value_11(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C1_11(v)
      check_C1_11(v as III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>)
      check_C1_11(v as III2_11<number, null> | III2_11<number, string> | bigint)
    } else if (v_id == 2) {
      check_C3_11(v)
      check_C3_11(v as III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>)
    } else {
      check_bigint_11(v)
      check_bigint_11(v as III2_11<number, null> | III2_11<number, string> | bigint)
    }
  }
  function check_value_as_type_T_11(v: Object | bigint, v_id: number): void {
    expect(
      v instanceof III1_11 || v instanceof II2_11 ||
        v instanceof III2_11 || typeof v === 'bigint'
    ).assertTrue()
    check_value_11(v, v_id)
  }
  function check_is_in_T_type_11(
    v: III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string> | III2_11<number, null> | III2_11<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_11(v, v_id)
    if (v instanceof III1_11 || v instanceof II2_11) {
      check_value_11(v, v_id)
      if (v instanceof III2_11 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_11(v, v_id)
        expect(v instanceof III1_11 || v instanceof II2_11).assertTrue()
        check_value_as_type_T_11(v, v_id)
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_11(v, v_id)
        check_value_as_type_T_11(v, v_id)
        return true
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_11(v, v_id)
      check_value_as_type_T_11(v, v_id)
      return true
    }
  }
  export function runTest_11(): boolean {
    const res1 = check_is_in_T_type_11(new C1_11<number, null>(123), 1)
    const res2 = check_is_in_T_type_11(new C3_11<bigint, undefined>(321n), 2)
    const res3 = check_is_in_T_type_11(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

// ========================= testNS4_11 =========================
namespace testNS4_11 {
  interface I_11<U, V> {}
  interface II1_11<U, V> extends I_11<U, V> {}
  interface II2_11<U, V> extends I_11<U, V> {}
  interface III1_11<U, V> extends II1_11<U, V> {}
  interface III2_11<U, V> extends II1_11<U, V> {}
  class C1_11<U, V> implements III1_11<U, V>, III2_11<U, V> {
    c1_v: U | V
    constructor(p: U | V) { this.c1_v = p }
  }
  class C2_11<U, V> implements II2_11<U, V>, III2_11<U, V> {
    c2_v: U | V
    constructor(p: U | V) { this.c2_v = p }
  }
  class C3_11<U, V> implements III1_11<U, V> {
    c3_v: U | V
    constructor(p: U | V) { this.c3_v = p }
  }
  function check_C1_11(a: Object) {
    expect(a instanceof C1_11).assertTrue()
    expect(a instanceof III1_11).assertTrue()
    expect(a instanceof III2_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C1_11<number, null>).c1_v).assertEqual(123)
  }
  function check_C2_11(a: Object) {
    expect(a instanceof C2_11).assertTrue()
    expect(a instanceof II2_11).assertTrue()
    expect(a instanceof III2_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C2_11<number, string>).c2_v).assertEqual(6.7)
  }
  function check_C3_11(a: Object) {
    expect(a instanceof C3_11).assertTrue()
    expect(a instanceof III1_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C3_11<bigint, undefined>).c3_v).assertEqual(321n)
  }
  function check_bigint_11(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a).assertEqual(5n)
  }
  function check_value_11(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C2_11(v)
      check_C2_11(v as III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>)
      check_C2_11(v as III2_11<number, null> | III2_11<number, string> | bigint)
    } else if (v_id == 2) {
      check_C3_11(v)
      check_C3_11(v as III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>)
    } else {
      check_bigint_11(v)
      check_bigint_11(v as III2_11<number, null> | III2_11<number, string> | bigint)
    }
  }
  function check_value_as_type_T_11(v: Object | bigint, v_id: number): void {
    expect(
      v instanceof III1_11 || v instanceof II2_11 ||
        v instanceof III2_11 || typeof v === 'bigint'
    ).assertTrue()
    check_value_11(v, v_id)
  }
  function check_is_in_T_type_11(
    v: III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string> | III2_11<number, null> | III2_11<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_11(v, v_id)
    if (v instanceof III1_11 || v instanceof II2_11) {
      check_value_11(v, v_id)
      if (v instanceof III2_11 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_11(v, v_id)
        expect(v instanceof III1_11 || v instanceof II2_11).assertTrue()
        check_value_as_type_T_11(v, v_id)
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_11(v, v_id)
        check_value_as_type_T_11(v, v_id)
        return true
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_11(v, v_id)
      check_value_as_type_T_11(v, v_id)
      return true
    }
  }
  export function runTest_11(): boolean {
    const res1 = check_is_in_T_type_11(new C2_11<number, string>(6.7), 1)
    const res2 = check_is_in_T_type_11(new C3_11<bigint, undefined>(321n), 2)
    const res3 = check_is_in_T_type_11(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

// ========================= testNS5_11 =========================
namespace testNS5_11 {
  interface I_11<U, V> {}
  interface II1_11<U, V> extends I_11<U, V> {}
  interface II2_11<U, V> extends I_11<U, V> {}
  interface III1_11<U, V> extends II1_11<U, V> {}
  interface III2_11<U, V> extends II1_11<U, V> {}
  class C1_11<U, V> implements III1_11<U, V>, III2_11<U, V> {
    c1_v: U | V
    constructor(p: U | V) { this.c1_v = p }
  }
  class C2_11<U, V> implements II2_11<U, V>, III2_11<U, V> {
    c2_v: U | V
    constructor(p: U | V) { this.c2_v = p }
  }
  class C3_11<U, V> implements III1_11<U, V> {
    c3_v: U | V
    constructor(p: U | V) { this.c3_v = p }
  }
  function check_C1_11(a: Object) {
    expect(a instanceof C1_11).assertTrue()
    expect(a instanceof III1_11).assertTrue()
    expect(a instanceof III2_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C1_11<number, null>).c1_v).assertEqual(123)
  }
  function check_C2_11(a: Object) {
    expect(a instanceof C2_11).assertTrue()
    expect(a instanceof II2_11).assertTrue()
    expect(a instanceof III2_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C2_11<number, string>).c2_v).assertEqual(6.7)
  }
  function check_C3_11(a: Object) {
    expect(a instanceof C3_11).assertTrue()
    expect(a instanceof III1_11).assertTrue()
    expect(a instanceof II1_11).assertTrue()
    expect(a instanceof I_11).assertTrue()
    expect((a as C3_11<bigint, undefined>).c3_v).assertEqual(321n)
  }
  function check_bigint_11(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a).assertEqual(5n)
  }
  function check_value_11(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C1_11(v)
      check_C1_11(v as III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>)
      check_C1_11(v as III2_11<number, null> | III2_11<number, string> | bigint)
    } else if (v_id == 2) {
      check_C3_11(v)
      check_C3_11(v as III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>)
    } else {
      check_bigint_11(v)
      check_bigint_11(v as III2_11<number, null> | III2_11<number, string> | bigint)
    }
  }
  function check_value_as_type_T_11(v: Object | bigint, v_id: number): void {
    expect(
      v instanceof III1_11 || v instanceof II2_11 ||
        v instanceof III2_11 || typeof v === 'bigint'
    ).assertTrue()
    check_value_11(v, v_id)
  }
  function check_is_in_T_type_11(
    v: III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string> | III2_11<number, null> | III2_11<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_11(v, v_id)
    if (v instanceof III1_11 || v instanceof II2_11) {
      check_value_11(v, v_id)
      if (v instanceof III2_11 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_11(v, v_id)
        expect(v instanceof III1_11 || v instanceof II2_11).assertTrue()
        check_value_as_type_T_11(v, v_id)
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_11(v, v_id)
        check_value_as_type_T_11(v, v_id)
        return true
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_11(v, v_id)
      check_value_as_type_T_11(v, v_id)
      return true
    }
  }
  export function runTest_11(): boolean {
    const res1 = check_is_in_T_type_11(new C1_11<number, null>(123), 1)
    const res2 = check_is_in_T_type_11(new C3_11<bigint, undefined>(321n), 2)
    const res3 = check_is_in_T_type_11(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

// ========================= 全局 11 =========================
interface I_11<U, V> {}
interface II1_11<U, V> extends I_11<U, V> {}
interface II2_11<U, V> extends I_11<U, V> {}
interface III1_11<U, V> extends II1_11<U, V> {}
interface III2_11<U, V> extends II1_11<U, V> {}
class C1_11<U, V> implements III1_11<U, V>, III2_11<U, V> {
  c1_v: U | V
  constructor(p: U | V) { this.c1_v = p }
}
class C2_11<U, V> implements II2_11<U, V>, III2_11<U, V> {
  c2_v: U | V
  constructor(p: U | V) { this.c2_v = p }
}
class C3_11<U, V> implements III1_11<U, V> {
  c3_v: U | V
  constructor(p: U | V) { this.c3_v = p }
}
function check_C1_11(a: Object) {
  expect(a instanceof C1_11).assertTrue()
  expect(a instanceof III1_11).assertTrue()
  expect(a instanceof III2_11).assertTrue()
  expect(a instanceof II1_11).assertTrue()
  expect(a instanceof I_11).assertTrue()
  expect((a as C1_11<number, null>).c1_v).assertEqual(123)
}
function check_C2_11(a: Object) {
  expect(a instanceof C2_11).assertTrue()
  expect(a instanceof II2_11).assertTrue()
  expect(a instanceof III2_11).assertTrue()
  expect(a instanceof II1_11).assertTrue()
  expect(a instanceof I_11).assertTrue()
  expect((a as C2_11<number, string>).c2_v).assertEqual(6.7)
}
function check_C3_11(a: Object) {
  expect(a instanceof C3_11).assertTrue()
  expect(a instanceof III1_11).assertTrue()
  expect(a instanceof II1_11).assertTrue()
  expect(a instanceof I_11).assertTrue()
  expect((a as C3_11<bigint, undefined>).c3_v).assertEqual(321n)
}
function check_bigint_11(a: Object | bigint) {
  expect(typeof a === 'bigint').assertTrue()
  expect(a).assertEqual(5n)
}
function check_value_11(v: Object | bigint, v_id: number): void {
  if (v_id == 1) {
    check_C1_11(v)
    check_C1_11(v as III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>)
    check_C1_11(v as III2_11<number, null> | III2_11<number, string> | bigint)
  } else if (v_id == 2) {
    check_C3_11(v)
    check_C3_11(v as III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string>)
  } else {
    check_bigint_11(v)
    check_bigint_11(v as III2_11<number, null> | III2_11<number, string> | bigint)
  }
}
function check_value_as_type_T_11(v: Object | bigint, v_id: number): void {
  expect(
    v instanceof III1_11 || v instanceof II2_11 ||
      v instanceof III2_11 || typeof v === 'bigint'
  ).assertTrue()
  check_value_11(v, v_id)
}
function check_is_in_T_type_11(
  v: III1_11<number, null> | III1_11<bigint, undefined> | II2_11<number, string> | III2_11<number, null> | III2_11<number, string> | bigint,
  v_id: number
): boolean {
  check_value_11(v, v_id)
  if (v instanceof III1_11 || v instanceof II2_11) {
    check_value_11(v, v_id)
    if (v instanceof III2_11 || typeof v === 'bigint') {
      expect(v_id).assertEqual(1)
      check_value_11(v, v_id)
      expect(v instanceof III1_11 || v instanceof II2_11).assertTrue()
      check_value_as_type_T_11(v, v_id)
      return true
    } else {
      expect(v_id).assertEqual(2)
      check_value_11(v, v_id)
      check_value_as_type_T_11(v, v_id)
      return true
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_11(v, v_id)
    check_value_as_type_T_11(v, v_id)
    return true
  }
}

// ========================= testNS1_12 =========================
namespace testNS1_12 {
  interface I_12<U, V> {}
  interface II1_12<U, V> extends I_12<U, V> {}
  interface II2_12<U, V> extends I_12<U, V> {}
  interface III1_12<U, V> extends II1_12<U, V> {}
  interface III2_12<U, V> extends II1_12<U, V> {}
  class C1_12<U, V> implements III1_12<U, V>, III2_12<U, V> {
    c1_v: U | V
    constructor(p: U | V) { this.c1_v = p }
  }
  class C2_12<U, V> implements II2_12<U, V>, III2_12<U, V> {
    c2_v: U | V
    constructor(p: U | V) { this.c2_v = p }
  }
  class C3_12<U, V> implements III1_12<U, V> {
    c3_v: U | V
    constructor(p: U | V) { this.c3_v = p }
  }
  function check_C1_12(a: Object) {
    expect(a instanceof C1_12).assertTrue()
    expect(a instanceof III1_12).assertTrue()
    expect(a instanceof III2_12).assertTrue()
    expect(a instanceof II1_12).assertTrue()
    expect(a instanceof I_12).assertTrue()
    expect((a as C1_12<number, null>).c1_v).assertEqual(123)
  }
  function check_C2_12(a: Object) {
    expect(a instanceof C2_12).assertTrue()
    expect(a instanceof II2_12).assertTrue()
    expect(a instanceof III2_12).assertTrue()
    expect(a instanceof II1_12).assertTrue()
    expect(a instanceof I_12).assertTrue()
    expect((a as C2_12<number, string>).c2_v).assertEqual(6.7)
  }
  function check_C3_12(a: Object) {
    expect(a instanceof C3_12).assertTrue()
    expect(a instanceof III1_12).assertTrue()
    expect(a instanceof II1_12).assertTrue()
    expect(a instanceof I_12).assertTrue()
    expect((a as C3_12<bigint, undefined>).c3_v).assertEqual(321n)
  }
  function check_bigint_12(a: Object | bigint) {
    expect(typeof a === 'bigint').assertTrue()
    expect(a).assertEqual(5n)
  }
  function check_value_12(v: Object | bigint, v_id: number): void {
    if (v_id == 1) {
      check_C1_12(v)
      check_C1_12(v as III1_12<number, null> | III1_12<bigint, undefined> | II2_12<number, string>)
      check_C1_12(v as III2_12<number, null> | III2_12<number, string> | bigint)
    } else if (v_id == 2) {
      check_C3_12(v)
      check_C3_12(v as III1_12<number, null> | III1_12<bigint, undefined> | II2_12<number, string>)
    } else {
      check_bigint_12(v)
      check_bigint_12(v as III2_12<number, null> | III2_12<number, string> | bigint)
    }
  }
  function check_value_as_type_T_12(v: Object | bigint, v_id: number): void {
    expect(
      v instanceof III1_12 || v instanceof II2_12 ||
        v instanceof III2_12 || typeof v === 'bigint'
    ).assertTrue()
    check_value_12(v, v_id)
  }
  function check_is_in_T_type_12(
    v: III1_12<number, null> | III1_12<bigint, undefined> | II2_12<number, string> | III2_12<number, null> | III2_12<number, string> | bigint,
    v_id: number
  ): boolean {
    check_value_12(v, v_id)
    if (v instanceof III1_12 || v instanceof II2_12) {
      check_value_12(v, v_id)
      if (v instanceof III2_12 || typeof v === 'bigint') {
        expect(v_id).assertEqual(1)
        check_value_12(v, v_id)
        expect(v instanceof III1_12 || v instanceof II2_12).assertTrue()
        expect(v instanceof I_12).assertTrue()
        check_value_as_type_T_12(v, v_id)
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_12(v, v_id)
        check_value_as_type_T_12(v, v_id)
        return true
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_12(v, v_id)
      check_value_as_type_T_12(v, v_id)
      return true
    }
  }
  export function runTest_12(): boolean {
    const res1 = check_is_in_T_type_12(new C1_12<number, null>(123), 1)
    const res2 = check_is_in_T_type_12(new C3_12<bigint, undefined>(321n), 2)
    const res3 = check_is_in_T_type_12(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

// ========================= 全局 12 =========================
interface I_12<U, V> {}
interface II1_12<U, V> extends I_12<U, V> {}
interface II2_12<U, V> extends I_12<U, V> {}
interface III1_12<U, V> extends II1_12<U, V> {}
interface III2_12<U, V> extends II1_12<U, V> {}
class C1_12<U, V> implements III1_12<U, V>, III2_12<U, V> {
  c1_v: U | V
  constructor(p: U | V) { this.c1_v = p }
}
class C2_12<U, V> implements II2_12<U, V>, III2_12<U, V> {
  c2_v: U | V
  constructor(p: U | V) { this.c2_v = p }
}
class C3_12<U, V> implements III1_12<U, V> {
  c3_v: U | V
  constructor(p: U | V) { this.c3_v = p }
}
function check_C1_12(a: Object) {
  expect(a instanceof C1_12).assertTrue()
  expect(a instanceof III1_12).assertTrue()
  expect(a instanceof III2_12).assertTrue()
  expect(a instanceof II1_12).assertTrue()
  expect(a instanceof I_12).assertTrue()
  expect((a as C1_12<number, null>).c1_v).assertEqual(123)
}
function check_C2_12(a: Object) {
  expect(a instanceof C2_12).assertTrue()
  expect(a instanceof II2_12).assertTrue()
  expect(a instanceof III2_12).assertTrue()
  expect(a instanceof II1_12).assertTrue()
  expect(a instanceof I_12).assertTrue()
  expect((a as C2_12<number, string>).c2_v).assertEqual(6.7)
}
function check_C3_12(a: Object) {
  expect(a instanceof C3_12).assertTrue()
  expect(a instanceof III1_12).assertTrue()
  expect(a instanceof II1_12).assertTrue()
  expect(a instanceof I_12).assertTrue()
  expect((a as C3_12<bigint, undefined>).c3_v).assertEqual(321n)
}
function check_bigint_12(a: Object | bigint) {
  expect(typeof a === 'bigint').assertTrue()
  expect(a).assertEqual(5n)
}
function check_value_12(v: Object | bigint, v_id: number): void {
  if (v_id == 1) {
    check_C1_12(v)
    check_C1_12(v as III1_12<number, null> | III1_12<bigint, undefined> | II2_12<number, string>)
    check_C1_12(v as III2_12<number, null> | III2_12<number, string> | bigint)
  } else if (v_id == 2) {
    check_C3_12(v)
    check_C3_12(v as III1_12<number, null> | III1_12<bigint, undefined> | II2_12<number, string>)
  } else {
    check_bigint_12(v)
    check_bigint_12(v as III2_12<number, null> | III2_12<number, string> | bigint)
  }
}
function check_value_as_type_T_12(v: Object | bigint, v_id: number): void {
  expect(
    v instanceof III1_12 || v instanceof II2_12 ||
      v instanceof III2_12 || typeof v === 'bigint'
  ).assertTrue()
  check_value_12(v, v_id)
}
function check_is_in_T_type_12(
  v: III1_12<number, null> | III1_12<bigint, undefined> | II2_12<number, string> | III2_12<number, null> | III2_12<number, string> | bigint,
  v_id: number
): boolean {
  check_value_12(v, v_id)
  if (v instanceof III1_12 || v instanceof II2_12) {
    check_value_12(v, v_id)
    if (v instanceof III2_12 || typeof v === 'bigint') {
      expect(v_id).assertEqual(1)
      check_value_12(v, v_id)
      expect(v instanceof III1_12 || v instanceof II2_12).assertTrue()
      expect(v instanceof I_12).assertTrue()
      check_value_as_type_T_12(v, v_id)
      return true
    } else {
      expect(v_id).assertEqual(2)
      check_value_12(v, v_id)
      check_value_as_type_T_12(v, v_id)
      return true
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_12(v, v_id)
    check_value_as_type_T_12(v, v_id)
    return true
  }
}

export default function InterTypeIsSubOfTypeTOnGenTest04(): void {
  describe('InterTypeIsSubOfTypeTOnGenTest04', () => {
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
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0900
     * @tc.name      testInterTypeIsSubOfTypeTOnGen0009
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on generic custom
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnGen0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnGen0009';
      let res1: boolean = check_is_in_T_type_9(new C2_9(6.7), 1)
      let res2: boolean = check_is_in_T_type_9(new C3_9(321n), 2)
      let res3: boolean = check_is_in_T_type_9(5n, 3)
      expect(res1 && (res2 || res3)).assertTrue()
      expect(testNS1_9.runTest_9()).assertTrue()
      expect(testNS2_9.runTest_9()).assertTrue()
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_1000
     * @tc.name      testInterTypeIsSubOfTypeTOnGen0010
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on generic custom
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnGen0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnGen0010';

      let res1: boolean = check_is_in_T_type_10(new C1_10(123), 1);
      let res2: boolean = check_is_in_T_type_10(new C3_10(321n), 2);
      let res3: boolean = check_is_in_T_type_10(5n, 3);
      expect(res1 && (res2 || res3)).assertTrue();
      expect(testNS1_10.runTest_10()).assertTrue();
      expect(testNS2_10.runTest_10()).assertTrue();
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_1100
     * @tc.name      testInterTypeIsSubOfTypeTOnGen0011
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on generic custom
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnGen0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnGen0011';
      let res1: boolean = check_is_in_T_type_11(new C1_11<number, null>(123), 1);
      let res2: boolean = check_is_in_T_type_11(new C3_11<bigint, undefined>(321n), 2);
      let res3: boolean = check_is_in_T_type_11(5n, 3);
      expect(res1 && (res2 || res3)).assertTrue();
      expect(testNS1_11.runTest_11()).assertTrue();
      expect(testNS2_11.runTest_11()).assertTrue();
      expect(testNS3_11.runTest_11()).assertTrue();
      expect(testNS4_11.runTest_11()).assertTrue();
      expect(testNS5_11.runTest_11()).assertTrue();
    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_1200
     * @tc.name      testInterTypeIsSubOfTypeTOnGen0012
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on generic custom
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnGen0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnGen0012';
      let res1: boolean = check_is_in_T_type_12(new C1_12<number, null>(123), 1)
      let res2: boolean = check_is_in_T_type_12(new C3_12<bigint, undefined>(321n), 2)
      let res3: boolean = check_is_in_T_type_12(5n, 3)
      expect(res1 && (res2 || res3)).assertTrue()
      expect(testNS1_12.runTest_12()).assertTrue()
    });
  })
}