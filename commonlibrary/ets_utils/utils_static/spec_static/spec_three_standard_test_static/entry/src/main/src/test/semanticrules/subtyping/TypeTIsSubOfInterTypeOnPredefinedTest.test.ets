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

namespace testNS2_3 {
  function check_value_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof long).assertTrue()
    if (v_id == 1) {
      expect((v as long)).assertEqual(123)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(123)
        expect((v as bigint | int | null)).assertEqual(123)
      }
    }
    else {
      expect((v as long)).assertEqual(456)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(456)
        expect((v as bigint | int | null)).assertEqual(456)
      }
    }
  }
  function check_3(v: long,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint &&
      v instanceof bigint | int | null).assertEqual(is_subtype_of_inter_type)
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v instanceof undefined | string | null | bigint) {
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as undefined | string | null | bigint)).assertEqual(123)
      }
      else {
        expect((v as undefined | string | null | bigint)).assertEqual(456)
      }
      res = check_is_in_inter_type_3(v, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof bigint | int | null).assertFalse()
        check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_3(v: undefined | string | null | bigint,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as undefined | string | null | bigint)).assertEqual(123)
    }
    else {
      expect((v as undefined | string | null | bigint)).assertEqual(456)
    }
    if (v instanceof bigint | int | null) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as bigint | int | null)).assertEqual(123)
      }
      else {
        expect((v as bigint | int | null)).assertEqual(456)
      }
      let b: bigint | int | null = v as bigint | int | null
      check_value_3(b, is_subtype_of_inter_type, v_id)
      return true
    }
    else {
      return false
    }
  }
  function check_is_not_in_I2_type_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof bigint | int | null).assertFalse()
    expect(() => {
      let b: bigint | int | null = v as bigint | int | null
    }).assertThrow("error")
  }

  export function runTest_3(): boolean {
    let v1: long = 123
    let v2: long = 456
    let res: boolean =
      check_3(v1, false, 1) &&
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

function check_value_3(v: Object | null | undefined,
  is_subtype_of_inter_type: boolean,
  v_id: int): void {
  expect(v instanceof int).assertTrue()
  if (v_id == 1) {
    expect((v as int)).assertEqual(123)
    if (is_subtype_of_inter_type) {
      expect(v instanceof undefined | string | null | bigint &&
        v instanceof bigint | int | null).assertTrue()
      expect((v as undefined | string | null | bigint)).assertEqual(123)
      expect((v as bigint | int | null)).assertEqual(123)
    }
  }
  else {
    expect((v as int)).assertEqual(456)
    if (is_subtype_of_inter_type) {
      expect(v instanceof undefined | string | null | bigint &&
        v instanceof bigint | int | null).assertTrue()
      expect((v as undefined | string | null | bigint)).assertEqual(456)
      expect((v as bigint | int | null)).assertEqual(456)
    }
  }
}
function check_3(v: int,
  is_subtype_of_inter_type: boolean,
  v_id: int): boolean {
  let res: boolean = false
  expect(v instanceof undefined | string | null | bigint &&
    v instanceof bigint | int | null).assertEqual(is_subtype_of_inter_type)
  check_value_3(v, is_subtype_of_inter_type, v_id)
  if (v instanceof undefined | string | null | bigint) {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as undefined | string | null | bigint)).assertEqual(123)
    }
    else {
      expect((v as undefined | string | null | bigint)).assertEqual(456)
    }
    res = check_is_in_inter_type_3(v, is_subtype_of_inter_type, v_id)
    if (!res) {
      expect(v instanceof bigint | int | null).assertFalse()
      check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_is_in_inter_type_3(v: undefined | string | null | bigint,
  is_subtype_of_inter_type: boolean,
  v_id: int): boolean {
  check_value_3(v, is_subtype_of_inter_type, v_id)
  if (v_id == 1) {
    expect((v as undefined | string | null | bigint)).assertEqual(123)
  }
  else {
    expect((v as undefined | string | null | bigint)).assertEqual(456)
  }
  if (v instanceof bigint | int | null) {
    expect(is_subtype_of_inter_type).assertTrue()
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as bigint | int | null)).assertEqual(123)
    }
    else {
      expect((v as bigint | int | null)).assertEqual(456)
    }
    let b: bigint | int | null = v as bigint | int | null
    check_value_3(b, is_subtype_of_inter_type, v_id)
    return true
  }
  else {
    return false
  }
}
function check_is_not_in_I2_type_3(v: Object | null | undefined,
  is_subtype_of_inter_type: boolean,
  v_id: int): void {
  check_value_3(v, is_subtype_of_inter_type, v_id)
  expect(v instanceof bigint | int | null).assertFalse()
  expect(() => {
    let b: bigint | int | null = v as bigint | int | null
  }).assertThrow("error")
}

export default function TypeTIsSubOfInterTypeOnPredefinedTest01(): void {
  describe('TypeTIsSubOfInterTypeOnPredefinedTest01', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_PREDEFINED_0300
     * @tc.name      testTypeTIsSubOfInterTypeOnPredefined0003
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnPredefined0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: int = 123
      let v2: int = 456
      let res: boolean =
        check_3(v1, false, 1) &&
        check_3(v2, false, 2)
      expect(res).assertEqual(false)

      expect(testNS2_3.runTest_3()).assertTrue()
    })

  })
}
