import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
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

namespace testNS1_1 {
  function check_value_from_type_A(v: string): boolean {
    return v === "Done" || v === "In Progress" || v === "On Review";
  }
  function foo(v: Object): void {
    expect(check_value_from_type_A(v as string)).assertTrue();
  }
  function f1(v: "Done" | "In Progress" | "On Review"): number {
    foo(v);
    return f2(v);
  }
  function f2(v: "Done" | "In Progress" | "On Review"): number {
    if (v === "In Progress") {
      expect(v).assertEqual("In Progress");
      return 1;
    } else {
      expect(check_value_from_type_A(v)).assertTrue();
      foo(v);
      expect(v).assertEqual("On Review");
      return 2;
    }
  }

  export function runTest_1(): boolean {
    let res: number = f1("In Progress");
    expect(res).assertEqual(1);
    res = f1("On Review");
    expect(res).assertEqual(2);
    return true;
  }
}

function check_value_from_type_A_1(v: string): boolean {
  return v === "Done" || v === "In Progress" || v === "On Review";
}
function foo_1(v: Object): void {
  expect(check_value_from_type_A_1(v as string)).assertTrue();
}
function f1_1(v: "Done" | "In Progress" | "On Review"): number {
  foo_1(v);
  return f2_1(v);
}
function f2_1(v: "Done" | "In Progress" | "On Review"): number {
  if (v === "In Progress") {
    expect(v).assertEqual("In Progress");
    return 1;
  } else {
    expect(check_value_from_type_A_1(v)).assertTrue();
    foo_1(v);
    expect(v).assertEqual("On Review");
    return 2;
  }
}

namespace testNS1_2 {
  function check_value_from_type_A(v: string): boolean {
    return v === "Done" || v === "In Progress" || v === "On Review";
  }
  function foo(v: Object): void {
    expect(check_value_from_type_A(v as string)).assertTrue();
  }
  function f1(v: "Done" | "In Progress" | "On Review"): number {
    foo(v);
    return f2(v);
  }
  function f2(v: "Done" | "In Progress" | "On Review"): number {
    if (v === "In Progress") {
      expect(v).assertEqual("In Progress");
      return 1;
    } else {
      expect(check_value_from_type_A(v)).assertTrue();
      foo(v);
      expect(v).assertEqual("On Review");
      return 2;
    }
  }

  export function runTest_2(): boolean {
    let res: number = f1("In Progress");
    expect(res).assertEqual(1);
    res = f1("On Review");
    expect(res).assertEqual(2);
    return true;
  }
}

function check_value_from_type_A_2(v: string): boolean {
  return v === "Done" || v === "In Progress" || v === "On Review";
}
function foo_2(v: Object): void {
  expect(check_value_from_type_A_2(v as string)).assertTrue();
}
function f1_2(v: "Done" | "In Progress" | "On Review"): number {
  foo_2(v);
  return f2_2(v);
}
function f2_2(v: "Done" | "In Progress" | "On Review"): number {
  if (v === "In Progress") {
    expect(v).assertEqual("In Progress");
    return 1;
  } else {
    expect(check_value_from_type_A_2(v)).assertTrue();
    foo_2(v);
    expect(v).assertEqual("On Review");
    return 2;
  }
}

export default function DiffTypeIsSubOfTypeObjOnStrLitTest(): void {
  describe('DiffTypeIsSubOfTypeObjOnStrLitTest', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_STR_LIT_0100
     * @tc.name      testDiffTypeIsSubOfTypeObjOnStrLit0001
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object on literal union types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnStrLit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnStrLit0001';
      let res: number = f1_1("In Progress");
      expect(res).assertEqual(1);
      res = f1_1("On Review");
      expect(res).assertEqual(2);
      expect(testNS1_1.runTest_1()).assertTrue();
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_OBJ_ON_STR_LIT_0200
     * @tc.name      testDiffTypeIsSubOfTypeObjOnStrLit0002
     * @tc.desc      Checking that difference type A - B is a subtype of Object if A is a subtype
    of Object on literal union types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeObjOnStrLit0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeObjOnStrLit0002';
      let res: number = f1_2("In Progress");
      expect(res).assertEqual(1);
      res = f1_2("On Review");
      expect(res).assertEqual(2);
      expect(testNS1_2.runTest_2()).assertTrue();
    });
  });
}