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

export default function ExtendedConditionalExpressionsTest11():void {
  describe('ExtendedConditionalExpressionsTest11', () => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0378
     * @tc.desc      Conditional expression with truthy value (byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = (0x80).toByte()  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0379
     * @tc.desc      Conditional expression with truthy value (negative byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = -128  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0380
     * @tc.desc      Conditional expression with truthy value (Byte object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Byte = new Byte(1)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0381
     * @tc.desc      Conditional expression with truthy value (int 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: int = 1  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0382
     * @tc.desc      Conditional expression with truthy value (negative int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: int = -1  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0383
     * @tc.desc      Conditional expression with truthy value (Int object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Int = new Int(1)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0384
     * @tc.desc      Conditional expression with truthy value (negative Int object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Int = new Int(-1)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0385
     * @tc.desc      Conditional expression with truthy value (long 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = 1  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0386
     * @tc.desc      Conditional expression with truthy value (negative long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = -1  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0387
     * @tc.desc      Conditional expression with truthy value (Long object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(1)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0388
     * @tc.desc      Conditional expression with truthy value (Short.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: short = Short.MAX_VALUE  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0389
     * @tc.desc      Conditional expression with truthy value (Short object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Short = new Short(1)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0390
     * @tc.desc      Conditional expression with truthy value (float 1.0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: float = 1.0  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0391
     * @tc.desc      Conditional expression with truthy value (Float object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Float = new Float(1.0)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0392
     * @tc.desc      Conditional expression with truthy value (char space)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: char = c' '  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0393
     * @tc.desc      Conditional expression with truthy value (Char object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Char = new Char(c' ')  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0394
     * @tc.desc      Conditional expression with truthy value (string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = 'a'  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0395
     * @tc.desc      Conditional expression with truthy value (String object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: String = new String('a')  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0396
     * @tc.desc      Conditional expression with truthy value (substring)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: String = new String('abc').substring(0, 1)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0397
     * @tc.desc      Conditional expression with truthy value (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = true  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0398
     * @tc.desc      Conditional expression with truthy value (Boolean true object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Boolean = new Boolean(true)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_2200
     * @tc.name    testConditionalExpression0399
     * @tc.desc      Conditional expression with truthy value (number 1.0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 1.0  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_2300
     * @tc.name    testConditionalExpression0400
     * @tc.desc      Conditional expression with truthy value (Number object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Number = new Number(1.0)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_2400
     * @tc.name    testConditionalExpression0401
     * @tc.desc      Conditional expression with truthy value (POSITIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.POSITIVE_INFINITY  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_2500
     * @tc.name    testConditionalExpression0402
     * @tc.desc      Conditional expression with truthy value (NEGATIVE_INFINITY)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.NEGATIVE_INFINITY  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_2600
     * @tc.name    testConditionalExpression0403
     * @tc.desc      Conditional expression with truthy value (Number POSITIVE_INFINITY object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Number = new Number(Number.POSITIVE_INFINITY)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_2700
     * @tc.name    testConditionalExpression0404
     * @tc.desc      Conditional expression with truthy value (MIN_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.MIN_VALUE  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_2800
     * @tc.name    testConditionalExpression0405
     * @tc.desc      Conditional expression with truthy value (array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number[] = [1]  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_2900
     * @tc.name    testConditionalExpression0406
     * @tc.desc      Conditional expression with truthy value (string array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string[] = [""]  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_3000
     * @tc.name    testConditionalExpression0407
     * @tc.desc      Conditional expression with truthy value (Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = {}  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_3100
     * @tc.name    testConditionalExpression0408
     * @tc.desc      Conditional expression with truthy value (Color.Green)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Color = Color.Green  // truthy (value is 1)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_3200
     * @tc.name    testConditionalExpression0409
     * @tc.desc      Conditional expression with truthy value (Color.Blue)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Color = Color.Blue  // truthy (value is 2)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_3300
     * @tc.name    testConditionalExpression0410
     * @tc.desc      Conditional expression with truthy value (TestSize.M)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: TestSize = TestSize.M  // truthy (value is 1)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_3400
     * @tc.name    testConditionalExpression0411
     * @tc.desc      Conditional expression with truthy value (TestSize.L)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: TestSize = TestSize.L  // truthy (value is 2)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_3500
     * @tc.name    testConditionalExpression0412
     * @tc.desc      Conditional expression with truthy value (Status.Active)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Status = Status.Active  // truthy (value is 1)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_3600
     * @tc.name    testConditionalExpression0413
     * @tc.desc      Conditional expression with truthy value (Priority.Medium)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Priority = Priority.Medium  // truthy (value is 1)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_3700
     * @tc.name    testConditionalExpression0414
     * @tc.desc      Conditional expression with truthy value (Priority.High)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Priority = Priority.High  // truthy (value is 2)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_3800
     * @tc.name    testConditionalExpression0415
     * @tc.desc      Conditional expression with truthy value (Long.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = Long.MAX_VALUE  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_3900
     * @tc.name    testConditionalExpression0416
     * @tc.desc      Conditional expression with truthy value (Long MAX_VALUE object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(Long.MAX_VALUE)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_4000
     * @tc.name    testConditionalExpression0417
     * @tc.desc      Conditional expression with truthy value (short 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: short = 1  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_4100
     * @tc.name    testConditionalExpression0418
     * @tc.desc      Conditional expression with truthy value (unicode char string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = '\u0000'  // truthy (non-empty string)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_4200
     * @tc.name    testConditionalExpression0419
     * @tc.desc      Conditional expression with truthy value (bigint 1n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: bigint = 1n  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_4300
     * @tc.name    testConditionalExpression0420
     * @tc.desc      Conditional expression with truthy value (negative bigint)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: bigint = -1n  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_4400
     * @tc.name    testConditionalExpression0421
     * @tc.desc      Conditional expression with falsy value (Number 0 object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = new Number()  // falsy (0 value, converts to falsy in ArkTS)
      let res = v ? 0 : 1
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_4500
     * @tc.name    testConditionalExpression0422
     * @tc.desc      Conditional expression with truthy value (computed non-zero)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = (1 - 1) + 1  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_4600
     * @tc.name    testConditionalExpression0423
     * @tc.desc      Conditional expression with truthy value (concatenated substring)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = ('a' + 'b').substring(0, 1)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_4700
     * @tc.name    testConditionalExpression0424
     * @tc.desc      Conditional expression with truthy value (computed truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = (42 - 21 - 20)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_4800
     * @tc.name    testConditionalExpression0425
     * @tc.desc      Conditional expression with truthy value (Object|undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|undefined = {} as Object  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_4900
     * @tc.name    testConditionalExpression0426
     * @tc.desc      Conditional expression with truthy value (Long.MIN_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = Long.MIN_VALUE  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_5000
     * @tc.name    testConditionalExpression0427
     * @tc.desc      Conditional expression with truthy value (Long MIN_VALUE object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(Long.MIN_VALUE)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_5100
     * @tc.name    testConditionalExpression0428
     * @tc.desc      Conditional expression with truthy value (short array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: short[] = [0 as short]  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_5200
     * @tc.name    testConditionalExpression0429
     * @tc.desc      Conditional expression with truthy value (byte 127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: byte = 127  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_5300
     * @tc.name    testConditionalExpression0430
     * @tc.desc      Conditional expression with truthy value (Byte 127 object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Byte = new Byte(127)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_5400
     * @tc.name    testConditionalExpression0431
     * @tc.desc      Conditional expression with truthy value (int 42)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: int = 42  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_5500
     * @tc.name    testConditionalExpression0432
     * @tc.desc      Conditional expression with truthy value (Int 42 object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Int = new Int(42)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_5600
     * @tc.name    testConditionalExpression0433
     * @tc.desc      Conditional expression with truthy value (long 9223372036854775807)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = 9223372036854775807  // truthy (Long.MAX_VALUE)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_5700
     * @tc.name    testConditionalExpression0434
     * @tc.desc      Conditional expression with truthy value (Long object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(9223372036854775807)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_5800
     * @tc.name    testConditionalExpression0435
     * @tc.desc      Conditional expression with truthy value (Short.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: short = 32767  // truthy (Short.MAX_VALUE)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_5900
     * @tc.name    testConditionalExpression0436
     * @tc.desc      Conditional expression with truthy value (Short object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Short = new Short(32767)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_6000
     * @tc.name    testConditionalExpression0437
     * @tc.desc      Conditional expression with truthy value (Float.MAX_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Float = new Float(3.4028235e38)  // truthy (Float.MAX_VALUE)
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_6100
     * @tc.name    testConditionalExpression0438
     * @tc.desc      Conditional expression with truthy value (Float object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Float = new Float(3.4028235e38)  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_6200
     * @tc.name    testConditionalExpression0439
     * @tc.desc      Conditional expression with truthy value (char A)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: char = c'A'  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_6300
     * @tc.name    testConditionalExpression0440
     * @tc.desc      Conditional expression with truthy value (Char object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Char = new Char(c'A')  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_6400
     * @tc.name    testConditionalExpression0441
     * @tc.desc      Conditional expression with truthy value (Hello World)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = 'Hello World'  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_ELEVEN_EXPRESSIONS_6500
     * @tc.name    testConditionalExpression0442
     * @tc.desc      Conditional expression with truthy value (String Hello object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: String = new String('Hello')  // truthy
      let res = v ? 0 : 1
      expect(res).assertEqual(0);
    });

  });
}
