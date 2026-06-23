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
class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}

namespace testNS2_11 {
  function check_value_11(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as float | bigint).assertEqual(723n);
      expect(v as bigint | string).assertEqual(723n);
    }
    else if (v_id == 2) {
      expect(v as float | bigint).assertEqual(12.8f);
    }
    else {
      expect(v as bigint | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_11(v: bigint | string | char, v_id: int): void {
    expect(v instanceof float | bigint || v instanceof bigint | string).assertEqual(true);
    check_value_11(v, v_id);
  }
  function check_is_in_T_type_11(v: float | bigint | bigint | string, v_id: int): boolean {
    check_value_11(v, v_id);
    if (v instanceof float | bigint) {
      check_value_11(v, v_id);
      if (v instanceof bigint | string) {
        expect(v_id).assertEqual(1);
        check_value_11(v, v_id);
        expect(v).assertEqual(723n);
        expect(v instanceof float | bigint).assertEqual(true);
        expect(v instanceof bigint | string | char).assertEqual(true);
        if (v instanceof bigint | string | char) {
          check_value_as_type_T_11(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_11(v, v_id);
        expect(v).assertEqual(12.8f);
        if (v instanceof bigint | string | char) {
          check_value_as_type_T_11(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_11(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof bigint | string | char) {
        check_value_as_type_T_11(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_11(): boolean {
    let res1_11: boolean = check_is_in_T_type_11(723n, 1);
    let res2_11: boolean = check_is_in_T_type_11(12.8f, 2);
    let res3_11: boolean = check_is_in_T_type_11("efg", 3);
    expect(res1_11 && (res2_11 || res3_11)).assertEqual(true);
    return true;
  }
}

function check_value_11(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as float | bigint).assertEqual(5n);
    expect(v as bigint | string).assertEqual(5n);
  }
  else if (v_id == 2) {
    expect(v as float | bigint).assertEqual(1.7f);
  }
  else {
    expect(v as bigint | string).assertEqual("abc");
  }
}
function check_value_as_type_T_11(v: float | bigint | boolean, v_id: int): void {
  expect(v instanceof float | bigint || v instanceof bigint | string).assertEqual(true);
  check_value_11(v, v_id);
}
function check_is_in_T_type_11(v: float | bigint | bigint | string, v_id: int): boolean {
  check_value_11(v, v_id);
  if (v instanceof float | bigint) {
    check_value_11(v, v_id);
    if (v instanceof bigint | string) {
      expect(v_id).assertEqual(1);
      check_value_11(v, v_id);
      expect(v).assertEqual(5n);
      expect(v instanceof float | bigint).assertEqual(true);
      expect(v instanceof float | bigint | boolean).assertEqual(true);
      if (v instanceof float | bigint | boolean) {
        check_value_as_type_T_11(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_11(v, v_id);
      expect(v).assertEqual(1.7f);
      if (v instanceof float | bigint | boolean) {
        check_value_as_type_T_11(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_11(v, v_id);
    expect(v).assertEqual("abc");
    if (v instanceof float | bigint | boolean) {
      check_value_as_type_T_11(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

export default function InterTypeIsSubOfTypeTOnPredefinedTest03(): void {
  describe('InterTypeIsSubOfTypeTOnPredefinedTest03', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1100
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0011
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1_11: boolean = check_is_in_T_type_11(5n, 1)
      let res2_11: boolean = check_is_in_T_type_11(1.7f, 2)
      let res3_11: boolean = check_is_in_T_type_11("abc", 3)
      expect(res1_11 && (res2_11 || res3_11)).assertEqual(true)
      expect(testNS2_11.runTest_11()).assertEqual(true)
    });
  })
}