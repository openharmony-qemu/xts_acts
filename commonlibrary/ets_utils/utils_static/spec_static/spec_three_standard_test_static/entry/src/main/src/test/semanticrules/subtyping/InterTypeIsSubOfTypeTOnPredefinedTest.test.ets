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
namespace testNS2_1 {
  function check_value_1(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(undefined);
      expect(v as undefined | null).assertEqual(undefined);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual(123);
    }
    else {
      expect(v as undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_1(v: Object | undefined | bigint, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof undefined | null).assertEqual(true);
    check_value_1(v, v_id);
  }
  function check_is_in_T_type_1(v: Object | undefined | undefined | null, v_id: int): boolean {
    check_value_1(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_1(v, v_id);
      if (v instanceof undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_1(v, v_id);
        expect(v).assertEqual(undefined);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof Object | undefined | bigint).assertEqual(true);
        if (v instanceof Object | undefined | bigint) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_1(v, v_id);
        expect(v).assertEqual(123);
        if (v instanceof Object | undefined | bigint) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_1(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof Object | undefined | bigint) {
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_1(): boolean {
    let res1_1: boolean = check_is_in_T_type_1(undefined, 1);
    let res2_1: boolean = check_is_in_T_type_1(123, 2);
    let res3_1: boolean = check_is_in_T_type_1(null, 3);
    expect(res1_1 && (res2_1 || res3_1)).assertEqual(true);
    return true;
  }
}

function check_value_1(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as Object | undefined).assertEqual(undefined);
    expect(v as undefined | null).assertEqual(undefined);
  }
  else if (v_id == 2) {
    expect(v as Object | undefined).assertEqual(5n);
  }
  else {
    expect(v as undefined | null).assertEqual(null);
  }
}
function check_value_as_type_T_1(v: undefined | null | int, v_id: int): void {
  expect(v instanceof Object | undefined || v instanceof undefined | null).assertEqual(true);
  check_value_1(v, v_id);
}
function check_is_in_T_type_1(v: Object | undefined | undefined | null, v_id: int): boolean {
  check_value_1(v, v_id);
  if (v instanceof Object | undefined) {
    check_value_1(v, v_id);
    if (v instanceof undefined | null) {
      expect(v_id).assertEqual(1);
      check_value_1(v, v_id);
      expect(v).assertEqual(undefined);
      expect(v instanceof Object | undefined).assertEqual(true);
      expect(v instanceof undefined | null | int).assertEqual(true);
      if (v instanceof undefined | null | int) {
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_1(v, v_id);
      expect(v).assertEqual(5n);
      if (v instanceof undefined | null | int) {
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_1(v, v_id);
    expect(v).assertEqual(null);
    if (v instanceof undefined | null | int) {
      check_value_as_type_T_1(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

namespace testNS2_2 {
  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(undefined);
      expect(v as bigint | undefined | null).assertEqual(undefined);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual(123);
    }
    else {
      expect(v as bigint | undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_2(v: bigint | undefined | null | int, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof bigint | undefined | null).assertEqual(true);
    check_value_2(v, v_id);
  }
  function check_is_in_T_type_2(v: Object | undefined | bigint | undefined | null, v_id: int): boolean {
    check_value_2(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_2(v, v_id);
      if (v instanceof bigint | undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_2(v, v_id);
        expect(v).assertEqual(undefined);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof bigint | undefined | null | int).assertEqual(true);
        if (v instanceof bigint | undefined | null | int) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_2(v, v_id);
        expect(v).assertEqual(123);
        if (v instanceof bigint | undefined | null | int) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_2(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof bigint | undefined | null | int) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(undefined, 1);
    let res2_2: boolean = check_is_in_T_type_2(123, 2);
    let res3_2: boolean = check_is_in_T_type_2(null, 3);
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true);
    return true;
  }
}

function check_value_2(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as Object | undefined).assertEqual(5n);
    expect(v as bigint | undefined | null).assertEqual(5n);
  }
  else if (v_id == 2) {
    expect(v as Object | undefined).assertEqual("abc");
  }
  else {
    expect(v as bigint | undefined | null).assertEqual(null);
  }
}
function check_value_as_type_T_2(v: bigint | undefined | null | int, v_id: int): void {
  expect(v instanceof Object | undefined || v instanceof bigint | undefined | null).assertEqual(true);
  check_value_2(v, v_id);
}
function check_is_in_T_type_2(v: Object | undefined | bigint | undefined | null, v_id: int): boolean {
  check_value_2(v, v_id);
  if (v instanceof Object | undefined) {
    check_value_2(v, v_id);
    if (v instanceof bigint | undefined | null) {
      expect(v_id).assertEqual(1);
      check_value_2(v, v_id);
      expect(v).assertEqual(5n);
      expect(v instanceof Object | undefined).assertEqual(true);
      expect(v instanceof bigint | undefined | null | int).assertEqual(true);
      if (v instanceof bigint | undefined | null | int) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_2(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof bigint | undefined | null | int) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_2(v, v_id);
    expect(v).assertEqual(null);
    if (v instanceof bigint | undefined | null | int) {
      check_value_as_type_T_2(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

export default function InterTypeIsSubOfTypeTOnPredefinedTest(): void {
  describe('InterTypeIsSubOfTypeTOnPredefinedTest', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0100
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0001
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let res1_1: boolean = check_is_in_T_type_1(undefined, 1)
      let res2_1: boolean = check_is_in_T_type_1(5n, 2)
      let res3_1: boolean = check_is_in_T_type_1(null, 3)
      expect(res1_1 && (res2_1 || res3_1)).assertEqual(true)

      expect(testNS2_1.runTest_1()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0200
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0002
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let res1_2: boolean = check_is_in_T_type_2(5n, 1)
      let res2_2: boolean = check_is_in_T_type_2("abc", 2)
      let res3_2: boolean = check_is_in_T_type_2(null, 3)
      expect(res1_2 && (res2_2 || res3_2)).assertEqual(true)

      expect(testNS2_2.runTest_2()).assertEqual(true)

    });
  })
}
