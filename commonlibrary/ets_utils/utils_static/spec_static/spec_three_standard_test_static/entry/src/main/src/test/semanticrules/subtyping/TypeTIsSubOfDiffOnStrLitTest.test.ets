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

namespace testNS4_2 {
  function check_is_subtype_of_A(a: Object | undefined | null): boolean {
    let res: boolean = false
    if (a instanceof string | number) {
      if (a instanceof number) {
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
    return res
  }
  function check_is_in_diff_type(v: Object | undefined | null): boolean {
    if (v === "In Progress") {
      let b: "In Progress"  = v as "In Progress"
      expect(b).assertEqual("In Progress")
      return false
    }
    else {
      return true
    }
  }
  function check_is_not_in_B_type(v: Object | undefined | null) {
    expect(v === "In Progress").assertEqual(false)
  }
  export function check(v: boolean,
    is_subtype_of_A: boolean, v_id: number): boolean {
    let res: boolean = check_is_subtype_of_A(v)
    expect(res).assertEqual(is_subtype_of_A)
    if (res) {
      expect(v instanceof string | number).assertEqual(true)
      if (v instanceof string | number) {
        res = check_is_in_diff_type_with_value(v, v_id)
      }
    }
    if (res) {
      check_is_not_in_B_type_with_value(v, v_id)
    }
    return res
  }
  function check_value(v: Object | undefined | null, v_id: number): void {
    if (v_id == 1) {
      expect(v as boolean).assertEqual(false)
    }
    else {
      expect(v as boolean).assertEqual(true)
    }
  }
  function check_is_in_diff_type_with_value(v: string | number,
    v_id: number): boolean {
    check_value(v, v_id)
    return check_is_in_diff_type(v)
  }
  function check_is_not_in_B_type_with_value(v: Object | undefined | null, v_id: number): void {
    check_value(v, v_id)
    check_is_not_in_B_type(v)
  }

  export function runTest(): boolean {
    let v1: boolean = false
    let v2: boolean = true
    let res: boolean =
      check(v1, false, 1) &
      check(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

function check_2(v: boolean, flag: boolean, id: number): boolean {
  return testNS4_2.check(v, flag, id);
}

export default function TypeTIsSubOfDiffOnStrLitTest(): void {
  describe('TypeTIsSubOfDiffOnStrLitTest', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_STR_LIT_0200
     * @tc.name      testTypeTIsSubOfDiffOnStrLit0002
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
     *               of A, and no value belongs both to T and B in case of usage instanceof on literal
     *               union types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnStrLit0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: boolean = false
      let v2: boolean = true
      let res: boolean =
        check_2(v1, false, 1) &
        check_2(v2, false, 2)
      expect(res).assertEqual(false)
      expect(testNS4_2.runTest()).assertEqual(true)
    })
  })
}
