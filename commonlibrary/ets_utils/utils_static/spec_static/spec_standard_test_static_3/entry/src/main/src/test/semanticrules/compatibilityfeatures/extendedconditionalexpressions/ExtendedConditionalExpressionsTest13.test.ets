/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

function addNumbers(a: number, b: number): number {
  return a + b;
}

// File-level enum declarations for tests
enum Color { Red, Green, Blue }
enum TestSize { S, M, L }
enum Status { None, Active, Inactive }
enum Priority { Low = 0, Medium = 1, High = 2 }

export default function ExtendedConditionalExpressionsTest13():void {
  describe('ExtendedConditionalExpressionsTest13', () => {
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

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0490
     * @tc.name      testIfStatementif_f2_0_0490
     * @tc.desc      If statement with falsy value (Object|null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_0_0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Object|null = null  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0491
     * @tc.name      testIfStatementif_f2_1_0491
     * @tc.desc      If statement with falsy value (boolean false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_1_0491', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: boolean = false  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0492
     * @tc.name      testIfStatementif_f2_2_0492
     * @tc.desc      If statement with falsy value (Boolean object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_2_0492', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Boolean = new Boolean(false)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0493
     * @tc.name      testIfStatementif_f2_3_0493
     * @tc.desc      If statement with falsy value (empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_3_0493', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: string = ''  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0494
     * @tc.name      testIfStatementif_f2_4_0494
     * @tc.desc      If statement with falsy value (String empty object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_4_0494', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: String = new String('')  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0495
     * @tc.name      testIfStatementif_f2_5_0495
     * @tc.desc      If statement with falsy value (empty substring)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_5_0495', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: String = new String('abc').substring(0, 0)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0496
     * @tc.name      testIfStatementif_f2_6_0496
     * @tc.desc      If statement with falsy value (number 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_6_0496', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: number = 0  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0497
     * @tc.name      testIfStatementif_f2_7_0497
     * @tc.desc      If statement with falsy value (negative zero)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_7_0497', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: number = -0.0  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0498
     * @tc.name      testIfStatementif_f2_8_0498
     * @tc.desc      If statement with falsy value (Number 0.0 object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_8_0498', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Number = new Number(0.0)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0499
     * @tc.name      testIfStatementif_f2_9_0499
     * @tc.desc      If statement with falsy value (Number.NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_9_0499', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: number = Number.NaN  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0500
     * @tc.name      testIfStatementif_f2_10_0500
     * @tc.desc      If statement with falsy value (Number NaN object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_10_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Number = new Number(Number.NaN)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0501
     * @tc.name      testIfStatementif_f2_11_0501
     * @tc.desc      If statement with truthy value (empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_11_0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number[] = []  // truthy (empty array is truthy in JS)
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0502
     * @tc.name      testIfStatementif_f2_12_0502
     * @tc.desc      If statement with falsy value (undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_12_0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: undefined = undefined  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0503
     * @tc.name      testIfStatementif_f2_13_0503
     * @tc.desc      If statement with falsy value (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_13_0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: null = null  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0504
     * @tc.name      testIfStatementif_f2_14_0504
     * @tc.desc      If statement with falsy value (long 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_14_0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: long = 0  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0505
     * @tc.name      testIfStatementif_f2_15_0505
     * @tc.desc      If statement with falsy value (Long object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_15_0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Long = new Long()  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0506
     * @tc.name      testIfStatementif_f2_16_0506
     * @tc.desc      If statement with falsy value (int 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_16_0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: int = 0  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0507
     * @tc.name      testIfStatementif_f2_17_0507
     * @tc.desc      If statement with falsy value (Int object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_17_0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Int = new Int(0)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0508
     * @tc.name      testIfStatementif_f2_18_0508
     * @tc.desc      If statement with falsy value (short 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_18_0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: short = 0  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0509
     * @tc.name      testIfStatementif_f2_19_0509
     * @tc.desc      If statement with falsy value (Short object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_19_0509', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Short = new Short(0)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0510
     * @tc.name      testIfStatementif_f2_20_0510
     * @tc.desc      If statement with falsy value (Float object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_20_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: float = new Float()  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0511
     * @tc.name      testIfStatementif_f2_21_0511
     * @tc.desc      If statement with falsy value (char null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_21_0511', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: char = c'\u0000'  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0512
     * @tc.name      testIfStatementif_f2_22_0512
     * @tc.desc      If statement with falsy value (Char object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_22_0512', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Char = new Char(c'\u0000')  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0513
     * @tc.name      testIfStatementif_f2_23_0513
     * @tc.desc      If statement with falsy value (bigint 0n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_23_0513', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: bigint = 0n  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0514
     * @tc.name      testIfStatementif_f2_24_0514
     * @tc.desc      If statement with falsy value (Color.Red)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_24_0514', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Color = Color.Red  // falsy (value is 0)
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0515
     * @tc.name      testIfStatementif_f2_25_0515
     * @tc.desc      If statement with falsy value (TestSize.S)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_25_0515', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: TestSize = TestSize.S  // falsy (value is 0)
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0516
     * @tc.name      testIfStatementif_f2_26_0516
     * @tc.desc      If statement with falsy value (Status.None)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_26_0516', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Status = Status.None  // falsy (value is 0)
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0517
     * @tc.name      testIfStatementif_f2_27_0517
     * @tc.desc      If statement with falsy value (Priority.Low)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_27_0517', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Priority = Priority.Low  // falsy (value is 0)
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0518
     * @tc.name      testIfStatementif_f2_28_0518
     * @tc.desc      If statement with falsy value (Object|undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_28_0518', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Object|undefined = undefined  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0519
     * @tc.name      testIfStatementif_f2_29_0519
     * @tc.desc      If statement with falsy value (computed 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_29_0519', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: number = (42 - 21 - 21)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0520
     * @tc.name      testIfStatementif_f2_30_0520
     * @tc.desc      If statement with falsy value (concatenated empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_30_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: string = ('' + '')  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0521
     * @tc.name      testIfStatementif_f2_31_0521
     * @tc.desc      If statement with truthy value (empty object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_31_0521', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Object = {}  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0522
     * @tc.name      testIfStatementif_f2_32_0522
     * @tc.desc      If statement with truthy value (non-empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_32_0522', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string = 'abc'  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0523
     * @tc.name      testIfStatementif_f2_33_0523
     * @tc.desc      If statement with truthy value (non-zero number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_33_0523', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = 42  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0524
     * @tc.name      testIfStatementif_f2_34_0524
     * @tc.desc      If statement with truthy value (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_34_0524', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: boolean = true  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0525
     * @tc.name      testIfStatementif_f2_35_0525
     * @tc.desc      If statement with truthy value (computed truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_35_0525', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = (1 - 1) + 1  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0526
     * @tc.name      testIfStatementif_f2_36_0526
     * @tc.desc      If statement with truthy value (substring)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_36_0526', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string = ('a' + 'b').substring(0, 1)  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0527
     * @tc.name      testIfStatementif_f2_37_0527
     * @tc.desc      If statement with truthy value (computed truthy value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_37_0527', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = (42 - 21 - 20)  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0528
     * @tc.name      testIfStatementif_f2_38_0528
     * @tc.desc      If statement with truthy value (unicode char string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_38_0528', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string = '\u0000'  // truthy (non-empty string)
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0529
     * @tc.name      testIfStatementif_f2_39_0529
     * @tc.desc      If statement with falsy value (Number 0 object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f2_39_0529', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = new Number()  // falsy (0 value, converts to falsy in ArkTS)
      if (v) {
        res = 0
      }
      expect(res).assertEqual(1);
    });

  });
}
