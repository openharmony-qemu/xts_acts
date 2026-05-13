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

namespace testNS1_1 {
  function check_value_from_type_I1_1(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "Done" || v === "In Progress"
    } else {
      return false
    }
  }

  function check_value_from_type_I2_1(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_1(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "Done" || v === "In Progress" || v === "Investigating"
    } else {
      return false
    }
  }

  function check_value_1(v: "Done" | "In Progress" | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress")
      expect(v).assertEqual("In Progress")
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }

  function check_is_in_T_type_1(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
    check_value_1(v, v_id)
    if (check_value_from_type_I1_1(v)) {
      check_value_1(v, v_id)
      expect(typeof v === 'string').assertTrue()
      check_value_1(v, v_id)
      if (check_value_from_type_I2_1(v)) {
        expect(v_id).assertEqual(1)
        check_value_1(v, v_id)
        expect(v).assertEqual("In Progress")
        expect(typeof v === 'string').assertTrue()
        expect(typeof v === 'string').assertTrue()
        check_value_1(v, v_id)
        expect(typeof v === 'string').assertTrue()
        expect(check_value_from_type_T_1(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_1(v, v_id)
        expect(v).assertEqual("Done")
        expect(typeof v === 'string').assertTrue()
        if (check_value_from_type_T_1(v)) {
          expect(typeof v === 'string').assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_1(v, v_id)
      expect(v).assertEqual("On Review")
      expect(typeof v === 'string').assertTrue()
      if (check_value_from_type_T_1(v)) {
        expect(typeof v === 'string').assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1: boolean = check_is_in_T_type_1("In Progress", 1)
    let res2: boolean = check_is_in_T_type_1("Done", 2)
    let res3: boolean = check_is_in_T_type_1("On Review", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_1 {
  function check_value_from_type_I1_1(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "Done" || v === "In Progress"
    } else {
      return false
    }
  }

  function check_value_from_type_I2_1(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_1(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "In Progress" || v === "On Review" || typeof v === 'bigint'
    } else {
      return false
    }
  }

  function check_value_1(v: "Done" | "In Progress" | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress")
      expect(v).assertEqual("In Progress")
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }

  function check_is_in_T_type_1(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
    check_value_1(v, v_id)
    if (check_value_from_type_I1_1(v)) {
      check_value_1(v, v_id)
      expect(typeof v === 'string').assertTrue()
      check_value_1(v, v_id)
      if (check_value_from_type_I2_1(v)) {
        expect(v_id).assertEqual(1)
        check_value_1(v, v_id)
        expect(v).assertEqual("In Progress")
        expect(typeof v === 'string').assertTrue()
        expect(typeof v === 'string').assertTrue()
        check_value_1(v, v_id)
        expect(typeof v === 'string' || typeof v === 'bigint').assertTrue()
        expect(check_value_from_type_T_1(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_1(v, v_id)
        expect(v).assertEqual("Done")
        expect(typeof v === 'string').assertTrue()
        if (check_value_from_type_T_1(v)) {
          expect(typeof v === 'string' || typeof v === 'bigint').assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_1(v, v_id)
      expect(v).assertEqual("On Review")
      expect(typeof v === 'string').assertTrue()
      if (check_value_from_type_T_1(v)) {
        expect(typeof v === 'string' || typeof v === 'bigint').assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1: boolean = check_is_in_T_type_1("In Progress", 1)
    let res2: boolean = check_is_in_T_type_1("Done", 2)
    let res3: boolean = check_is_in_T_type_1("On Review", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS3_1 {
  function check_value_from_type_I1_1(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "Done" || v === "In Progress"
    } else {
      return false
    }
  }

  function check_value_from_type_I2_1(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_1(v: Any): boolean {
    return true
  }

  function check_value_1(v: "Done" | "In Progress" | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress")
      expect(v).assertEqual("In Progress")
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }

  function check_is_in_T_type_1(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
    check_value_1(v, v_id)
    if (check_value_from_type_I1_1(v)) {
      check_value_1(v, v_id)
      expect(typeof v === 'string').assertTrue()
      check_value_1(v, v_id)
      if (check_value_from_type_I2_1(v)) {
        expect(v_id).assertEqual(1)
        check_value_1(v, v_id)
        expect(v).assertEqual("In Progress")
        expect(typeof v === 'string').assertTrue()
        expect(typeof v === 'string').assertTrue()
        check_value_1(v, v_id)
        expect(true).assertTrue()
        expect(check_value_from_type_T_1(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_1(v, v_id)
        expect(v).assertEqual("Done")
        expect(typeof v === 'string').assertTrue()
        if (check_value_from_type_T_1(v)) {
          expect(true).assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_1(v, v_id)
      expect(v).assertEqual("On Review")
      expect(typeof v === 'string').assertTrue()
      if (check_value_from_type_T_1(v)) {
        expect(true).assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1: boolean = check_is_in_T_type_1("In Progress", 1)
    let res2: boolean = check_is_in_T_type_1("Done", 2)
    let res3: boolean = check_is_in_T_type_1("On Review", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

function check_value_from_type_I1_2(v: Any): boolean {
  if (typeof v === 'string') {
    return v === "Done" || v === "In Progress"
  } else {
    return false
  }
}

function check_value_from_type_I2_2(v: Any): boolean {
  if (typeof v === 'string') {
    return v === "In Progress" || v === "On Review"
  } else {
    return false
  }
}

function check_value_from_type_T_2(v: Any): boolean {
  if (typeof v === 'string') {
    return v === "Done" || v === "In Progress" || v === "Investigating"
  } else {
    return false
  }
}

function check_value_2(v: "Done" | "In Progress" | "On Review", v_id: number): void {
  if (v_id == 1) {
    expect(v).assertEqual("In Progress")
    expect(v).assertEqual("In Progress")
  } else if (v_id == 2) {
    expect(v).assertEqual("Done")
  } else {
    expect(v).assertEqual("On Review")
  }
}

function check_is_in_T_type_2(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
  check_value_2(v, v_id)
  if (check_value_from_type_I1_2(v)) {
    check_value_2(v, v_id)
    expect(typeof v === 'string').assertTrue()
    check_value_2(v, v_id)
    if (check_value_from_type_I2_2(v)) {
      expect(v_id).assertEqual(1)
      check_value_2(v, v_id)
      expect(v).assertEqual("In Progress")
      expect(typeof v === 'string').assertTrue()
      expect(typeof v === 'string').assertTrue()
      check_value_2(v, v_id)
      expect(typeof v === 'string').assertTrue()
      expect(check_value_from_type_T_2(v)).assertTrue()
      return true
    } else {
      expect(v_id).assertEqual(2)
      check_value_2(v, v_id)
      expect(v).assertEqual("Done")
      expect(typeof v === 'string').assertTrue()
      if (check_value_from_type_T_2(v)) {
        expect(typeof v === 'string').assertTrue()
        return true
      } else {
        return false
      }
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_2(v, v_id)
    expect(v).assertEqual("On Review")
    expect(typeof v === 'string').assertTrue()
    if (check_value_from_type_T_2(v)) {
      expect(typeof v === 'string').assertTrue()
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_2 {
  function check_value_from_type_I1_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number'
    } else {
      return false
    }
  }

  function check_value_from_type_I2_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number' || v === "Investigating"
    } else {
      return false
    }
  }

  function check_value_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress")
      expect(v).assertEqual("In Progress")
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }

  function check_is_in_T_type_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_2(v, v_id)
    if (check_value_from_type_I1_2(v)) {
      check_value_2(v, v_id)
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      check_value_2(v, v_id)
      if (check_value_from_type_I2_2(v)) {
        expect(v_id).assertEqual(1)
        check_value_2(v, v_id)
        expect(v).assertEqual("In Progress")
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        check_value_2(v, v_id)
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        expect(check_value_from_type_T_2(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_2(v, v_id)
        expect(v).assertEqual("Done")
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        if (check_value_from_type_T_2(v)) {
          expect(typeof v === 'string' || typeof v === 'number').assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_2(v, v_id)
      expect(v).assertEqual("On Review")
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      if (check_value_from_type_T_2(v)) {
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2("In Progress", 1)
    let res2: boolean = check_is_in_T_type_2("Done", 2)
    let res3: boolean = check_is_in_T_type_2("On Review", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_2 {
  function check_value_from_type_I1_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number'
    } else {
      return false
    }
  }

  function check_value_from_type_I2_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number' || v === "Investigating"
    } else {
      return false
    }
  }

  function check_value_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual(123)
      expect(v).assertEqual(123)
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }

  function check_is_in_T_type_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_2(v, v_id)
    if (check_value_from_type_I1_2(v)) {
      check_value_2(v, v_id)
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      check_value_2(v, v_id)
      if (check_value_from_type_I2_2(v)) {
        expect(v_id).assertEqual(1)
        check_value_2(v, v_id)
        expect(v).assertEqual(123)
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        check_value_2(v, v_id)
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        expect(check_value_from_type_T_2(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_2(v, v_id)
        expect(v).assertEqual("Done")
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        if (check_value_from_type_T_2(v)) {
          expect(typeof v === 'string' || typeof v === 'number').assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_2(v, v_id)
      expect(v).assertEqual("On Review")
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      if (check_value_from_type_T_2(v)) {
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2(123, 1)
    let res2: boolean = check_is_in_T_type_2("Done", 2)
    let res3: boolean = check_is_in_T_type_2("On Review", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS3_2 {
  function check_value_from_type_I1_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number'
    } else {
      return false
    }
  }

  function check_value_from_type_I2_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review" || typeof v === 'bigint'
    } else {
      return false
    }
  }

  function check_value_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress")
      expect(v).assertEqual("In Progress")
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }
  function check_is_in_T_type_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_2(v, v_id)
    if (check_value_from_type_I1_2(v)) {
      check_value_2(v, v_id)
      let typeCheck1: boolean = typeof v === 'string' || typeof v === 'number'
      expect(typeCheck1).assertTrue()
      check_value_2(v, v_id)
      if (check_value_from_type_I2_2(v)) {
        expect(v_id).assertEqual(1)
        check_value_2(v, v_id)
        expect(v).assertEqual("In Progress")
        let typeCheck2: boolean = typeof v === 'string' || typeof v === 'number'
        expect(typeCheck2).assertTrue()
        let typeCheck3: boolean = typeof v === 'string' || typeof v === 'number'
        expect(typeCheck3).assertTrue()
        check_value_2(v, v_id)
        let typeCheck4: boolean = typeof v === 'string' || typeof v === 'number'
        expect(typeCheck4).assertTrue()
        expect(check_value_from_type_T_2(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_2(v, v_id)
        expect(v).assertEqual("Done")
        let typeCheck5: boolean = typeof v === 'string' || typeof v === 'number'
        expect(typeCheck5).assertTrue()
        if (check_value_from_type_T_2(v)) {
          let typeCheck6: boolean = typeof v === 'string' || typeof v === 'number'
          expect(typeCheck6).assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_2(v, v_id)
      expect(v).assertEqual("On Review")
      let typeCheck7: boolean = typeof v === 'string' || typeof v === 'number'
      expect(typeCheck7).assertTrue()
      if (check_value_from_type_T_2(v)) {
        let typeCheck8: boolean = typeof v === 'string' || typeof v === 'number'
        expect(typeCheck8).assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2("In Progress", 1)
    let res2: boolean = check_is_in_T_type_2("Done", 2)
    let res3: boolean = check_is_in_T_type_2("On Review", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS4_2 {
  function check_value_from_type_I1_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number'
    } else {
      return false
    }
  }

  function check_value_from_type_I2_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review" || typeof v === 'bigint'
    } else {
      return false
    }
  }

  function check_value_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual(123)
      expect(v).assertEqual(123)
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }
  function check_is_in_T_type_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_2(v, v_id)
    if (check_value_from_type_I1_2(v)) {
      check_value_2(v, v_id)
      let typeCheck1: boolean = typeof v === 'string' || typeof v === 'number'
      expect(typeCheck1).assertTrue()
      check_value_2(v, v_id)
      if (check_value_from_type_I2_2(v)) {
        expect(v_id).assertEqual(1)
        check_value_2(v, v_id)
        expect(v).assertEqual(123)
        let typeCheck2: boolean = typeof v === 'string' || typeof v === 'number'
        expect(typeCheck2).assertTrue()
        let typeCheck3: boolean = typeof v === 'string' || typeof v === 'number'
        expect(typeCheck3).assertTrue()
        check_value_2(v, v_id)
        let typeCheck4: boolean = typeof v === 'string' || typeof v === 'number'
        expect(typeCheck4).assertTrue()
        expect(check_value_from_type_T_2(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_2(v, v_id)
        expect(v).assertEqual("Done")
        let typeCheck5: boolean = typeof v === 'string' || typeof v === 'number'
        expect(typeCheck5).assertTrue()
        if (check_value_from_type_T_2(v)) {
          let typeCheck6: boolean = typeof v === 'string' || typeof v === 'number'
          expect(typeCheck6).assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_2(v, v_id)
      expect(v).assertEqual("On Review")
      let typeCheck7: boolean = typeof v === 'string' || typeof v === 'number'
      expect(typeCheck7).assertTrue()
      if (check_value_from_type_T_2(v)) {
        let typeCheck8: boolean = typeof v === 'string' || typeof v === 'number'
        expect(typeCheck8).assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2(123, 1)
    let res2: boolean = check_is_in_T_type_2("Done", 2)
    let res3: boolean = check_is_in_T_type_2("On Review", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS5_2 {
  function check_value_from_type_I1_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number'
    } else {
      return false
    }
  }

  function check_value_from_type_I2_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_2(v: Any): boolean {
    return true
  }

  function check_value_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress")
      expect(v).assertEqual("In Progress")
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }

  function check_is_in_T_type_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_2(v, v_id)
    if (check_value_from_type_I1_2(v)) {
      check_value_2(v, v_id)
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      check_value_2(v, v_id)
      if (check_value_from_type_I2_2(v)) {
        expect(v_id).assertEqual(1)
        check_value_2(v, v_id)
        expect(v).assertEqual("In Progress")
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        check_value_2(v, v_id)
        expect(true).assertTrue()
        expect(check_value_from_type_T_2(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_2(v, v_id)
        expect(v).assertEqual("Done")
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        if (check_value_from_type_T_2(v)) {
          expect(true).assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_2(v, v_id)
      expect(v).assertEqual("On Review")
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      if (check_value_from_type_T_2(v)) {
        expect(true).assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2("In Progress", 1)
    let res2: boolean = check_is_in_T_type_2("Done", 2)
    let res3: boolean = check_is_in_T_type_2("On Review", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS6_2 {
  function check_value_from_type_I1_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number'
    } else {
      return false
    }
  }

  function check_value_from_type_I2_2(v: Any): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_2(v: Any): boolean {
    return true
  }

  function check_value_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual(123)
      expect(v).assertEqual(123)
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }

  function check_is_in_T_type_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_2(v, v_id)
    if (check_value_from_type_I1_2(v)) {
      check_value_2(v, v_id)
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      check_value_2(v, v_id)
      if (check_value_from_type_I2_2(v)) {
        expect(v_id).assertEqual(1)
        check_value_2(v, v_id)
        expect(v).assertEqual(123)
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        check_value_2(v, v_id)
        expect(true).assertTrue()
        expect(check_value_from_type_T_2(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_2(v, v_id)
        expect(v).assertEqual("Done")
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        if (check_value_from_type_T_2(v)) {
          expect(true).assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_2(v, v_id)
      expect(v).assertEqual("On Review")
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      if (check_value_from_type_T_2(v)) {
        expect(true).assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2(123, 1)
    let res2: boolean = check_is_in_T_type_2("Done", 2)
    let res3: boolean = check_is_in_T_type_2("On Review", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

function check_value_from_type_I1_3(v: Any): boolean {
  if (typeof v === 'string' || typeof v === 'number') {
    return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number'
  } else {
    return false
  }
}

function check_value_from_type_I2_3(v: Any): boolean {
  if (typeof v === 'string' || typeof v === 'number') {
    return typeof v === 'number' || v === "In Progress" || v === "On Review"
  } else {
    return false
  }
}

function check_value_from_type_T_3(v: Any): boolean {
  if (typeof v === 'string' || typeof v === 'number') {
    return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number' || v === "Investigating"
  } else {
    return false
  }
}

function check_value_3(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
  if (v_id == 1) {
    expect(v).assertEqual("In Progress")
    expect(v).assertEqual("In Progress")
  } else if (v_id == 2) {
    expect(v).assertEqual("Done")
  } else {
    expect(v).assertEqual("On Review")
  }
}

function check_is_in_T_type_3(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
  check_value_3(v, v_id)
  if (check_value_from_type_I1_3(v)) {
    check_value_3(v, v_id)
    expect(typeof v === 'string' || typeof v === 'number').assertTrue()
    check_value_3(v, v_id)
    if (check_value_from_type_I2_3(v)) {
      expect(v_id).assertEqual(1)
      check_value_3(v, v_id)
      expect(v).assertEqual("In Progress")
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      check_value_3(v, v_id)
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      expect(check_value_from_type_T_3(v)).assertTrue()
      return true
    } else {
      expect(v_id).assertEqual(2)
      check_value_3(v, v_id)
      expect(v).assertEqual("Done")
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      if (check_value_from_type_T_3(v)) {
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        return true
      } else {
        return false
      }
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_3(v, v_id)
    expect(v).assertEqual("On Review")
    expect(typeof v === 'string' || typeof v === 'number').assertTrue()
    if (check_value_from_type_T_3(v)) {
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_3 {
  function check_value_from_type_I1_3(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "Done" || v === "In Progress"
    } else {
      return false
    }
  }

  function check_value_from_type_I2_3(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_3(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "Done" || v === "In Progress" || v === "Investigating"
    } else {
      return false
    }
  }

  function check_value_3(v: "Done" | "In Progress" | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress")
      expect(v).assertEqual("In Progress")
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }

  function check_is_in_T_type_3(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
    check_value_3(v, v_id)
    if (check_value_from_type_I1_3(v)) {
      check_value_3(v, v_id)
      expect(typeof v === 'string').assertTrue()
      if (typeof v === 'string') {
        check_value_3(v, v_id)
      }
      if (check_value_from_type_I2_3(v)) {
        expect(v_id).assertEqual(1)
        check_value_3(v, v_id)
        expect(v).assertEqual("In Progress")
        expect(typeof v === 'string').assertTrue()
        expect(typeof v === 'string').assertTrue()
        if (typeof v === 'string') {
          check_value_3(v, v_id)
        }
        expect(typeof v === 'string').assertTrue()
        expect(check_value_from_type_T_3(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_3(v, v_id)
        expect(v).assertEqual("Done")
        expect(typeof v === 'string').assertTrue()
        if (check_value_from_type_T_3(v)) {
          expect(typeof v === 'string').assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_3(v, v_id)
      expect(v).assertEqual("On Review")
      expect(typeof v === 'string').assertTrue()
      if (check_value_from_type_T_3(v)) {
        expect(typeof v === 'string').assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_3(): boolean {
    let res1: boolean = check_is_in_T_type_3("In Progress", 1)
    let res2: boolean = check_is_in_T_type_3("Done", 2)
    let res3: boolean = check_is_in_T_type_3("On Review", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_3 {
  function check_value_from_type_I1_3(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "Done" || v === "In Progress"
    } else {
      return false
    }
  }

  function check_value_from_type_I2_3(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_3(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "In Progress" || v === "On Review" || typeof v === 'bigint'
    } else {
      return false
    }
  }

  function check_value_3(v: "Done" | "In Progress" | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress")
      expect(v).assertEqual("In Progress")
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }

  function check_is_in_T_type_3(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
    check_value_3(v, v_id)
    if (check_value_from_type_I1_3(v)) {
      check_value_3(v, v_id)
      expect(typeof v === 'string').assertTrue()
      if (typeof v === 'string') {
        check_value_3(v, v_id)
      }
      if (check_value_from_type_I2_3(v)) {
        expect(v_id).assertEqual(1)
        check_value_3(v, v_id)
        expect(v).assertEqual("In Progress")
        expect(typeof v === 'string').assertTrue()
        expect(typeof v === 'string').assertTrue()
        if (typeof v === 'string') {
          check_value_3(v, v_id)
        }
        expect(typeof v === 'string' || typeof v === 'bigint').assertTrue()
        expect(check_value_from_type_T_3(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_3(v, v_id)
        expect(v).assertEqual("Done")
        expect(typeof v === 'string').assertTrue()
        if (check_value_from_type_T_3(v)) {
          expect(typeof v === 'string' || typeof v === 'bigint').assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_3(v, v_id)
      expect(v).assertEqual("On Review")
      expect(typeof v === 'string').assertTrue()
      if (check_value_from_type_T_3(v)) {
        expect(typeof v === 'string' || typeof v === 'bigint').assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_3(): boolean {
    let res1: boolean = check_is_in_T_type_3("In Progress", 1)
    let res2: boolean = check_is_in_T_type_3("Done", 2)
    let res3: boolean = check_is_in_T_type_3("On Review", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS3_3 {
  function check_value_from_type_I1_3(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "Done" || v === "In Progress"
    } else {
      return false
    }
  }

  function check_value_from_type_I2_3(v: Any): boolean {
    if (typeof v === 'string') {
      return v === "In Progress" || v === "On Review"
    } else {
      return false
    }
  }

  function check_value_from_type_T_3(v: Any): boolean {
    return true
  }

  function check_value_3(v: "Done" | "In Progress" | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress")
      expect(v).assertEqual("In Progress")
    } else if (v_id == 2) {
      expect(v).assertEqual("Done")
    } else {
      expect(v).assertEqual("On Review")
    }
  }

  function check_is_in_T_type_3(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
    check_value_3(v, v_id)
    if (check_value_from_type_I1_3(v)) {
      check_value_3(v, v_id)
      expect(typeof v === 'string').assertTrue()
      if (typeof v === 'string') {
        check_value_3(v, v_id)
      }
      if (check_value_from_type_I2_3(v)) {
        expect(v_id).assertEqual(1)
        check_value_3(v, v_id)
        expect(v).assertEqual("In Progress")
        expect(typeof v === 'string').assertTrue()
        expect(typeof v === 'string').assertTrue()
        if (typeof v === 'string') {
          check_value_3(v, v_id)
        }
        expect(true).assertTrue()
        expect(check_value_from_type_T_3(v)).assertTrue()
        return true
      } else {
        expect(v_id).assertEqual(2)
        check_value_3(v, v_id)
        expect(v).assertEqual("Done")
        expect(typeof v === 'string').assertTrue()
        if (check_value_from_type_T_3(v)) {
          expect(true).assertTrue()
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_3(v, v_id)
      expect(v).assertEqual("On Review")
      expect(typeof v === 'string').assertTrue()
      if (check_value_from_type_T_3(v)) {
        expect(true).assertTrue()
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_3(): boolean {
    let res1: boolean = check_is_in_T_type_3("In Progress", 1)
    let res2: boolean = check_is_in_T_type_3("Done", 2)
    let res3: boolean = check_is_in_T_type_3("On Review", 3)
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

function check_value_from_type_I1_5(v: Any): boolean {
  if (typeof v === 'string' || typeof v === 'number') {
    return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number'
  } else {
    return false
  }
}

function check_value_from_type_I2_5(v: Any): boolean {
  if (typeof v === 'string' || typeof v === 'number') {
    return typeof v === 'number' || v === "In Progress" || v === "On Review"
  } else {
    return false
  }
}

function check_value_from_type_T_5(v: Any): boolean {
  if (typeof v === 'string' || typeof v === 'number') {
    return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number' || v === "Investigating"
  } else {
    return false
  }
}

function check_value_5(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
  if (v_id == 1) {
    expect(v).assertEqual("In Progress")
    expect(v).assertEqual("In Progress")
  } else if (v_id == 2) {
    expect(v).assertEqual("Done")
  } else {
    expect(v).assertEqual("On Review")
  }
}

function check_is_in_T_type_5(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
  check_value_5(v, v_id)
  if (check_value_from_type_I1_5(v)) {
    check_value_5(v, v_id)
    expect(typeof v === 'string' || typeof v === 'number').assertTrue()
    if (typeof v === 'string' || typeof v === 'number') {
      check_value_5(v, v_id)
    }
    if (check_value_from_type_I2_5(v)) {
      expect(v_id).assertEqual(1)
      check_value_5(v, v_id)
      expect(v).assertEqual("In Progress")
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      if (typeof v === 'string' || typeof v === 'number') {
        check_value_5(v, v_id)
      }
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      expect(check_value_from_type_T_5(v)).assertTrue()
      return true
    } else {
      expect(v_id).assertEqual(2)
      check_value_5(v, v_id)
      expect(v).assertEqual("Done")
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      if (check_value_from_type_T_5(v)) {
        expect(typeof v === 'string' || typeof v === 'number').assertTrue()
        return true
      } else {
        return false
      }
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_5(v, v_id)
    expect(v).assertEqual("On Review")
    expect(typeof v === 'string' || typeof v === 'number').assertTrue()
    if (check_value_from_type_T_5(v)) {
      expect(typeof v === 'string' || typeof v === 'number').assertTrue()
      return true
    } else {
      return false
    }
  }
}

export default function InterTypeIsSubOfTypeTOnStrLit1Test(): void {
  describe('InterTypeIsSubOfTypeTOnStrLit1Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep_1(30);
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_STR_LIT1_0100
     * @tc.name      testInterTypeIsSubOfTypeTOnStrLit0001
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on literal union
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnStrLit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnStrLit0001';

      let res1: boolean = check_is_in_T_type_2("In Progress", 1)
      let res2: boolean = check_is_in_T_type_2("Done", 2)
      let res3: boolean = check_is_in_T_type_2("On Review", 3)
      expect(res1 && (res2 || res3)).assertTrue()
      expect(testNS1_1.runTest_1()).assertTrue()
      expect(testNS2_1.runTest_1()).assertTrue()
      expect(testNS3_1.runTest_1()).assertTrue()
    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_STR_LIT1_0200
     * @tc.name      testInterTypeIsSubOfTypeTOnStrLit0002
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on literal union
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnStrLit0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnStrLit0002';

      let res1: boolean = check_is_in_T_type_2("In Progress", 1)
      let res2: boolean = check_is_in_T_type_2("Done", 2)
      let res3: boolean = check_is_in_T_type_2("On Review", 3)
      expect(res1 && (res2 || res3)).assertTrue()
      expect(testNS1_2.runTest_2()).assertTrue()
      expect(testNS2_2.runTest_2()).assertTrue()
      expect(testNS3_2.runTest_2()).assertTrue()
      expect(testNS4_2.runTest_2()).assertTrue()
      expect(testNS5_2.runTest_2()).assertTrue()
      expect(testNS6_2.runTest_2()).assertTrue()
    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_STR_LIT1_0300
     * @tc.name      testInterTypeIsSubOfTypeTOnStrLit0003
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on literal union
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnStrLit0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnStrLit0003';

      let res1: boolean = check_is_in_T_type_4("In Progress", 1)
      let res2: boolean = check_is_in_T_type_4("Done", 2)
      let res3: boolean = check_is_in_T_type_4("On Review", 3)
      expect(res1 && (res2 || res3)).assertTrue()
      expect(testNS1_3.runTest_3()).assertTrue()
      expect(testNS2_3.runTest_3()).assertTrue()
      expect(testNS3_3.runTest_3()).assertTrue()
    });

  })
}