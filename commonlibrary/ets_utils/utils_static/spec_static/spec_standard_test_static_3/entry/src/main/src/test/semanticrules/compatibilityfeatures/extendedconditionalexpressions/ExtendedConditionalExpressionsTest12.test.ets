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

export default function ExtendedConditionalExpressionsTest12():void {
  describe('ExtendedConditionalExpressionsTest12', () => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0443
     * @tc.name      testIfStatementif_f1_0_0443
     * @tc.desc      If statement with falsy value (boolean false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_0_0443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: boolean = false
      if (v) {  // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0444
     * @tc.name      testIfStatementif_f1_1_0444
     * @tc.desc      If statement with falsy value (Boolean object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_1_0444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Boolean = new Boolean(false)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0445
     * @tc.name      testIfStatementif_f1_2_0445
     * @tc.desc      If statement with falsy value (empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_2_0445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: string = ''  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0446
     * @tc.name      testIfStatementif_f1_3_0446
     * @tc.desc      If statement with falsy value (String empty object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_3_0446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: String = new String('')  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0447
     * @tc.name      testIfStatementif_f1_4_0447
     * @tc.desc      If statement with falsy value (empty substring)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_4_0447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: String = new String('abc').substring(0, 0)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0448
     * @tc.name      testIfStatementif_f1_5_0448
     * @tc.desc      If statement with falsy value (number 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_5_0448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: number = 0  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0449
     * @tc.name      testIfStatementif_f1_6_0449
     * @tc.desc      If statement with falsy value (negative zero)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_6_0449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: number = -0.0  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0450
     * @tc.name      testIfStatementif_f1_7_0450
     * @tc.desc      If statement with falsy value (Number 0.0 object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_7_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Number = new Number(0.0)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0451
     * @tc.name      testIfStatementif_f1_8_0451
     * @tc.desc      If statement with falsy value (Number.NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_8_0451', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: number = Number.NaN  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0452
     * @tc.name      testIfStatementif_f1_9_0452
     * @tc.desc      If statement with falsy value (Number NaN object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_9_0452', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Number = new Number(Number.NaN)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0453
     * @tc.name      testIfStatementif_f1_10_0453
     * @tc.desc      If statement with truthy value (empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_10_0453', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number[] = []  // truthy (empty array is truthy in JS)
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0454
     * @tc.name      testIfStatementif_f1_11_0454
     * @tc.desc      If statement with falsy value (undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_11_0454', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: undefined = undefined  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0455
     * @tc.name      testIfStatementif_f1_12_0455
     * @tc.desc      If statement with falsy value (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_12_0455', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: null = null  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0456
     * @tc.name      testIfStatementif_f1_13_0456
     * @tc.desc      If statement with falsy value (long 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_13_0456', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: long = 0  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0457
     * @tc.name      testIfStatementif_f1_14_0457
     * @tc.desc      If statement with falsy value (Long object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_14_0457', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Long = new Long()  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0458
     * @tc.name      testIfStatementif_f1_15_0458
     * @tc.desc      If statement with falsy value (int 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_15_0458', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: int = 0  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0459
     * @tc.name      testIfStatementif_f1_16_0459
     * @tc.desc      If statement with falsy value (Int object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_16_0459', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Int = new Int(0)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0460
     * @tc.name      testIfStatementif_f1_17_0460
     * @tc.desc      If statement with falsy value (short 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_17_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: short = 0  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0461
     * @tc.name      testIfStatementif_f1_18_0461
     * @tc.desc      If statement with falsy value (Short object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_18_0461', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Short = new Short(0)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0462
     * @tc.name      testIfStatementif_f1_19_0462
     * @tc.desc      If statement with falsy value (Float object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_19_0462', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: float = new Float()  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0463
     * @tc.name      testIfStatementif_f1_20_0463
     * @tc.desc      If statement with falsy value (char null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_20_0463', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: char = c'\u0000'  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0464
     * @tc.name      testIfStatementif_f1_21_0464
     * @tc.desc      If statement with falsy value (Char object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_21_0464', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Char = new Char(c'\u0000')  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0465
     * @tc.name      testIfStatementif_f1_22_0465
     * @tc.desc      If statement with falsy value (bigint 0n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_22_0465', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: bigint = 0n  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0466
     * @tc.name      testIfStatementif_f1_23_0466
     * @tc.desc      If statement with falsy value (Color.Red)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_23_0466', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Color = Color.Red  // falsy (value is 0)
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0467
     * @tc.name      testIfStatementif_f1_24_0467
     * @tc.desc      If statement with falsy value (TestSize.S)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_24_0467', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: TestSize = TestSize.S  // falsy (value is 0)
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0468
     * @tc.name      testIfStatementif_f1_25_0468
     * @tc.desc      If statement with falsy value (Status.None)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_25_0468', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Status = Status.None  // falsy (value is 0)
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0469
     * @tc.name      testIfStatementif_f1_26_0469
     * @tc.desc      If statement with falsy value (Priority.Low)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_26_0469', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Priority = Priority.Low  // falsy (value is 0)
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0470
     * @tc.name      testIfStatementif_f1_27_0470
     * @tc.desc      If statement with falsy value (Object|undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_27_0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Object|undefined = undefined  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0471
     * @tc.name      testIfStatementif_f1_28_0471
     * @tc.desc      If statement with falsy value (Object|null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_28_0471', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Object|null = null  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0472
     * @tc.name      testIfStatementif_f1_29_0472
     * @tc.desc      If statement with falsy value (computed 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_29_0472', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: number = (42 - 21 - 21)  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0473
     * @tc.name      testIfStatementif_f1_30_0473
     * @tc.desc      If statement with falsy value (concatenated empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_30_0473', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: string = ('' + '')  // falsy
      if (v) {
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0474
     * @tc.name      testIfStatementif_f1_31_0474
     * @tc.desc      If statement with truthy value (empty object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_31_0474', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Object = {}  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0475
     * @tc.name      testIfStatementif_f1_32_0475
     * @tc.desc      If statement with truthy value (non-empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_32_0475', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string = 'abc'  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0476
     * @tc.name      testIfStatementif_f1_33_0476
     * @tc.desc      If statement with truthy value (non-zero number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_33_0476', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = 42  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0477
     * @tc.name      testIfStatementif_f1_34_0477
     * @tc.desc      If statement with truthy value (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_34_0477', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: boolean = true  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0478
     * @tc.name      testIfStatementif_f1_35_0478
     * @tc.desc      If statement with truthy value (computed truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_35_0478', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = (1 - 1) + 1  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0479
     * @tc.name      testIfStatementif_f1_36_0479
     * @tc.desc      If statement with truthy value (substring)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_36_0479', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string = ('a' + 'b').substring(0, 1)  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0480
     * @tc.name      testIfStatementif_f1_37_0480
     * @tc.desc      If statement with truthy value (computed truthy value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_37_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = (42 - 21 - 20)  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0481
     * @tc.name      testIfStatementif_f1_38_0481
     * @tc.desc      If statement with truthy value (unicode char string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_38_0481', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string = '\u0000'  // truthy (non-empty string)
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0482
     * @tc.name      testIfStatementif_f1_39_0482
     * @tc.desc      If statement with falsy value (Number 0 object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_39_0482', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = new Number()  // falsy (0 value, converts to falsy in ArkTS)
      if (v) {
        res = 0
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0483
     * @tc.name      testIfStatementif_f1_40_0483
     * @tc.desc      If statement with falsy value (Long 0 object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_40_0483', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Long = new Long()  // falsy (0 value, converts to falsy in ArkTS)
      if (v) {
        res = 0
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0484
     * @tc.name      testIfStatementif_f1_41_0484
     * @tc.desc      If statement with truthy value (non-empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_41_0484', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number[] = [1, 2, 3]  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0485
     * @tc.name      testIfStatementif_f1_42_0485
     * @tc.desc      If statement with truthy value (string array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_42_0485', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string[] = [""]  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0486
     * @tc.name      testIfStatementif_f1_43_0486
     * @tc.desc      If statement with truthy value (Long.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_43_0486', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: long = Long.MAX_VALUE  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0487
     * @tc.name      testIfStatementif_f1_44_0487
     * @tc.desc      If statement with truthy value (Long MAX_VALUE object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_44_0487', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Long = new Long(Long.MAX_VALUE)  // truthy
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0488
     * @tc.name      testIfStatementif_f1_45_0488
     * @tc.desc      If statement with truthy value (Color.Green)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_45_0488', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Color = Color.Green  // truthy (value is 1)
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0489
     * @tc.name      testIfStatementif_f1_46_0489
     * @tc.desc      If statement with truthy value (TestSize.L)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementif_f1_46_0489', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: TestSize = TestSize.L  // truthy (value is 2)
      if (v) {
        res = 0
      }
      expect(res).assertEqual(0);
    });

  });
}
