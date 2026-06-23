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

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}


function check_4(v: bigint,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof undefined || v instanceof string || v instanceof null || v instanceof bigint).assertEqual(is_subtype_of_A)
  if (v instanceof undefined || v instanceof string || v instanceof null || v instanceof bigint) {
    res = check_is_in_diff_type_4(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_4(v, v_id)
  }
  return res
}
function check_value_4(v: Any, v_id: number): void {
  if (v_id == 1) {
    expect(v as bigint).assertEqual(123n)
  }
  else {
    expect(v as bigint).assertEqual(456n)
  }
}
function check_is_in_diff_type_4(v: undefined | string | null | bigint,
  v_id: number): boolean {
  check_value_4(v, v_id)
  if (v instanceof bigint | number | null) {
    let b: bigint | number | null = v as bigint | number | null
    check_value_4(b, v_id)
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_4(v: Any, v_id: number): void {
  check_value_4(v, v_id)
  expect(v instanceof bigint | number | null).assertEqual(false)
  let thrown = false;
  try {
    let b: bigint | number | null = v as bigint | number | null
  } catch(e) {
    thrown = true;
    expect(e instanceof Error).assertEqual(true);
  }
  expect(thrown).assertEqual(true);
}


function check_5(v: Object,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof undefined | number | null | bigint).assertEqual(is_subtype_of_A)
  if (v instanceof undefined | number | null | bigint) {
    res = check_is_in_diff_type_5(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_5(v, v_id)
  }
  return res
}
function check_value_5(v: Any, v_id: number): void {
  if (v_id == 1) {
    expect(v as Object).assertEqual(5n)
  }
  else {
    expect(v as Object).assertEqual(123)
  }
}
function check_is_in_diff_type_5(v: undefined | number | null | bigint,
  v_id: number): boolean {
  check_value_5(v, v_id)
  if (v instanceof bigint | string | undefined) {
    let b: bigint | string | undefined = v as bigint | string | undefined
    check_value_5(b, v_id)
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_5(v: Any, v_id: number): void {
  check_value_5(v, v_id)
  expect(v instanceof bigint | string | undefined).assertEqual(false)
  let thrown = false;
  try {
    let b: bigint | string | undefined = v as bigint | string | undefined
  } catch(e) {
    thrown = true;
    expect(e instanceof Error).assertEqual(true);
  }
  expect(thrown).assertEqual(true);
}

export default function TypeTIsSubOfDiffOnPredefinedTest01(): void {
  describe('TypeTIsSubOfDiffOnPredefinedTest01', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await sleep(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_PREDEFINED_0400
     * @tc.name      testTypeTIsSubOfDiffOnPredefined0004
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on predefined
    types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnPredefined0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: bigint = 123n
      let v2: bigint = 456n
      let res: boolean =
        check_4(v1, true, 1) &
        check_4(v2, true, 2)
      expect(res).assertEqual(false)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_PREDEFINED_0500
     * @tc.name      testTypeTIsSubOfDiffOnPredefined0005
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on predefined
    types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnPredefined0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let v1: Object = 5n
      let v2: Object = 123
      let res: boolean =
        check_5(v1, true, 1) &
        check_5(v2, false, 2)
      expect(res).assertEqual(false)
    });
  })
}
