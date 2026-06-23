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


function check_1(v: Object,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof Object || v === undefined).assertEqual(is_subtype_of_A)
  if (v instanceof Object || v === undefined) {
    res = check_is_in_diff_type_1(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_1(v, v_id)
  }
  return res
}
function check_value_1(v: Any, v_id: number): void {
  if (v_id == 1) {
    expect(v as Object).assertEqual(5n)
  }
  else {
    expect(v as Object).assertEqual(123)
  }
}
function check_is_in_diff_type_1(v: Object | undefined,
  v_id: number): boolean {
  check_value_1(v, v_id)
  if (v === undefined) {
    let b: undefined = v as undefined
    check_value_1(b, v_id)
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_1(v: Any, v_id: number): void {
  check_value_1(v, v_id)
  expect(v === undefined).assertEqual(false)
  let thrown = false;
  try {
    let b: undefined = v as undefined
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}


function check_2(v: Object,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(is_subtype_of_A).assertEqual(true)
  res = check_is_in_diff_type_2(v, v_id)
  if (res) {
    check_is_not_in_B_type_2(v, v_id)
  }
  return res
}
function check_value_2(v: string | number | object | undefined | null, v_id: number): void {
  if (v_id == 1) {
    expect(v as string).assertEqual("abc")
  }
  else {
    expect(v).assertEqual(123)
  }
}
function check_is_in_diff_type_2(v: string | number | object | undefined | null,
  v_id: number): boolean {
  check_value_2(v, v_id)
  if (v instanceof undefined | string) {
    let b: undefined | string = v as undefined | string
    check_value_2(b, v_id)
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_2(v: string | number | object | undefined | null, v_id: number): void {
  check_value_2(v, v_id)
  expect(v instanceof undefined | string).assertEqual(false)
  let thrown = false;
  try {
    let b: undefined | string = v as undefined | string
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}


function check_3(v: number,
  is_subtype_of_A: boolean, v_id: number): boolean {
  let res: boolean = false
  expect(v instanceof undefined | string | null | bigint).assertEqual(is_subtype_of_A)
  if (v instanceof undefined | string | null | bigint) {
    res = check_is_in_diff_type_3(v, v_id)
  }
  if (res) {
    check_is_not_in_B_type_3(v, v_id)
  }
  return res
}
function check_value_3(v: Any, v_id: number): void {
  if (v_id == 1) {
    expect(v as number).assertEqual(123)
  }
  else {
    expect(v as number).assertEqual(456)
  }
}
function check_is_in_diff_type_3(v: undefined | string | null | bigint,
  v_id: number): boolean {
  check_value_3(v, v_id)
  if (v instanceof bigint | number | null) {
    let b: bigint | number | null = v as bigint | number | null
    check_value_3(b, v_id)
    return false
  }
  else {
    return true
  }
}
function check_is_not_in_B_type_3(v: Any, v_id: number): void {
  check_value_3(v, v_id)
  expect(v instanceof bigint | number | null).assertEqual(false)
  let thrown = false;
  try {
    let b: bigint | number | null = v as bigint | number | null
  } catch(e) {
    thrown = true;
  }
  expect(thrown).assertEqual(true);
}

export default function TypeTIsSubOfDiffOnPredefinedTest(): void {
  describe('TypeTIsSubOfDiffOnPredefinedTest', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_PREDEFINED_0100
     * @tc.name      testTypeTIsSubOfDiffOnPredefined0001
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on predefined
    types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnPredefined0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Object = 5n
      let v2: Object = 123
      let res: boolean =
        check_1(v1, true, 1) &
        check_1(v2, true, 2)
      expect(res).assertEqual(true)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_PREDEFINED_0200
     * @tc.name      testTypeTIsSubOfDiffOnPredefined0002
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on predefined
    types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnPredefined0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let v1: Object = "abc"
      let v2: Object = 123
      let res: boolean =
        check_2(v1, true, 1) &
        check_2(v2, true, 2)
      expect(res).assertEqual(false)
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_DIFF_ON_PREDEFINED_0300
     * @tc.name      testTypeTIsSubOfDiffOnPredefined0003
     * @tc.desc      Checking that Type T is a subtype of the difference type A - B if T is a subtype
    of A, and no value belongs both to T and B in case of usage instanceof on predefined
    types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfDiffOnPredefined0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let v1: number = 123
      let v2: number = 456
      let res: boolean =
        check_3(v1, false, 1) &
        check_3(v2, false, 2)
      expect(res).assertEqual(false)
    });
  })
}
