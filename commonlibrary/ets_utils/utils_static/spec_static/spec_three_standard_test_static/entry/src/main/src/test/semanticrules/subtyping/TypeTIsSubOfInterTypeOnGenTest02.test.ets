'use static'
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
  from '../../../../../hypium/index'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => { resolve(0); }, time);
  });
}

namespace testNS2_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v_5: U | V
    constructor(p: U | V) {
      this.c1_v_5 = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V> {
    c2_v_5: U | V
    constructor(p: U | V) {
      this.c2_v_5 = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V> {
    c3_v_5: U | V
    constructor(p: U | V) {
      this.c3_v_5 = p
    }
  }
  function check_C1_5(a: Object) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<number, null>).c1_v_5 as number).assertEqual(123)
  }
  function check_C2_5(a: Object) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v_5 as number).assertEqual(6.7)
  }
  function check_C3_5(a: Object) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v_5 as bigint).assertEqual(321n)
  }
  function check_int_5(a: Object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C2_5(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_5
        expect(cond1).assertTrue()
      }
    } else {
      check_C3_5(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_5
        expect(cond1).assertTrue()
      }
    }
  }
  function check_5(
    v: II1_5<number, null> |
    II1_5<number, string> |
    II2_5<bigint, undefined>, is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
    let cond1: boolean = v instanceof II1_5
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number') {
      check_value_5(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_5(v)
      } else {
        check_C3_5(v)
      }
      res = check_is_in_inter_type_5(
        v as III1_5<number, null> |
        III2_5<number, string> |
        II2_5<bigint, undefined> |
        number, is_subtype_of_inter_type, v_id
      )
      if (!res) {
        expect(v instanceof II1_5).assertFalse()
        check_is_not_in_I2_type_5(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_5(
    v: III1_5<number, null> |
    III2_5<number, string> |
    II2_5<bigint, undefined> |
    number, is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C2_5(v)
    } else {
      check_C3_5(v)
    }
    if (v instanceof II1_5) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_5(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_5(v)
      } else {
        check_C3_5(v)
      }
      check_value_5(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof II1_5).assertFalse()
  }
  export function runTest_5(): boolean {
    let v1: II1_5<number, null> | II1_5<number, string> | II2_5<bigint, undefined> = new C2_5<number, string>(6.7)
    let v2: II1_5<number, null> | II1_5<number, string> | II2_5<bigint, undefined> = new C3_5<bigint, undefined>(321n)
    let res: boolean = check_5(v1, true, 1) && check_5(v2, false, 2)
    expect(res).assertEqual(false)
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
  c1_v_5: U | V
  constructor(p: U | V) {
    this.c1_v_5 = p
  }
}
class C2_5<U, V> implements III2_5<U, V> {
  c2_v_5: U | V
  constructor(p: U | V) {
    this.c2_v_5 = p
  }
}
class C3_5<U, V> implements II2_5<U, V> {
  c3_v_5: U | V
  constructor(p: U | V) {
    this.c3_v_5 = p
  }
}
function check_C1_5(a: Object) {
  expect(a instanceof C1_5).assertTrue()
  expect(a instanceof III1_5).assertTrue()
  expect(a instanceof II1_5).assertTrue()
  expect(a instanceof I1_5).assertTrue()
  expect(a instanceof I2_5).assertTrue()
  expect((a as C1_5<number, null>).c1_v_5 as number).assertEqual(123)
}
function check_C2_5(a: Object) {
  expect(a instanceof C2_5).assertTrue()
  expect(a instanceof III2_5).assertTrue()
  expect(a instanceof II1_5).assertTrue()
  expect(a instanceof I1_5).assertTrue()
  expect(a instanceof I2_5).assertTrue()
  expect((a as C2_5<number, string>).c2_v_5 as number).assertEqual(6.7)
}
function check_C3_5(a: Object) {
  expect(a instanceof C3_5).assertTrue()
  expect(a instanceof II2_5).assertTrue()
  expect(a instanceof I1_5).assertTrue()
  expect(a instanceof I2_5).assertTrue()
  expect((a as C3_5<bigint, undefined>).c3_v_5 as bigint).assertEqual(321n)
}
function check_int_5(a: Object) {
  expect(typeof a === 'number').assertTrue()
  expect(a as number).assertEqual(123)
}
function check_value_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  if (v_id == 1) {
    check_C1_5(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof II1_5
      expect(cond1).assertTrue()
    }
  } else {
    check_C3_5(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof II1_5
      expect(cond1).assertTrue()
    }
  }
}
function check_5(
  v: III1_5<number, null> |
  II2_5<bigint, undefined> |
  III2_5<number, string>,
  is_subtype_of_inter_type: boolean, v_id: number
): boolean {
  let res: boolean = false
  let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
  let cond1: boolean = v instanceof II1_5
  let cmp: boolean = cond0 && cond1
  expect(cmp).assertEqual(is_subtype_of_inter_type)
  check_value_5(v, is_subtype_of_inter_type, v_id)
  if (v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number') {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_5(v)
    } else {
      check_C3_5(v)
    }
    res = check_is_in_inter_type_5(
      v as III1_5<number, null> |
      III2_5<number, string> |
      II2_5<bigint, undefined> |
      number, is_subtype_of_inter_type, v_id
    )
    if (!res) {
      expect(v instanceof II1_5).assertFalse()
      check_is_not_in_I2_type_5(v, is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_is_in_inter_type_5(
  v: III1_5<number, null> |
  III2_5<number, string> |
  II2_5<bigint, undefined> |
  number, is_subtype_of_inter_type: boolean, v_id: number
): boolean {
  check_value_5(v, is_subtype_of_inter_type, v_id)
  if (v_id == 1) {
    check_C1_5(v)
  } else {
    check_C3_5(v)
  }
  if (v instanceof II1_5) {
    expect(is_subtype_of_inter_type).assertTrue()
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_5(v)
    } else {
      check_C3_5(v)
    }
    check_value_5(v, is_subtype_of_inter_type, v_id)
    return true
  } else {
    return false
  }
}
function check_is_not_in_I2_type_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  check_value_5(v, is_subtype_of_inter_type, v_id)
  expect(v instanceof II1_5).assertFalse()
}

export default function TypeTIsSubOfInterTypeOnGenTest02(): void {
  describe('TypeTIsSubOfInterTypeOnGenTest02', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_GEN_0600
     * @tc.name      testTypeTIsSubOfInterTypeOnGen0006
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnGen0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: III1_5<number, null> | II2_5<bigint, undefined> | III2_5<number, string> =
        new C1_5<number, null>(123)
      let v2: III1_5<number, null> | II2_5<bigint, undefined> | III2_5<number, string> =
        new C3_5<bigint, undefined>(321n)
      let res: boolean = check_5(v1, true, 1) && check_5(v2, false, 2)
      expect(res).assertEqual(false)
      expect(testNS2_5.runTest_5()).assertTrue()
    });
  })
}
