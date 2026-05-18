/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// ----------------- Shared Data Setup -----------------
type T = "Done" | "In Progress" | "On Review" | number | int | undefined
type A = int | string

type T_inter_A = "Done" | "In Progress" | "On Review" | int
type T_diff_A = number | undefined

enum VarType { T_inter_A, T_diff_A }

type CheckValueData = [T, VarType]
let check_values: ReadonlyArray<CheckValueData> = [
  [123, VarType.T_inter_A],
  ["Done", VarType.T_inter_A],
  ["In Progress", VarType.T_inter_A],
  ["On Review", VarType.T_inter_A],
  [1.7, VarType.T_diff_A],
  [undefined, VarType.T_diff_A]
]
const check_values_number: int = 6


// ----------------- 0001: testStrLitInFn0001 (if/else) -----------------
function check_as_type_T_inter_A_fn(v: T_inter_A, v_id: int): void {
  expect(v).assertEqual(check_values[v_id][0])
}
function check_as_type_T_diff_A_fn(v: T_diff_A, v_id: int): void {
  expect(v).assertEqual(check_values[v_id][0])
}
function check_fn(v: T, v_type: VarType, v_id: int): void {
  if (typeof v === 'string' || typeof v === 'int') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values[v_id][0])
    check_as_type_T_inter_A_fn(v as T_inter_A, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values[v_id][0])
    check_as_type_T_diff_A_fn(v as T_diff_A, v_id)
  }
}

// ----------------- 0002: testStrLitInFnN0002 (if/else negated) -----------------
function check_fn_n(v: T, v_type: VarType, v_id: int): void {
  if (!(typeof v === 'string' || typeof v === 'int')) {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values[v_id][0])
    check_as_type_T_diff_A_fn(v as T_diff_A, v_id)
  } else {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values[v_id][0])
    check_as_type_T_inter_A_fn(v as T_inter_A, v_id)
  }
}

// ----------------- 0003: testStrLitInFr0003 (for loop) -----------------
function check_fr(v: T, v_type: VarType, v_id: int): void {
  for (; typeof v === 'string' || typeof v === 'int' ;) {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values[v_id][0])
    check_as_type_T_inter_A_fn(v as T_inter_A, v_id)
    return
  }
  expect(v_type).assertEqual(VarType.T_diff_A)
}

// ----------------- 0004: testStrLitInFrN0004 (for loop negated) -----------------
function check_fr_n(v: T, v_type: VarType, v_id: int): void {
  for (; !(typeof v === 'string' || typeof v === 'int') ;) {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values[v_id][0])
    check_as_type_T_diff_A_fn(v as T_diff_A, v_id)
    return
  }
  expect(v_type).assertEqual(VarType.T_inter_A)
}

// ----------------- 0005: testStrLitInTr0005 (ternary) -----------------
function check_tr(v: T, v_type: VarType, v_id: int): void {
  (typeof v === 'string' || typeof v === 'int')
    ? expect(v).assertEqual(check_values[v_id][0]) : expect(v).assertEqual(check_values[v_id][0]);
  (typeof v === 'string' || typeof v === 'int')
    ? check_as_type_T_inter_A_fn(v as T_inter_A, v_id) : check_as_type_T_diff_A_fn(v as T_diff_A, v_id);
}

// ----------------- 0006: testStrLitInTrN0006 (ternary negated) -----------------
function check_tr_n(v: T, v_type: VarType, v_id: int): void {
  (!(typeof v === 'string' || typeof v === 'int'))
    ? expect(v).assertEqual(check_values[v_id][0]) : expect(v).assertEqual(check_values[v_id][0]);
  (!(typeof v === 'string' || typeof v === 'int'))
    ? check_as_type_T_diff_A_fn(v as T_diff_A, v_id) : check_as_type_T_inter_A_fn(v as T_inter_A, v_id);
}

// ----------------- 0007: testStrLitInWl0007 (while loop) -----------------
function check_wl(v: T, v_type: VarType, v_id: int): void {
  while (typeof v === 'string' || typeof v === 'int') {
    expect(v_type).assertEqual(VarType.T_inter_A)
    expect(v).assertEqual(check_values[v_id][0])
    check_as_type_T_inter_A_fn(v as T_inter_A, v_id)
    return
  }
  expect(v_type).assertEqual(VarType.T_diff_A)
}

