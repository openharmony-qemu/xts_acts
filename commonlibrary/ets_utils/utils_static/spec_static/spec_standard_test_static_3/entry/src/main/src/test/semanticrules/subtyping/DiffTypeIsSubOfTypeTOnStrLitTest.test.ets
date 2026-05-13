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

namespace testNS1_1 {
  function check_value_from_type_A_1(v: Any): boolean {
    if (v instanceof string) {
      return v === "Done" ||
        v === "In Progress" ||
        v === "On Review";
    } else {
      return false;
    }
  }

  function check_value_from_type_T_1(v: Any): boolean {
    if (v instanceof string) {
      return v === "Done" ||
        v === "In Progress" ||
        v === "On Review" ||
        v === "Investigating";
    } else {
      return false;
    }
  }

  function foo_1(v: "Done" | "In Progress" | "On Review" | "Investigating"): void {
    expect(check_value_from_type_A_1(v)).assertEqual(true);
  }

  function f1_1(v: "Done" | "In Progress" | "On Review"): number {
    expect(check_value_from_type_T_1(v)).assertEqual(true);
    foo_1(v);
    return f2_1(v);
  }

  function f2_1(v: "Done" | "In Progress" | "On Review"): number {
    if (v === "In Progress") {
      expect(v).assertEqual("In Progress");
      return 1;
    } else {
      expect(check_value_from_type_A_1(v)).assertEqual(true);
      expect(check_value_from_type_T_1(v)).assertEqual(true);
      foo_1(v);
      expect(v).assertEqual("Done");
      return 2;
    }
  }

