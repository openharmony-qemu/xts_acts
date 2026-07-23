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

interface I1_4 {}
interface I2_4 {}
interface II1_4 extends I1_4, I2_4 {}
interface II2_4 extends I1_4, I2_4 {}
interface III1_4 extends II1_4 {}
interface III2_4 extends II1_4 {}
class C1_4 implements III1_4 {v: bigint = 123n}
class C2_4 implements III2_4 {v: number = 321}
class C3_4 implements II2_4 {v: number = 7.8}

function check_C1_4(a: Any) {
  expect(a instanceof C1_4).assertEqual(true);
  expect(a instanceof III1_4).assertEqual(true);
  expect(a instanceof II1_4).assertEqual(true);
  expect(a instanceof I1_4).assertEqual(true);
  expect(a instanceof I2_4).assertEqual(true);
  expect((a as C1_4).v).assertEqual(123n);
}
function check_C2_4(a: Any) {
  expect(a instanceof C2_4).assertEqual(true);
  expect(a instanceof III2_4).assertEqual(true);
  expect(a instanceof II1_4).assertEqual(true);
  expect(a instanceof I1_4).assertEqual(true);
  expect(a instanceof I2_4).assertEqual(true);
  expect((a as C2_4).v).assertEqual(321);
}
function check_C3_4(a: Any) {
  expect(a instanceof C3_4).assertEqual(true);
  expect(a instanceof II2_4).assertEqual(true);
  expect(a instanceof I1_4).assertEqual(true);
  expect(a instanceof I2_4).assertEqual(true);
  expect((a as C3_4).v).assertEqual(7.8);
}
function check_int_4(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(123);
}

function check_4(v: C3_4 | number,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false;
  expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || v instanceof number).assertEqual(is_subtype_of_A);
  if (v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || v instanceof number) {
    res = check_is_in_diff_type_4(v, v_id);
  }
  if (res) {
    check_is_not_in_B_type_4(v, v_id);
  }
  return res;
}

function check_value_4(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C3_4(v);
  } else {
    check_int_4(v);
  }
}

function check_is_in_diff_type_4(v: III1_4 | III2_4 | II2_4 | number,
  v_id: number): boolean {
  check_value_4(v, v_id);
  if (v instanceof II1_4) {
    let b: II1_4 = v as II1_4;
    check_value_4(b, v_id);
    return false;
  } else {
    return true;
  }
}

function check_is_not_in_B_type_4(v: Any, v_id: number): void {
  check_value_4(v, v_id);
  expect(v instanceof II1_4).assertEqual(false);
  let thrown = false;
  try {
    let b: II1_4 = v as II1_4;
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}


interface I_5 {}
interface II1_5 extends I_5 {}
interface II2_5 extends I_5 {}
interface III1_5 extends II1_5 {}
interface III2_5 extends II1_5 {}
class C1_5 implements III1_5, III2_5 {v: bigint = 123n}
class C2_5 implements II2_5, III2_5 {v: number = 321}
class C3_5 implements III1_5 {v: number = 7.8}

function check_C1_5(a: Any) {
  expect(a instanceof C1_5).assertEqual(true);
  expect(a instanceof III1_5).assertEqual(true);
  expect(a instanceof III2_5).assertEqual(true);
  expect(a instanceof II1_5).assertEqual(true);
  expect(a instanceof I_5).assertEqual(true);
  expect((a as C1_5).v).assertEqual(123n);
}
function check_C2_5(a: Any) {
  expect(a instanceof C2_5).assertEqual(true);
  expect(a instanceof II2_5).assertEqual(true);
  expect(a instanceof III2_5).assertEqual(true);
  expect(a instanceof II1_5).assertEqual(true);
  expect(a instanceof I_5).assertEqual(true);
  expect((a as C2_5).v).assertEqual(321);
}
function check_C3_5(a: Any) {
  expect(a instanceof C3_5).assertEqual(true);
  expect(a instanceof III1_5).assertEqual(true);
  expect(a instanceof II1_5).assertEqual(true);
  expect(a instanceof I_5).assertEqual(true);
  expect((a as C3_5).v).assertEqual(7.8);
}
function check_int_5(a: Any) {
  expect(a instanceof number).assertEqual(true);
  expect(a as number).assertEqual(123);
}

function check_5(v: III1_5 | III2_5,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false;
  expect(v instanceof III1_5 | III2_5 | II2_5 | number).assertEqual(is_subtype_of_A);
  if (v instanceof III1_5 | III2_5 | II2_5 | number) {
    res = check_is_in_diff_type_5(v, v_id);
  }
  if (res) {
    check_is_not_in_B_type_5(v, v_id);
  }
  return res;
}

function check_value_5(v: Any, v_id: number): void {
  if (v_id == 1) {
    check_C1_5(v);
  } else {
    check_C2_5(v);
  }
}

function check_is_in_diff_type_5(v: III1_5 | III2_5 | II2_5 | number,
  v_id: number): boolean {
  check_value_5(v, v_id);
  if (v instanceof III2_5) {
    let b: III2_5 = v as III2_5;
    check_value_5(b, v_id);
    return false;
  } else {
    return true;
  }
}

function check_is_not_in_B_type_5(v: Any, v_id: number): void {
  check_value_5(v, v_id);
  expect(v instanceof III2_5).assertEqual(false);
  let thrown = false;
  try {
    let b: III2_5 = v as III2_5;
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}

export default function TypeTIsSubOfDiffOnNonGenTest01(): void {
  describe('TypeTIsSubOfDiffOnNonGenTest01', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_NON_GEN_0400
     * @tc.name      testTypeTIsSubOfDiffOnNonGen0004
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on non generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnNonGen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: C3_4 | number = 123
      let v2: C3_4 | number = new C3_4()
      let res: boolean =
        check_4(v1, true, 2) &
        check_4(v2, true, 1)
      expect(res).assertEqual(true)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_NON_GEN_0500
     * @tc.name      testTypeTIsSubOfDiffOnNonGen0005
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on non generic
    custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnNonGen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: III1_5 | III2_5 = new C1_5()
      let v2: III1_5 | III2_5 = new C2_5()
      let res: boolean =
        check_5(v1, true, 1) &
        check_5(v2, true, 2)
      expect(res).assertEqual(false)
    });
  })
}
