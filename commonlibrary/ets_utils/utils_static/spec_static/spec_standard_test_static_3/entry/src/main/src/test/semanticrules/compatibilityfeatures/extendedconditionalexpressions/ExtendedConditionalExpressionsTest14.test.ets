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

export default function ExtendedConditionalExpressionsTest14():void {
  describe('ExtendedConditionalExpressionsTest14', () => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0530
     * @tc.name      testWhileLoopwhile_f_0_0530
     * @tc.desc      While loop with falsy boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_0_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: boolean = false  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0531
     * @tc.name      testWhileLoopwhile_f_1_0531
     * @tc.desc      While loop with falsy Boolean wrapper object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_1_0531', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Boolean = new Boolean(false)  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0532
     * @tc.name      testWhileLoopwhile_f_2_0532
     * @tc.desc      While loop with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_2_0532', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: string = ''  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0533
     * @tc.name      testWhileLoopwhile_f_3_0533
     * @tc.desc      While loop with falsy String wrapper object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_3_0533', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: String = new String('')  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0534
     * @tc.name      testWhileLoopwhile_f_4_0534
     * @tc.desc      While loop with empty substring result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_4_0534', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: String = new String('abc').substring(0, 0)  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0535
     * @tc.name      testWhileLoopwhile_f_5_0535
     * @tc.desc      While loop with number zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_5_0535', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: number = 0  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0536
     * @tc.name      testWhileLoopwhile_f_6_0536
     * @tc.desc      While loop with negative zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_6_0536', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: number = -0.0  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0537
     * @tc.name      testWhileLoopwhile_f_7_0537
     * @tc.desc      While loop with Number wrapper zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_7_0537', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Number = new Number(0.0)  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0538
     * @tc.name      testWhileLoopwhile_f_8_0538
     * @tc.desc      While loop with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_8_0538', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: number = Number.NaN  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0539
     * @tc.name      testWhileLoopwhile_f_9_0539
     * @tc.desc      While loop with Number NaN wrapper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_9_0539', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Number = new Number(Number.NaN)  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0540
     * @tc.name      testWhileLoopwhile_f_10_0540
     * @tc.desc      While loop with truthy empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_10_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number[] = []  // truthy (empty array is truthy in JS)
      let count = 0
      while (v) {  // Will enter loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0541
     * @tc.name      testWhileLoopwhile_f_11_0541
     * @tc.desc      While loop with undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_11_0541', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: undefined = undefined  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0542
     * @tc.name      testWhileLoopwhile_f_12_0542
     * @tc.desc      While loop with null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_12_0542', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: null = null  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0543
     * @tc.name      testWhileLoopwhile_f_13_0543
     * @tc.desc      While loop with long zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_13_0543', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: long = 0  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0544
     * @tc.name      testWhileLoopwhile_f_14_0544
     * @tc.desc      While loop with Long wrapper default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_14_0544', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Long = new Long()  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0545
     * @tc.name      testWhileLoopwhile_f_15_0545
     * @tc.desc      While loop with int zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_15_0545', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: int = 0  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0546
     * @tc.name      testWhileLoopwhile_f_16_0546
     * @tc.desc      While loop with Int wrapper zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_16_0546', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Int = new Int(0)  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0547
     * @tc.name      testWhileLoopwhile_f_17_0547
     * @tc.desc      While loop with short zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_17_0547', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: short = 0  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0548
     * @tc.name      testWhileLoopwhile_f_18_0548
     * @tc.desc      While loop with Short wrapper zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_18_0548', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Short = new Short(0)  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0549
     * @tc.name      testWhileLoopwhile_f_19_0549
     * @tc.desc      While loop with Float wrapper default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_19_0549', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: float = new Float()  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0550
     * @tc.name      testWhileLoopwhile_f_20_0550
     * @tc.desc      While loop with null character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_20_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: char = c'\u0000'  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0551
     * @tc.name      testWhileLoopwhile_f_21_0551
     * @tc.desc      While loop with Char wrapper null character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_21_0551', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Char = new Char(c'\u0000')  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0552
     * @tc.name      testWhileLoopwhile_f_22_0552
     * @tc.desc      While loop with bigint zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_22_0552', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: bigint = 0n  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0553
     * @tc.name      testWhileLoopwhile_f_23_0553
     * @tc.desc      While loop with enum Color.Red
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_23_0553', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Color = Color.Red  // falsy (value is 0)
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0554
     * @tc.name      testWhileLoopwhile_f_24_0554
     * @tc.desc      While loop with enum TestSize.S
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_24_0554', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: TestSize = TestSize.S  // falsy (value is 0)
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0555
     * @tc.name      testWhileLoopwhile_f_25_0555
     * @tc.desc      While loop with enum Status.None
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_25_0555', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Status = Status.None  // falsy (value is 0)
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0556
     * @tc.name      testWhileLoopwhile_f_26_0556
     * @tc.desc      While loop with enum Priority.Low
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_26_0556', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Priority = Priority.Low  // falsy (value is 0)
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0557
     * @tc.name      testWhileLoopwhile_f_27_0557
     * @tc.desc      While loop with Object or undefined type undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_27_0557', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Object|undefined = undefined  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0558
     * @tc.name      testWhileLoopwhile_f_28_0558
     * @tc.desc      While loop with Object or null type null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_28_0558', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: Object|null = null  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0559
     * @tc.name      testWhileLoopwhile_f_29_0559
     * @tc.desc      While loop with computed zero expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_29_0559', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: number = (42 - 21 - 21)  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0560
     * @tc.name      testWhileLoopwhile_f_30_0560
     * @tc.desc      While loop with computed empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_30_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      let v: string = ('' + '')  // falsy
      while (v) {  // Should not enter loop
        res = 1
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0561
     * @tc.name      testWhileLoopwhile_f_31_0561
     * @tc.desc      While loop with truthy boolean true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_31_0561', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: boolean = true  // truthy
      while (v) {  // Should enter loop
        res = 0
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0562
     * @tc.name      testWhileLoopwhile_f_32_0562
     * @tc.desc      While loop with non-empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_32_0562', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string = 'abc'  // truthy
      while (v) {  // Should enter loop
        res = 0
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0563
     * @tc.name      testWhileLoopwhile_f_33_0563
     * @tc.desc      While loop with non-zero number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_33_0563', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = 42  // truthy
      while (v) {  // Should enter loop
        res = 0
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0564
     * @tc.name      testWhileLoopwhile_f_34_0564
     * @tc.desc      While loop with empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_34_0564', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Object = {}  // truthy
      while (v) {  // Should enter loop
        res = 0
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0565
     * @tc.name      testWhileLoopwhile_f_35_0565
     * @tc.desc      While loop with non-empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_35_0565', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number[] = [1]  // truthy
      while (v) {  // Should enter loop
        res = 0
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0566
     * @tc.name      testWhileLoopwhile_f_36_0566
     * @tc.desc      While loop with enum Color.Green
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_36_0566', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Color = Color.Green  // truthy (value is 1)
      while (v) {  // Should enter loop
        res = 0
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0567
     * @tc.name      testWhileLoopwhile_f_37_0567
     * @tc.desc      While loop with enum TestSize.L
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_37_0567', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: TestSize = TestSize.L  // truthy (value is 2)
      while (v) {  // Should enter loop
        res = 0
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0568
     * @tc.name      testWhileLoopwhile_f_38_0568
     * @tc.desc      While loop with enum Status.Active
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_38_0568', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Status = Status.Active  // truthy (value is 1)
      while (v) {  // Should enter loop
        res = 0
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0569
     * @tc.name      testWhileLoopwhile_f_39_0569
     * @tc.desc      While loop with enum Priority.High
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_39_0569', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Priority = Priority.High  // truthy (value is 2)
      while (v) {  // Should enter loop
        res = 0
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0570
     * @tc.name      testWhileLoopwhile_f_40_0570
     * @tc.desc      While loop with long MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_40_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: long = Long.MAX_VALUE  // truthy
      while (v) {  // Should enter loop
        res = 0
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0571
     * @tc.name      testWhileLoopwhile_f_41_0571
     * @tc.desc      While loop with Long wrapper MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_41_0571', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: Long = new Long(Long.MAX_VALUE)  // truthy
      while (v) {  // Should enter loop
        res = 0
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0572
     * @tc.name      testWhileLoopwhile_f_42_0572
     * @tc.desc      While loop with non-empty Unicode string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_42_0572', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: string = '\u0000'  // truthy (non-empty string)
      while (v) {  // Should enter loop
        res = 0
        break
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0573
     * @tc.name      testWhileLoopwhile_f_43_0573
     * @tc.desc      While loop with Number wrapper default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopwhile_f_43_0573', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 1;
      let v: number = new Number()  // falsy (0 value, converts to falsy in ArkTS)
      let count = 0
      while (v) {  // Will not enter loop
        count++
        if (count >= 2) {
          res = 0
          break
        }
      }
      expect(res).assertEqual(1);
    });

  });
}
