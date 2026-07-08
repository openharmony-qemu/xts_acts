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

      let res1_3: boolean = check_is_in_T_type_3(
        new C1_3<int, null>(123), 1)
      let res2_3: boolean = check_is_in_T_type_3(
        new C3_3<bigint, undefined>(321n), 2)
      let res3_3: boolean = check_is_in_T_type_3(
        5n, 3)
      expect(res1_3 && (res2_3 || res3_3)).assertEqual(true)

      expect(testNS2_3.runTest_3()).assertEqual(true)

    });
  })
}
