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

namespace testNS1_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<int, null>).c1_v as int).assertEqual(123)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_5(v)
      check_C1_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
      check_C1_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
  }
  function check_value_as_type_T_5(v: III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | number, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 ||
      v instanceof II1_5 | bigint).assertTrue()
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | II1_5<int, null> | II1_5<number, string> | bigint,
    v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof II1_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertTrue()
        expect(v instanceof III1_5 | III2_5 | II2_5 | number).assertTrue()
        if (v instanceof III1_5 | III2_5 | II2_5 | number) {
          check_value_as_type_T_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | number, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof III1_5 | III2_5 | II2_5 | number) {
          check_value_as_type_T_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | number, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_5(v, v_id)
      if (v instanceof III1_5 | III2_5 | II2_5 | number) {
        check_value_as_type_T_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | number, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_5(): boolean {
    let res1: boolean = check_is_in_T_type_5(
      new C1_5<int, null>(123), 1)
    let res2: boolean = check_is_in_T_type_5(
      new C3_5<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_5(
      5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<int, null>).c1_v as int).assertEqual(123)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_5(v)
      check_C2_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
      check_C2_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
  }
  function check_value_as_type_T_5(v: II1_5<int, null> | II1_5<number, string> | II2_5<bigint, undefined>, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 ||
      v instanceof II1_5 | bigint).assertTrue()
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | II1_5<int, null> | II1_5<number, string> | bigint,
    v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof II1_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertTrue()
        expect(v instanceof II1_5 | II2_5).assertTrue()
        if (v instanceof II1_5 | II2_5) {
          check_value_as_type_T_5(v as II1_5<int, null> | II1_5<number, string> | II2_5<bigint, undefined>, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof II1_5 | II2_5) {
          check_value_as_type_T_5(v as II1_5<int, null> | II1_5<number, string> | II2_5<bigint, undefined>, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_5(v, v_id)
      if (v instanceof II1_5 | II2_5) {
        check_value_as_type_T_5(v as II1_5<int, null> | II1_5<number, string> | II2_5<bigint, undefined>, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_5(): boolean {
    let res1: boolean = check_is_in_T_type_5(
      new C2_5<number, string>(6.7), 1)
    let res2: boolean = check_is_in_T_type_5(
      new C3_5<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_5(
      5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS3_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<int, null>).c1_v as int).assertEqual(123)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_5(v)
      check_C1_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
      check_C1_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
  }
  function check_value_as_type_T_5(v: I1_5<int, null> | I1_5<number, string> | I2_5<bigint, undefined>, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 ||
      v instanceof II1_5 | bigint).assertTrue()
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | II1_5<int, null> | II1_5<number, string> | bigint,
    v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof II1_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertTrue()
        expect(v instanceof I1_5 | I2_5).assertTrue()
        if (v instanceof I1_5 | I2_5) {
          check_value_as_type_T_5(v as I1_5<int, null> | I1_5<number, string> | I2_5<bigint, undefined>, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof I1_5 | I2_5) {
          check_value_as_type_T_5(v as I1_5<int, null> | I1_5<number, string> | I2_5<bigint, undefined>, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_5(v, v_id)
      if (v instanceof I1_5 | I2_5) {
        check_value_as_type_T_5(v as I1_5<int, null> | I1_5<number, string> | I2_5<bigint, undefined>, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_5(): boolean {
    let res1: boolean = check_is_in_T_type_5(
      new C1_5<int, null>(123), 1)
    let res2: boolean = check_is_in_T_type_5(
      new C3_5<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_5(
      5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS4_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<int, null>).c1_v as int).assertEqual(123)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_5(v)
      check_C1_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
      check_C1_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
  }
  function check_value_as_type_T_5(v: II1_5<int, null> | II1_5<number, string> | bigint | string, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 ||
      v instanceof II1_5 | bigint).assertTrue()
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | II1_5<int, null> | II1_5<number, string> | bigint,
    v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof II1_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertTrue()
        expect(v instanceof II1_5 | bigint | string).assertTrue()
        if (v instanceof II1_5 | bigint | string) {
          check_value_as_type_T_5(v as II1_5<int, null> | II1_5<number, string> | bigint | string, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof II1_5 | bigint | string) {
          check_value_as_type_T_5(v as II1_5<int, null> | II1_5<number, string> | bigint | string, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_5(v, v_id)
      if (v instanceof II1_5 | bigint | string) {
        check_value_as_type_T_5(v as II1_5<int, null> | II1_5<number, string> | bigint | string, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_5(): boolean {
    let res1: boolean = check_is_in_T_type_5(
      new C1_5<int, null>(123), 1)
    let res2: boolean = check_is_in_T_type_5(
      new C3_5<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_5(
      5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS5_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<int, null>).c1_v as int).assertEqual(123)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_5(v)
      check_C2_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
      check_C2_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
  }
  function check_value_as_type_T_5(v: I1_5<int, null> | I2_5<number, string> | bigint, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 ||
      v instanceof II1_5 | bigint).assertTrue()
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | II1_5<int, null> | II1_5<number, string> | bigint,
    v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof II1_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertTrue()
        expect(v instanceof I1_5 | I2_5 | bigint).assertTrue()
        if (v instanceof I1_5 | I2_5 | bigint) {
          check_value_as_type_T_5(v as I1_5<int, null> | I2_5<number, string> | bigint, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof I1_5 | I2_5 | bigint) {
          check_value_as_type_T_5(v as I1_5<int, null> | I2_5<number, string> | bigint, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_5(v, v_id)
      if (v instanceof I1_5 | I2_5 | bigint) {
        check_value_as_type_T_5(v as I1_5<int, null> | I2_5<number, string> | bigint, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_5(): boolean {
    let res1: boolean = check_is_in_T_type_5(
      new C2_5<number, string>(6.7), 1)
    let res2: boolean = check_is_in_T_type_5(
      new C3_5<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_5(
      5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS6_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<int, null>).c1_v as int).assertEqual(123)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_5(v)
      check_C1_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
      check_C1_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
  }
  function check_value_as_type_T_5(v: I1_5<int, null> | I1_5<number, string> | bigint, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 ||
      v instanceof II1_5 | bigint).assertTrue()
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | II1_5<int, null> | II1_5<number, string> | bigint,
    v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof II1_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertTrue()
        expect(v instanceof I1_5 | bigint).assertTrue()
        if (v instanceof I1_5 | bigint) {
          check_value_as_type_T_5(v as I1_5<int, null> | I1_5<number, string> | bigint, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof I1_5 | bigint) {
          check_value_as_type_T_5(v as I1_5<int, null> | I1_5<number, string> | bigint, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_5(v, v_id)
      if (v instanceof I1_5 | bigint) {
        check_value_as_type_T_5(v as I1_5<int, null> | I1_5<number, string> | bigint, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_5(): boolean {
    let res1: boolean = check_is_in_T_type_5(
      new C1_5<int, null>(123), 1)
    let res2: boolean = check_is_in_T_type_5(
      new C3_5<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_5(
      5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS7_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<int, null>).c1_v as int).assertEqual(123)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_5(v)
      check_C2_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
      check_C2_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
    }
  }
  function check_value_as_type_T_5(v: I2_5<int, null> | I2_5<number, string> | bigint, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 ||
      v instanceof II1_5 | bigint).assertTrue()
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | II1_5<int, null> | II1_5<number, string> | bigint,
    v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof II1_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertTrue()
        expect(v instanceof I2_5 | bigint).assertTrue()
        if (v instanceof I2_5 | bigint) {
          check_value_as_type_T_5(v as I2_5<int, null> | I2_5<number, string> | bigint, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof I2_5 | bigint) {
          check_value_as_type_T_5(v as I2_5<int, null> | I2_5<number, string> | bigint, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_5(v, v_id)
      if (v instanceof I2_5 | bigint) {
        check_value_as_type_T_5(v as I2_5<int, null> | I2_5<number, string> | bigint, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_5(): boolean {
    let res1: boolean = check_is_in_T_type_5(
      new C2_5<number, string>(6.7), 1)
    let res2: boolean = check_is_in_T_type_5(
      new C3_5<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_5(
      5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

interface I1_5<U, V> {}
interface I2_5<U, V> {}
interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
interface III1_5<U, V> extends II1_5<U, V> {}
interface III2_5<U, V> extends II1_5<U, V> {}
class C1_5<U, V> implements III1_5<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_5<U, V> implements III2_5<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class C3_5<U, V> implements II2_5<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_5(a: Any) {
  expect(a instanceof C1_5).assertTrue()
  expect(a instanceof III1_5).assertTrue()
  expect(a instanceof II1_5).assertTrue()
  expect(a instanceof I1_5).assertTrue()
  expect(a instanceof I2_5).assertTrue()
  expect((a as C1_5<int, null>).c1_v as int).assertEqual(123)
}
function check_C2_5(a: Any) {
  expect(a instanceof C2_5).assertTrue()
  expect(a instanceof III2_5).assertTrue()
  expect(a instanceof II1_5).assertTrue()
  expect(a instanceof I1_5).assertTrue()
  expect(a instanceof I2_5).assertTrue()
  expect((a as C2_5<number, string>).c2_v as number).assertEqual(6.7)
}
function check_C3_5(a: Any) {
  expect(a instanceof C3_5).assertTrue()
  expect(a instanceof II2_5).assertTrue()
  expect(a instanceof I1_5).assertTrue()
  expect(a instanceof I2_5).assertTrue()
  expect((a as C3_5<bigint, undefined>).c3_v as bigint).assertEqual(321n)
}
function check_bigint_5(a: Any) {
  expect(a instanceof bigint).assertTrue()
  expect(a as bigint).assertEqual(5n)
}
function check_value_5(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C1_5(v)
    check_C1_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
    check_C1_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
  }
  else if (v_id == 2) {
    check_C3_5(v)
    check_C3_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined>)
  }
  else {
    check_bigint_5(v)
    check_bigint_5(v as II1_5<int, null> | II1_5<number, string> | bigint)
  }
}
function check_value_as_type_T_5(v: III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | number, v_id: int): void {
  expect(v instanceof III1_5 | III2_5 | II2_5 ||
    v instanceof II1_5 | bigint).assertTrue()
  check_value_5(v, v_id)
}
function check_is_in_T_type_5(v: III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | II1_5<int, null> | II1_5<number, string> | bigint,
  v_id: int): boolean {
  check_value_5(v, v_id)
  if (v instanceof III1_5 | III2_5 | II2_5) {
    check_value_5(v, v_id)
    if (v instanceof II1_5 | bigint) {
      expect(v_id).assertEqual(1)
      check_value_5(v, v_id)
      expect(v instanceof III1_5 | III2_5 | II2_5).assertTrue()
      expect(v instanceof III1_5 | III2_5 | II2_5 | number).assertTrue()
      if (v instanceof III1_5 | III2_5 | II2_5 | number) {
        check_value_as_type_T_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | number, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_5(v, v_id)
      if (v instanceof III1_5 | III2_5 | II2_5 | number) {
        check_value_as_type_T_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | number, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5 | number) {
      check_value_as_type_T_5(v as III1_5<int, null> | III2_5<number, string> | II2_5<bigint, undefined> | number, v_id)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_6 {
  interface I1_6<U, V> {}
  interface I2_6<U, V> {}
  interface II1_6<U, V> extends I1_6<U, V>, I2_6<U, V> {}
  interface II2_6<U, V> extends I1_6<U, V>, I2_6<U, V> {}
  interface III1_6<U, V> extends II1_6<U, V> {}
  interface III2_6<U, V> extends II1_6<U, V> {}
  class C1_6<U, V> implements III1_6<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_6<U, V> implements III2_6<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_6<U, V> implements II2_6<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_6(a: Any) {
    expect(a instanceof C1_6).assertTrue()
    expect(a instanceof III1_6).assertTrue()
    expect(a instanceof II1_6).assertTrue()
    expect(a instanceof I1_6).assertTrue()
    expect(a instanceof I2_6).assertTrue()
    expect((a as C1_6<int, null>).c1_v as int).assertEqual(123)
  }
  function check_C2_6(a: Any) {
    expect(a instanceof C2_6).assertTrue()
    expect(a instanceof III2_6).assertTrue()
    expect(a instanceof II1_6).assertTrue()
    expect(a instanceof I1_6).assertTrue()
    expect(a instanceof I2_6).assertTrue()
    expect((a as C2_6<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_6(a: Any) {
    expect(a instanceof C3_6).assertTrue()
    expect(a instanceof II2_6).assertTrue()
    expect(a instanceof I1_6).assertTrue()
    expect(a instanceof I2_6).assertTrue()
    expect((a as C3_6<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_6(a: Any) {
    expect(a instanceof bigint).assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_6(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_6(v)
      check_C2_6(v as III1_6<int, null> | III2_6<number, string> | II2_6<bigint, undefined>)
      check_C2_6(v as II1_6<int, null> | II1_6<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_6(v)
      check_C3_6(v as III1_6<int, null> | III2_6<number, string> | II2_6<bigint, undefined>)
    }
    else {
      check_bigint_6(v)
      check_bigint_6(v as II1_6<int, null> | II1_6<number, string> | bigint)
    }
  }
  function check_value_as_type_T_6(v: I1_6<int, null> | I1_6<number, string> | I1_6<bigint, undefined>, v_id: int): void {
    expect(v instanceof III1_6 | III2_6 | II2_6 ||
      v instanceof II1_6 | bigint).assertTrue()
    check_value_6(v, v_id)
  }
  function check_is_in_T_type_6(v: III1_6<int, null> | III2_6<number, string> | II2_6<bigint, undefined> | II1_6<int, null> | II1_6<number, string> | bigint,
    v_id: int): boolean {
    check_value_6(v, v_id)
    if (v instanceof III1_6 | III2_6 | II2_6) {
      check_value_6(v, v_id)
      if (v instanceof II1_6 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_6(v, v_id)
        expect(v instanceof III1_6 | III2_6 | II2_6).assertTrue()
        expect(v instanceof I1_6).assertTrue()
        if (v instanceof I1_6) {
          check_value_as_type_T_6(v as I1_6<int, null> | I1_6<number, string> | I1_6<bigint, undefined>, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_6(v, v_id)
        if (v instanceof I1_6) {
          check_value_as_type_T_6(v as I1_6<int, null> | I1_6<number, string> | I1_6<bigint, undefined>, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_6(v, v_id)
      if (v instanceof I1_6) {
        check_value_as_type_T_6(v as I1_6<int, null> | I1_6<number, string> | I1_6<bigint, undefined>, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_6(): boolean {
    let res1: boolean = check_is_in_T_type_6(
      new C2_6<number, string>(6.7), 1)
    let res2: boolean = check_is_in_T_type_6(
      new C3_6<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_6(
      5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_6 {
  interface I1_6<U, V> {}
  interface I2_6<U, V> {}
  interface II1_6<U, V> extends I1_6<U, V>, I2_6<U, V> {}
  interface II2_6<U, V> extends I1_6<U, V>, I2_6<U, V> {}
  interface III1_6<U, V> extends II1_6<U, V> {}
  interface III2_6<U, V> extends II1_6<U, V> {}
  class C1_6<U, V> implements III1_6<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_6<U, V> implements III2_6<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3_6<U, V> implements II2_6<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1_6(a: Any) {
    expect(a instanceof C1_6).assertTrue()
    expect(a instanceof III1_6).assertTrue()
    expect(a instanceof II1_6).assertTrue()
    expect(a instanceof I1_6).assertTrue()
    expect(a instanceof I2_6).assertTrue()
    expect((a as C1_6<int, null>).c1_v as int).assertEqual(123)
  }
  function check_C2_6(a: Any) {
    expect(a instanceof C2_6).assertTrue()
    expect(a instanceof III2_6).assertTrue()
    expect(a instanceof II1_6).assertTrue()
    expect(a instanceof I1_6).assertTrue()
    expect(a instanceof I2_6).assertTrue()
    expect((a as C2_6<number, string>).c2_v as number).assertEqual(6.7)
  }
  function check_C3_6(a: Any) {
    expect(a instanceof C3_6).assertTrue()
    expect(a instanceof II2_6).assertTrue()
    expect(a instanceof I1_6).assertTrue()
    expect(a instanceof I2_6).assertTrue()
    expect((a as C3_6<bigint, undefined>).c3_v as bigint).assertEqual(321n)
  }
  function check_bigint_6(a: Any) {
    expect(a instanceof bigint).assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_6(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_6(v)
      check_C1_6(v as III1_6<int, null> | III2_6<number, string> | II2_6<bigint, undefined>)
      check_C1_6(v as II1_6<int, null> | II1_6<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_6(v)
      check_C3_6(v as III1_6<int, null> | III2_6<number, string> | II2_6<bigint, undefined>)
    }
    else {
      check_bigint_6(v)
      check_bigint_6(v as II1_6<int, null> | II1_6<number, string> | bigint)
    }
  }
  function check_value_as_type_T_6(v: I2_6<int, null> | I2_6<number, string> | I2_6<bigint, undefined>, v_id: int): void {
    expect(v instanceof III1_6 | III2_6 | II2_6 ||
      v instanceof II1_6 | bigint).assertTrue()
    check_value_6(v, v_id)
  }
  function check_is_in_T_type_6(v: III1_6<int, null> | III2_6<number, string> | II2_6<bigint, undefined> | II1_6<int, null> | II1_6<number, string> | bigint,
    v_id: int): boolean {
    check_value_6(v, v_id)
    if (v instanceof III1_6 | III2_6 | II2_6) {
      check_value_6(v, v_id)
      if (v instanceof II1_6 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_6(v, v_id)
        expect(v instanceof III1_6 | III2_6 | II2_6).assertTrue()
        expect(v instanceof I2_6).assertTrue()
        if (v instanceof I2_6) {
          check_value_as_type_T_6(v as I2_6<int, null> | I2_6<number, string> | I2_6<bigint, undefined>, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_6(v, v_id)
        if (v instanceof I2_6) {
          check_value_as_type_T_6(v as I2_6<int, null> | I2_6<number, string> | I2_6<bigint, undefined>, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_6(v, v_id)
      if (v instanceof I2_6) {
        check_value_as_type_T_6(v as I2_6<int, null> | I2_6<number, string> | I2_6<bigint, undefined>, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_6(): boolean {
    let res1: boolean = check_is_in_T_type_6(
      new C1_6<int, null>(123), 1)
    let res2: boolean = check_is_in_T_type_6(
      new C3_6<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_6(
      5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

interface I1_6<U, V> {}
interface I2_6<U, V> {}
interface II1_6<U, V> extends I1_6<U, V>, I2_6<U, V> {}
interface II2_6<U, V> extends I1_6<U, V>, I2_6<U, V> {}
interface III1_6<U, V> extends II1_6<U, V> {}
interface III2_6<U, V> extends II1_6<U, V> {}
class C1_6<U, V> implements III1_6<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_6<U, V> implements III2_6<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class C3_6<U, V> implements II2_6<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_6(a: Any) {
  expect(a instanceof C1_6).assertTrue()
  expect(a instanceof III1_6).assertTrue()
  expect(a instanceof II1_6).assertTrue()
  expect(a instanceof I1_6).assertTrue()
  expect(a instanceof I2_6).assertTrue()
  expect((a as C1_6<int, null>).c1_v as int).assertEqual(123)
}
function check_C2_6(a: Any) {
  expect(a instanceof C2_6).assertTrue()
  expect(a instanceof III2_6).assertTrue()
  expect(a instanceof II1_6).assertTrue()
  expect(a instanceof I1_6).assertTrue()
  expect(a instanceof I2_6).assertTrue()
  expect((a as C2_6<number, string>).c2_v as number).assertEqual(6.7)
}
function check_C3_6(a: Any) {
  expect(a instanceof C3_6).assertTrue()
  expect(a instanceof II2_6).assertTrue()
  expect(a instanceof I1_6).assertTrue()
  expect(a instanceof I2_6).assertTrue()
  expect((a as C3_6<bigint, undefined>).c3_v as bigint).assertEqual(321n)
}
function check_bigint_6(a: Any) {
  expect(a instanceof bigint).assertTrue()
  expect(a as bigint).assertEqual(5n)
}
function check_value_6(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C2_6(v)
    check_C2_6(v as III1_6<int, null> | III2_6<number, string> | II2_6<bigint, undefined>)
    check_C2_6(v as II1_6<int, null> | II1_6<number, string> | bigint)
  }
  else if (v_id == 2) {
    check_C3_6(v)
    check_C3_6(v as III1_6<int, null> | III2_6<number, string> | II2_6<bigint, undefined>)
  }
  else {
    check_bigint_6(v)
    check_bigint_6(v as II1_6<int, null> | II1_6<number, string> | bigint)
  }
}
function check_value_as_type_T_6(v: I1_6<int, null> | I1_6<number, string> | I1_6<bigint, undefined>, v_id: int): void {
  expect(v instanceof III1_6 | III2_6 | II2_6 ||
    v instanceof II1_6 | bigint).assertTrue()
  check_value_6(v, v_id)
}
function check_is_in_T_type_6(v: III1_6<int, null> | III2_6<number, string> | II2_6<bigint, undefined> | II1_6<int, null> | II1_6<number, string> | bigint,
  v_id: int): boolean {
  check_value_6(v, v_id)
  if (v instanceof III1_6 | III2_6 | II2_6) {
    check_value_6(v, v_id)
    if (v instanceof II1_6 | bigint) {
      expect(v_id).assertEqual(1)
      check_value_6(v, v_id)
      expect(v instanceof III1_6 | III2_6 | II2_6).assertTrue()
      expect(v instanceof I1_6).assertTrue()
      if (v instanceof I1_6) {
        check_value_as_type_T_6(v as I1_6<int, null> | I1_6<number, string> | I1_6<bigint, undefined>, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_6(v, v_id)
      if (v instanceof I1_6) {
        check_value_as_type_T_6(v as I1_6<int, null> | I1_6<number, string> | I1_6<bigint, undefined>, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_6(v, v_id)
    if (v instanceof I1_6) {
      check_value_as_type_T_6(v as I1_6<int, null> | I1_6<number, string> | I1_6<bigint, undefined>, v_id)
      return true
    } else {
      return false
    }
  }
}

export default function InterTypeIsSubOfTypeTOnGenTest02(): void {
  describe('InterTypeIsSubOfTypeTOnGenTest02', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0500a
     * @tc.name      testInterTypeIsSubOfTypeTOnGen0005
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on generic custom
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnGen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnGen0005';
      

      let res1: boolean = check_is_in_T_type_5(
        new C1_5<int, null>(123), 1)
      let res2: boolean = check_is_in_T_type_5(
        new C3_5<bigint, undefined>(321n), 2)
      let res3: boolean = check_is_in_T_type_5(
        5n, 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_5.runTest_5()).assertTrue()
      expect(testNS2_5.runTest_5()).assertTrue()
      expect(testNS3_5.runTest_5()).assertTrue()
      expect(testNS4_5.runTest_5()).assertTrue()
      expect(testNS5_5.runTest_5()).assertTrue()
      expect(testNS6_5.runTest_5()).assertTrue()
      expect(testNS7_5.runTest_5()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0600
     * @tc.name      testInterTypeIsSubOfTypeTOnGen0006
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on generic custom
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnGen0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnGen0006';
      

      let res1: boolean = check_is_in_T_type_6(
        new C2_6<number, string>(6.7), 1)
      let res2: boolean = check_is_in_T_type_6(
        new C3_6<bigint, undefined>(321n), 2)
      let res3: boolean = check_is_in_T_type_6(
        5n, 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_6.runTest_6()).assertTrue()
      expect(testNS2_6.runTest_6()).assertTrue()

    });
  })
}