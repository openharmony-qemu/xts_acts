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
  function check_C1_3(a: Object) {
    expect(a instanceof C1_3).assertTrue()
    expect(a instanceof III1_3).assertTrue()
    expect(a instanceof II1_3).assertTrue()
    expect(a instanceof I1_3).assertTrue()
    expect(a instanceof I2_3).assertTrue()
    expect((a as C1_3<number, null>).c1_v_3 as number).assertEqual(123)
  }
  function check_C2_3(a: Object) {
    expect(a instanceof C2_3).assertTrue()
    expect(a instanceof III2_3).assertTrue()
    expect(a instanceof II1_3).assertTrue()
    expect(a instanceof I1_3).assertTrue()
    expect(a instanceof I2_3).assertTrue()
    expect((a as C2_3<number, string>).c2_v_3 as number).assertEqual(6.7)
  }
  function check_C3_3(a: Object) {
    expect(a instanceof C3_3).assertTrue()
    expect(a instanceof II2_3).assertTrue()
    expect(a instanceof I1_3).assertTrue()
    expect(a instanceof I2_3).assertTrue()
    expect((a as C3_3<bigint, undefined>).c3_v_3 as bigint).assertEqual(321n)
  }
  function check_int_3(a: Object) {
    expect(a instanceof number).assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_3(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C2_3(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3 || v instanceof number
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_3
        expect(cond1).assertTrue()
      }
    } else {
      check_C3_3(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3 || v instanceof number
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_3
        expect(cond1).assertTrue()
      }
    }
  }
  function check_3(v: II1_3<number, null> | II1_3<number, string> | II2_3<bigint, undefined>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3 || v instanceof number
    let cond1: boolean = v instanceof II1_3
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3 || v instanceof number) {
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_3(v)
      } else {
        check_C3_3(v)
      }
      res = check_is_in_inter_type_3(v as III1_3<number, null> | III2_3<number, string> | II2_3<bigint, undefined> | number, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof II1_3).assertFalse()
        check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_3(v: III1_3<number, null> | III2_3<number, string> | II2_3<bigint, undefined> | number, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C2_3(v)
    } else {
      check_C3_3(v)
    }
    if (v instanceof II1_3) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_3(v)
      } else {
        check_C3_3(v)
      }
      check_value_3(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_3(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof II1_3).assertFalse()
  }
  export function runTest_3(): boolean {
    let v1: II1_3<number, null> | II1_3<number, string> | II2_3<bigint, undefined> = new C2_3<number, string>(6.7)
    let v2: II1_3<number, null> | II1_3<number, string> | II2_3<bigint, undefined> = new C3_3<bigint, undefined>(321n)
    let res: boolean = check_3(v1, true, 1) && check_3(v2, false, 2)
    expect(res).assertEqual(false)
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
function check_C1_3(a: Object) {
  expect(a instanceof C1_3).assertTrue()
  expect(a instanceof III1_3).assertTrue()
  expect(a instanceof II1_3).assertTrue()
  expect(a instanceof I1_3).assertTrue()
  expect(a instanceof I2_3).assertTrue()
  expect((a as C1_3<number, null>).c1_v_3 as number).assertEqual(123)
}
function check_C2_3(a: Object) {
  expect(a instanceof C2_3).assertTrue()
  expect(a instanceof III2_3).assertTrue()
  expect(a instanceof II1_3).assertTrue()
  expect(a instanceof I1_3).assertTrue()
  expect(a instanceof I2_3).assertTrue()
  expect((a as C2_3<number, string>).c2_v_3 as number).assertEqual(6.7)
}
function check_C3_3(a: Object) {
  expect(a instanceof C3_3).assertTrue()
  expect(a instanceof II2_3).assertTrue()
  expect(a instanceof I1_3).assertTrue()
  expect(a instanceof I2_3).assertTrue()
  expect((a as C3_3<bigint, undefined>).c3_v_3 as bigint).assertEqual(321n)
}
function check_int_3(a: Object) {
  expect(a instanceof number).assertTrue()
  expect(a as number).assertEqual(123)
}
function check_value_3(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  if (v_id == 1) {
    check_C1_3(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3 || v instanceof number
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof II1_3
      expect(cond1).assertTrue()
    }
  } else {
    check_C3_3(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3 || v instanceof number
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof II1_3
      expect(cond1).assertTrue()
    }
  }
}
function check_3(v: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
  let res: boolean = false
  let cond0: boolean = v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3 || v instanceof number
  let cond1: boolean = v instanceof II1_3
  let cmp: boolean = cond0 && cond1
  expect(cmp).assertEqual(is_subtype_of_inter_type)
  check_value_3(v, is_subtype_of_inter_type, v_id)
  if (v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3 || v instanceof number) {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_3(v)
    } else {
      check_C3_3(v)
    }
    res = check_is_in_inter_type_3(v as III1_3<number, null> | III2_3<number, string> | II2_3<bigint, undefined> | number, is_subtype_of_inter_type, v_id)
    if (!res) {
      expect(v instanceof II1_3).assertFalse()
      check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_is_in_inter_type_3(v: III1_3<number, null> | III2_3<number, string> | II2_3<bigint, undefined> | number, is_subtype_of_inter_type: boolean, v_id: number): boolean {
  check_value_3(v, is_subtype_of_inter_type, v_id)
  if (v_id == 1) {
    check_C1_3(v)
  } else {
    check_C3_3(v)
  }
  if (v instanceof II1_3) {
    expect(is_subtype_of_inter_type).assertTrue()
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_3(v)
    } else {
      check_C3_3(v)
    }
    check_value_3(v, is_subtype_of_inter_type, v_id)
    return true
  } else {
    return false
  }
}
function check_is_not_in_I2_type_3(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  check_value_3(v, is_subtype_of_inter_type, v_id)
  expect(v instanceof II1_3).assertFalse()
}

interface I1_2<U, V> {}
interface I2_2<U, V> {}
interface II1_2<U, V> extends I1_2<U, V>, I2_2<U, V> {}
interface II2_2<U, V> extends I1_2<U, V>, I2_2<U, V> {}
interface III1_2<U, V> extends II1_2<U, V> {}
interface III2_2<U, V> extends II1_2<U, V> {}
class C3_2<U, V> implements II2_2<U, V>  {
  c3_v_2: U | V
  constructor (p: U | V) {
    this.c3_v_2 = p
  }
}
function check_C3_2(a: Object) {
  expect(a instanceof C3_2).assertTrue()
  expect(a instanceof II2_2).assertTrue()
  expect(a instanceof I1_2).assertTrue()
  expect(a instanceof I2_2).assertTrue()
  expect((a as C3_2<bigint, undefined>).c3_v_2 as bigint).assertEqual(321n)
}
function check_int_2(a: Object) {
  expect(a instanceof number).assertTrue()
  expect(a as number).assertEqual(123)
}
function check_value_2(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  if (v_id == 1) {
    check_int_2(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_2 || v instanceof III2_2 || v instanceof II2_2 || v instanceof number
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof II1_2
      expect(cond1).assertTrue()
    }
  } else {
    check_C3_2(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_2 || v instanceof III2_2 || v instanceof II2_2 || v instanceof number
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof II1_2
      expect(cond1).assertTrue()
    }
  }
}
function check_2(v: C3_2<bigint, undefined> | number, is_subtype_of_inter_type: boolean, v_id: number): boolean {
  let res: boolean = false
  let cond0: boolean = v instanceof III1_2 || v instanceof III2_2 || v instanceof II2_2 || v instanceof number
  let cond1: boolean = v instanceof II1_2
  let cmp: boolean = cond0 && cond1
  expect(cmp).assertEqual(is_subtype_of_inter_type)
  check_value_2(v, is_subtype_of_inter_type, v_id)
  if (v instanceof III1_2 || v instanceof III2_2 || v instanceof II2_2 || v instanceof number) {
    check_value_2(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_int_2(v)
    } else {
      check_C3_2(v)
    }
    res = check_is_in_inter_type_2(v as III1_2<number, null> | III2_2<number, string> | II2_2<bigint, undefined> | number, is_subtype_of_inter_type, v_id)
    if (!res) {
      expect(v instanceof II1_2).assertFalse()
      check_is_not_in_I2_type_2(v, is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_is_in_inter_type_2(v: III1_2<number, null> | III2_2<number, string> | II2_2<bigint, undefined> | number, is_subtype_of_inter_type: boolean, v_id: number): boolean {
  check_value_2(v, is_subtype_of_inter_type, v_id)
  if (v_id == 1) {
    check_int_2(v)
  } else {
    check_C3_2(v)
  }
  if (v instanceof II1_2) {
    expect(is_subtype_of_inter_type).assertTrue()
    check_value_2(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_int_2(v)
    } else {
      check_C3_2(v)
    }
    check_value_2(v, is_subtype_of_inter_type, v_id)
    return true
  } else {
    return false
  }
}
function check_is_not_in_I2_type_2(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  check_value_2(v, is_subtype_of_inter_type, v_id)
  expect(v instanceof II1_2).assertFalse()
}

export default function TypeTIsSubOfInterTypeOnGenTest01(): void {
  describe('TypeTIsSubOfInterTypeOnGenTest01', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_GEN_0300
     * @tc.name      testTypeTIsSubOfInterTypeOnGen0003
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnGen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: C3_2<bigint, undefined> | number = 123
      let v2: C3_2<bigint, undefined> | number = new C3_2<bigint, undefined>(321n)
      let res: boolean = check_2(v1, false, 1) && check_2(v2, false, 2)
      expect(res).assertEqual(false)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_GEN_0400
     * @tc.name      testTypeTIsSubOfInterTypeOnGen0004
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnGen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string> =
        new C1_3<number, null>(123)
      let v2: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string> =
        new C3_3<bigint, undefined>(321n)
      let res: boolean = check_3(v1, true, 1) && check_3(v2, false, 2)
      expect(res).assertEqual(false)
      expect(testNS2_3.runTest_3()).assertTrue()
    });
  })
}
