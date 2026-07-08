'use static';
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
  from '@ohos/hypium-binary/src/main/indexStatic';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace testNS2_4 {
  abstract class A_4<U, V> {}
  abstract class B1_4<U, V> extends A_4<U, V> {}
  class B2_4<U=bigint, V=undefined> extends A_4<U, V> {
    b2_v: U | V
    constructor (p: U | V) {
      this.b2_v = p
    }
  }
  class C1_4<U = int, V = null> extends B1_4<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2_4<U = number, V = string> extends B1_4<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class Other_4<T = string> {
    other_v: T
    constructor (p: T) {
      this.other_v = p
    }
  }
  function check_C1_4(a: Any) {
    expect(a instanceof C1_4).assertTrue()
    expect((a as C1_4).c1_v as int).assertEqual(321)
  }
  function check_C2_4(a: Any) {
    expect(a instanceof C2_4).assertTrue()
    expect((a as C2_4).c2_v as number).assertEqual(6.7)
  }
  function check_B2_4(a: Any) {
    expect(a instanceof B2_4).assertTrue()
    expect((a as B2_4).b2_v as bigint).assertEqual(123n)
  }
  function check_Other_4(a: Any) {
    expect(a instanceof Other_4).assertTrue()
    expect((a as Other_4).other_v as string).assertEqual("other")
  }
  function check_bigint_4(a: Any) {
    expect(a instanceof bigint).assertTrue()
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_4(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_4(v)
      check_C2_4(v as C1_4 | C2_4| B2_4 | Other_4)
      check_C2_4(v as B1_4<int, null> | B1_4<number, string> | Other_4 | bigint)
    }
    else if (v_id == 2) {
      check_B2_4(v)
      check_B2_4(v as C1_4 | C2_4| B2_4 | Other_4)
    }
    else {
      check_bigint_4(v)
      check_bigint_4(v as B1_4<int, null> | B1_4<number, string> | Other_4 | bigint)
    }
  }
  function check_value_as_type_T_4(v: Any, v_id: int): void {
    expect(v instanceof C1_4 | C2_4 | B2_4 | Other_4 ||
      v instanceof B1_4 | Other_4 | bigint).assertTrue()
    check_value_4(v, v_id)
  }
  function check_is_in_T_type_4(v: C1_4 | C2_4| B2_4 | Other_4 | B1_4<int, null> | B1_4<number, string> | Other_4 | bigint,
    v_id: int): boolean {
    check_value_4(v, v_id)
    if (v instanceof C1_4 | C2_4 | B2_4 | Other_4) {
      check_value_4(v, v_id)
      if (v instanceof B1_4 | Other_4 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_4(v, v_id)
        expect(v instanceof C1_4 | C2_4 | B2_4 | Other_4).assertTrue()
        check_value_as_type_T_4(v as Any, v_id)
        return true
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_4(v, v_id)
        check_value_as_type_T_4(v as Any, v_id)
        return true
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_4(v, v_id)
      check_value_as_type_T_4(v as Any, v_id)
      return true
    }
  }

  export function runTest_4(): boolean {
    let res1: boolean = check_is_in_T_type_4(
      new C2_4(6.7), 1)
    let res2: boolean = check_is_in_T_type_4(
      new B2_4(123n), 2)
    let res3: boolean = check_is_in_T_type_4(
      5n, 3)
    expect(res1 && res2 && res3).assertTrue()
    return true
  }
}

abstract class A_4<U, V> {}
abstract class B1_4<U, V> extends A_4<U, V> {}
class B2_4<U=bigint, V=undefined> extends A_4<U, V> {
  b2_v: U | V
  constructor (p: U | V) {
    this.b2_v = p
  }
}
class C1_4<U = int, V = null> extends B1_4<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_4<U = number, V = string> extends B1_4<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class Other_4<T = string> {
  other_v: T
  constructor (p: T) {
    this.other_v = p
  }
}
function check_C1_4(a: Any) {
  expect(a instanceof C1_4).assertTrue()
  expect((a as C1_4).c1_v as int).assertEqual(321)
}
function check_C2_4(a: Any) {
  expect(a instanceof C2_4).assertTrue()
  expect((a as C2_4).c2_v as number).assertEqual(6.7)
}
function check_B2_4(a: Any) {
  expect(a instanceof B2_4).assertTrue()
  expect((a as B2_4).b2_v as bigint).assertEqual(123n)
}
function check_Other_4(a: Any) {
  expect(a instanceof Other_4).assertTrue()
  expect((a as Other_4).other_v as string).assertEqual("other")
}
function check_bigint_4(a: Any) {
  expect(a instanceof bigint).assertTrue()
  expect(a as bigint).assertEqual(5n)
}
function check_value_4(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C1_4(v)
    check_C1_4(v as C1_4 | C2_4| B2_4 | Other_4)
    check_C1_4(v as B1_4<int, null> | B1_4<number, string> | Other_4 | bigint)
  }
  else if (v_id == 2) {
    check_B2_4(v)
    check_B2_4(v as C1_4 | C2_4| B2_4 | Other_4)
  }
  else {
    check_bigint_4(v)
    check_bigint_4(v as B1_4<int, null> | B1_4<number, string> | Other_4 | bigint)
  }
}
function check_value_as_type_T_4(v: Any, v_id: int): void {
  expect(v instanceof C1_4 | C2_4 | B2_4 | Other_4 ||
    v instanceof B1_4 | Other_4 | bigint).assertTrue()
  check_value_4(v, v_id)
}
function check_is_in_T_type_4(v: C1_4 | C2_4| B2_4 | Other_4 | B1_4<int, null> | B1_4<number, string> | Other_4 | bigint,
  v_id: int): boolean {
  check_value_4(v, v_id)
  if (v instanceof C1_4 | C2_4 | B2_4 | Other_4) {
    check_value_4(v, v_id)
    if (v instanceof B1_4 | Other_4 | bigint) {
      expect(v_id).assertEqual(1)
      check_value_4(v, v_id)
      expect(v instanceof C1_4 | C2_4 | B2_4 | Other_4).assertTrue()
      check_value_as_type_T_4(v as Any, v_id)
      return true
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_4(v, v_id)
      check_value_as_type_T_4(v as Any, v_id)
      return true
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_4(v, v_id)
    check_value_as_type_T_4(v as Any, v_id)
    return true
  }
}

export default function InterTypeIsSubOfTypeTOnGenTest01(): void {
  describe('InterTypeIsSubOfTypeTOnGenTest01', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_0400
     * @tc.name      testInterTypeIsSubOfTypeTOnGen0004
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on generic custom
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnGen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let res1: boolean = check_is_in_T_type_4(
        new C1_4(321), 1)
      let res2: boolean = check_is_in_T_type_4(
        new B2_4(123n), 2)
      let res3: boolean = check_is_in_T_type_4(
        5n, 3)
      expect(res1 && res2 && res3).assertTrue()

      expect(testNS2_4.runTest_4()).assertTrue()

    });
  })
}
