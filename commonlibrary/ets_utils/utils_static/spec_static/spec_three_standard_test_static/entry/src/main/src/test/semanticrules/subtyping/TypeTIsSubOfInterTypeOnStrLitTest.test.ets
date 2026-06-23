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
namespace testNS2_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof byte).assertTrue()
    if (v_id == 1) {
      expect((v as byte)).assertEqual(4)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(4)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(4)
      }
    }
    else {
      expect((v as byte)).assertEqual(5)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(5)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(5)
      }
    }
  }
  function check_6(v: byte,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: byte = 4
    let v2: byte = 5
    let res: boolean =
      check_6(v1, false, 1) &&
      check_6(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

// 顶层函数同样修改
function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
  let res: boolean = false
  if (a instanceof string | int) {
    if (a instanceof int) {
      res = true
    }
    else {
      if ((a === "Done") ||
        (a === "In Progress") ||
        (a === "On Review")) {
        res = true
      }
    }
  }
  if (res) {
    let b: "Done" | "In Progress" | "On Review" | int =
      a as "Done" | "In Progress" | "On Review" | int
  }
  return res
}
function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
  let res: boolean = false
  if (a instanceof string | int | float) {
    if (a instanceof int | float) {
      res = true
    }
    else {
      if ((a === "In Progress") ||
        (a === "On Review")) {
        res = true
      }
    }
  }
  if (res) {
    if (a instanceof string | float) {
      let b: "In Progress" | "On Review" | float =
        a as "In Progress" | "On Review" | float
    }
    if (a instanceof string) {
      let b: "In Progress" | "On Review" =
        a as "In Progress" | "On Review"
    }
    if (a instanceof int) {
      let b: int = a as int
    }
    if (a instanceof float) {
      let b: float = a as float
    }
    let b: "In Progress" | "On Review" | int | float =
      a as "In Progress" | "On Review" | int | float
  }
  return res
}
function check_value_6(v: Object | null | undefined,
  is_subtype_of_inter_type: boolean,
  v_id: int): void {
  expect(v instanceof int).assertTrue()
  if (v_id == 1) {
    expect((v as int)).assertEqual(123)
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(123)
      expect((v as "In Progress" | "On Review" | int | float)).assertEqual(123)
    }
  }
  else {
    expect((v as int)).assertEqual(456)
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(456)
      expect((v as "In Progress" | "On Review" | int | float)).assertEqual(456)
    }
  }
}
function check_6(v: int,
  is_subtype_of_inter_type: boolean,
  v_id: int): boolean {
  let res: boolean = false
  if (is_subtype_of_inter_type) {
    expect(v instanceof string | int &&
      v instanceof string | int | float).assertTrue()
    expect(check_is_subtype_of_I1_6(v)).assertTrue()
    expect(check_is_subtype_of_I2_6(v)).assertTrue()
  }
  check_value_6(v, is_subtype_of_inter_type, v_id)
  if (check_is_subtype_of_I1_6(v)) {
    expect(v instanceof string | int).assertTrue()
    if (v instanceof string | int) {
      expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
      res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
        is_subtype_of_inter_type, v_id)
      expect(res).assertEqual(is_subtype_of_inter_type)
      if (!res) {
        expect(check_is_subtype_of_I2_6(v)).assertFalse()
      }
    }
  }
  else {
    expect(is_subtype_of_inter_type).assertFalse()
  }
  return res
}
function check_is_in_inter_type_6(v: string | int,
  is_subtype_of_inter_type: boolean,
  v_id: int): boolean {
  let res: boolean = false
  check_value_6(v, is_subtype_of_inter_type, v_id)
  if (check_is_subtype_of_I2_6(v)) {
    expect(is_subtype_of_inter_type).assertTrue()
    expect(v instanceof string | int | float).assertTrue()
    if (v instanceof string | int | float) {
      res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
        is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_as_I2_type_6(v: string | int | float,
  is_subtype_of_inter_type: boolean,
  v_id: int): boolean {
  check_value_6(v, is_subtype_of_inter_type, v_id)
  return check_is_subtype_of_I2_6(v)
}

export default function TypeTIsSubOfInterTypeOnStrLitTest(): void {
  describe('TypeTIsSubOfInterTypeOnStrLitTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_STR_LIT_0100
     * @tc.name      testTypeTIsSubOfInterTypeOnStrLit0001
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnStrLit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: int = 123
      let v2: int = 456
      let res: boolean =
        check_6(v1, true, 1) &&
        check_6(v2, true, 2)
      expect(res).assertEqual(true)

      expect(testNS2_6.runTest_6()).assertTrue()
    })

  })
}