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

namespace testNS2_7 {
  function check_is_subtype_of_I1_7(a: Object): boolean {
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
  function check_is_subtype_of_I2_7(a: Object): boolean {
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
  function check_value_7(v: Object,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof double).assertTrue()
    if (v_id == 1) {
      expect((v as double)).assertEqual(123)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(123)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(123)
      }
    }
    else {
      expect((v as double)).assertEqual(45.6)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(45.6)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(45.6)
      }
    }
  }
  function check_7(v: double,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_7(v)).assertTrue()
      expect(check_is_subtype_of_I2_7(v)).assertTrue()
    }
    check_value_7(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_7(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_7(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_7(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_7(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_7(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_7(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_7(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_7(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_7(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_7(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_7(v)
  }

  export function runTest_7(): boolean {
    let v1: double = 123
    let v2: double = 45.6
    let res: boolean =
      check_7(v1, false, 1) &&
      check_7(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

function check_is_subtype_of_I1_7(a: Object): boolean {
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
function check_is_subtype_of_I2_7(a: Object): boolean {
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
function check_value_7(v: Object,
  is_subtype_of_inter_type: boolean,
  v_id: int): void {
  expect(v instanceof long).assertTrue()
  if (v_id == 1) {
    expect((v as long)).assertEqual(123)
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(123)
      expect((v as "In Progress" | "On Review" | int | float)).assertEqual(123)
    }
  }
  else {
    expect((v as long)).assertEqual(456)
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(456)
      expect((v as "In Progress" | "On Review" | int | float)).assertEqual(456)
    }
  }
}
function check_7(v: long,
  is_subtype_of_inter_type: boolean,
  v_id: int): boolean {
  let res: boolean = false
  if (is_subtype_of_inter_type) {
    expect(v instanceof string | int &&
      v instanceof string | int | float).assertTrue()
    expect(check_is_subtype_of_I1_7(v)).assertTrue()
    expect(check_is_subtype_of_I2_7(v)).assertTrue()
  }
  check_value_7(v, is_subtype_of_inter_type, v_id)
  if (check_is_subtype_of_I1_7(v)) {
    expect(v instanceof string | int).assertTrue()
    if (v instanceof string | int) {
      expect(check_is_subtype_of_I1_7(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
      res = check_is_in_inter_type_7(v as "Done" | "In Progress" | "On Review" | int,
        is_subtype_of_inter_type, v_id)
      expect(res).assertEqual(is_subtype_of_inter_type)
      if (!res) {
        expect(check_is_subtype_of_I2_7(v)).assertFalse()
      }
    }
  }
  else {
    expect(is_subtype_of_inter_type).assertFalse()
  }
  return res
}
function check_is_in_inter_type_7(v: string | int,
  is_subtype_of_inter_type: boolean,
  v_id: int): boolean {
  let res: boolean = false
  check_value_7(v, is_subtype_of_inter_type, v_id)
  if (check_is_subtype_of_I2_7(v)) {
    expect(is_subtype_of_inter_type).assertTrue()
    expect(v instanceof string | int | float).assertTrue()
    if (v instanceof string | int | float) {
      res = check_as_I2_type_7(v as "In Progress" | "On Review" | int | float,
        is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_as_I2_type_7(v: string | int | float,
  is_subtype_of_inter_type: boolean,
  v_id: int): boolean {
  check_value_7(v, is_subtype_of_inter_type, v_id)
  return check_is_subtype_of_I2_7(v)
}

export default function TypeTIsSubOfInterTypeOnStrLitTest01(): void {
  describe('TypeTIsSubOfInterTypeOnStrLitTest01', () => {
    beforeAll(() => {
    })

    beforeEach(() => {
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_STR_LIT_0200
     * @tc.name      testTypeTIsSubOfInterTypeOnStrLit0002
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnStrLit0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: long = 123
      let v2: long = 456
      let res: boolean =
        check_7(v1, false, 1) &&
        check_7(v2, false, 2)
      expect(res).assertEqual(false)

      expect(testNS2_7.runTest_7()).assertTrue()
    })

  })
}