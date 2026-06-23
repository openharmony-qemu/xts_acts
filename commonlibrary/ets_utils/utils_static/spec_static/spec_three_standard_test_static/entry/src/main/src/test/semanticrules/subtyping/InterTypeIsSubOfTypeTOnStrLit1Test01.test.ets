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

async function sleep_1(time: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace testNS2_4 {
  function check_value_from_type_I1_4(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number'
    } else {
      return false
    }
  }

  function check_value_from_type_I2_4(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_4(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number' || v === "Investigating"
    } else {
      return false
    }
  }

  function check_value_4(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual(123)
      expect(v).assertEqual(123)
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }

  function check_is_in_T_type_4(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_4(v, v_id)
    if (check_value_from_type_I1_4(v)) {
      check_value_4(v, v_id)
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      if (typeof v === 'string' || typeof v === 'number') {
        check_value_4(v, v_id)
      }
      if (check_value_from_type_I2_4(v)) {
        expect(v_id).assertEqual(1)
        check_value_4(v, v_id)
        expect(v).assertEqual(123)
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        if (typeof v === 'string' || typeof v === 'number') {
          check_value_4(v, v_id)
        }
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        expect(check_value_from_type_T_4(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_4(v, v_id)
        expect(v).assertEqual("Done")
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        if (check_value_from_type_T_4(v)) {
          expect(typeof v === 'string' || typeof v === 'number').assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_4(v, v_id)
      expect(v).assertEqual("On Review")
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      if (check_value_from_type_T_4(v)) {
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_4(): boolean {
    let res1: boolean = check_is_in_T_type_4(123, 1)
    let res2: boolean = check_is_in_T_type_4("Done", 2)
    let res3: boolean = check_is_in_T_type_4("On Review", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

function check_value_from_type_I1_4(v: Any): boolean {
  if (typeof v === 'string') {
    return v === "Done" || v === "In Progress"
  } else {
    return false
  }
}

function check_value_from_type_I2_4(v: Any): boolean {
  if (typeof v === 'string') {
    return v === "In Progress" || v === "On Review"
  } else {
    return false
  }
}

function check_value_from_type_T_4(v: Any): boolean {
  if (typeof v === 'string') {
    return v === "Done" || v === "In Progress" || v === "Investigating"
  } else {
    return false
  }
}

function check_value_4(v: "Done" | "In Progress" | "On Review", v_id: number): void {
  if (v_id == 1) {
    expect(v).assertEqual("In Progress")
    expect(v).assertEqual("In Progress")
  } else if (v_id == 2) {
    expect(v).assertEqual("Done")
  } else {
    expect(v).assertEqual("On Review")
  }
}

function check_is_in_T_type_4(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
  check_value_4(v, v_id)
  if (check_value_from_type_I1_4(v)) {
    check_value_4(v, v_id)
    expect(typeof v === 'string').assertTrue()
    if (typeof v === 'string') {
      check_value_4(v, v_id)
    }
    if (check_value_from_type_I2_4(v)) {
      expect(v_id).assertEqual(1)
      check_value_4(v, v_id)
      expect(v).assertEqual("In Progress")
      expect(typeof v === 'string').assertTrue()
      expect(typeof v === 'string').assertTrue()
      if (typeof v === 'string') {
        check_value_4(v, v_id)
      }
      expect(typeof v === 'string').assertTrue()
      expect(check_value_from_type_T_4(v)).assertTrue()
      return true
    } else {
      expect(v_id).assertEqual(2)
      check_value_4(v, v_id)
      expect(v).assertEqual("Done")
      expect(typeof v === 'string').assertTrue()
      if (check_value_from_type_T_4(v)) {
        expect(typeof v === 'string').assertTrue()
        return true
      } else {
        return false
      }
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_4(v, v_id)
    expect(v).assertEqual("On Review")
    expect(typeof v === 'string').assertTrue()
    if (check_value_from_type_T_4(v)) {
      expect(typeof v === 'string').assertTrue()
      return true
    } else {
      return false
    }
  }
}

export default function InterTypeIsSubOfTypeTOnStrLit1Test01(): void {
  describe('InterTypeIsSubOfTypeTOnStrLit1Test01', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await sleep_1(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })
    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_STR_LIT1_ONE_0300
     * @tc.name      testInterTypeIsSubOfTypeTOnStrLit0004
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on literal union
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnStrLit0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let res1: boolean = check_is_in_T_type_4("In Progress", 1)
      let res2: boolean = check_is_in_T_type_4("Done", 2)
      let res3: boolean = check_is_in_T_type_4("On Review", 3)
      expect(res1 && (res2 || res3)).assertTrue()
      expect(testNS2_4.runTest_4()).assertTrue()

    });

  })
}