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

class Neg<T extends number> {
  constructor(x: T) {}
}

class Pos<T extends number> {
  constructor(x: T) {}
}

namespace testNS1_2_0 {
  function check_value_from_type_I1_2_0(v: Object): boolean {
    if (typeof v === 'string') {
      return v === "Done" || v === "In Progress";
    } else {
      return false;
    }
  }

  function check_value_from_type_I2_2_0(v: Object): boolean {
    if (typeof v === 'string') {
      return v === "In Progress" || v === "On Review";
    } else {
      return false;
    }
  }

  function check_value_from_type_T_2_0(v: Object): boolean {
    if (typeof v === 'string') {
      return v === "Done" || v === "In Progress" || v === "Investigating";
    } else {
      return false;
    }
  }

  function check_value_2_0(v: "Done" | "In Progress" | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress");
      expect(v).assertEqual("In Progress");
    } else if (v_id == 2) {
      expect(v).assertEqual("Done");
    } else {
      expect(v).assertEqual("On Review");
    }
  }

  function check_is_in_T_type_2_0(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
    check_value_2_0(v, v_id);
    if (check_value_from_type_I1_2_0(v)) {
      check_value_2_0(v, v_id);
      expect(typeof v === 'string').assertTrue();
      if (typeof v === 'string') {
        check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
      }
      if (check_value_from_type_I2_2_0(v)) {
        expect(v_id).assertEqual(1);
        check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
        expect(v).assertEqual("In Progress");
        expect(typeof v === 'string').assertTrue();
        if (typeof v === 'string') {
          check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
        }
        expect(typeof v === 'string').assertTrue();
        expect(check_value_from_type_T_2_0(v)).assertTrue();
        expect(check_value_from_type_T_2_0(v)).assertTrue();
        expect(typeof v === 'string').assertTrue();
        expect(check_value_from_type_I1_2_0(v) || check_value_from_type_I2_2_0(v)).assertTrue();
        check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
        return true;
      } else {
        expect(v_id).assertEqual(2);
        check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
        expect(v).assertEqual("Done");
        expect(typeof v === 'string').assertTrue();
        if (check_value_from_type_T_2_0(v)) {
          expect(typeof v === 'string').assertTrue();
          expect(check_value_from_type_T_2_0(v)).assertTrue();
          expect(typeof v === 'string').assertTrue();
          expect(check_value_from_type_I1_2_0(v) || check_value_from_type_I2_2_0(v)).assertTrue();
          check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
          return true;
        } else {
          return false;
        }
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_2_0(v, v_id);
      expect(v).assertEqual("On Review");
      expect(typeof v === 'string').assertTrue();
      if (check_value_from_type_T_2_0(v)) {
        expect(typeof v === 'string').assertTrue();
        expect(check_value_from_type_T_2_0(v)).assertTrue();
        expect(typeof v === 'string').assertTrue();
        expect(check_value_from_type_I1_2_0(v) || check_value_from_type_I2_2_0(v)).assertTrue();
        check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2_0(): boolean {
    let res1: boolean = check_is_in_T_type_2_0("In Progress", 1);
    let res2: boolean = check_is_in_T_type_2_0("Done", 2);
    let res3: boolean = check_is_in_T_type_2_0("On Review", 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

namespace testNS2_2_0 {
  function check_value_from_type_I1_2_0(v: Object): boolean {
    if (typeof v === 'string') {
      return v === "Done" || v === "In Progress";
    } else {
      return false;
    }
  }

  function check_value_from_type_I2_2_0(v: Object): boolean {
    if (typeof v === 'string') {
      return v === "In Progress" || v === "On Review";
    } else {
      return false;
    }
  }

  function check_value_from_type_T_2_0(v: Object): boolean {
    return true;
  }

  function check_value_2_0(v: "Done" | "In Progress" | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress");
      expect(v).assertEqual("In Progress");
    } else if (v_id == 2) {
      expect(v).assertEqual("Done");
    } else {
      expect(v).assertEqual("On Review");
    }
  }

  function check_is_in_T_type_2_0(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
    check_value_2_0(v, v_id);
    if (check_value_from_type_I1_2_0(v)) {
      check_value_2_0(v, v_id);
      expect(typeof v === 'string').assertTrue();
      if (typeof v === 'string') {
        check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
      }
      if (check_value_from_type_I2_2_0(v)) {
        expect(v_id).assertEqual(1);
        check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
        expect(v).assertEqual("In Progress");
        expect(typeof v === 'string').assertTrue();
        if (typeof v === 'string') {
          check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
        }
        expect(check_value_from_type_T_2_0(v)).assertTrue();
        expect(check_value_from_type_T_2_0(v)).assertTrue();
        expect(typeof v === 'string').assertTrue();
        expect(check_value_from_type_I1_2_0(v) || check_value_from_type_I2_2_0(v)).assertTrue();
        check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
        return true;
      } else {
        expect(v_id).assertEqual(2);
        check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
        expect(v).assertEqual("Done");
        expect(typeof v === 'string').assertTrue();
        if (check_value_from_type_T_2_0(v)) {
          expect(check_value_from_type_T_2_0(v)).assertTrue();
          expect(typeof v === 'string').assertTrue();
          expect(check_value_from_type_I1_2_0(v) || check_value_from_type_I2_2_0(v)).assertTrue();
          check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
          return true;
        } else {
          return false;
        }
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_2_0(v, v_id);
      expect(v).assertEqual("On Review");
      expect(typeof v === 'string').assertTrue();
      if (check_value_from_type_T_2_0(v)) {
        expect(check_value_from_type_T_2_0(v)).assertTrue();
        expect(typeof v === 'string').assertTrue();
        expect(check_value_from_type_I1_2_0(v) || check_value_from_type_I2_2_0(v)).assertTrue();
        check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2_0(): boolean {
    let res1: boolean = check_is_in_T_type_2_0("In Progress", 1);
    let res2: boolean = check_is_in_T_type_2_0("Done", 2);
    let res3: boolean = check_is_in_T_type_2_0("On Review", 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

function check_value_from_type_I1_2_0(v: Object): boolean {
  if (typeof v === 'string') {
    return v === "Done" || v === "In Progress";
  } else {
    return false;
  }
}

function check_value_from_type_I2_2_0(v: Object): boolean {
  if (typeof v === 'string') {
    return v === "In Progress" || v === "On Review";
  } else {
    return false;
  }
}

function check_value_from_type_T_2_0(v: Object): boolean {
  if (typeof v === 'string') {
    return v === "Done" || v === "In Progress" || v === "Investigating";
  } else {
    return false;
  }
}

function check_value_2_0(v: "Done" | "In Progress" | "On Review", v_id: number): void {
  if (v_id == 1) {
    expect(v).assertEqual("In Progress");
    expect(v).assertEqual("In Progress");
  } else if (v_id == 2) {
    expect(v).assertEqual("Done");
  } else {
    expect(v).assertEqual("On Review");
  }
}

function check_is_in_T_type_2_0(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
  check_value_2_0(v, v_id);
  if (check_value_from_type_I1_2_0(v)) {
    check_value_2_0(v, v_id);
    expect(typeof v === 'string').assertTrue();
    if (typeof v === 'string') {
      check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
    }
    if (check_value_from_type_I2_2_0(v)) {
      expect(v_id).assertEqual(1);
      check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
      expect(v).assertEqual("In Progress");
      expect(typeof v === 'string').assertTrue();
      if (typeof v === 'string') {
        check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
      }
      expect(typeof v === 'string').assertTrue();
      expect(check_value_from_type_T_2_0(v)).assertTrue();
      expect(check_value_from_type_T_2_0(v)).assertTrue();
      expect(typeof v === 'string').assertTrue();
      expect(check_value_from_type_I1_2_0(v) || check_value_from_type_I2_2_0(v)).assertTrue();
      check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
      return true;
    } else {
      expect(v_id).assertEqual(2);
      check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
      expect(v).assertEqual("Done");
      expect(typeof v === 'string').assertTrue();
      if (check_value_from_type_T_2_0(v)) {
        expect(typeof v === 'string').assertTrue();
        expect(check_value_from_type_T_2_0(v)).assertTrue();
        expect(typeof v === 'string').assertTrue();
        expect(check_value_from_type_I1_2_0(v) || check_value_from_type_I2_2_0(v)).assertTrue();
        check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
        return true;
      } else {
        return false;
      }
    }
  } else {
    expect(v_id).assertEqual(3);
    check_value_2_0(v, v_id);
    expect(v).assertEqual("On Review");
    expect(typeof v === 'string').assertTrue();
    if (check_value_from_type_T_2_0(v)) {
      expect(typeof v === 'string').assertTrue();
      expect(check_value_from_type_T_2_0(v)).assertTrue();
      expect(typeof v === 'string').assertTrue();
      expect(check_value_from_type_I1_2_0(v) || check_value_from_type_I2_2_0(v)).assertTrue();
      check_value_2_0(v as "Done" | "In Progress" | "On Review", v_id);
      return true;
    } else {
      return false;
    }
  }
}

namespace testNS1_2_1 {
  function check_value_from_type_I1_2_1(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number';
    } else {
      return false;
    }
  }

  function check_value_from_type_I2_2_1(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review";
    } else {
      return false;
    }
  }

  function check_value_from_type_T_2_1(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number' || v === "Investigating";
    } else {
      return false;
    }
  }

  function check_value_2_1(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress");
      expect(v).assertEqual("In Progress");
    } else if (v_id == 2) {
      expect(v).assertEqual("Done");
    } else {
      expect(v).assertEqual("On Review");
    }
  }

  function check_is_in_T_type_2_1(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_2_1(v, v_id);
    if (check_value_from_type_I1_2_1(v)) {
      check_value_2_1(v, v_id);
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (typeof v === 'string' || typeof v === 'number') {
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      }
      if (check_value_from_type_I2_2_1(v)) {
        expect(v_id).assertEqual(1);
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        expect(v).assertEqual("In Progress");
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        if (typeof v === 'string' || typeof v === 'number') {
          check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        }
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        return true;
      } else {
        expect(v_id).assertEqual(2);
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        expect(v).assertEqual("Done");
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        if (check_value_from_type_T_2_1(v)) {
          expect(typeof v === 'string' || typeof v === 'number').assertTrue();
          expect(check_value_from_type_T_2_1(v)).assertTrue();
          expect(typeof v === 'string' || typeof v === 'number').assertTrue();
          expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
          check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
          return true;
        } else {
          return false;
        }
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_2_1(v, v_id);
      expect(v).assertEqual("On Review");
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (check_value_from_type_T_2_1(v)) {
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2_1(): boolean {
    let res1: boolean = check_is_in_T_type_2_1("In Progress", 1);
    let res2: boolean = check_is_in_T_type_2_1("Done", 2);
    let res3: boolean = check_is_in_T_type_2_1("On Review", 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

namespace testNS2_2_1 {
  function check_value_from_type_I1_2_1(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number';
    } else {
      return false;
    }
  }

  function check_value_from_type_I2_2_1(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review";
    } else {
      return false;
    }
  }

  function check_value_from_type_T_2_1(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number' || v === "Investigating";
    } else {
      return false;
    }
  }

  function check_value_2_1(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual(123);
      expect(v).assertEqual(123);
    } else if (v_id == 2) {
      expect(v).assertEqual("Done");
    } else {
      expect(v).assertEqual("On Review");
    }
  }

  function check_is_in_T_type_2_1(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_2_1(v, v_id);
    if (check_value_from_type_I1_2_1(v)) {
      check_value_2_1(v, v_id);
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (typeof v === 'string' || typeof v === 'number') {
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      }
      if (check_value_from_type_I2_2_1(v)) {
        expect(v_id).assertEqual(1);
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        expect(v).assertEqual(123);
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        if (typeof v === 'string' || typeof v === 'number') {
          check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        }
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        return true;
      } else {
        expect(v_id).assertEqual(2);
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        expect(v).assertEqual("Done");
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        if (check_value_from_type_T_2_1(v)) {
          expect(typeof v === 'string' || typeof v === 'number').assertTrue();
          expect(check_value_from_type_T_2_1(v)).assertTrue();
          expect(typeof v === 'string' || typeof v === 'number').assertTrue();
          expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
          check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
          return true;
        } else {
          return false;
        }
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_2_1(v, v_id);
      expect(v).assertEqual("On Review");
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (check_value_from_type_T_2_1(v)) {
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2_1(): boolean {
    let res1: boolean = check_is_in_T_type_2_1(123, 1);
    let res2: boolean = check_is_in_T_type_2_1("Done", 2);
    let res3: boolean = check_is_in_T_type_2_1("On Review", 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

namespace testNS3_2_1 {
  function check_value_from_type_I1_2_1(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number';
    } else {
      return false;
    }
  }

  function check_value_from_type_I2_2_1(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review";
    } else {
      return false;
    }
  }

  function check_value_from_type_T_2_1(v: Object): boolean {
    return true;
  }

  function check_value_2_1(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual("In Progress");
      expect(v).assertEqual("In Progress");
    } else if (v_id == 2) {
      expect(v).assertEqual("Done");
    } else {
      expect(v).assertEqual("On Review");
    }
  }

  function check_is_in_T_type_2_1(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_2_1(v, v_id);
    if (check_value_from_type_I1_2_1(v)) {
      check_value_2_1(v, v_id);
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (typeof v === 'string' || typeof v === 'number') {
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      }
      if (check_value_from_type_I2_2_1(v)) {
        expect(v_id).assertEqual(1);
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        expect(v).assertEqual("In Progress");
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        if (typeof v === 'string' || typeof v === 'number') {
          check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        }
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        return true;
      } else {
        expect(v_id).assertEqual(2);
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        expect(v).assertEqual("Done");
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        if (check_value_from_type_T_2_1(v)) {
          expect(check_value_from_type_T_2_1(v)).assertTrue();
          expect(typeof v === 'string' || typeof v === 'number').assertTrue();
          expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
          check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
          return true;
        } else {
          return false;
        }
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_2_1(v, v_id);
      expect(v).assertEqual("On Review");
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (check_value_from_type_T_2_1(v)) {
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2_1(): boolean {
    let res1: boolean = check_is_in_T_type_2_1("In Progress", 1);
    let res2: boolean = check_is_in_T_type_2_1("Done", 2);
    let res3: boolean = check_is_in_T_type_2_1("On Review", 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

namespace testNS4_2_1 {
  function check_value_from_type_I1_2_1(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number';
    } else {
      return false;
    }
  }

  function check_value_from_type_I2_2_1(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review";
    } else {
      return false;
    }
  }

  function check_value_from_type_T_2_1(v: Object): boolean {
    return true;
  }

  function check_value_2_1(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v).assertEqual(123);
      expect(v).assertEqual(123);
    } else if (v_id == 2) {
      expect(v).assertEqual("Done");
    } else {
      expect(v).assertEqual("On Review");
    }
  }

  function check_is_in_T_type_2_1(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_2_1(v, v_id);
    if (check_value_from_type_I1_2_1(v)) {
      check_value_2_1(v, v_id);
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (typeof v === 'string' || typeof v === 'number') {
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      }
      if (check_value_from_type_I2_2_1(v)) {
        expect(v_id).assertEqual(1);
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        expect(v).assertEqual(123);
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        if (typeof v === 'string' || typeof v === 'number') {
          check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        }
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        return true;
      } else {
        expect(v_id).assertEqual(2);
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        expect(v).assertEqual("Done");
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        if (check_value_from_type_T_2_1(v)) {
          expect(check_value_from_type_T_2_1(v)).assertTrue();
          expect(typeof v === 'string' || typeof v === 'number').assertTrue();
          expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
          check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
          return true;
        } else {
          return false;
        }
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_2_1(v, v_id);
      expect(v).assertEqual("On Review");
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (check_value_from_type_T_2_1(v)) {
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2_1(): boolean {
    let res1: boolean = check_is_in_T_type_2_1(123, 1);
    let res2: boolean = check_is_in_T_type_2_1("Done", 2);
    let res3: boolean = check_is_in_T_type_2_1("On Review", 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

function check_value_from_type_I1_2_1(v: Object): boolean {
  if (typeof v === 'string' || typeof v === 'number') {
    return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number';
  } else {
    return false;
  }
}

function check_value_from_type_I2_2_1(v: Object): boolean {
  if (typeof v === 'string' || typeof v === 'number') {
    return typeof v === 'number' || v === "In Progress" || v === "On Review";
  } else {
    return false;
  }
}

function check_value_from_type_T_2_1(v: Object): boolean {
  if (typeof v === 'string' || typeof v === 'number') {
    return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number' || v === "Investigating";
  } else {
    return false;
  }
}

function check_value_2_1(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
  if (v_id == 1) {
    expect(v).assertEqual("In Progress");
    expect(v).assertEqual("In Progress");
  } else if (v_id == 2) {
    expect(v).assertEqual("Done");
  } else {
    expect(v).assertEqual("On Review");
  }
}

function check_is_in_T_type_2_1(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
  check_value_2_1(v, v_id);
  if (check_value_from_type_I1_2_1(v)) {
    check_value_2_1(v, v_id);
    expect(typeof v === 'string' || typeof v === 'number').assertTrue();
    if (typeof v === 'string' || typeof v === 'number') {
      check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
    }
    if (check_value_from_type_I2_2_1(v)) {
      expect(v_id).assertEqual(1);
      check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      expect(v).assertEqual("In Progress");
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (typeof v === 'string' || typeof v === 'number') {
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      }
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      expect(check_value_from_type_T_2_1(v)).assertTrue();
      expect(check_value_from_type_T_2_1(v)).assertTrue();
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
      check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      return true;
    } else {
      expect(v_id).assertEqual(2);
      check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      expect(v).assertEqual("Done");
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (check_value_from_type_T_2_1(v)) {
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_T_2_1(v)).assertTrue();
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
        check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        return true;
      } else {
        return false;
      }
    }
  } else {
    expect(v_id).assertEqual(3);
    check_value_2_1(v, v_id);
    expect(v).assertEqual("On Review");
    expect(typeof v === 'string' || typeof v === 'number').assertTrue();
    if (check_value_from_type_T_2_1(v)) {
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      expect(check_value_from_type_T_2_1(v)).assertTrue();
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      expect(check_value_from_type_I1_2_1(v) || check_value_from_type_I2_2_1(v)).assertTrue();
      check_value_2_1(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      return true;
    } else {
      return false;
    }
  }
}



export default function InterTypeIsSubOfTypeTOnStrLit2Test(): void {
  describe('InterTypeIsSubOfTypeTOnStrLit2Test', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_STR_LIT2_0100
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

      let res1: boolean = check_is_in_T_type_2_0("In Progress", 1)
      let res2: boolean = check_is_in_T_type_2_0("Done", 2)
      let res3: boolean = check_is_in_T_type_2_0("On Review", 3)
      expect(res1 && (res2 || res3)).assertTrue()
      expect(testNS1_2_0.runTest_2_0()).assertTrue()
      expect(testNS2_2_0.runTest_2_0()).assertTrue()
    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_STR_LIT2_0200
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

      let res1: boolean = check_is_in_T_type_2_1("In Progress", 1)
      let res2: boolean = check_is_in_T_type_2_1("Done", 2)
      let res3: boolean = check_is_in_T_type_2_1("On Review", 3)
      expect(res1 && (res2 || res3)).assertTrue()
      expect(testNS1_2_1.runTest_2_1()).assertTrue()
      expect(testNS2_2_1.runTest_2_1()).assertTrue()
      expect(testNS3_2_1.runTest_2_1()).assertTrue()
      expect(testNS4_2_1.runTest_2_1()).assertTrue()
    });
  })
}