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

export default function ExtendedConditionalExpressionsTest15():void {
  describe('ExtendedConditionalExpressionsTest15', () => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0574
     * @tc.desc      Do-while loop with falsy boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0574', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: boolean = false  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0575
     * @tc.desc      Do-while loop with Boolean wrapper false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0575', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Boolean = new Boolean(false)  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0576
     * @tc.desc      Do-while loop with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0576', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string = ''  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0577
     * @tc.desc      Do-while loop with String wrapper empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0577', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: String = new String('')  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0578
     * @tc.desc      Do-while loop with empty substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0578', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: String = new String('abc').substring(0, 0)  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0579
     * @tc.desc      Do-while loop with number zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0579', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = 0  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0580
     * @tc.desc      Do-while loop with negative zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = -0.0  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0581
     * @tc.desc      Do-while loop with Number wrapper zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0581', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Number = new Number(0.0)  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0582
     * @tc.desc      Do-while loop with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0582', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = Number.NaN  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0583
     * @tc.desc      Do-while loop with Number NaN wrapper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0583', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Number = new Number(Number.NaN)  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0584
     * @tc.desc      Do-while loop with truthy empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0584', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number[] = []  // truthy (empty array is truthy in JS)
      let count = 0
      do {  // Will loop but we limit it
        res = 0
        count++
      } while (v && count < 1)  // Exit after one iteration
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0585
     * @tc.desc      Do-while loop with undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0585', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: undefined = undefined  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0586
     * @tc.desc      Do-while loop with null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0586', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: null = null  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0587
     * @tc.desc      Do-while loop with long zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0587', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: long = 0  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0588
     * @tc.desc      Do-while loop with Long wrapper default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0588', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Long = new Long()  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0589
     * @tc.desc      Do-while loop with int zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0589', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: int = 0  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0590
     * @tc.desc      Do-while loop with Int wrapper zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Int = new Int(0)  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0591
     * @tc.desc      Do-while loop with short zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0591', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: short = 0  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0592
     * @tc.desc      Do-while loop with Short wrapper zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0592', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Short = new Short(0)  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0593
     * @tc.desc      Do-while loop with Float wrapper default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0593', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: float = new Float()  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0594
     * @tc.desc      Do-while loop with null character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0594', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: char = c'\u0000'  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_2200
     * @tc.name    testConditionalExpression0595
     * @tc.desc      Do-while loop with Char wrapper null character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0595', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Char = new Char(c'\u0000')  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_2300
     * @tc.name    testConditionalExpression0596
     * @tc.desc      Do-while loop with bigint zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0596', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: bigint = 0n  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_2400
     * @tc.name    testConditionalExpression0597
     * @tc.desc      Do-while loop with enum Color.Red
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0597', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Color = Color.Red  // falsy (value is 0)
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_2500
     * @tc.name    testConditionalExpression0598
     * @tc.desc      Do-while loop with enum TestSize.S
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0598', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: TestSize = TestSize.S  // falsy (value is 0)
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_2600
     * @tc.name    testConditionalExpression0599
     * @tc.desc      Do-while loop with enum Status.None
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0599', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Status = Status.None  // falsy (value is 0)
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_2700
     * @tc.name    testConditionalExpression0600
     * @tc.desc      Do-while loop with enum Priority.Low
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Priority = Priority.Low  // falsy (value is 0)
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_2800
     * @tc.name    testConditionalExpression0601
     * @tc.desc      Do-while loop with Object or undefined undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Object|undefined = undefined  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_2900
     * @tc.name    testConditionalExpression0602
     * @tc.desc      Do-while loop with Object or null null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Object|null = null  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_3000
     * @tc.name    testConditionalExpression0603
     * @tc.desc      Do-while loop with computed zero expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = (42 - 21 - 21)  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_3100
     * @tc.name    testConditionalExpression0604
     * @tc.desc      Do-while loop with computed empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string = ('' + '')  // falsy
      do {  // Should execute once
        res = 0
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_3200
     * @tc.name    testConditionalExpression0605
     * @tc.desc      Do-while loop with truthy boolean true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: boolean = true  // truthy
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_3300
     * @tc.name    testConditionalExpression0606
     * @tc.desc      Do-while loop with non-empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string = 'abc'  // truthy
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_3400
     * @tc.name    testConditionalExpression0607
     * @tc.desc      Do-while loop with non-zero number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = 42  // truthy
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_3500
     * @tc.name    testConditionalExpression0608
     * @tc.desc      Do-while loop with empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Object = {}  // truthy
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_3600
     * @tc.name    testConditionalExpression0609
     * @tc.desc      Do-while loop with non-empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0609', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number[] = [1]  // truthy
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_3700
     * @tc.name    testConditionalExpression0610
     * @tc.desc      Do-while loop with enum Color.Green
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Color = Color.Green  // truthy (value is 1)
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_3800
     * @tc.name    testConditionalExpression0611
     * @tc.desc      Do-while loop with enum TestSize.L
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0611', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: TestSize = TestSize.L  // truthy (value is 2)
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_3900
     * @tc.name    testConditionalExpression0612
     * @tc.desc      Do-while loop with enum Status.Active
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0612', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Status = Status.Active  // truthy (value is 1)
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_4000
     * @tc.name    testConditionalExpression0613
     * @tc.desc      Do-while loop with enum Priority.High
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0613', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Priority = Priority.High  // truthy (value is 2)
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_4100
     * @tc.name    testConditionalExpression0614
     * @tc.desc      Do-while loop with long MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0614', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: long = Long.MAX_VALUE  // truthy
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_4200
     * @tc.name    testConditionalExpression0615
     * @tc.desc      Do-while loop with Long wrapper MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0615', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Long = new Long(Long.MAX_VALUE)  // truthy
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_4300
     * @tc.name    testConditionalExpression0616
     * @tc.desc      Do-while loop with non-empty Unicode string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0616', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string = '\u0000'  // truthy (non-empty string)
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_4400
     * @tc.name    testConditionalExpression0617
     * @tc.desc      Do-while loop with Number wrapper default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0617', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = new Number()  // falsy (0 value, converts to falsy in ArkTS)
      let count = 0
      do {  // Will execute once (do-while always executes body)
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)  // v is falsy, loop ends
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_4500
     * @tc.name    testConditionalExpression0618
     * @tc.desc      Do-while loop with non-zero int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0618', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: int = 42  // truthy
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_4600
     * @tc.name    testConditionalExpression0619
     * @tc.desc      Do-while loop with Int wrapper non-zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0619', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Int = new Int(42)  // truthy
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_4700
     * @tc.name    testConditionalExpression0620
     * @tc.desc      Do-while loop with non-zero short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: short = 100  // truthy
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_FIFTEEN_EXPRESSIONS_4800
     * @tc.name    testConditionalExpression0621
     * @tc.desc      Do-while loop with Short wrapper non-zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0621', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Short = new Short(100)  // truthy
      let count = 0
      do {  // Should loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      } while (v)
      expect(res).assertEqual(0);
    });

  });
}
