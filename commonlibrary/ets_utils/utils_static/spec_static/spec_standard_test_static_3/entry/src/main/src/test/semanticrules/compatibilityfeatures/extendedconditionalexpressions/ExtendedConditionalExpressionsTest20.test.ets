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

interface ValueObject {
  value: number
}

interface NestedObject {
  nested: Object
}


interface ValueNullObject {
  value: Object | null
}

// Enum definitions
enum Status { Active = 1, Inactive = 0 }
enum State { Start = 1, Middle = 2, End = 0 }

export default function ExtendedConditionalExpressionsTest20(): void {
  describe('ExtendedConditionalExpressionsTest20', () => {
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

    // Ternary Expressions with Logical Operators
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0746
     * @tc.desc      Ternary with AND operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0746', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 0 ? 1 : (1 && 2)
      expect(result).assertEqual(2)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0747
     * @tc.desc      Ternary with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0747', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 0 ? 1 : (0 || 2)
      expect(result).assertEqual(2)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0748
     * @tc.desc      Nested ternary with logical operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0748', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = (1 && 0) ? 3 : ((0 || 1) ? 4 : 5)
      expect(result).assertEqual(4)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0749
     * @tc.desc      Ternary and AND chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0749', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1
      let b: number = a ? 2 : 3
      let c: number = b && 4
      expect(c).assertEqual(4)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0750
     * @tc.desc      Nullish coalescing with AND
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = (null ?? 1) && 2
      expect(result).assertEqual(2)
    })
    
    // Function Calls in Conditional Expressions
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0751
     * @tc.desc      Short-circuit with AND and function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0751', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 0 && ((): number => { called = true; return 1 })()
      expect(called).assertFalse()
      expect(result).assertEqual(0)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0752
     * @tc.desc      Short-circuit with OR and function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0752', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 0 || ((): number => { called = true; return 1 })()
      expect(called).assertTrue()
      expect(result).assertEqual(1)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0753
     * @tc.desc      AND with function call returning falsy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0753', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 1 && ((): number => { called = true; return 0 })()
      expect(called).assertTrue()
      expect(result).assertEqual(0)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0754
     * @tc.desc      OR with function call returning truthy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0754', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 0 || ((): number => { called = true; return 42 })()
      expect(called).assertTrue()
      expect(result).assertEqual(42)
    })
    
    // Method Calls in Conditional Expressions
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0755
     * @tc.desc      String method call in conditional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0755', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "hello"
      let result = str && str.length > 0
      expect(result).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0756
     * @tc.desc      Array method call in conditional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0756', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [1, 2, 3]
      let result = arr && arr.length > 0
      expect(result).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0757
     * @tc.desc      Array length with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0757', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = []
      let result: number = arr.length || 42
      expect(result).assertEqual(42)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0758
     * @tc.desc      Object property comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0758', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValueObject = { value: 1 }
      let cond: boolean = obj.value > 0
      expect(cond).assertTrue()
    })
    
    // Property Access in Conditional Expressions
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0759
     * @tc.desc      Object property access with ternary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0759', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValueObject | null = { value: 1 }
      let result: number = obj ? obj.value : 0
      expect(result).assertEqual(1)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0760
     * @tc.desc      Object property with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValueObject = { value: 0 }
      let result: number = obj.value || 42
      expect(result).assertEqual(42)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0761
     * @tc.desc      Nested object with ternary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0761', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: NestedObject | null = null
      let result: NestedObject | null = obj ? obj.nested as NestedObject : null
      expect(result).assertEqual(null)
    })
    
    // Array Operations in Conditional Context
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0762
     * @tc.desc      Array access with ternary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0762', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [1, 2, 3]
      let result: number = arr ? arr[0] : 0
      expect(result).assertEqual(1)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0763
     * @tc.desc      Array element with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0763', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [0, 1, 2]
      let result: number = arr[0] || arr[1]
      expect(result).assertEqual(1)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0764
     * @tc.desc      Array filter with comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0764', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [0, 1, 2, 3]
      let result: Array<number> = arr.filter(v => v > 1)
      expect(result.length).assertEqual(2)
      expect(result[0]).assertEqual(2)
      expect(result[1]).assertEqual(3)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0765
     * @tc.desc      Array map with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0765', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [0, 1, 2]
      let result: Array<number> = arr.map(v => v || 10)
      expect(result[0]).assertEqual(10)
      expect(result[1]).assertEqual(1)
      expect(result[2]).assertEqual(2)
    })
    
    // Complex Short-Circuit Evaluation
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0766
     * @tc.desc      Short-circuit AND falsy first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0766', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 0 && ((): number => { called = true; return 1 })()
      expect(called).assertFalse()
      expect(result).assertEqual(0)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_2200
     * @tc.name    testConditionalExpression0767
     * @tc.desc      Short-circuit AND truthy first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0767', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 1 && ((): number => { called = true; return 42 })()
      expect(called).assertTrue()
      expect(result).assertEqual(42)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_2300
     * @tc.name    testConditionalExpression0768
     * @tc.desc      Short-circuit OR falsy first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0768', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 0 || ((): number => { called = true; return 42 })()
      expect(called).assertTrue()
      expect(result).assertEqual(42)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_2400
     * @tc.name    testConditionalExpression0769
     * @tc.desc      Short-circuit OR truthy first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0769', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 1 || ((): number => { called = true; return 0 })()
      expect(called).assertFalse()
      expect(result).assertEqual(1)
    })
    
    // Operator Precedence with Logical Operators
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_2500
     * @tc.name    testConditionalExpression0770
     * @tc.desc      AND then OR precedence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 1 && 0 || 2
      expect(result).assertEqual(2)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_2600
     * @tc.name    testConditionalExpression0771
     * @tc.desc      Explicit grouping precedence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0771', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 1 && (0 || 2)
      expect(result).assertEqual(2)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_2700
     * @tc.name    testConditionalExpression0772
     * @tc.desc      Comparison with AND precedence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0772', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = 1 > 0 && 2 < 3
      expect(result).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_2800
     * @tc.name    testConditionalExpression0773
     * @tc.desc      Ternary with AND precedence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0773', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 1 > 0 ? 1 && 2 : 3
      expect(result).assertEqual(2)
    })
    
    // Enum and Constant Combinations (using enums defined at top level)
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_2900
     * @tc.name    testConditionalExpression0774
     * @tc.desc      Enum with AND operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0774', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Status.Active && true
      expect(result).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_3000
     * @tc.name    testConditionalExpression0775
     * @tc.desc      Enum with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0775', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Status.Inactive || 42
      expect(result).assertEqual(42)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_3100
     * @tc.name    testConditionalExpression0776
     * @tc.desc      Enum AND enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0776', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = State.Start && State.Middle
      expect(result).assertEqual(2)
    })
    
    // Null-Safety Chains
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_3200
     * @tc.name    testConditionalExpression0777
     * @tc.desc      Null-safe chain with null inner value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0777', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValueNullObject | null = { value: null }
      let result: Object | null = obj ? obj.value : null
      expect(result).assertEqual(null)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_3300
     * @tc.name    testConditionalExpression0778
     * @tc.desc      Null-safe chain with null object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0778', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: NestedObject | null = null
      let result: NestedObject | null = obj ? obj.nested as NestedObject : null
      expect(result).assertEqual(null)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_3400
     * @tc.name    testConditionalExpression0779
     * @tc.desc      Null object with default value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0779', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValueObject | null = null
      let result: number = obj ? obj.value : 100
      expect(result).assertEqual(100)
    })
    
    // Edge Cases
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_3500
     * @tc.name    testConditionalExpression0780
     * @tc.desc      Positive infinity with AND
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond = Number.POSITIVE_INFINITY && true
      expect(cond).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_3600
     * @tc.name    testConditionalExpression0781
     * @tc.desc      Negative infinity with AND
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0781', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond = Number.NEGATIVE_INFINITY && true
      expect(cond).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_3700
     * @tc.name    testConditionalExpression0782
     * @tc.desc      MAX_VALUE with AND
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0782', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond = Number.MAX_VALUE && true
      expect(cond).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_3800
     * @tc.name    testConditionalExpression0783
     * @tc.desc      MIN_VALUE with AND
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0783', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond = Number.MIN_VALUE && true
      expect(cond).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_TWENTY_EXPRESSIONS_3900
     * @tc.name    testConditionalExpression0784
     * @tc.desc      Empty string and null with defaults
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0784', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: string = ""
      let nullVal: string | null = null
      let result1: string = empty || "default"
      let result2: string = nullVal ?? "default"
      expect(result1).assertEqual("default")
      expect(result2).assertEqual("default")
    })
  });
}

