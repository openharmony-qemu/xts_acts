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
  from '../../../../../hypium/index';
import Utils from '../../Util.test'


interface I1_4<U, V> {}
interface I2_4<U, V> {}
interface II1_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
interface II2_4<U = bigint, V = undefined> extends I1_4<U, V>, I2_4<U, V> {}
interface III1_4<U = int, V = null> extends II1_4<U, V> {}
interface III2_4<U = number, V = string> extends II1_4<U, V> {}
class C1_4<U = int, V = null> implements III1_4<U, V> {
  c1_v_4: U | V
  constructor (p: U | V) {
    this.c1_v_4 = p
  }
}
class C3_4<U = bigint, V = undefined> implements II2_4<U, V>  {
  c3_v_4: U | V
  constructor (p: U | V) {
    this.c3_v_4 = p
  }
}
function check_C1_4(a: Any) {
  expect(a instanceof C1_4).assertEqual(true)
  expect(a instanceof III1_4).assertEqual(true)
  expect(a instanceof II1_4).assertEqual(true)
  expect(a instanceof I1_4).assertEqual(true)
  expect(a instanceof I2_4).assertEqual(true)
  expect((a as C1_4).c1_v_4 as int).assertEqual(123)
}
function check_C3_4(a: Any) {
  expect(a instanceof C3_4).assertEqual(true)
  expect(a instanceof II2_4).assertEqual(true)
  expect(a instanceof I1_4).assertEqual(true)
  expect(a instanceof I2_4).assertEqual(true)
  expect((a as C3_4).c3_v_4 as bigint).assertEqual(321n)
}
function check_bigint_4(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}
function check_value_4(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C1_4(v)
    check_C1_4(v)
    check_C1_4(v)
  }
  else if (v_id == 2) {
    check_C3_4(v)
    check_C3_4(v)
  }
  else {
    check_bigint_4(v)
    check_bigint_4(v)
  }
}
function check_value_as_type_T_4(v: Object, v_id: int): void {
  expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 ||
    v instanceof II1_4 || v instanceof bigint).assertEqual(true)
  check_value_4(v, v_id)
}
function check_is_in_T_type_4(v: III1_4 | III2_4 | II2_4 | II1_4<int, null> | II1_4<number, string> | bigint,
  v_id: int): boolean {
  check_value_4(v, v_id)
  if (v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4) {
    check_value_4(v, v_id)
    if (v instanceof II1_4 || v instanceof bigint) {
      expect(v_id).assertEqual(1)
      check_value_4(v, v_id)
      expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertEqual(true)
      expect(v instanceof Object).assertEqual(true)
      if (v instanceof Object) {
        check_value_as_type_T_4(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_4(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_4(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_4(v, v_id)
    if (v instanceof Object) {
      check_value_as_type_T_4(v, v_id)
      return true
    } else {
      return false
    }
  }
}

class C1_6<in T1, out T2> {
  readonly c1_v_6: T2
  constructor (p: T2) {
    this.c1_v_6 = p
  }
}
class C2_6<out T1, in T2> {
  readonly c2_v_6: T1
  constructor (p: T1) {
    this.c2_v_6 = p
  }
}
class Base_6 {
  b_v_6: bigint
  constructor (p: bigint) {
    this.b_v_6 = p
  }
}
class Derived_6 extends Base_6 {
  d_v_6: int
  constructor (p: int) {
    super(0n)
    this.d_v_6 = p
  }
}
function check_C1_6(a: Any) {
  expect(a instanceof C1_6).assertEqual(true)
  expect(((a as C1_6<Base_6, Base_6>).c1_v_6 as Base_6).b_v_6).assertEqual(123n)
}
function check_C2_6(a: Any) {
  expect(a instanceof C2_6).assertEqual(true)
  expect(((a as C2_6<Derived_6, Base_6>).c2_v_6 as Derived_6).d_v_6).assertEqual(321)
}
function check_bigint_6(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}
function check_value_6(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C2_6(v)
    check_C2_6(v)
    check_C2_6(v)
  }
  else if (v_id == 2) {
    check_C1_6(v)
    check_C1_6(v)
  }
  else {
    check_bigint_6(v)
    check_bigint_6(v)
  }
}
function check_value_as_type_T_6(v: Object, v_id: int): void {
  expect(v instanceof C1_6 || v instanceof C2_6 || v instanceof bigint).assertEqual(true)
  check_value_6(v, v_id)
}
function check_is_in_T_type_6(
  v: C1_6<Derived_6, Base_6> | C2_6<Base_6, Derived_6> | bigint,
  v_id: int
): boolean {
  check_value_6(v, v_id)
  if (v instanceof C1_6 || v instanceof C2_6) {
    check_value_6(v, v_id)
    if (v instanceof C2_6 || v instanceof bigint) {
      expect(v_id).assertEqual(1)
      check_value_6(v, v_id)
      expect(v instanceof C1_6 || v instanceof C2_6).assertEqual(true)
      expect(v instanceof Object).assertEqual(true)
      if (v instanceof Object) {
        check_value_as_type_T_6(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_6(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_6(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_6(v, v_id)
    if (v instanceof Object) {
      check_value_as_type_T_6(v, v_id)
      return true
    } else {
      return false
    }
  }
}

export default function InterTypeIsSubOfTypeObjOnGenTest01(): void {
  describe('InterTypeIsSubOfTypeObjOnGenTest01', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0400
     * @tc.name      testInterTypeIsSubOfTypeObjOnGen0004
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on generic
     *               custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnGen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1_4: boolean = check_is_in_T_type_4(
        new C1_4(123), 1)
      let res2_4: boolean = check_is_in_T_type_4(
        new C3_4(321n), 2)
      let res3_4: boolean = check_is_in_T_type_4(
        5n, 3)
      expect(res1_4 && (res2_4 || res3_4)).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_GEN_0600
     * @tc.name      testInterTypeIsSubOfTypeObjOnGen0006
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on generic
     *               were not provided.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnGen0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1_6: boolean = check_is_in_T_type_6(
        new C2_6<Derived_6, Base_6>(new Derived_6(321)), 1)
      let res2_6: boolean = check_is_in_T_type_6(
        new C1_6<Base_6, Base_6>(new Base_6(123n)), 2)
      let res3_6: boolean = check_is_in_T_type_6(
        5n, 3)
      expect(res1_6 && (res2_6 || res3_6)).assertEqual(true)
    });
  })
}
