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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0333
     * @tc.desc      Conditional expression with falsy value (Object|null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0334
     * @tc.desc      Conditional expression with falsy value (boolean)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = false  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0335
     * @tc.desc      Conditional expression with falsy value (Boolean object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Boolean = new Boolean(false)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0336
     * @tc.desc      Conditional expression with falsy value (empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = ''  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0337
     * @tc.desc      Conditional expression with falsy value (String object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: String = new String('')  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0338
     * @tc.desc      Conditional expression with falsy value (empty substring)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: String = new String('abc').substring(0, 0)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0339
     * @tc.desc      Conditional expression with falsy value (0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0340
     * @tc.desc      Conditional expression with falsy value (-0.0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -0.0  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0341
     * @tc.desc      Conditional expression with falsy value (Number object 0.0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Number = new Number(0.0)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0342
     * @tc.desc      Conditional expression with falsy value (Number.NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.NaN  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0343
     * @tc.desc      Conditional expression with falsy value (Number NaN object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Number = new Number(Number.NaN)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0344
     * @tc.desc      Conditional expression with truthy value (empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number[] = []  // truthy (empty array is truthy in JS)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0345
     * @tc.desc      Conditional expression with falsy value (undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: undefined = undefined  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0346
     * @tc.desc      Conditional expression with falsy value (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: null = null  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0347
     * @tc.desc      Conditional expression with falsy value (long 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = 0  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0348
     * @tc.desc      Conditional expression with falsy value (Long object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long()  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0349
     * @tc.desc      Conditional expression with falsy value (int 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: int = 0  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0350
     * @tc.desc      Conditional expression with falsy value (Int object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Int = new Int(0)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0351
     * @tc.desc      Conditional expression with falsy value (short 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: short = 0  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0352
     * @tc.desc      Conditional expression with falsy value (Short object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Short = new Short(0)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0353
     * @tc.desc      Conditional expression with falsy value (Float object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: float = new Float()  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_2200
     * @tc.name    testConditionalExpression0354
     * @tc.desc      Conditional expression with falsy value (char null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: char = c'\u0000'  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_2300
     * @tc.name    testConditionalExpression0355
     * @tc.desc      Conditional expression with falsy value (Char object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Char = new Char(c'\u0000')  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_2400
     * @tc.name    testConditionalExpression0356
     * @tc.desc      Conditional expression with falsy value (bigint 0n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: bigint = 0n  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_2500
     * @tc.name    testConditionalExpression0357
     * @tc.desc      Conditional expression with falsy value (Color.Red)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Color = Color.Red  // falsy (value is 0)
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_2600
     * @tc.name    testConditionalExpression0358
     * @tc.desc      Conditional expression with falsy value (TestSize.S)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: TestSize = TestSize.S  // falsy (value is 0)
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_2700
     * @tc.name    testConditionalExpression0359
     * @tc.desc      Conditional expression with falsy value (Status.None)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Status = Status.None  // falsy (value is 0)
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_2800
     * @tc.name    testConditionalExpression0360
     * @tc.desc      Conditional expression with falsy value (Priority.Low)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Priority = Priority.Low  // falsy (value is 0)
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_2900
     * @tc.name    testConditionalExpression0361
     * @tc.desc      Conditional expression with falsy value (Object|undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|undefined = undefined  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_3000
     * @tc.name    testConditionalExpression0362
     * @tc.desc      Conditional expression with falsy value (computed 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = (42 - 21 - 21)  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_3100
     * @tc.name    testConditionalExpression0363
     * @tc.desc      Conditional expression with falsy value (concatenated empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = ('' + '')  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_3200
     * @tc.name    testConditionalExpression0364
     * @tc.desc      Conditional expression with truthy value (empty object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = {}  // truthy
      let res = v ? 1 : 0
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_3300
     * @tc.name    testConditionalExpression0365
     * @tc.desc      Conditional expression with truthy value (non-empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = 'abc'  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_3400
     * @tc.name    testConditionalExpression0366
     * @tc.desc      Conditional expression with truthy value (non-zero number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 42  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_3500
     * @tc.name    testConditionalExpression0367
     * @tc.desc      Conditional expression with truthy value (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = true  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_3600
     * @tc.name    testConditionalExpression0368
     * @tc.desc      Conditional expression with truthy value (computed non-zero)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = (1 - 1) + 1  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_3700
     * @tc.name    testConditionalExpression0369
     * @tc.desc      Conditional expression with truthy value (substring)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = ('a' + 'b').substring(0, 1)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_3800
     * @tc.name    testConditionalExpression0370
     * @tc.desc      Conditional expression with truthy value (computed truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = (42 - 21 - 20)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_3900
     * @tc.name    testConditionalExpression0371
     * @tc.desc      Conditional expression with truthy value (non-empty unicode string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = '\u0000'  // truthy (non-empty string)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_4000
     * @tc.name    testConditionalExpression0372
     * @tc.desc      Conditional expression with falsy value (Number object 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = new Number()  // falsy (0 value, converts to falsy in ArkTS)
      let res = v ? 0 : 1
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_4100
     * @tc.name    testConditionalExpression0373
     * @tc.desc      Conditional expression with falsy value (Long object 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long()  // falsy
      let res = v ? 1 : 0
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_4200
     * @tc.name    testConditionalExpression0374
     * @tc.desc      Conditional expression with truthy value (non-empty array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number[] = [1, 2, 3]  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_4300
     * @tc.name    testConditionalExpression0375
     * @tc.desc      Conditional expression with truthy value (string array with empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string[] = [""]  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_4400
     * @tc.name    testConditionalExpression0376
     * @tc.desc      Conditional expression with truthy value (Long.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = Long.MAX_VALUE  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TEN_EXPRESSIONS_4500
     * @tc.name    testConditionalExpression0377
     * @tc.desc      Conditional expression with truthy value (Long object MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(Long.MAX_VALUE)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

  });
}
