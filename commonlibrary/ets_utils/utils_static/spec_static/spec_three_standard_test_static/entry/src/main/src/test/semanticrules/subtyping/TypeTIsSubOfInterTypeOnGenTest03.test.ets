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

interface I_6<U, V> {}
interface II1_6<U, V> extends I_6<U, V> {}
interface II2_6<U, V> extends I_6<U, V> {}
interface III1_6<U, V> extends II1_6<U, V> {}
interface III2_6<U, V> extends II1_6<U, V> {}
class C1_6<U, V> implements III1_6<U, V>, III2_6<U, V> {
  c1_v_6: U | V
  constructor(p: U | V) { this.c1_v_6 = p }
}
class C2_6<U, V> implements II2_6<U, V>, III2_6<U, V> {
  c2_v_6: U | V
  constructor(p: U | V) { this.c2_v_6 = p }
}
class C3_6<U, V> implements III1_6<U, V> {
  c3_v_6: U | V
  constructor(p: U | V) { this.c3_v_6 = p }
}
function check_C1_6(a: Object) {
  expect(a instanceof C1_6).assertTrue()
  expect(a instanceof III1_6).assertTrue()
  expect(a instanceof III2_6).assertTrue()
  expect(a instanceof II1_6).assertTrue()
  expect(a instanceof I_6).assertTrue()
  expect((a as C1_6<number, null>).c1_v_6 as number).assertEqual(123)
}
function check_C2_6(a: Object) {
  expect(a instanceof C2_6).assertTrue()
  expect(a instanceof II2_6).assertTrue()
  expect(a instanceof III2_6).assertTrue()
  expect(a instanceof II1_6).assertTrue()
  expect(a instanceof I_6).assertTrue()
  expect((a as C2_6<number, string>).c2_v_6 as number).assertEqual(6.7)
}
function check_C3_6(a: Object) {
  expect(a instanceof C3_6).assertTrue()
  expect(a instanceof III1_6).assertTrue()
  expect(a instanceof II1_6).assertTrue()
  expect(a instanceof I_6).assertTrue()
  expect((a as C3_6<bigint, undefined>).c3_v_6 as bigint).assertEqual(321n)
}
function check_int_6(a: Object) {
  expect(typeof a === 'number').assertTrue()
  expect(a as number).assertEqual(123)
}
function check_value_6(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  if (v_id == 1) {
    check_int_6(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_6 || v instanceof II2_6 || typeof v === 'number'
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof III2_6
      expect(cond1).assertTrue()
    }
  } else {
    check_C3_6(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_6 || v instanceof II2_6 || typeof v === 'number'
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof III2_6
      expect(cond1).assertTrue()
    }
  }
}
function check_6(v: C3_6<bigint, undefined> | number, is_subtype_of_inter_type: boolean, v_id: number): boolean {
  let res: boolean = false
  let cond0: boolean = v instanceof III1_6 || v instanceof II2_6 || typeof v === 'number'
  let cond1: boolean = v instanceof III2_6
  let cmp: boolean = cond0 && cond1
  expect(cmp).assertEqual(is_subtype_of_inter_type)
  check_value_6(v, is_subtype_of_inter_type, v_id)
  if (v instanceof III1_6 || v instanceof II2_6 || typeof v === 'number') {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_int_6(v)
    } else {
      check_C3_6(v)
    }
    res = check_is_in_inter_type_6(v, is_subtype_of_inter_type, v_id)
    if (!res) {
      expect(v instanceof III2_6).assertFalse()
      check_is_not_in_I2_type_6(v, is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_is_in_inter_type_6(v: Object | number, is_subtype_of_inter_type: boolean, v_id: number): boolean {
  if (typeof v !== 'object') return false
  check_value_6(v, is_subtype_of_inter_type, v_id)
  if (v_id == 1) {
    check_int_6(v)
  } else {
    check_C3_6(v)
  }
  if (v instanceof III2_6) {
    expect(is_subtype_of_inter_type).assertTrue()
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_int_6(v)
    } else {
      check_C3_6(v)
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return true
  } else {
    return false
  }
}
function check_is_not_in_I2_type_6(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  check_value_6(v, is_subtype_of_inter_type, v_id)
  expect(v instanceof III2_6).assertFalse()
}

// ==================== testNS2_7 修改 ====================
namespace testNS2_7 {
  interface I_7<U, V> {}
  interface II1_7<U, V> extends I_7<U, V> {}
  interface II2_7<U, V> extends I_7<U, V> {}
  interface III1_7<U, V> extends II1_7<U, V> {}
  interface III2_7<U, V> extends II1_7<U, V> {}
  class C1_7<U, V> implements III1_7<U, V>, III2_7<U, V> {
    c1_v_7: U | V
    constructor(p: U | V) { this.c1_v_7 = p }
  }
  class C2_7<U, V> implements II2_7<U, V>, III2_7<U, V> {
    c2_v_7: U | V
    constructor(p: U | V) { this.c2_v_7 = p }
  }
  class C3_7<U, V> implements III1_7<U, V> {
    c3_v_7: U | V
    constructor(p: U | V) { this.c3_v_7 = p }
  }
  function check_C1_7(a: Object) {
    expect(a instanceof C1_7).assertTrue()
    expect(a instanceof III1_7).assertTrue()
    expect(a instanceof III2_7).assertTrue()
    expect(a instanceof II1_7).assertTrue()
    expect(a instanceof I_7).assertTrue()
    expect((a as C1_7<number, null>).c1_v_7 as number).assertEqual(123)
  }
  function check_C2_7(a: Object) {
    expect(a instanceof C2_7).assertTrue()
    expect(a instanceof II2_7).assertTrue()
    expect(a instanceof III2_7).assertTrue()
    expect(a instanceof II1_7).assertTrue()
    expect(a instanceof I_7).assertTrue()
    expect((a as C2_7<number, string>).c2_v_7 as number).assertEqual(6.7)
  }
  function check_C3_7(a: Object) {
    expect(a instanceof C3_7).assertTrue()
    expect(a instanceof III1_7).assertTrue()
    expect(a instanceof II1_7).assertTrue()
    expect(a instanceof I_7).assertTrue()
    expect((a as C3_7<bigint, undefined>).c3_v_7 as bigint).assertEqual(321n)
  }
  function check_int_7(a: Object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_7(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C2_7(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_7 || v instanceof II2_7 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof III2_7
        expect(cond1).assertTrue()
      }
    } else {
      check_C3_7(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_7 || v instanceof II2_7 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof III2_7
        expect(cond1).assertTrue()
      }
    }
  }
  function check_7(
    v: II1_7<number, null> | II1_7<bigint, undefined> | II2_7<number, string>,
    is_subtype_of_inter_type: boolean,
    v_id: number
  ): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_7 || v instanceof II2_7 || typeof v === 'number'
    let cond1: boolean = v instanceof III2_7
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_7(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_7 || v instanceof II2_7 || typeof v === 'number') {
      check_value_7(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_7(v)
      } else {
        check_C3_7(v)
      }
      res = check_is_in_inter_type_7(v, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof III2_7).assertFalse()
        check_is_not_in_I2_type_7(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_7(v: Object | number, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    if (typeof v !== 'object') return false
    check_value_7(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C2_7(v)
    } else {
      check_C3_7(v)
    }
    if (v instanceof III2_7) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_7(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_7(v)
      } else {
        check_C3_7(v)
      }
      check_value_7(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_7(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_7(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof III2_7).assertFalse()
  }
  export function runTest_7(): boolean {
    let v1: II1_7<number, null> | II1_7<bigint, undefined> | II2_7<number, string> = new C2_7<number, string>(6.7)
    let v2: II1_7<number, null> | II1_7<bigint, undefined> | II2_7<number, string> = new C3_7<bigint, undefined>(321n)
    let res: boolean = check_7(v1, true, 1) && check_7(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

// ==================== 全局 7 ====================
interface I_7<U, V> {}
interface II1_7<U, V> extends I_7<U, V> {}
interface II2_7<U, V> extends I_7<U, V> {}
interface III1_7<U, V> extends II1_7<U, V> {}
interface III2_7<U, V> extends II1_7<U, V> {}
class C1_7<U, V> implements III1_7<U, V>, III2_7<U, V> {
  c1_v_7: U | V
  constructor(p: U | V) { this.c1_v_7 = p }
}
class C2_7<U, V> implements II2_7<U, V>, III2_7<U, V> {
  c2_v_7: U | V
  constructor(p: U | V) { this.c2_v_7 = p }
}
class C3_7<U, V> implements III1_7<U, V> {
  c3_v_7: U | V
  constructor(p: U | V) { this.c3_v_7 = p }
}
function check_C1_7(a: Object) {
  expect(a instanceof C1_7).assertTrue()
  expect(a instanceof III1_7).assertTrue()
  expect(a instanceof III2_7).assertTrue()
  expect(a instanceof II1_7).assertTrue()
  expect(a instanceof I_7).assertTrue()
  expect((a as C1_7<number, null>).c1_v_7 as number).assertEqual(123)
}
function check_C2_7(a: Object) {
  expect(a instanceof C2_7).assertTrue()
  expect(a instanceof II2_7).assertTrue()
  expect(a instanceof III2_7).assertTrue()
  expect(a instanceof II1_7).assertTrue()
  expect(a instanceof I_7).assertTrue()
  expect((a as C2_7<number, string>).c2_v_7 as number).assertEqual(6.7)
}
function check_C3_7(a: Object) {
  expect(a instanceof C3_7).assertTrue()
  expect(a instanceof III1_7).assertTrue()
  expect(a instanceof II1_7).assertTrue()
  expect(a instanceof I_7).assertTrue()
  expect((a as C3_7<bigint, undefined>).c3_v_7 as bigint).assertEqual(321n)
}
function check_int_7(a: Object) {
  expect(typeof a === 'number').assertTrue()
  expect(a as number).assertEqual(123)
}
function check_value_7(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  if (v_id == 1) {
    check_C1_7(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_7 || v instanceof II2_7 || typeof v === 'number'
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof III2_7
      expect(cond1).assertTrue()
    }
  } else {
    check_C3_7(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_7 || v instanceof II2_7 || typeof v === 'number'
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof III2_7
      expect(cond1).assertTrue()
    }
  }
}
function check_7(
  v: III1_7<number, null> | III1_7<bigint, undefined> | number,
  is_subtype_of_inter_type: boolean,
  v_id: number
): boolean {
  let res: boolean = false
  let cond0: boolean = v instanceof III1_7 || v instanceof II2_7 || typeof v === 'number'
  let cond1: boolean = v instanceof III2_7
  let cmp: boolean = cond0 && cond1
  expect(cmp).assertEqual(is_subtype_of_inter_type)
  check_value_7(v, is_subtype_of_inter_type, v_id)
  if (v instanceof III1_7 || v instanceof II2_7 || typeof v === 'number') {
    check_value_7(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_7(v)
    } else {
      check_C3_7(v)
    }
    res = check_is_in_inter_type_7(v, is_subtype_of_inter_type, v_id)
    if (!res) {
      expect(v instanceof III2_7).assertFalse()
      check_is_not_in_I2_type_7(v, is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_is_in_inter_type_7(v: Object | number, is_subtype_of_inter_type: boolean, v_id: number): boolean {
  if (typeof v !== 'object') return false
  check_value_7(v, is_subtype_of_inter_type, v_id)
  if (v_id == 1) {
    check_C1_7(v)
  } else {
    check_C3_7(v)
  }
  if (v instanceof III2_7) {
    expect(is_subtype_of_inter_type).assertTrue()
    check_value_7(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_7(v)
    } else {
      check_C3_7(v)
    }
    check_value_7(v, is_subtype_of_inter_type, v_id)
    return true
  } else {
    return false
  }
}
function check_is_not_in_I2_type_7(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  check_value_7(v, is_subtype_of_inter_type, v_id)
  expect(v instanceof III2_7).assertFalse()
}
export default function TypeTIsSubOfInterTypeOnGenTest03(): void {
  describe('TypeTIsSubOfInterTypeOnGenTest03', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_GEN_0700
     * @tc.name      testTypeTIsSubOfInterTypeOnGen0007
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnGen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: C3_6<bigint, undefined> | number = 123
      let v2: C3_6<bigint, undefined> | number = new C3_6<bigint, undefined>(321n)
      let res: boolean = check_6(v1, false, 1) && check_6(v2, false, 2)
      expect(res).assertEqual(false)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_GEN_0800
     * @tc.name      testTypeTIsSubOfInterTypeOnGen0008
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnGen0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: III1_7<number, null> | III1_7<bigint, undefined> | number = new C1_7<number, null>(123)
      let v2: III1_7<number, null> | III1_7<bigint, undefined> | number = new C3_7<bigint, undefined>(321n)
      let res: boolean = check_7(v1, true, 1) && check_7(v2, false, 2)
      expect(res).assertEqual(false)
      expect(testNS2_7.runTest_7()).assertTrue()
    });

  })
}
