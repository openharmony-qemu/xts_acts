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

interface I1_4<U, V> {}
interface I2_4<U, V> {}
interface II1_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
interface II2_4<U = bigint, V = undefined> extends I1_4<U, V>, I2_4<U, V> {}
interface III1_4<U = number, V = null> extends II1_4<U, V> {}
interface III2_4<U = number, V = string> extends II1_4<U, V> {}
class C1_4<U = number, V = null> implements III1_4<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C3_4<U = bigint, V = undefined> implements II2_4<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_4(a: Any) {
  expect(a instanceof C1_4).assertEqual(true);
  expect(a instanceof III1_4).assertEqual(true);
  expect(a instanceof II1_4).assertEqual(true);
  expect(a instanceof I1_4).assertEqual(true);
  expect(a instanceof I2_4).assertEqual(true);
  expect((a as C1_4).c1_v as number).assertEqual(123);
}
function check_C3_4(a: Any) {
  expect(a instanceof C3_4).assertEqual(true);
  expect(a instanceof II2_4).assertEqual(true);
  expect(a instanceof I1_4).assertEqual(true);
  expect(a instanceof I2_4).assertEqual(true);
  expect((a as C3_4).c3_v as bigint).assertEqual(321n);
}
function check_4(v: III1_4 | II2_4 | III2_4,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false;
  expect(v instanceof III1_4 | III2_4 | II2_4 | number).assertEqual(is_subtype_of_A);
  if (v instanceof III1_4 | III2_4 | II2_4 | number) {
    res = check_is_in_diff_type_4(v as III1_4 | III2_4 | II2_4 | number, v_id);
  }
  if (res) {
    check_is_not_in_B_type_4(v, v_id);
  }
  return res;
}
function check_value_4(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_4(v);
  }
  else {
    check_C3_4(v);
  }
}
function check_is_in_diff_type_4(v: III1_4 | III2_4 | II2_4 | number,
  v_id: number): boolean {
  check_value_4(v, v_id);
  if (v instanceof II1_4) {
    return false;
  }
  else {
    return true;
  }
}
function check_is_not_in_B_type_4(v: Any, v_id: number): void {
  check_value_4(v, v_id);
  expect(v instanceof II1_4).assertEqual(false);
}