// ----------------- 0008: testStrLitInWlN0008 (while loop negated) -----------------
function check_wl_n(v: T, v_type: VarType, v_id: int): void {
  while (!(typeof v === 'string' || typeof v === 'int')) {
    expect(v_type).assertEqual(VarType.T_diff_A)
    expect(v).assertEqual(check_values[v_id][0])
    check_as_type_T_diff_A_fn(v as T_diff_A, v_id)
    return
  }
  expect(v_type).assertEqual(VarType.T_inter_A)
}


export default function ComputingSmartTypesTest10():void {
  describe('ComputingSmartTypesTest10', () => {
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
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTEN_0100
     * @tc.name      testStrLitInFn0001
     * @tc.desc      Checking branching on "v instanceof A" on unions with string literal types in function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStrLitInFn0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values.length; v_id++) {
        check_fn(check_values[v_id][0], check_values[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTEN_0200
     * @tc.name      testStrLitInFnN0002
     * @tc.desc      Checking branching on "!(v instanceof A)" on unions with string literal types in function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStrLitInFnN0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values.length; v_id++) {
        check_fn_n(check_values[v_id][0], check_values[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTEN_0300
     * @tc.name      testStrLitInFr0003
     * @tc.desc      Checking branching on "v instanceof A" on unions with string literal types with "for" usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStrLitInFr0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values.length; v_id++) {
        check_fr(check_values[v_id][0], check_values[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTEN_0400
     * @tc.name      testStrLitInFrN0004
     * @tc.desc      Checking branching on "!(v instanceof A)" on unions with string literal types with "for" usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStrLitInFrN0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values.length; v_id++) {
        check_fr_n(check_values[v_id][0], check_values[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTEN_0500
     * @tc.name      testStrLitInLm0005
     * @tc.desc      Checking branching on "v instanceof A" on unions with string literal types in lambda function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStrLitInLm0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let check_as_type_T_inter_A_lm = (v: T_inter_A, v_id: int) => {
        expect(v).assertEqual(check_values[v_id][0])
      }
      let check_as_type_T_diff_A_lm = (v: T_diff_A, v_id: int) => {
        expect(v).assertEqual(check_values[v_id][0])
      }
      let check_lm = (v: T, v_type: VarType, v_id: int) => {
        if (typeof v === 'string' || typeof v === 'int') {
          expect(v_type).assertEqual(VarType.T_inter_A)
          expect(v).assertEqual(check_values[v_id][0])
          check_as_type_T_inter_A_lm(v as T_inter_A, v_id)
        } else {
          expect(v_type).assertEqual(VarType.T_diff_A)
          expect(v).assertEqual(check_values[v_id][0])
          check_as_type_T_diff_A_lm(v as T_diff_A, v_id)
        }
      }

      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values.length; v_id++) {
        check_lm(check_values[v_id][0], check_values[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTEN_0600
     * @tc.name      testStrLitInTr0006
     * @tc.desc      Checking branching on "v instanceof A" on unions with string literal types with ternary expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStrLitInTr0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values.length; v_id++) {
        check_tr(check_values[v_id][0], check_values[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTEN_0700
     * @tc.name      testStrLitInTrN0007
     * @tc.desc      Checking branching on "!(v instanceof A)" on unions with string literal types with ternary expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStrLitInTrN0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values.length; v_id++) {
        check_tr_n(check_values[v_id][0], check_values[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTEN_0800
     * @tc.name      testStrLitInWl0008
     * @tc.desc      Checking branching on "v instanceof A" on unions with string literal types with "while" usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStrLitInWl0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values.length; v_id++) {
        check_wl(check_values[v_id][0], check_values[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number)
    });

    /**
     * @tc.number    SUB_COMPUTING_SMART_TYPESTESTTEN_0900
     * @tc.name      testStrLitInWlN0009
     * @tc.desc      Checking branching on "!(v instanceof A)" on unions with string literal types with "while" usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStrLitInWlN0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checks_number: int = 0
      for (let v_id: int = 0; v_id < check_values.length; v_id++) {
        check_wl_n(check_values[v_id][0], check_values[v_id][1], v_id)
        checks_number++
      }
      expect(checks_number).assertEqual(check_values_number)
    });

  })
}