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

export default function ExtendedConditionalExpressionsTest18(): void {
  describe('ExtendedConditionalExpressionsTest18', () => {
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

    // For Loop with Falsy Values
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0622
     * @tc.name      testOpsForFalsy001
     * @tc.desc      For loop with null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForFalsy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let v: Object | null = null;

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 1;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0623
     * @tc.name      testOpsForFalsy002
     * @tc.desc      For loop with undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForFalsy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let v: Object | undefined = undefined;

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 1;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0624
     * @tc.name      testOpsForFalsy003
     * @tc.desc      For loop with number zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForFalsy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let v: number = 0;

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 1;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0625
     * @tc.name      testOpsForFalsy004
     * @tc.desc      For loop with number 0.0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForFalsy004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let v: number = 0.0;

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 1;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0626
     * @tc.name      testOpsForFalsy005
     * @tc.desc      For loop with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForFalsy005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let v: string = "";

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 1;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0627
     * @tc.name      testOpsForFalsy006
     * @tc.desc      For loop with negative zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForFalsy006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let v: number = -0;

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 1;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0628
     * @tc.name      testOpsForFalsy007
     * @tc.desc      For loop with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForFalsy007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let v: number = Number.NaN;

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 1;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0629
     * @tc.name      testOpsForFalsy008
     * @tc.desc      For loop with boolean false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForFalsy008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let v: boolean = false;

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 1;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    // For Loop with Truthy Values
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0630
     * @tc.name      testOpsForTruthy001
     * @tc.desc      For loop with truthy hex value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForTruthy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: number = 0x80;

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0631
     * @tc.name      testOpsForTruthy002
     * @tc.desc      For loop with truthy hex value 0x8000
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForTruthy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: number = 0x8000;

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0632
     * @tc.name      testOpsForTruthy003
     * @tc.desc      For loop with truthy number one
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForTruthy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: number = 1;

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0633
     * @tc.name      testOpsForTruthy004
     * @tc.desc      For loop with truthy negative one
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForTruthy004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: number = -1;

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0634
     * @tc.name      testOpsForTruthy005
     * @tc.desc      For loop with truthy non-empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForTruthy005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: string = "hello";

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0635
     * @tc.name      testOpsForTruthy006
     * @tc.desc      For loop with truthy empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForTruthy006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: Object = {};

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0636
     * @tc.name      testOpsForTruthy007
     * @tc.desc      For loop with truthy empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForTruthy007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: Array<number> = [];

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0637
     * @tc.name      testOpsForTruthy008
     * @tc.desc      For loop with truthy boolean true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForTruthy008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: boolean = true;

      for (let i: number = 0; v; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    // For Loop with Logical Operators in Condition
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0638
     * @tc.name      testOpsForLogical001
     * @tc.desc      For loop with AND condition truthy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForLogical001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: number = 1;
      let b: number = 2;

      for (let i: number = 0; a && b; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0639
     * @tc.name      testOpsForLogical002
     * @tc.desc      For loop with AND condition falsy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForLogical002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let a: number = 0;
      let b: number = 2;

      for (let i: number = 0; a && b; i++) {
        retcode = 1;
        break;
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0640
     * @tc.name      testOpsForLogical003
     * @tc.desc      For loop with OR condition truthy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForLogical003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let a: number = 1;
      let b: number = 0;

      for (let i: number = 0; a || b; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0641
     * @tc.name      testOpsForLogical004
     * @tc.desc      For loop with OR condition falsy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForLogical004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let a: number = 0;
      let b: number = 0;

      for (let i: number = 0; a || b; i++) {
        retcode = 1;
        break;
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0642
     * @tc.name      testOpsForLogical005
     * @tc.desc      For loop with triple AND condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForLogical005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let a: number = 1;
      let b: number = 1;

      for (let i: number = 0; a && b && true; i++) {
        if (i == 0) {
          retcode = 1;
          break;
        }
      }
      expect(retcode).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0643
     * @tc.name      testOpsForLogical006
     * @tc.desc      For loop with triple OR condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForLogical006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

    // For Loop with Nullish Coalescing
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0644
     * @tc.name      testOpsForNullish001
     * @tc.desc      For loop with nullish coalescing null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForNullish001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: NullishObj | null = null;
      let defaultObj: NullishObj = new NullishObj(1);

      for (let i: number = 0; v ?? defaultObj; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0645
     * @tc.name      testOpsForNullish002
     * @tc.desc      For loop with nullish coalescing undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForNullish002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: NullishObj | undefined = undefined;
      let defaultObj: NullishObj = new NullishObj(1);

      for (let i: number = 0; v ?? defaultObj; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0646
     * @tc.name      testOpsForNullish003
     * @tc.desc      For loop with nullish coalescing zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForNullish003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let v: number = 0;

      for (let i: number = 0; v ?? 1; i++) {
        retcode = 1;
        break;
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0647
     * @tc.name      testOpsForNullish004
     * @tc.desc      For loop with nullish coalescing object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsForNullish004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 1;
      let v: NullishObj = new NullishObj(1);

      for (let i: number = 0; v ?? null; i++) {
        if (i == 0) {
          retcode = 0;
          break;
        }
      }
      expect(retcode).assertEqual(0);
    });
  });
}
