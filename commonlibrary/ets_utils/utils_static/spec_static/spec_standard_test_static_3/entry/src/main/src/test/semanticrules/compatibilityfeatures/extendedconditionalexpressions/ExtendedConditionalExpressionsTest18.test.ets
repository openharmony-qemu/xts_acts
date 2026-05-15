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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0695
     * @tc.desc      For loop with null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0695', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0696
     * @tc.desc      For loop with undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0696', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0697
     * @tc.desc      For loop with number zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0697', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0698
     * @tc.desc      For loop with number 0.0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0698', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0699
     * @tc.desc      For loop with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0699', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0700
     * @tc.desc      For loop with negative zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0701
     * @tc.desc      For loop with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0702
     * @tc.desc      For loop with boolean false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0703
     * @tc.desc      For loop with truthy hex value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0704
     * @tc.desc      For loop with truthy hex value 0x8000
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0705
     * @tc.desc      For loop with truthy number one
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0706
     * @tc.desc      For loop with truthy negative one
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0707
     * @tc.desc      For loop with truthy non-empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0708
     * @tc.desc      For loop with truthy empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0708', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0709
     * @tc.desc      For loop with truthy empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0709', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0710
     * @tc.desc      For loop with truthy boolean true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0711
     * @tc.desc      For loop with AND condition truthy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0711', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0712
     * @tc.desc      For loop with AND condition falsy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0712', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0713
     * @tc.desc      For loop with OR condition truthy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0713', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0714
     * @tc.desc      For loop with OR condition falsy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0714', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0715
     * @tc.desc      For loop with triple AND condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0715', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_2200
     * @tc.name    testConditionalExpression0716
     * @tc.desc      For loop with triple OR condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0716', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_2300
     * @tc.name    testConditionalExpression0717
     * @tc.desc      For loop with nullish coalescing null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0717', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_2400
     * @tc.name    testConditionalExpression0718
     * @tc.desc      For loop with nullish coalescing undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0718', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_2500
     * @tc.name    testConditionalExpression0719
     * @tc.desc      For loop with nullish coalescing zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0719', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retcode: number = 0;
      let v: number = 0;

      for (let i: number = 0; v ?? 1; i++) {
        retcode = 1;
        break;
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHTEEN_EXPRESSIONS_2600
     * @tc.name    testConditionalExpression0720
     * @tc.desc      For loop with nullish coalescing object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
