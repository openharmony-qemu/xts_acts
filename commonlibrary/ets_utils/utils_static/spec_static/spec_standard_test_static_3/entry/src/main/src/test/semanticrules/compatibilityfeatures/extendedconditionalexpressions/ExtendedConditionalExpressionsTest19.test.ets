/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../../../../hypium/index";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class NullishObj {
  value: number = 1;
  constructor(val: number) {
    this.value = val;
  }
}

export default function ExtendedConditionalExpressionsTest19(): void {
  describe('ExtendedConditionalExpressionsTest19', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    // Do-While with Truthy Conditions
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0648
     * @tc.name      testOpsDoWhileTruthy001
     * @tc.desc      Do-while with truthy number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsDoWhileTruthy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: number = 1;
      let count: number = 0;

      do {
        count++;
        if (count >= 1) {
          retcode = 0;
          break;
        }
      } while (v);
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0649
     * @tc.name      testOpsDoWhileTruthy002
     * @tc.desc      Do-while with truthy string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsDoWhileTruthy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: string = "truthy";
      let count: number = 0;

      do {
        count++;
        if (count >= 1) {
          retcode = 0;
          break;
        }
      } while (v);
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0650
     * @tc.name      testOpsDoWhileTruthy003
     * @tc.desc      Do-while with truthy object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsDoWhileTruthy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: Object = {};
      let count: number = 0;

      do {
        count++;
        if (count >= 1) {
          retcode = 0;
          break;
        }
      } while (v);
      expect(retcode).assertEqual(0);
    });

    // Do-While with Falsy Conditions
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0651
     * @tc.name      testOpsDoWhileFalsy001
     * @tc.desc      Do-while with falsy number zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsDoWhileFalsy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0;
      let v: number = 0;

      do {
        count++;
      } while (v);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0652
     * @tc.name      testOpsDoWhileFalsy002
     * @tc.desc      Do-while with falsy null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsDoWhileFalsy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0;
      let v: Object | null = null;

      do {
        count++;
      } while (v);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0653
     * @tc.name      testOpsDoWhileFalsy003
     * @tc.desc      Do-while with falsy undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsDoWhileFalsy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0;
      let v: Object | undefined = undefined;

      do {
        count++;
      } while (v);
      expect(count).assertEqual(1);
    });

    // While with Logical Operators
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0654
     * @tc.name      testOpsWhileLogical001
     * @tc.desc      While with AND condition truthy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsWhileLogical001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: number = 1;
      let b: number = 1;
      let count: number = 0;

      while (a && b) {
        count++;
        if (count >= 1) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0655
     * @tc.name      testOpsWhileLogical002
     * @tc.desc      While with AND condition falsy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsWhileLogical002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let a: number = 0;
      let b: number = 1;
      let count: number = 0;

      while (a && b) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0656
     * @tc.name      testOpsWhileLogical003
     * @tc.desc      While with OR condition truthy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsWhileLogical003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: number = 1;
      let b: number = 0;
      let count: number = 0;

      while (a || b) {
        count++;
        if (count >= 1) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0657
     * @tc.name      testOpsWhileLogical004
     * @tc.desc      While with OR condition falsy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsWhileLogical004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let a: number = 0;
      let b: number = 0;
      let count: number = 0;

      while (a || b) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0658
     * @tc.name      testOpsWhileLogical005
     * @tc.desc      While with triple OR condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsWhileLogical005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: number = 0;
      let b: number = 0;
      let c: number = 1;
      let count: number = 0;

      while (a || b || c) {
        count++;
        if (count >= 1) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0659
     * @tc.name      testOpsWhileLogical006
     * @tc.desc      While with AND NOT condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsWhileLogical006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: number = 1;
      let b: number = 0;
      let count: number = 0;

      while (a && !b) {
        count++;
        if (count >= 1) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    // While with Nullish Coalescing
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0660
     * @tc.name      testOpsWhileNullish001
     * @tc.desc      While with nullish coalescing null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsWhileNullish001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: NullishObj | null = null;
      let defaultObj: NullishObj = new NullishObj(1);
      let count: number = 0;

      while (v ?? defaultObj) {
        count++;
        if (count >= 1) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0661
     * @tc.name      testOpsWhileNullish002
     * @tc.desc      While with nullish coalescing undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsWhileNullish002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: NullishObj | undefined = undefined;
      let defaultObj: NullishObj = new NullishObj(1);
      let count: number = 0;

      while (v ?? defaultObj) {
        count++;
        if (count >= 1) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    // Nested Loops with Conditional Expressions
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0662
     * @tc.name      testOpsNestedLoops001
     * @tc.desc      Nested loops with conditional expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsNestedLoops001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let outer: number = 1;
      let inner: number = 1;
      let innerCount: number = 0;

      while (outer) {
        while (inner) {
          innerCount++;
          if (innerCount >= 1) {
            retcode = 0;
            inner = 0;
            outer = 0;
            break;
          }
        }
        break;
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0663
     * @tc.name      testOpsNestedLoops002
     * @tc.desc      Nested loops with logical operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsNestedLoops002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let a: number = 0;
      let b: number = 1;
      let c: number = 1;
      let count: number = 0;

      while (a || b) {
        while (b && c) {
          count++;
          if (count >= 1) {
            a = 1;
            break;
          }
        }
        break;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0664
     * @tc.name      testOpsNestedLoops003
     * @tc.desc      Nested while and for loops
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsNestedLoops003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let v: number = 1;
      let total: number = 0;

      while (v) {
        for (let i: number = 0; i < 3 && v; i++) {
          total++;
        }
        expect(total).assertEqual(3);
        retcode = 1;
        break;
      }
      expect(retcode).assertEqual(1);
    });

    // Break/Continue with Conditional Expressions
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0665
     * @tc.name      testOpsControlFlow001
     * @tc.desc      Break with conditional expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsControlFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0;
      let a: number = 1;
      let b: number = 0;

      for (let i: number = 0; i < 10 && (a || b); i++) {
        if (i == 2) {
          break;
        }
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0666
     * @tc.name      testOpsControlFlow002
     * @tc.desc      Continue with conditional expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsControlFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0;
      let processed: number = 0;
      let a: number = 1;

      for (let i: number = 0; i < 5 && a; i++) {
        if (i % 2 == 0) {
          continue;
        }
        processed++;
      }
      expect(processed).assertEqual(2);
    });

    // Multiple Variables in Loop Condition
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0667
     * @tc.name      testOpsMultiVar001
     * @tc.desc      Multiple variables with AND in loop condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsMultiVar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: number = 1;
      let b: number = 1;
      let c: number = 1;

      for (let i: number = 0; a && b && c; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0668
     * @tc.name      testOpsMultiVar002
     * @tc.desc      Multiple variables with OR in loop condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsMultiVar002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: number = 0;
      let b: number = 0;
      let c: number = 1;

      for (let i: number = 0; a || b || c; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0669
     * @tc.name      testOpsMultiVar003
     * @tc.desc      Multiple variables with AND falsy in loop condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsMultiVar003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let a: number = 1;
      let b: number = 0;
      let c: number = 0;

      for (let i: number = 0; a && b && c; i++) {
        retcode = 1;
      }
      expect(retcode).assertEqual(0);
    });

    // Type Combinations in Loop Conditions
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0670
     * @tc.name      testOpsTypeComb001
     * @tc.desc      Type combination number and string in loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsTypeComb001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: number = 1;
      let b: string = "truthy";

      for (let i: number = 0; a && b; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0671
     * @tc.name      testOpsTypeComb002
     * @tc.desc      Type combination number and boolean in while loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsTypeComb002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: number = 1;
      let b: boolean = true;

      while (a && b) {
        retcode = 0;
        break;
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0672
     * @tc.name      testOpsTypeComb003
     * @tc.desc      Type combination object and null in while loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsTypeComb003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: Object | null = {};
      let b: Object | null = null;

      while (a && !b) {
        retcode = 0;
        break;
      }
      expect(retcode).assertEqual(0);
    });
  });
}
