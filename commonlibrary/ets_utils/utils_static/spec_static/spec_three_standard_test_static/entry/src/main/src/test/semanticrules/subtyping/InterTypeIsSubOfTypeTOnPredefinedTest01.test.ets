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
namespace testNS2_3 {
  function check_value_3(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as int | bigint | boolean | string).assertEqual(5n);
      expect(v as string | char | bigint | float).assertEqual(5n);
    }
    else if (v_id == 2) {
      expect(v as int | bigint | boolean | string).assertEqual(123);
    }
    else {
      expect(v as string | char | bigint | float).assertEqual(7.8f);
    }
  }
  function check_value_as_type_T_3(v: int | bigint | boolean | string | number, v_id: int): void {
    expect(v instanceof int | bigint | boolean | string || v instanceof string | char | bigint | float).assertEqual(true);
    check_value_3(v, v_id);
  }
  function check_is_in_T_type_3(v: int | bigint | boolean | string | string | char | bigint | float, v_id: int): boolean {
    check_value_3(v, v_id);
    if (v instanceof int | bigint | boolean | string) {
      check_value_3(v, v_id);
      if (v instanceof string | char | bigint | float) {
        expect(v_id).assertEqual(1);
        check_value_3(v, v_id);
        expect(v).assertEqual(5n);
        expect(v instanceof int | bigint | boolean | string).assertEqual(true);
        expect(v instanceof int | bigint | boolean | string | number).assertEqual(true);
        if (v instanceof int | bigint | boolean | string | number) {
          check_value_as_type_T_3(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_3(v, v_id);
        expect(v).assertEqual(123);
        if (v instanceof int | bigint | boolean | string | number) {
          check_value_as_type_T_3(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_3(v, v_id);
      expect(v).assertEqual(7.8f);
      if (v instanceof int | bigint | boolean | string | number) {
        check_value_as_type_T_3(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_3(): boolean {
    let res1_3: boolean = check_is_in_T_type_3(5n, 1);
    let res2_3: boolean = check_is_in_T_type_3(123, 2);
    let res3_3: boolean = check_is_in_T_type_3(7.8f, 3);
    expect(res1_3 && (res2_3 || res3_3)).assertEqual(true);
    return true;
  }
}

function check_value_3(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as int | bigint | boolean | string).assertEqual("abc");
    expect(v as string | char | bigint | float).assertEqual("abc");
  }
  else if (v_id == 2) {
    expect(v as int | bigint | boolean | string).assertEqual(true);
  }
  else {
    expect(v as string | char | bigint | float).assertEqual(c'a');
  }
}
function check_value_as_type_T_3(v: int | bigint | boolean | string | number, v_id: int): void {
  expect(v instanceof int | bigint | boolean | string || v instanceof string | char | bigint | float).assertEqual(true);
  check_value_3(v, v_id);
}
function check_is_in_T_type_3(v: int | bigint | boolean | string | string | char | bigint | float, v_id: int): boolean {
  check_value_3(v, v_id);
  if (v instanceof int | bigint | boolean | string) {
    check_value_3(v, v_id);
    if (v instanceof string | char | bigint | float) {
      expect(v_id).assertEqual(1);
      check_value_3(v, v_id);
      expect(v).assertEqual("abc");
      expect(v instanceof int | bigint | boolean | string).assertEqual(true);
      expect(v instanceof int | bigint | boolean | string | number).assertEqual(true);
      if (v instanceof int | bigint | boolean | string | number) {
        check_value_as_type_T_3(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_3(v, v_id);
      expect(v).assertEqual(true);
      if (v instanceof int | bigint | boolean | string | number) {
        check_value_as_type_T_3(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_3(v, v_id);
    expect(v).assertEqual(c'a');
    if (v instanceof int | bigint | boolean | string | number) {
      check_value_as_type_T_3(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}
export default function InterTypeIsSubOfTypeTOnPredefinedTest01(): void {
  describe('InterTypeIsSubOfTypeTOnPredefinedTest01', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_TEST_0300
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0003
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let res1_3: boolean = check_is_in_T_type_3("abc", 1)
      let res2_3: boolean = check_is_in_T_type_3(true, 2)
      let res3_3: boolean = check_is_in_T_type_3(c'a', 3)
      expect(res1_3 && (res2_3 || res3_3)).assertEqual(true)

      expect(testNS2_3.runTest_3()).assertEqual(true)

    });
  })
}
