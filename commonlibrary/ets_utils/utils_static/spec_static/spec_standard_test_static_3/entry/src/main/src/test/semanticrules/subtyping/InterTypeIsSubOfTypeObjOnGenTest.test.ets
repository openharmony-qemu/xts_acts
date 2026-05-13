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
  abstract class A_1<U, V> {}
  abstract class B1_1<U, V> extends A_1<U, V> {}
  class B2_1<U, V> extends A_1<U, V> {
    b2_v_1: U | V
    constructor (p: U | V) {
      this.b2_v_1 = p
    }
  }
  class C1_1<U, V> extends B1_1<U, V> {
    c1_v_1: U | V
    constructor (p: U | V) {
      this.c1_v_1 = p
    }
  }
  class C2_1<U, V> extends B1_1<U, V> {
    c2_v_1: U | V
    constructor (p: U | V) {
      this.c2_v_1 = p
    }
  }
  class Other_1<T> {
    other_v_1: T
    constructor (p: T) {
      this.other_v_1 = p
    }
  }
  function check_C1_1(a: Any) {
    expect(a instanceof C1_1).assertEqual(true)
    expect((a as C1_1<int, null>).c1_v_1 as int).assertEqual(321)
  }
  function check_C2_1(a: Any) {
    expect(a instanceof C2_1).assertEqual(true)
    expect((a as C2_1<number, string>).c2_v_1 as number).assertEqual(6.7)
  }
  function check_B2_1(a: Any) {
    expect(a instanceof B2_1).assertEqual(true)
    expect((a as B2_1<bigint, undefined>).b2_v_1 as bigint).assertEqual(123n)
  }
  function check_Other_1(a: Any) {
    expect(a instanceof Other_1).assertEqual(true)
    expect((a as Other_1<string>).other_v_1 as string).assertEqual("other")
  }
  function check_bigint_1(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_1(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_1(v)
      check_C1_1(v as C1_1<int, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>)
      check_C1_1(v as B1_1<int, null> | B1_1<number, string> | Other_1<string> | bigint)
    }
    else if (v_id == 2) {
      check_B2_1(v)
      check_B2_1(v as C1_1<int, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>)
    }
    else {
      check_bigint_1(v)
      check_bigint_1(v as B1_1<int, null> | B1_1<number, string> | Other_1<string> | bigint)
    }
  }
  function check_value_as_type_T_1(v: Object, v_id: int): void {
    expect(v instanceof C1_1 | C2_1 | B2_1 | Other_1 ||
      v instanceof B1_1 | Other_1 | bigint).assertEqual(true)
    check_value_1(v, v_id)
  }
  function check_is_in_T_type_1(v: C1_1<int, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string> | B1_1<int, null> | B1_1<number, string> | Other_1<string> | bigint,
    v_id: int): boolean {
    check_value_1(v, v_id)
    if (v instanceof C1_1 | C2_1 | B2_1 | Other_1) {
      check_value_1(v, v_id)
      if (v instanceof B1_1 | Other_1 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_1(v, v_id)
        expect(v instanceof C1_1 | C2_1 | B2_1 | Other_1).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_1(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_1(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1: boolean = check_is_in_T_type_1(
      new C1_1<int, null>(321), 1)
    let res2: boolean = check_is_in_T_type_1(
      new B2_1<bigint, undefined>(123n), 2)
    let res3: boolean = check_is_in_T_type_1(
      5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

namespace testNS2_1 {
  abstract class A_1<U, V> {}
  abstract class B1_1<U, V> extends A_1<U, V> {}
  class B2_1<U, V> extends A_1<U, V> {
    b2_v_1: U | V
    constructor (p: U | V) {
      this.b2_v_1 = p
    }
  }
  class C1_1<U, V> extends B1_1<U, V> {
    c1_v_1: U | V
    constructor (p: U | V) {
      this.c1_v_1 = p
    }
  }
  class C2_1<U, V> extends B1_1<U, V> {
    c2_v_1: U | V
    constructor (p: U | V) {
      this.c2_v_1 = p
    }
  }
  class Other_1<T> {
    other_v_1: T
    constructor (p: T) {
      this.other_v_1 = p
    }
  }
  function check_C1_1(a: Any) {
    expect(a instanceof C1_1).assertEqual(true)
    expect((a as C1_1<int, null>).c1_v_1 as int).assertEqual(321)
  }
  function check_C2_1(a: Any) {
    expect(a instanceof C2_1).assertEqual(true)
    expect((a as C2_1<number, string>).c2_v_1 as number).assertEqual(6.7)
  }
  function check_B2_1(a: Any) {
    expect(a instanceof B2_1).assertEqual(true)
    expect((a as B2_1<bigint, undefined>).b2_v_1 as bigint).assertEqual(123n)
  }
  function check_Other_1(a: Any) {
    expect(a instanceof Other_1).assertEqual(true)
    expect((a as Other_1<string>).other_v_1 as string).assertEqual("other")
  }
  function check_bigint_1(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_1(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_1(v)
      check_C2_1(v as C1_1<int, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>)
      check_C2_1(v as B1_1<int, null> | B1_1<number, string> | Other_1<string> | bigint)
    }
    else if (v_id == 2) {
      check_B2_1(v)
      check_B2_1(v as C1_1<int, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>)
    }
    else {
      check_bigint_1(v)
      check_bigint_1(v as B1_1<int, null> | B1_1<number, string> | Other_1<string> | bigint)
    }
  }
  function check_value_as_type_T_1(v: Object, v_id: int): void {
    expect(v instanceof C1_1 | C2_1 | B2_1 | Other_1 ||
      v instanceof B1_1 | Other_1 | bigint).assertEqual(true)
    check_value_1(v, v_id)
  }
  function check_is_in_T_type_1(v: C1_1<int, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string> | B1_1<int, null> | B1_1<number, string> | Other_1<string> | bigint,
    v_id: int): boolean {
    check_value_1(v, v_id)
    if (v instanceof C1_1 | C2_1 | B2_1 | Other_1) {
      check_value_1(v, v_id)
      if (v instanceof B1_1 | Other_1 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_1(v, v_id)
        expect(v instanceof C1_1 | C2_1 | B2_1 | Other_1).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_1(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_1(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1: boolean = check_is_in_T_type_1(
      new C2_1<number, string>(6.7), 1)
    let res2: boolean = check_is_in_T_type_1(
      new B2_1<bigint, undefined>(123n), 2)
    let res3: boolean = check_is_in_T_type_1(
      5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

abstract class A_1<U, V> {}
abstract class B1_1<U, V> extends A_1<U, V> {}
class B2_1<U, V> extends A_1<U, V> {
  b2_v_1: U | V
  constructor (p: U | V) {
    this.b2_v_1 = p
  }
}
class C1_1<U, V> extends B1_1<U, V> {
  c1_v_1: U | V
  constructor (p: U | V) {
    this.c1_v_1 = p
  }
}
class C2_1<U, V> extends B1_1<U, V> {
  c2_v_1: U | V
  constructor (p: U | V) {
    this.c2_v_1 = p
  }
}
class Other_1<T> {
  other_v_1: T
  constructor (p: T) {
    this.other_v_1 = p
  }
}
function check_C1_1(a: Any) {
  expect(a instanceof C1_1).assertEqual(true)
  expect((a as C1_1<int, null>).c1_v_1 as int).assertEqual(321)
}
function check_C2_1(a: Any) {
  expect(a instanceof C2_1).assertEqual(true)
  expect((a as C2_1<number, string>).c2_v_1 as number).assertEqual(6.7)
}
function check_B2_1(a: Any) {
  expect(a instanceof B2_1).assertEqual(true)
  expect((a as B2_1<bigint, undefined>).b2_v_1 as bigint).assertEqual(123n)
}
function check_Other_1(a: Any) {
  expect(a instanceof Other_1).assertEqual(true)
  expect((a as Other_1<string>).other_v_1 as string).assertEqual("other")
}
function check_bigint_1(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}
function check_value_1(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C1_1(v)
    check_C1_1(v as C1_1<int, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>)
    check_C1_1(v as B1_1<int, null> | B1_1<number, string> | Other_1<string> | bigint)
  }
  else if (v_id == 2) {
    check_B2_1(v)
    check_B2_1(v as C1_1<int, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string>)
  }
  else {
    check_bigint_1(v)
    check_bigint_1(v as B1_1<int, null> | B1_1<number, string> | Other_1<string> | bigint)
  }
}
function check_value_as_type_T_1(v: Object, v_id: int): void {
  expect(v instanceof C1_1 | C2_1 | B2_1 | Other_1 ||
    v instanceof B1_1 | Other_1 | bigint).assertEqual(true)
  check_value_1(v, v_id)
}
function check_is_in_T_type_1(v: C1_1<int, null> | C2_1<number, string> | B2_1<bigint, undefined> | Other_1<string> | B1_1<int, null> | B1_1<number, string> | Other_1<string> | bigint,
  v_id: int): boolean {
  check_value_1(v, v_id)
  if (v instanceof C1_1 | C2_1 | B2_1 | Other_1) {
    check_value_1(v, v_id)
    if (v instanceof B1_1 | Other_1 | bigint) {
      expect(v_id).assertEqual(1)
      check_value_1(v, v_id)
      expect(v instanceof C1_1 | C2_1 | B2_1 | Other_1).assertEqual(true)
      expect(v instanceof Object).assertEqual(true)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_1(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_1(v, v_id)
    if (v instanceof Object) {
      check_value_as_type_T_1(v, v_id)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_2 {
  abstract class A_2<U, V> {}
  abstract class B1_2<U, V> extends A_2<U, V> {}
  class B2_2<U=bigint, V=undefined> extends A_2<U, V> {
    b2_v_2: U | V
    constructor (p: U | V) {
      this.b2_v_2 = p
    }
  }
  class C1_2<U = int, V = null> extends B1_2<U, V> {
    c1_v_2: U | V
    constructor (p: U | V) {
      this.c1_v_2 = p
    }
  }
  class C2_2<U = number, V = string> extends B1_2<U, V> {
    c2_v_2: U | V
    constructor (p: U | V) {
      this.c2_v_2 = p
    }
  }
  class Other_2<T = string> {
    other_v_2: T
    constructor (p: T) {
      this.other_v_2 = p
    }
  }
  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).c1_v_2 as int).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).c2_v_2 as number).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).b2_v_2 as bigint).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).other_v_2 as string).assertEqual("other")
  }
  function check_bigint_2(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_2(v)
      check_C1_2(v as C1_2 | C2_2| B2_2 | Other_2)
      check_C1_2(v as B1_2<int, null> | B1_2<number, string> | Other_2 | bigint)
    }
    else if (v_id == 2) {
      check_B2_2(v)
      check_B2_2(v as C1_2 | C2_2| B2_2 | Other_2)
    }
    else {
      check_bigint_2(v)
      check_bigint_2(v as B1_2<int, null> | B1_2<number, string> | Other_2 | bigint)
    }
  }
  function check_value_as_type_T_2(v: Object, v_id: int): void {
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 ||
      v instanceof B1_2 | Other_2 | bigint).assertEqual(true)
    check_value_2(v, v_id)
  }
  function check_is_in_T_type_2(v: C1_2 | C2_2| B2_2 | Other_2 | B1_2<int, null> | B1_2<number, string> | Other_2 | bigint,
    v_id: int): boolean {
    check_value_2(v, v_id)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
      check_value_2(v, v_id)
      if (v instanceof B1_2 | Other_2 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_2(v, v_id)
        expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_2(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_2(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_2(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_2(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_2(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2(
      new C1_2(321), 1)
    let res2: boolean = check_is_in_T_type_2(
      new B2_2(123n), 2)
    let res3: boolean = check_is_in_T_type_2(
      5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

namespace testNS2_2 {
  abstract class A_2<U, V> {}
  abstract class B1_2<U, V> extends A_2<U, V> {}
  class B2_2<U=bigint, V=undefined> extends A_2<U, V> {
    b2_v_2: U | V
    constructor (p: U | V) {
      this.b2_v_2 = p
    }
  }
  class C1_2<U = int, V = null> extends B1_2<U, V> {
    c1_v_2: U | V
    constructor (p: U | V) {
      this.c1_v_2 = p
    }
  }
  class C2_2<U = number, V = string> extends B1_2<U, V> {
    c2_v_2: U | V
    constructor (p: U | V) {
      this.c2_v_2 = p
    }
  }
  class Other_2<T = string> {
    other_v_2: T
    constructor (p: T) {
      this.other_v_2 = p
    }
  }
  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).c1_v_2 as int).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).c2_v_2 as number).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).b2_v_2 as bigint).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).other_v_2 as string).assertEqual("other")
  }
  function check_bigint_2(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_2(v)
      check_C2_2(v as C1_2 | C2_2| B2_2 | Other_2)
      check_C2_2(v as B1_2<int, null> | B1_2<number, string> | Other_2 | bigint)
    }
    else if (v_id == 2) {
      check_B2_2(v)
      check_B2_2(v as C1_2 | C2_2| B2_2 | Other_2)
    }
    else {
      check_bigint_2(v)
      check_bigint_2(v as B1_2<int, null> | B1_2<number, string> | Other_2 | bigint)
    }
  }
  function check_value_as_type_T_2(v: Object, v_id: int): void {
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 ||
      v instanceof B1_2 | Other_2 | bigint).assertEqual(true)
    check_value_2(v, v_id)
  }
  function check_is_in_T_type_2(v: C1_2 | C2_2| B2_2 | Other_2 | B1_2<int, null> | B1_2<number, string> | Other_2 | bigint,
    v_id: int): boolean {
    check_value_2(v, v_id)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
      check_value_2(v, v_id)
      if (v instanceof B1_2 | Other_2 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_2(v, v_id)
        expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_2(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_2(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_2(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_2(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_2(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2(
      new C2_2(6.7), 1)
    let res2: boolean = check_is_in_T_type_2(
      new B2_2(123n), 2)
    let res3: boolean = check_is_in_T_type_2(
      5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

abstract class A_2<U, V> {}
abstract class B1_2<U, V> extends A_2<U, V> {}
class B2_2<U=bigint, V=undefined> extends A_2<U, V> {
  b2_v_2: U | V
  constructor (p: U | V) {
    this.b2_v_2 = p
  }
}
class C1_2<U = int, V = null> extends B1_2<U, V> {
  c1_v_2: U | V
  constructor (p: U | V) {
    this.c1_v_2 = p
  }
}
class C2_2<U = number, V = string> extends B1_2<U, V> {
  c2_v_2: U | V
  constructor (p: U | V) {
    this.c2_v_2 = p
  }
}
class Other_2<T = string> {
  other_v_2: T
  constructor (p: T) {
    this.other_v_2 = p
  }
}
function check_C1_2(a: Any) {
  expect(a instanceof C1_2).assertEqual(true)
  expect((a as C1_2).c1_v_2 as int).assertEqual(321)
}
function check_C2_2(a: Any) {
  expect(a instanceof C2_2).assertEqual(true)
  expect((a as C2_2).c2_v_2 as number).assertEqual(6.7)
}
function check_B2_2(a: Any) {
  expect(a instanceof B2_2).assertEqual(true)
  expect((a as B2_2).b2_v_2 as bigint).assertEqual(123n)
}
function check_Other_2(a: Any) {
  expect(a instanceof Other_2).assertEqual(true)
  expect((a as Other_2).other_v_2 as string).assertEqual("other")
}
function check_bigint_2(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}
function check_value_2(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C1_2(v)
    check_C1_2(v as C1_2 | C2_2| B2_2 | Other_2)
    check_C1_2(v as B1_2<int, null> | B1_2<number, string> | Other_2 | bigint)
  }
  else if (v_id == 2) {
    check_B2_2(v)
    check_B2_2(v as C1_2 | C2_2| B2_2 | Other_2)
  }
  else {
    check_bigint_2(v)
    check_bigint_2(v as B1_2<int, null> | B1_2<number, string> | Other_2 | bigint)
  }
}
function check_value_as_type_T_2(v: Object, v_id: int): void {
  expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 ||
    v instanceof B1_2 | Other_2 | bigint).assertEqual(true)
  check_value_2(v, v_id)
}
function check_is_in_T_type_2(v: C1_2 | C2_2| B2_2 | Other_2 | B1_2<int, null> | B1_2<number, string> | Other_2 | bigint,
  v_id: int): boolean {
  check_value_2(v, v_id)
  if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
    check_value_2(v, v_id)
    if (v instanceof B1_2 | Other_2 | bigint) {
      expect(v_id).assertEqual(1)
      check_value_2(v, v_id)
      expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(true)
      expect(v instanceof Object).assertEqual(true)
      if (v instanceof Object) {
        check_value_as_type_T_2(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_2(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_2(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_2(v, v_id)
    if (v instanceof Object) {
      check_value_as_type_T_2(v, v_id)
      return true
    } else {
      return false
    }
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
    c1_v_3: U | V
    constructor (p: U | V) {
      this.c1_v_3 = p
    }
  }
  class C2_3<U, V> implements III2_3<U, V>  {
    c2_v_3: U | V
    constructor (p: U | V) {
      this.c2_v_3 = p
    }
  }
  class C3_3<U, V> implements II2_3<U, V>  {
    c3_v_3: U | V
    constructor (p: U | V) {
      this.c3_v_3 = p
    }
  }
  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3<int, null>).c1_v_3 as int).assertEqual(123)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3<number, string>).c2_v_3 as number).assertEqual(6.7)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3<bigint, undefined>).c3_v_3 as bigint).assertEqual(321n)
  }
  function check_bigint_3(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_3(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_3(v)
      check_C1_3(v as III1_3<int, null> | III2_3<number, string> | II2_3<bigint, undefined>)
      check_C1_3(v as II1_3<int, null> | II1_3<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_3(v)
      check_C3_3(v as III1_3<int, null> | III2_3<number, string> | II2_3<bigint, undefined>)
    }
    else {
      check_bigint_3(v)
      check_bigint_3(v as II1_3<int, null> | II1_3<number, string> | bigint)
    }
  }
  function check_value_as_type_T_3(v: Object, v_id: int): void {
    expect(v instanceof III1_3 | III2_3 | II2_3 ||
      v instanceof II1_3 | bigint).assertEqual(true)
    check_value_3(v, v_id)
  }
  function check_is_in_T_type_3(v: III1_3<int, null> | III2_3<number, string> | II2_3<bigint, undefined> | II1_3<int, null> | II1_3<number, string> | bigint,
    v_id: int): boolean {
    check_value_3(v, v_id)
    if (v instanceof III1_3 | III2_3 | II2_3) {
      check_value_3(v, v_id)
      if (v instanceof II1_3 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_3(v, v_id)
        expect(v instanceof III1_3 | III2_3 | II2_3).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_3(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_3(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_3(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_3(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_3(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_3(): boolean {
    let res1: boolean = check_is_in_T_type_3(
      new C1_3<int, null>(123), 1)
    let res2: boolean = check_is_in_T_type_3(
      new C3_3<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_3(
      5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
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
    c1_v_3: U | V
    constructor (p: U | V) {
      this.c1_v_3 = p
    }
  }
  class C2_3<U, V> implements III2_3<U, V>  {
    c2_v_3: U | V
    constructor (p: U | V) {
      this.c2_v_3 = p
    }
  }
  class C3_3<U, V> implements II2_3<U, V>  {
    c3_v_3: U | V
    constructor (p: U | V) {
      this.c3_v_3 = p
    }
  }
  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3<int, null>).c1_v_3 as int).assertEqual(123)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3<number, string>).c2_v_3 as number).assertEqual(6.7)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3<bigint, undefined>).c3_v_3 as bigint).assertEqual(321n)
  }
  function check_bigint_3(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_3(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_3(v)
      check_C2_3(v as III1_3<int, null> | III2_3<number, string> | II2_3<bigint, undefined>)
      check_C2_3(v as II1_3<int, null> | II1_3<number, string> | bigint)
    }
    else if (v_id == 2) {
      check_C3_3(v)
      check_C3_3(v as III1_3<int, null> | III2_3<number, string> | II2_3<bigint, undefined>)
    }
    else {
      check_bigint_3(v)
      check_bigint_3(v as II1_3<int, null> | II1_3<number, string> | bigint)
    }
  }
  function check_value_as_type_T_3(v: Object, v_id: int): void {
    expect(v instanceof III1_3 | III2_3 | II2_3 ||
      v instanceof II1_3 | bigint).assertEqual(true)
    check_value_3(v, v_id)
  }
  function check_is_in_T_type_3(v: III1_3<int, null> | III2_3<number, string> | II2_3<bigint, undefined> | II1_3<int, null> | II1_3<number, string> | bigint,
    v_id: int): boolean {
    check_value_3(v, v_id)
    if (v instanceof III1_3 | III2_3 | II2_3) {
      check_value_3(v, v_id)
      if (v instanceof II1_3 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_3(v, v_id)
        expect(v instanceof III1_3 | III2_3 | II2_3).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_3(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_3(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_3(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_3(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_3(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_3(): boolean {
    let res1: boolean = check_is_in_T_type_3(
      new C2_3<number, string>(6.7), 1)
    let res2: boolean = check_is_in_T_type_3(
      new C3_3<bigint, undefined>(321n), 2)
    let res3: boolean = check_is_in_T_type_3(
      5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
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
  c1_v_3: U | V
  constructor (p: U | V) {
    this.c1_v_3 = p
  }
}
class C2_3<U, V> implements III2_3<U, V>  {
  c2_v_3: U | V
  constructor (p: U | V) {
    this.c2_v_3 = p
  }
}
class C3_3<U, V> implements II2_3<U, V>  {
  c3_v_3: U | V
  constructor (p: U | V) {
    this.c3_v_3 = p
  }
}
function check_C1_3(a: Any) {
  expect(a instanceof C1_3).assertEqual(true)
  expect(a instanceof III1_3).assertEqual(true)
  expect(a instanceof II1_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C1_3<int, null>).c1_v_3 as int).assertEqual(123)
}
function check_C2_3(a: Any) {
  expect(a instanceof C2_3).assertEqual(true)
  expect(a instanceof III2_3).assertEqual(true)
  expect(a instanceof II1_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C2_3<number, string>).c2_v_3 as number).assertEqual(6.7)
}
function check_C3_3(a: Any) {
  expect(a instanceof C3_3).assertEqual(true)
  expect(a instanceof II2_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C3_3<bigint, undefined>).c3_v_3 as bigint).assertEqual(321n)
}
function check_bigint_3(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}
function check_value_3(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C1_3(v)
    check_C1_3(v as III1_3<int, null> | III2_3<number, string> | II2_3<bigint, undefined>)
    check_C1_3(v as II1_3<int, null> | II1_3<number, string> | bigint)
  }
  else if (v_id == 2) {
    check_C3_3(v)
    check_C3_3(v as III1_3<int, null> | III2_3<number, string> | II2_3<bigint, undefined>)
  }
  else {
    check_bigint_3(v)
    check_bigint_3(v as II1_3<int, null> | II1_3<number, string> | bigint)
  }
}
function check_value_as_type_T_3(v: Object, v_id: int): void {
  expect(v instanceof III1_3 | III2_3 | II2_3 ||
    v instanceof II1_3 | bigint).assertEqual(true)
  check_value_3(v, v_id)
}
function check_is_in_T_type_3(v: III1_3<int, null> | III2_3<number, string> | II2_3<bigint, undefined> | II1_3<int, null> | II1_3<number, string> | bigint,
  v_id: int): boolean {
  check_value_3(v, v_id)
  if (v instanceof III1_3 | III2_3 | II2_3) {
    check_value_3(v, v_id)
    if (v instanceof II1_3 | bigint) {
      expect(v_id).assertEqual(1)
      check_value_3(v, v_id)
      expect(v instanceof III1_3 | III2_3 | II2_3).assertEqual(true)
      expect(v instanceof Object).assertEqual(true)
      if (v instanceof Object) {
        check_value_as_type_T_3(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_3(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_3(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_3(v, v_id)
    if (v instanceof Object) {
      check_value_as_type_T_3(v, v_id)
      return true
    } else {
      return false
    }
  }
}

export default function InterTypeIsSubOfTypeObjOnGenTest(): void {
  describe('InterTypeIsSubOfTypeObjOnGenTest', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0100
     * @tc.name      testInterTypeIsSubOfTypeObjOnGen0001
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on generic
     *               custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnGen0001';
      

      let res1_1: boolean = check_is_in_T_type_1(
        new C1_1<int, null>(321), 1)
      let res2_1: boolean = check_is_in_T_type_1(
        new B2_1<bigint, undefined>(123n), 2)
      let res3_1: boolean = check_is_in_T_type_1(
        5n, 3)
      expect(res1_1 && (res2_1 || res3_1)).assertEqual(true)
      expect(testNS1_1.runTest_1()).assertEqual(true)
      expect(testNS2_1.runTest_1()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0200
     * @tc.name      testInterTypeIsSubOfTypeObjOnGen0002
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on generic
     *               custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnGen0002';
      

      let res1_2: boolean = check_is_in_T_type_2(
        new C1_2(321), 1)
      let res2_2: boolean = check_is_in_T_type_2(
        new B2_2(123n), 2)
      let res3_2: boolean = check_is_in_T_type_2(
        5n, 3)
      expect(res1_2 && (res2_2 || res3_2)).assertEqual(true)

      expect(testNS1_2.runTest_2()).assertEqual(true)
      expect(testNS2_2.runTest_2()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0300
     * @tc.name      testInterTypeIsSubOfTypeObjOnGen0003
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on generic
     *               custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnGen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnGen0003';
      

      let res1_3: boolean = check_is_in_T_type_3(
        new C1_3<int, null>(123), 1)
      let res2_3: boolean = check_is_in_T_type_3(
        new C3_3<bigint, undefined>(321n), 2)
      let res3_3: boolean = check_is_in_T_type_3(
        5n, 3)
      expect(res1_3 && (res2_3 || res3_3)).assertEqual(true)

      expect(testNS1_3.runTest_3()).assertEqual(true)
      expect(testNS2_3.runTest_3()).assertEqual(true)

    });
  })
}