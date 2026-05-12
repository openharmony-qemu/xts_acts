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

export default function ExtendedConditionalExpressionsTest10():void {
  describe('ExtendedConditionalExpressionsTest10', () => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0333
     * @tc.name      testConditionalExpressioncond_f2_0_0333
     * @tc.desc      Conditional expression with falsy value (Object|null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_0_0333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0334
     * @tc.name      testConditionalExpressioncond_f2_1_0334
     * @tc.desc      Conditional expression with falsy value (boolean)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_1_0334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = false  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0335
     * @tc.name      testConditionalExpressioncond_f2_2_0335
     * @tc.desc      Conditional expression with falsy value (Boolean object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_2_0335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Boolean = new Boolean(false)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0336
     * @tc.name      testConditionalExpressioncond_f2_3_0336
     * @tc.desc      Conditional expression with falsy value (empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_3_0336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = ''  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0337
     * @tc.name      testConditionalExpressioncond_f2_4_0337
     * @tc.desc      Conditional expression with falsy value (String object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_4_0337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: String = new String('')  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0338
     * @tc.name      testConditionalExpressioncond_f2_5_0338
     * @tc.desc      Conditional expression with falsy value (empty substring)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_5_0338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: String = new String('abc').substring(0, 0)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0339
     * @tc.name      testConditionalExpressioncond_f2_6_0339
     * @tc.desc      Conditional expression with falsy value (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_6_0339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0340
     * @tc.name      testConditionalExpressioncond_f2_7_0340
     * @tc.desc      Conditional expression with falsy value (-0.0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_7_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -0.0  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0341
     * @tc.name      testConditionalExpressioncond_f2_8_0341
     * @tc.desc      Conditional expression with falsy value (Number object 0.0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_8_0341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Number = new Number(0.0)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0342
     * @tc.name      testConditionalExpressioncond_f2_9_0342
     * @tc.desc      Conditional expression with falsy value (Number.NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_9_0342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.NaN  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0343
     * @tc.name      testConditionalExpressioncond_f2_10_0343
     * @tc.desc      Conditional expression with falsy value (Number NaN object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_10_0343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Number = new Number(Number.NaN)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0344
     * @tc.name      testConditionalExpressioncond_f2_11_0344
     * @tc.desc      Conditional expression with truthy value (empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_11_0344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number[] = []  // truthy (empty array is truthy in JS)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0345
     * @tc.name      testConditionalExpressioncond_f2_12_0345
     * @tc.desc      Conditional expression with falsy value (undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_12_0345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: undefined = undefined  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0346
     * @tc.name      testConditionalExpressioncond_f2_13_0346
     * @tc.desc      Conditional expression with falsy value (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_13_0346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: null = null  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0347
     * @tc.name      testConditionalExpressioncond_f2_14_0347
     * @tc.desc      Conditional expression with falsy value (long 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_14_0347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = 0  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0348
     * @tc.name      testConditionalExpressioncond_f2_15_0348
     * @tc.desc      Conditional expression with falsy value (Long object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_15_0348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long()  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0349
     * @tc.name      testConditionalExpressioncond_f2_16_0349
     * @tc.desc      Conditional expression with falsy value (int 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_16_0349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: int = 0  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0350
     * @tc.name      testConditionalExpressioncond_f2_17_0350
     * @tc.desc      Conditional expression with falsy value (Int object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_17_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Int = new Int(0)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0351
     * @tc.name      testConditionalExpressioncond_f2_18_0351
     * @tc.desc      Conditional expression with falsy value (short 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_18_0351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: short = 0  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0352
     * @tc.name      testConditionalExpressioncond_f2_19_0352
     * @tc.desc      Conditional expression with falsy value (Short object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_19_0352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Short = new Short(0)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0353
     * @tc.name      testConditionalExpressioncond_f2_20_0353
     * @tc.desc      Conditional expression with falsy value (Float object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_20_0353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: float = new Float()  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0354
     * @tc.name      testConditionalExpressioncond_f2_21_0354
     * @tc.desc      Conditional expression with falsy value (char null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_21_0354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: char = c'\u0000'  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0355
     * @tc.name      testConditionalExpressioncond_f2_22_0355
     * @tc.desc      Conditional expression with falsy value (Char object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_22_0355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Char = new Char(c'\u0000')  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0356
     * @tc.name      testConditionalExpressioncond_f2_23_0356
     * @tc.desc      Conditional expression with falsy value (bigint 0n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_23_0356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: bigint = 0n  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0357
     * @tc.name      testConditionalExpressioncond_f2_24_0357
     * @tc.desc      Conditional expression with falsy value (Color.Red)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_24_0357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Color = Color.Red  // falsy (value is 0)
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0358
     * @tc.name      testConditionalExpressioncond_f2_25_0358
     * @tc.desc      Conditional expression with falsy value (TestSize.S)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_25_0358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: TestSize = TestSize.S  // falsy (value is 0)
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0359
     * @tc.name      testConditionalExpressioncond_f2_26_0359
     * @tc.desc      Conditional expression with falsy value (Status.None)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_26_0359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Status = Status.None  // falsy (value is 0)
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0360
     * @tc.name      testConditionalExpressioncond_f2_27_0360
     * @tc.desc      Conditional expression with falsy value (Priority.Low)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_27_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Priority = Priority.Low  // falsy (value is 0)
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0361
     * @tc.name      testConditionalExpressioncond_f2_28_0361
     * @tc.desc      Conditional expression with falsy value (Object|undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_28_0361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|undefined = undefined  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0362
     * @tc.name      testConditionalExpressioncond_f2_29_0362
     * @tc.desc      Conditional expression with falsy value (computed 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_29_0362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = (42 - 21 - 21)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0363
     * @tc.name      testConditionalExpressioncond_f2_30_0363
     * @tc.desc      Conditional expression with falsy value (concatenated empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_30_0363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = ('' + '')  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0364
     * @tc.name      testConditionalExpressioncond_f2_31_0364
     * @tc.desc      Conditional expression with truthy value (empty object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_31_0364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = {}  // truthy
      let res = v ? 1 : 0
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0365
     * @tc.name      testConditionalExpressioncond_f2_32_0365
     * @tc.desc      Conditional expression with truthy value (non-empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_32_0365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = 'abc'  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0366
     * @tc.name      testConditionalExpressioncond_f2_33_0366
     * @tc.desc      Conditional expression with truthy value (non-zero number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_33_0366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 42  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0367
     * @tc.name      testConditionalExpressioncond_f2_34_0367
     * @tc.desc      Conditional expression with truthy value (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_34_0367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = true  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0368
     * @tc.name      testConditionalExpressioncond_f2_35_0368
     * @tc.desc      Conditional expression with truthy value (computed non-zero)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_35_0368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = (1 - 1) + 1  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0369
     * @tc.name      testConditionalExpressioncond_f2_36_0369
     * @tc.desc      Conditional expression with truthy value (substring)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_36_0369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = ('a' + 'b').substring(0, 1)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0370
     * @tc.name      testConditionalExpressioncond_f2_37_0370
     * @tc.desc      Conditional expression with truthy value (computed truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_37_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = (42 - 21 - 20)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0371
     * @tc.name      testConditionalExpressioncond_f2_38_0371
     * @tc.desc      Conditional expression with truthy value (non-empty unicode string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_38_0371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = '\u0000'  // truthy (non-empty string)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0372
     * @tc.name      testConditionalExpressioncond_f2_39_0372
     * @tc.desc      Conditional expression with falsy value (Number object 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_39_0372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = new Number()  // falsy (0 value, converts to falsy in ArkTS)
      let res = v ? 0 : 1
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0373
     * @tc.name      testConditionalExpressioncond_f2_40_0373
     * @tc.desc      Conditional expression with falsy value (Long object 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_40_0373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long()  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0374
     * @tc.name      testConditionalExpressioncond_f2_41_0374
     * @tc.desc      Conditional expression with truthy value (non-empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_41_0374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number[] = [1, 2, 3]  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0375
     * @tc.name      testConditionalExpressioncond_f2_42_0375
     * @tc.desc      Conditional expression with truthy value (string array with empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_42_0375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string[] = [""]  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0376
     * @tc.name      testConditionalExpressioncond_f2_43_0376
     * @tc.desc      Conditional expression with truthy value (Long.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_43_0376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = Long.MAX_VALUE  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0377
     * @tc.name      testConditionalExpressioncond_f2_44_0377
     * @tc.desc      Conditional expression with truthy value (Long object MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressioncond_f2_44_0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(Long.MAX_VALUE)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

  });
}
