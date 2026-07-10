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

import Utils from '../../Util.test'

class Animal_1 {}
class Cat_1 extends Animal_1 {v: string = "cat"}
class Dog_1 extends Animal_1 {v: bigint = 123n}
function check_dog_1(a: Any) {
  expect(a instanceof Dog_1).assertEqual(true)
  expect((a as Dog_1).v).assertEqual(123n)
}
function check_int_1(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(123)
}
function check_1(v: Cat_1 | Dog_1 | number,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof Cat_1 || v instanceof Dog_1 || typeof v === 'number').assertEqual(is_subtype_of_A)
  if (v instanceof Cat_1 | Dog_1 | number) {
    res = check_is_in_diff_type_1(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_1(v, v_id)
  }
  return res
}
function check_value_1(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_int_1(v)
  }
  else {
    check_dog_1(v)
  }
}
function check_is_in_diff_type_1(v: Cat_1 | Dog_1 | number,
  v_id: number): boolean {
  check_value_1(v, v_id)
  if (v instanceof number | Dog_1) {
    let b: number | Dog_1 = v as number | Dog_1
    check_value_1(b, v_id)
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_1(v: Any, v_id: number): void {
  check_value_1(v, v_id)
  expect(v instanceof number | Dog_1).assertEqual(false)
  let thrown = false;
  try {
    let b: number | Dog_1 = v as number | Dog_1
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}

abstract class A_2 {}
abstract class B1_2 extends A_2 {}
class B2_2 extends A_2 {v: bigint = 123n}
class C1_2 extends B1_2 {v: number = 321}
class C2_2 extends B1_2 {v: number = 6.7}
class Other_2 {v: string = "other"}

function check_C1_2(a: Any) {
  expect(a instanceof C1_2).assertEqual(true)
  expect((a as C1_2).v).assertEqual(321)
}
function check_B2_2(a: Any) {
  expect(a instanceof B2_2).assertEqual(true)
  expect((a as B2_2).v).assertEqual(123n)
}

function check_2(v: B2_2 | Other_2 | C1_2,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number).assertEqual(is_subtype_of_A)
  if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
    res = check_is_in_diff_type_2(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_2(v, v_id)
  }
  return res
}

function check_value_2(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_2(v)
  } else {
    check_B2_2(v)
  }
}

function check_is_in_diff_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | number,
  v_id: number): boolean {
  check_value_2(v, v_id)
  if (v instanceof B1_2 | Other_2) {
    let b: B1_2 | Other_2 = v as B1_2 | Other_2
    check_value_2(b, v_id)
    return false
  } else {
    return true
  }
}

function check_is_not_in_B_type_2(v: Any, v_id: number): void {
  check_value_2(v, v_id)
  expect(v instanceof B1_2 | Other_2).assertEqual(false)
  let thrown = false;
  try {
    let b: B1_2 | Other_2 = v as B1_2 | Other_2
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}

interface I1_3 {}
interface I2_3 {}
interface II1_3 extends I1_3, I2_3 {}
interface II2_3 extends I1_3, I2_3 {}
interface III1_3 extends II1_3 {}
interface III2_3 extends II1_3 {}
class C1_3 implements III1_3 {v: bigint = 123n}
class C3_3 implements II2_3 {v: number = 7.8}

function check_C1_3(a: Any) {
  expect(a instanceof C1_3).assertEqual(true)
  expect(a instanceof III1_3).assertEqual(true)
  expect(a instanceof II1_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C1_3).v).assertEqual(123n)
}
function check_C3_3(a: Any) {
  expect(a instanceof C3_3).assertEqual(true)
  expect(a instanceof II2_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C3_3).v).assertEqual(7.8)
}

function check_3(v: III1_3 | II2_3 | III2_3,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof III1_3 | III2_3 | II2_3 | number).assertEqual(is_subtype_of_A)
  if (v instanceof III1_3 | III2_3 | II2_3 | number) {
    res = check_is_in_diff_type_3(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_3(v, v_id)
  }
  return res
}

function check_value_3(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_3(v)
  } else {
    check_C3_3(v)
  }
}

function check_is_in_diff_type_3(v: III1_3 | III2_3 | II2_3 | number,
  v_id: number): boolean {
  check_value_3(v, v_id)
  if (v instanceof II1_3) {
    let b: II1_3 = v as II1_3
    check_value_3(b, v_id)
    return false
  } else {
    return true
  }
}

function check_is_not_in_B_type_3(v: Any, v_id: number): void {
  check_value_3(v, v_id)
  expect(v instanceof II1_3).assertEqual(false)
  let thrown = false;
  try {
    let b: II1_3 = v as II1_3
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}

export default function TypeTIsSubOfDiffOnNonGenTest(): void {
  describe('TypeTIsSubOfDiffOnNonGenTest', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_NON_GEN_0100
     * @tc.name      testTypeTIsSubOfDiffOnNonGen0001
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on non generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnNonGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Cat_1 | Dog_1 | number = 123
      let v2: Cat_1 | Dog_1 | number = new Dog_1()
      let res: boolean =
        check_1(v1, true, 1) &
        check_1(v2, true, 2)
      expect(res).assertEqual(false)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_NON_GEN_0200
     * @tc.name      testTypeTIsSubOfDiffOnNonGen0002
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on non generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnNonGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: B2_2 | Other_2 | C1_2 = new C1_2()
      let v2: B2_2 | Other_2 | C1_2 = new B2_2()
      let res: boolean =
        check_2(v1, true, 1) &
        check_2(v2, true, 2)
      expect(res).assertEqual(false)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_NON_GEN_0300
     * @tc.name      testTypeTIsSubOfDiffOnNonGen0003
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on non generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnNonGen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: III1_3 | II2_3 | III2_3 = new C1_3()
      let v2: III1_3 | II2_3 | III2_3 = new C3_3()
      let res: boolean =
        check_3(v1, true, 1) &
        check_3(v2, true, 2)
      expect(res).assertEqual(false)
    });
  })
}