  export function runTest_1(): boolean {
    let res: number = f1_1("In Progress");
    expect(res).assertEqual(1);
    res = f1_1("Done");
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_1 {
  function check_value_from_type_A_1(v: Any): boolean {
    if (v instanceof string) {
      return v === "Done" ||
        v === "In Progress" ||
        v === "On Review";
    } else {
      return false;
    }
  }

  function check_value_from_type_T_1(v: Any): boolean {
    return v instanceof Any;
  }

  function foo_1(v: Any): void {
    expect(check_value_from_type_A_1(v)).assertEqual(true);
  }

  function f1_1(v: "Done" | "In Progress" | "On Review"): number {
    expect(check_value_from_type_T_1(v)).assertEqual(true);
    foo_1(v);
    return f2_1(v);
  }

  function f2_1(v: "Done" | "In Progress" | "On Review"): number {
    if (v === "In Progress") {
      expect(v).assertEqual("In Progress");
      return 1;
    } else {
      expect(check_value_from_type_A_1(v)).assertEqual(true);
      expect(check_value_from_type_T_1(v)).assertEqual(true);
      foo_1(v);
      expect(v).assertEqual("On Review");
      return 2;
    }
  }

  export function runTest_1(): boolean {
    let res: number = f1_1("In Progress");
    expect(res).assertEqual(1);
    res = f1_1("On Review");
    expect(res).assertEqual(2);
    return true;
  }
}

function check_value_from_type_A_1(v: Any): boolean {
  if (v instanceof string) {
    return v === "Done" ||
      v === "In Progress" ||
      v === "On Review";
  } else {
    return false;
  }
}

function check_value_from_type_T_1(v: Any): boolean {
  if (v instanceof string) {
    return v === "Done" ||
      v === "In Progress" ||
      v === "On Review" ||
      v === "Investigating";
  } else {
    return false;
  }
}

function foo_1(v: "Done" | "In Progress" | "On Review" | "Investigating"): void {
  expect(check_value_from_type_A_1(v)).assertEqual(true);
}

function f1_1(v: "Done" | "In Progress" | "On Review"): number {
  expect(check_value_from_type_T_1(v)).assertEqual(true);
  foo_1(v);
  return f2_1(v);
}

function f2_1(v: "Done" | "In Progress" | "On Review"): number {
  if (v === "In Progress") {
    expect(v).assertEqual("In Progress");
    return 1;
  } else {
    expect(check_value_from_type_A_1(v)).assertEqual(true);
    expect(check_value_from_type_T_1(v)).assertEqual(true);
    foo_1(v);
    expect(v).assertEqual("Done");
    return 2;
  }
}

function runTest_1(): boolean {
  let res: number = f1_1("In Progress");
  expect(res).assertEqual(1);
  res = f1_1("Done");
  expect(res).assertEqual(2);
  return true;
}

namespace testNS1_2 {
  function check_value_from_type_A_2(v: Any): boolean {
    if (v instanceof string) {
      return v === "Done" ||
        v === "In Progress" ||
        v === "On Review";
    }
    else {
      return false;
    }
  }

  function check_value_from_type_T_2(v: Any): boolean {
    if (v instanceof string) {
      return v === "Done" ||
        v === "In Progress" ||
        v === "On Review" || v === "Investigating";
    }
    else {
      return false;
    }
  }

  function foo_2(v: "Done" | "In Progress" | "On Review" | "Investigating"): void {
    expect(check_value_from_type_A_2(v)).assertEqual(true);
  }

  function f1_2(v: "Done" | "In Progress" | "On Review"): number {
    if (check_value_from_type_T_2(v)) {
      foo_2(v);
      return f2_2(v);
    }
    else {
      return 0;
    }
  }

  function f2_2(v: "Done" | "In Progress" | "On Review"): number {
    if (v === "In Progress") {
      expect(v).assertEqual("In Progress");
      return 1;
    }
    else {
      expect(check_value_from_type_A_2(v)).assertEqual(true);
      expect(check_value_from_type_T_2(v)).assertEqual(true);
      foo_2(v);
      expect(v).assertEqual("Done");
      return 2;
    }
  }

  export function runTest_2(): boolean {
    let res: number = f1_2("In Progress");
    expect(res).assertEqual(1);
    res = f1_2("Done");
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_2 {
  function check_value_from_type_A_2(v: Any): boolean {
    if (v instanceof string) {
      return v === "Done" ||
        v === "In Progress" ||
        v === "On Review";
    }
    else {
      return false;
    }
  }

  function check_value_from_type_T_2(v: Any): boolean {
    return v instanceof Any;
  }

  function foo_2(v: Any): void {
    expect(check_value_from_type_A_2(v)).assertEqual(true);
  }

  function f1_2(v: "Done" | "In Progress" | "On Review"): number {
    if (check_value_from_type_T_2(v)) {
      foo_2(v);
      return f2_2(v);
    }
    else {
      return 0;
    }
  }

  function f2_2(v: "Done" | "In Progress" | "On Review"): number {
    if (v === "In Progress") {
      expect(v).assertEqual("In Progress");
      return 1;
    }
    else {
      expect(check_value_from_type_A_2(v)).assertEqual(true);
      expect(check_value_from_type_T_2(v)).assertEqual(true);
      foo_2(v);
      expect(v).assertEqual("On Review");
      return 2;
    }
  }

  export function runTest_2(): boolean {
    let res: number = f1_2("In Progress");
    expect(res).assertEqual(1);
    res = f1_2("On Review");
    expect(res).assertEqual(2);
    return true;
  }
}

function check_value_from_type_A_2(v: Any): boolean {
  if (v instanceof string) {
    return v === "Done" ||
      v === "In Progress" ||
      v === "On Review";
  }
  else {
    return false;
  }
}

function check_value_from_type_T_2(v: Any): boolean {
  if (v instanceof string) {
    return v === "Done" ||
      v === "In Progress" ||
      v === "On Review" || v === "Investigating";
  }
  else {
    return false;
  }
}

function foo_2(v: "Done" | "In Progress" | "On Review" | "Investigating"): void {
  expect(check_value_from_type_A_2(v)).assertEqual(true);
}

function f1_2(v: "Done" | "In Progress" | "On Review"): number {
  if (check_value_from_type_T_2(v)) {
    foo_2(v);
    return f2_2(v);
  }
  else {
    return 0;
  }
}

function f2_2(v: "Done" | "In Progress" | "On Review"): number {
  if (v === "In Progress") {
    expect(v).assertEqual("In Progress");
    return 1;
  }
  else {
    expect(check_value_from_type_A_2(v)).assertEqual(true);
    expect(check_value_from_type_T_2(v)).assertEqual(true);
    foo_2(v);
    expect(v).assertEqual("Done");
    return 2;
  }
}






export default function DiffTypeIsSubOfTypeTOnStrLitTest(): void {
  describe('DiffTypeIsSubOfTypeTOnStrLitTest', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_STR_LIT_0100
     * @tc.name      testDiffTypeIsSubOfTypeTOnStrLit0001
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
  on literal union types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnStrLit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnStrLit0001';


      let res: number = f1_1("In Progress")
      expect(res).assertEqual(1)
      res = f1_1("Done")
      expect(res).assertEqual(2)

      expect(testNS1_1.runTest_1()).assertEqual(true)
      expect(testNS2_1.runTest_1()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_STR_LIT_0200
     * @tc.name      testDiffTypeIsSubOfTypeTOnStrLit0002
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
  on literal union types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnStrLit0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnStrLit0002';


      let res: number = f1_2("In Progress")
      expect(res).assertEqual(1)
      res = f1_2("Done")
      expect(res).assertEqual(2)

      expect(testNS1_2.runTest_2()).assertEqual(true)
      expect(testNS2_2.runTest_2()).assertEqual(true)

    });
  })
}