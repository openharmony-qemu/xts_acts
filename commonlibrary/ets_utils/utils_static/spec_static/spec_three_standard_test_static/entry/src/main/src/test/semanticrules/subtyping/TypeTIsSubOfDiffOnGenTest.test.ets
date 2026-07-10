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
  from '@ohos/hypium-binary/src/main/indexStatic';

import { A_1, B1_1, B2_1, C1_1, C2_1, Other_1 } from '../types.test';
import Utils from '../../Util.test'

function check_C1_1(a: Any) {
  expect(a instanceof C1_1).assertEqual(true)
  expect((a as C1_1<number, null>).c1_v as number).assertEqual(321)
}
function check_B2_1(a: Any) {
  expect(a instanceof B2_1).assertEqual(true)
  expect((a as B2_1<bigint, undefined>).b2_v as bigint).assertEqual(123n)
}
function check_1(v: B2_1<bigint, undefined> | Other_1<string> | C1_1<number, null>,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof C1_1 | C2_1 | B2_1 | Other_1).assertEqual(is_subtype_of_A)
  if (v instanceof C1_1 | C2_1 | B2_1 | Other_1) {
    res = check_is_in_diff_type_1(v as C1_1<number, null> | C2_1<number, string> |
    B2_1<bigint, undefined> | Other_1<string>, v_id)
  }
  if (res) {
    check_is_not_in_B_type_1(v, v_id)
  }
  return res
}
function check_value_1(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_1(v)
  }
  else {
    check_B2_1(v)
  }
}
function check_is_in_diff_type_1(v: C1_1<number, null> | C2_1<number, string> |
B2_1<bigint, undefined> | Other_1<string>,
  v_id: number): boolean {
  check_value_1(v, v_id)
  if (v instanceof B1_1) {
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_1(v: Any, v_id: number): void {
  check_value_1(v, v_id)
  expect(v instanceof B1_1).assertEqual(false)
}

abstract class A_2<U, V> {}
abstract class B1_2<U, V> extends A_2<U, V> {}
class B2_2<U=bigint, V=undefined> extends A_2<U, V> {
  b2_v: U | V
  constructor (p: U | V) {
    this.b2_v = p
  }
}
class C1_2<U = number, V = null> extends B1_2<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_2<U = number, V = string> extends B1_2<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class Other_2<T = string> {
  other_v: T
  constructor (p: T) {
    this.other_v = p
  }
}
function check_C1_2(a: Any) {
  expect(a instanceof C1_2).assertEqual(true)
  expect((a as C1_2).c1_v as number).assertEqual(321)
}
function check_B2_2(a: Any) {
  expect(a instanceof B2_2).assertEqual(true)
  expect((a as B2_2).b2_v as bigint).assertEqual(123n)
}
function check_2(v: B2_2 | Other_2 | C1_2,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(is_subtype_of_A)
  if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
    res = check_is_in_diff_type_2(v as C1_2 | C2_2 | B2_2 | Other_2, v_id)
  }
  if (res) {
    check_is_not_in_B_type_2(v, v_id)
  }
  return res
}
function check_value_2(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_2(v)
  }
  else {
    check_B2_2(v)
  }
}
function check_is_in_diff_type_2(v: C1_2 | C2_2| B2_2 | Other_2,
  v_id: number): boolean {
  check_value_2(v, v_id)
  if (v instanceof B1_2) {
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_2(v: Any, v_id: number): void {
  check_value_2(v, v_id)
  expect(v instanceof B1_2).assertEqual(false)
}

interface I1_3<U, V> {}
interface I2_3<U, V> {}
interface II1_3<U, V> extends I1_3<U, V>, I2_3<U, V> {}
interface II2_3<U, V> extends I1_3<U, V>, I2_3<U, V> {}
interface III1_3<U, V> extends II1_3<U, V> {}
interface III2_3<U, V> extends II1_3<U, V> {}
class C1_3<U, V> implements III1_3<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C3_3<U, V> implements II2_3<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_3(a: Any) {
  expect(a instanceof C1_3).assertEqual(true)
  expect(a instanceof III1_3).assertEqual(true)
  expect(a instanceof II1_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C1_3<number, null>).c1_v as number).assertEqual(123)
}
function check_C3_3(a: Any) {
  expect(a instanceof C3_3).assertEqual(true)
  expect(a instanceof II2_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C3_3<bigint, undefined>).c3_v as bigint).assertEqual(321n)
}
function check_3(v: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string>,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
  if (v instanceof III1_3 | III2_3 | II2_3 | number) {
    res = check_is_in_diff_type_3(v as III1_3<number, null> | III2_3<number, string> |
    II2_3<bigint, undefined> | number, v_id)
  }
  if (res) {
    check_is_not_in_B_type_3(v, v_id)
  }
  return res
}
function check_value_3(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_3(v)
  }
  else {
    check_C3_3(v)
  }
}
function check_is_in_diff_type_3(v: III1_3<number, null> | III2_3<number, string> |
II2_3<bigint, undefined> | number,
  v_id: number): boolean {
  check_value_3(v, v_id)
  if (v instanceof II1_3) {
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_3(v: Any, v_id: number): void {
  check_value_3(v, v_id)
  expect(v instanceof II1_3).assertEqual(false)
}

export default function TypeTIsSubOfDiffOnGenTest(): void {
  describe('TypeTIsSubOfDiffOnGenTest', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_GEN_0100
     * @tc.name      testTypeTIsSubOfDiffOnGen0001
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: B2_1<bigint, undefined> | Other_1<string> | C1_1<number, null> = new C1_1<number, null>(321)
      let v2: B2_1<bigint, undefined> | Other_1<string> | C1_1<number, null> = new B2_1<bigint, undefined>(123n)
      let res: boolean = check_1(v1, true, 1) & check_1(v2, true, 2)
      expect(res).assertEqual(false)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_GEN_0200
     * @tc.name      testTypeTIsSubOfDiffOnGen0002
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: B2_2 | Other_2 | C1_2 = new C1_2(321)
      let v2: B2_2 | Other_2 | C1_2 = new B2_2(123n)
      let res: boolean =
        check_2(v1, true, 1) &
        check_2(v2, true, 2)
      expect(res).assertEqual(false)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_GEN_0300
     * @tc.name      testTypeTIsSubOfDiffOnGen0003
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnGen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string> = new C1_3<number, null>(123)
      let v2: III1_3<number, null> | II2_3<bigint, undefined> | III2_3<number, string> = new C3_3<bigint, undefined>(321n)
      let res: boolean =
        check_3(v1, true, 1) &
        check_3(v2, true, 2)
      expect(res).assertEqual(false)
    });
  })
}