interface I_5<U, V> {}
interface II1_5<U, V> extends I_5<U, V> {}
interface II2_5<U, V> extends I_5<U, V> {}
interface III1_5<U, V> extends II1_5<U, V> {}
interface III2_5<U, V> extends II1_5<U, V> {}
class C1_5<U, V> implements III1_5<U, V>, III2_5<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C3_5<U, V> implements III1_5<U, V> {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_5(a: Any) {
  expect(a instanceof C1_5).assertEqual(true);
  expect(a instanceof III1_5).assertEqual(true);
  expect(a instanceof III2_5).assertEqual(true);
  expect(a instanceof II1_5).assertEqual(true);
  expect(a instanceof I_5).assertEqual(true);
  expect((a as C1_5<number, null>).c1_v as number).assertEqual(123);
}
function check_C3_5(a: Any) {
  expect(a instanceof C3_5).assertEqual(true);
  expect(a instanceof III1_5).assertEqual(true);
  expect(a instanceof II1_5).assertEqual(true);
  expect(a instanceof I_5).assertEqual(true);
  expect((a as C3_5<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function check_5(v: III1_5<number, null> | III1_5<bigint, undefined> | number,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false;
  expect(v instanceof III1_5 | II2_5 | number).assertEqual(is_subtype_of_A);
  if (v instanceof III1_5 | II2_5 | number) {
    res = check_is_in_diff_type_5(v as III1_5<number, null> | III1_5<bigint, undefined> |
    II2_5<number, string> | number, v_id);
  }
  if (res) {
    check_is_not_in_B_type_5(v, v_id);
  }
  return res;
}
function check_value_5(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_5(v);
  }
  else {
    check_C3_5(v);
  }
}
function check_is_in_diff_type_5(v: III1_5<number, null> | III1_5<bigint, undefined> |
II2_5<number, string> | number,
  v_id: number): boolean {
  check_value_5(v, v_id);
  if (v instanceof III2_5) {
    return false;
  }
  else {
    return true;
  }
}
function check_is_not_in_B_type_5(v: Any, v_id: number): void {
  check_value_5(v, v_id);
  expect(v instanceof III2_5).assertEqual(false);
}

class C1_6<in T1, out T2> {
  readonly c1_v: T2
  constructor (p: T2) {
    this.c1_v = p
  }
}
class C2_6<out T1, in T2> {
  readonly c2_v: T1
  constructor (p: T1) {
    this.c2_v = p
  }
}
class Base_6 {
  b_v: bigint
  constructor (p: bigint) {
    this.b_v = p
  }
}
class Derived_6 extends Base_6 {
  d_v: number
  constructor (p: number) {
    super(0n)
    this.d_v = p
  }
}
function check_C1_6(a: Any) {
  expect(a instanceof C1_6).assertEqual(true);
  expect(((a as C1_6<Base_6, Base_6>).c1_v as Base_6).b_v).assertEqual(123n);
}
function check_C2_6(a: Any) {
  expect(a instanceof C2_6).assertEqual(true);
  expect(((a as C2_6<Derived_6, Base_6>).c2_v as Derived_6).d_v).assertEqual(321);
}
function check_6(v: C1_6<Derived_6, Base_6> | C2_6<Base_6, Derived_6>,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false;
  expect(v instanceof C1_6 | C2_6 | number).assertEqual(is_subtype_of_A);
  if (v instanceof C1_6 | C2_6 | number) {
    res = check_is_in_diff_type_6(v, v_id);
  }
  if (res) {
    check_is_not_in_B_type_6(v, v_id);
  }
  return res;
}
function check_value_6(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C2_6(v);
  }
  else {
    check_C1_6(v);
  }
}
function check_is_in_diff_type_6(v: C1_6<Derived_6, Base_6> | C2_6<Base_6, Derived_6> | number,
  v_id: number): boolean {
  check_value_6(v, v_id);
  if (v instanceof C2_6) {
    return false;
  }
  else {
    return true;
  }
}
function check_is_not_in_B_type_6(v: Any, v_id: number): void {
  check_value_6(v, v_id);
  expect(v instanceof C2_6).assertEqual(false);
}

export default function TypeTIsSubOfDiffOnGenTest01(): void {
  describe('TypeTIsSubOfDiffOnGenTest01', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_GEN_0400
     * @tc.name      testTypeTIsSubOfDiffOnGen0004
     * @tc.desc       Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnGen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let v1: III1_4 | II2_4 | III2_4 = new C1_4(123)
      let v2: III1_4 | II2_4 | III2_4 = new C3_4(321n)
      let res: boolean =
        check_4(v1, true, 1) &
        check_4(v2, true, 2)
      expect(res).assertEqual(false)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_GEN_0500
     * @tc.name      testTypeTIsSubOfDiffOnGen0005
     * @tc.desc       Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnGen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let v1: III1_5<number, null> | III1_5<bigint, undefined> | number = new C1_5<number, null>(123)
      let v2: III1_5<number, null> | III1_5<bigint, undefined> | number = new C3_5<bigint, undefined>(321n)
      let res: boolean =
        check_5(v1, true, 1) &
        check_5(v2, true, 2)
      expect(res).assertEqual(false)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_GEN_0600
     * @tc.name      testTypeTIsSubOfDiffOnGen0006
     * @tc.desc       Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnGen0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let v1: C1_6<Derived_6, Base_6> | C2_6<Base_6, Derived_6> = new C2_6<Derived_6, Base_6>(new Derived_6(321))
      let v2: C1_6<Derived_6, Base_6> | C2_6<Base_6, Derived_6> = new C1_6<Base_6, Base_6>(new Base_6(123n))
      let res: boolean =
        check_6(v1, true, 1) &
        check_6(v2, true, 2)
      expect(res).assertEqual(false)
    });
  })
}
