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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0673
     * @tc.name      testOpsTernaryComplex001
     * @tc.desc      Ternary with AND operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsTernaryComplex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 0 ? 1 : (1 && 2)
      expect(result).assertEqual(2)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0674
     * @tc.name      testOpsTernaryComplex002
     * @tc.desc      Ternary with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsTernaryComplex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 0 ? 1 : (0 || 2)
      expect(result).assertEqual(2)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0675
     * @tc.name      testOpsTernaryComplex003
     * @tc.desc      Nested ternary with logical operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsTernaryComplex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = (1 && 0) ? 3 : ((0 || 1) ? 4 : 5)
      expect(result).assertEqual(4)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0676
     * @tc.name      testOpsTernaryComplex004
     * @tc.desc      Ternary and AND chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsTernaryComplex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1
      let b: number = a ? 2 : 3
      let c: number = b && 4
      expect(c).assertEqual(4)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0677
     * @tc.name      testOpsTernaryComplex005
     * @tc.desc      Nullish coalescing with AND
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsTernaryComplex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = (null ?? 1) && 2
      expect(result).assertEqual(2)
    })
    
    // Function Calls in Conditional Expressions
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0678
     * @tc.name      testOpsFunctionCalls001
     * @tc.desc      Short-circuit with AND and function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsFunctionCalls001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 0 && ((): number => { called = true; return 1 })()
      expect(called).assertFalse()
      expect(result).assertEqual(0)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0679
     * @tc.name      testOpsFunctionCalls002
     * @tc.desc      Short-circuit with OR and function call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsFunctionCalls002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 0 || ((): number => { called = true; return 1 })()
      expect(called).assertTrue()
      expect(result).assertEqual(1)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0680
     * @tc.name      testOpsFunctionCalls003
     * @tc.desc      AND with function call returning falsy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsFunctionCalls003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 1 && ((): number => { called = true; return 0 })()
      expect(called).assertTrue()
      expect(result).assertEqual(0)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0681
     * @tc.name      testOpsFunctionCalls004
     * @tc.desc      OR with function call returning truthy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsFunctionCalls004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 0 || ((): number => { called = true; return 42 })()
      expect(called).assertTrue()
      expect(result).assertEqual(42)
    })
    
    // Method Calls in Conditional Expressions
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0682
     * @tc.name      testOpsMethodCalls001
     * @tc.desc      String method call in conditional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsMethodCalls001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "hello"
      let result = str && str.length > 0
      expect(result).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0683
     * @tc.name      testOpsMethodCalls002
     * @tc.desc      Array method call in conditional
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsMethodCalls002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [1, 2, 3]
      let result = arr && arr.length > 0
      expect(result).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0684
     * @tc.name      testOpsMethodCalls003
     * @tc.desc      Array length with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsMethodCalls003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = []
      let result: number = arr.length || 42
      expect(result).assertEqual(42)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0685
     * @tc.name      testOpsMethodCalls004
     * @tc.desc      Object property comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsMethodCalls004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValueObject = { value: 1 }
      let cond: boolean = obj.value > 0
      expect(cond).assertTrue()
    })
    
    // Property Access in Conditional Expressions
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0686
     * @tc.name      testOpsPropertyAccess001
     * @tc.desc      Object property access with ternary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsPropertyAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValueObject | null = { value: 1 }
      let result: number = obj ? obj.value : 0
      expect(result).assertEqual(1)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0687
     * @tc.name      testOpsPropertyAccess002
     * @tc.desc      Object property with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsPropertyAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValueObject = { value: 0 }
      let result: number = obj.value || 42
      expect(result).assertEqual(42)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0688
     * @tc.name      testOpsPropertyAccess003
     * @tc.desc      Nested object with ternary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsPropertyAccess003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: NestedObject | null = null
      let result: NestedObject | null = obj ? obj.nested as NestedObject : null
      expect(result).assertEqual(null)
    })
    
    // Array Operations in Conditional Context
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0689
     * @tc.name      testOpsArrayOps001
     * @tc.desc      Array access with ternary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsArrayOps001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [1, 2, 3]
      let result: number = arr ? arr[0] : 0
      expect(result).assertEqual(1)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0690
     * @tc.name      testOpsArrayOps002
     * @tc.desc      Array element with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsArrayOps002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [0, 1, 2]
      let result: number = arr[0] || arr[1]
      expect(result).assertEqual(1)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0691
     * @tc.name      testOpsArrayOps003
     * @tc.desc      Array filter with comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsArrayOps003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [0, 1, 2, 3]
      let result: Array<number> = arr.filter(v => v > 1)
      expect(result.length).assertEqual(2)
      expect(result[0]).assertEqual(2)
      expect(result[1]).assertEqual(3)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0692
     * @tc.name      testOpsArrayOps004
     * @tc.desc      Array map with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsArrayOps004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [0, 1, 2]
      let result: Array<number> = arr.map(v => v || 10)
      expect(result[0]).assertEqual(10)
      expect(result[1]).assertEqual(1)
      expect(result[2]).assertEqual(2)
    })
    
    // Complex Short-Circuit Evaluation
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0693
     * @tc.name      testOpsShortCircuit001
     * @tc.desc      Short-circuit AND falsy first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsShortCircuit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 0 && ((): number => { called = true; return 1 })()
      expect(called).assertFalse()
      expect(result).assertEqual(0)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0694
     * @tc.name      testOpsShortCircuit002
     * @tc.desc      Short-circuit AND truthy first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsShortCircuit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 1 && ((): number => { called = true; return 42 })()
      expect(called).assertTrue()
      expect(result).assertEqual(42)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0695
     * @tc.name      testOpsShortCircuit003
     * @tc.desc      Short-circuit OR falsy first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsShortCircuit003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 0 || ((): number => { called = true; return 42 })()
      expect(called).assertTrue()
      expect(result).assertEqual(42)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0696
     * @tc.name      testOpsShortCircuit004
     * @tc.desc      Short-circuit OR truthy first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsShortCircuit004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let result: number = 1 || ((): number => { called = true; return 0 })()
      expect(called).assertFalse()
      expect(result).assertEqual(1)
    })
    
    // Operator Precedence with Logical Operators
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0697
     * @tc.name      testOpsPrecedence001
     * @tc.desc      AND then OR precedence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsPrecedence001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 1 && 0 || 2
      expect(result).assertEqual(2)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0698
     * @tc.name      testOpsPrecedence002
     * @tc.desc      Explicit grouping precedence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsPrecedence002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 1 && (0 || 2)
      expect(result).assertEqual(2)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0699
     * @tc.name      testOpsPrecedence003
     * @tc.desc      Comparison with AND precedence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsPrecedence003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = 1 > 0 && 2 < 3
      expect(result).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0700
     * @tc.name      testOpsPrecedence004
     * @tc.desc      Ternary with AND precedence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsPrecedence004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 1 > 0 ? 1 && 2 : 3
      expect(result).assertEqual(2)
    })
    
    // Enum and Constant Combinations (using enums defined at top level)
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0701
     * @tc.name      testOpsEnumConst001
     * @tc.desc      Enum with AND operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsEnumConst001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Status.Active && true
      expect(result).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0702
     * @tc.name      testOpsEnumConst002
     * @tc.desc      Enum with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsEnumConst002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Status.Inactive || 42
      expect(result).assertEqual(42)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0703
     * @tc.name      testOpsEnumConst003
     * @tc.desc      Enum AND enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsEnumConst003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = State.Start && State.Middle
      expect(result).assertEqual(2)
    })
    
    // Null-Safety Chains
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0704
     * @tc.name      testOpsNullSafe001
     * @tc.desc      Null-safe chain with null inner value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsNullSafe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValueNullObject | null = { value: null }
      let result: Object | null = obj ? obj.value : null
      expect(result).assertEqual(null)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0705
     * @tc.name      testOpsNullSafe002
     * @tc.desc      Null-safe chain with null object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsNullSafe002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: NestedObject | null = null
      let result: NestedObject | null = obj ? obj.nested as NestedObject : null
      expect(result).assertEqual(null)
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0706
     * @tc.name      testOpsNullSafe003
     * @tc.desc      Null object with default value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsNullSafe003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValueObject | null = null
      let result: number = obj ? obj.value : 100
      expect(result).assertEqual(100)
    })
    
    // Edge Cases
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0707
     * @tc.name      testOpsEdgeCases001
     * @tc.desc      Positive infinity with AND
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsEdgeCases001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond = Number.POSITIVE_INFINITY && true
      expect(cond).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0708
     * @tc.name      testOpsEdgeCases002
     * @tc.desc      Negative infinity with AND
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsEdgeCases002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond = Number.NEGATIVE_INFINITY && true
      expect(cond).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0709
     * @tc.name      testOpsEdgeCases003
     * @tc.desc      MAX_VALUE with AND
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsEdgeCases003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond = Number.MAX_VALUE && true
      expect(cond).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0710
     * @tc.name      testOpsEdgeCases004
     * @tc.desc      MIN_VALUE with AND
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsEdgeCases004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond = Number.MIN_VALUE && true
      expect(cond).assertTrue()
    })
    
    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0711
     * @tc.name      testOpsEdgeCases005
     * @tc.desc      Empty string and null with defaults
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOpsEdgeCases005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: string = ""
      let nullVal: string | null = null
      let result1: string = empty || "default"
      let result2: string = nullVal ?? "default"
      expect(result1).assertEqual("default")
      expect(result2).assertEqual("default")
    })
  });
}

