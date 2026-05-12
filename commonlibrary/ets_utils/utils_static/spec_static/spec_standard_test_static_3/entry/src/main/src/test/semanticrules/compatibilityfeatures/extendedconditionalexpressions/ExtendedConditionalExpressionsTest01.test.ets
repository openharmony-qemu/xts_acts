/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

class TestContainer {
  public value: Object|null = null;
}

function addNumbers(a: number, b: number): number {
  return a + b;
}

// File-level enum declarations for tests
enum Color { Red, Green, Blue }
enum TestSize { S, M, L }
enum Status { None, Active, Inactive }
enum Priority { Low = 0, Medium = 1, High = 2 }

export default function ExtendedConditionalExpressionsTest01():void {
  describe('ExtendedConditionalExpressionsTest01', () => {
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
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0100
     * @tc.name      testConditionalExpressionFalsy0001
     * @tc.desc      ArkTS provides extended semantics for conditional expression with falsy value (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionFalsy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (null) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0200
     * @tc.name      testConditionalExpressionTruthy0002
     * @tc.desc      ArkTS provides extended semantics for conditional expression with truthy value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionTruthy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (1) ? 0 : 1  // truthy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0300
     * @tc.name      testDoWhileFalsy0003
     * @tc.desc      Do-while loop with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDoWhileFalsy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null  // falsy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0400
     * @tc.name      testDoWhileTruthy0004
     * @tc.desc      Do-while loop with truthy condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDoWhileTruthy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new Object()  // truthy
      let res: number = 0
      let loopCount: number = 0

      do {
        loopCount++
        if (loopCount >= 3) {
          break
        }
      } while (v)

      expect(loopCount).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0500
     * @tc.name      testForLoopFalsy0005
     * @tc.desc      For loop with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForLoopFalsy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null
      let retcode: number = 0

      for (let i: number = 0; v; i++) {  // falsy
        if (i == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0600
     * @tc.name      testForLoopTruthy0006
     * @tc.desc      For loop with truthy condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForLoopTruthy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new Object()  // truthy
      let retcode: number = 0

      for (let i: number = 0; v; i++) {
        retcode = i + 1
        if (i >= 2) {
          break
        }
      }
      expect(retcode).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0700
     * @tc.name      testIfStatementFalsy0007
     * @tc.desc      If statement with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementFalsy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (null) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0800
     * @tc.name      testIfStatementTruthy0008
     * @tc.desc      If statement with truthy condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementTruthy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (1) { // truthy
        res = 1
      }
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_0900
     * @tc.name      testWhileLoopFalsy0009
     * @tc.desc      While loop with falsy condition (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopFalsy0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null
      let retcode: number = 0

      while (v) {  // falsy
        if (retcode == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_1000
     * @tc.name      testWhileLoopTruthy0010
     * @tc.desc      While loop with truthy condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopTruthy0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new Object()  // truthy
      let retcode: number = 0
      let loopCount: number = 0

      while (v) {
        loopCount++
        if (loopCount >= 3) {
          break
        }
      }
      expect(loopCount).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_1100
     * @tc.name      testConditionalAndOrFalsy0011
     * @tc.desc      Conditional-and and conditional-or with falsy values (0, null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrFalsy0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1;  // truthy
      let b: number = 0;  // falsy

      // a && b should short-circuit to b (falsy)
      let andResult = (a && b);
      expect(andResult).assertEqual(0);

      // a || b should short-circuit to a (truthy)
      let orResult = (a || b);
      expect(orResult).assertEqual(a);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_1200
     * @tc.name      testConditionalAndOrTruthy0012
     * @tc.desc      Conditional-and and conditional-or with truthy values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrTruthy0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1;  // truthy
      let b: number = 2;  // truthy

      // a && b should return b (truthy)
      let andResult = (a && b);
      expect(andResult).assertEqual(2);

      // a || b should return a (truthy)
      let orResult = (a || b);
      expect(orResult).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_1300
     * @tc.name      testConditionalAndOrNullUndefined0013
     * @tc.desc      Conditional-and and conditional-or with null and undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrNullUndefined0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truthyObj: Object = new Object();

      // null is falsy
      let result1 = (truthyObj && null);
      expect(result1 == null).assertTrue();

      let result2 = (null || truthyObj);
      expect(result2 == truthyObj).assertTrue();

      // undefined is falsy
      let result3 = (truthyObj && undefined);
      expect(result3 == undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_1400
     * @tc.name      testConditionalAndOrNumberTypes0014
     * @tc.desc      Conditional-and and conditional-or with different number types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrNumberTypes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConditionalAndOrNumberTypes0014';
      console.log(TAG + ' start');

      // POSITIVE_INFINITY is truthy
      let a: number = Number.POSITIVE_INFINITY;
      let b: number = 0;

      let andResult = (a && b);
      expect(andResult).assertEqual(0);

      let orResult = (a || b);
      expect(orResult).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_1500
     * @tc.name      testConditionalAndOrNaNFalsy0015
     * @tc.desc      Conditional-and and conditional-or with NaN (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrNaNFalsy0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1;  // truthy
      let b: number = Number.NaN;  // falsy

      let andResult = (a && b);
      expect(Number.isNaN(andResult)).assertTrue();

      let orResult = (a || b);
      expect(orResult).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_1600
     * @tc.name      testConditionalAndOrStringTypes0016
     * @tc.desc      Conditional-and and conditional-or with string types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrStringTypes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConditionalAndOrStringTypes0016';
      console.log(TAG + ' start');

      // Empty string is falsy
      let falsyStr: string = '';
      let truthyStr: string = 'hello';

      let result1 = (truthyStr && falsyStr);
      expect(result1).assertEqual('');

      let result2 = (falsyStr || truthyStr);
      expect(result2).assertEqual('hello');

      let result3 = (truthyStr && 'world');
      expect(result3).assertEqual('world');
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_1700
     * @tc.name      testConditionalAndOrBooleanTypes0017
     * @tc.desc      Conditional-and and conditional-or with boolean types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrBooleanTypes0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truthyVal: boolean = true;
      let falsyVal: boolean = false;

      // true && false = false
      let andResult1 = (truthyVal && falsyVal);
      expect(andResult1).assertEqual(false);

      // true || false = true
      let orResult1 = (truthyVal || falsyVal);
      expect(orResult1).assertEqual(true);

      // false || true = true
      let orResult2 = (falsyVal || truthyVal);
      expect(orResult2).assertEqual(true);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_1800
     * @tc.name      testConditionalAndOrArrayTypes0018
     * @tc.desc      Conditional-and and conditional-or with array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrArrayTypes0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConditionalAndOrArrayTypes0018';
      console.log(TAG + ' start');

      // Empty array is truthy in ArkTS
      let emptyArr: number[] = [];
      let truthyObj: Object = new Object();

      let result1 = (emptyArr && truthyObj);
      expect(result1 == truthyObj).assertTrue();

      let result2 = (emptyArr || truthyObj);
      // emptyArr is truthy, so || returns emptyArr (short-circuit)
      expect(result2 == emptyArr).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_1900
     * @tc.name      testConditionalAndOrBigIntTypes0019
     * @tc.desc      Conditional-and and conditional-or with bigint types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrBigIntTypes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let falsyBigInt: bigint = 0n;  // falsy
      let truthyBigInt: bigint = 1n;  // truthy
      let truthyObj: Object = new Object();

      let result1 = (truthyObj && falsyBigInt);
      expect(result1).assertEqual(0n);

      let result2 = (falsyBigInt || truthyBigInt);
      expect(result2).assertEqual(1n);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_2000
     * @tc.name      testConditionalAndOrShortCircuit0020
     * @tc.desc      Test short-circuit evaluation in conditional expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrShortCircuit0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter: number = 0;
      let truthyObj: Object = new Object();

      // In &&, if first is falsy, second should not be evaluated
      let result1 = (null && (counter = 1));
      expect(result1 == null).assertTrue();
      expect(counter).assertEqual(0);

      // In ||, if first is truthy, second should not be evaluated
      let result2 = (truthyObj || (counter = 1));
      expect(result2 == truthyObj).assertTrue();
      expect(counter).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_2100
     * @tc.name      testConditionalAndOrComplexExpressions0021
     * @tc.desc      Conditional-and and conditional-or in complex expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrComplexExpressions0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1;
      let b: number = 0;
      let c: number = 3;

      // (a && b) || c = (1 && 0) || 3 = 0 || 3 = 3
      let result1 = ((a && b) || c);
      expect(result1).assertEqual(3);

      // (a || b) && c = (1 || 0) && 3 = 1 && 3 = 3
      let result2 = ((a || b) && c);
      expect(result2).assertEqual(3);

      // a && (b || c) = 1 && (0 || 3) = 1 && 3 = 3
      let result3 = (a && (b || c));
      expect(result3).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_2200
     * @tc.name      testConditionalAndOrNegation0022
     * @tc.desc      Negation with conditional expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrNegation0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let falsyVal: number = 0;
      let truthyVal: number = 1;

      // !falsyVal should be true
      expect(!falsyVal).assertEqual(true);

      // !truthyVal should be false
      expect(!truthyVal).assertEqual(false);

      // !!truthyVal should be true
      expect(!!truthyVal).assertEqual(true);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_2300
     * @tc.name      testConditionalAndOrNested0023
     * @tc.desc      Nested conditional expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrNested0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number|null = 1;
      let b: number|null = 0;
      let c: number|null = null;

      // Nested conditional expressions
      // b=0 (falsy), c=null (falsy), so (b || c) returns null
      // a=1 (truthy), so (a && null) returns null
      let result1 = (a && (b || c));
      expect(result1 == null).assertTrue();

      let result2 = (a || (b && c));
      expect(result2).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_2400
     * @tc.name      testConditionalAndOrObjectTypes0024
     * @tc.desc      Conditional-and and conditional-or with Object types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrObjectTypes0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truthyObj: Object = new Object();
      let nullObj: Object|null = null;

      let result1 = (truthyObj && nullObj);
      expect(result1 == null).assertTrue();

      let result2 = (nullObj || truthyObj);
      expect(result2 == truthyObj).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_2500
     * @tc.name      testConditionalExpressionUndefined0025
     * @tc.desc      Conditional expression with undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionUndefined0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (undefined) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_2600
     * @tc.name      testConditionalExpressionEmptyString0026
     * @tc.desc      Conditional expression with empty string (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionEmptyString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ('') ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_2700
     * @tc.name      testConditionalExpressionZeroNumber0027
     * @tc.desc      Conditional expression with zero number (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionZeroNumber0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (0) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_2800
     * @tc.name      testConditionalExpressionNegativeZero0028
     * @tc.desc      Conditional expression with negative zero (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionNegativeZero0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (-0.0) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_2900
     * @tc.name      testConditionalExpressionNonEmptyString0029
     * @tc.desc      Conditional expression with non-empty string (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionNonEmptyString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ('hello') ? 1 : 0  // truthy
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_3000
     * @tc.name      testConditionalExpressionPositiveNumber0030
     * @tc.desc      Conditional expression with positive number (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionPositiveNumber0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (42.5) ? 1 : 0  // truthy
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_3100
     * @tc.name      testConditionalExpressionBoolean0031
     * @tc.desc      Conditional expression with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionBoolean0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConditionalExpressionBoolean0031';
      console.log(TAG + ' start');

      // true is truthy, so result is 'yes'
      let res1: string = true ? 'yes' : 'no';
      expect(res1).assertEqual('yes');

      // false is falsy, so result is 'no'
      let res2: string = false ? 'yes' : 'no';
      expect(res2).assertEqual('no');
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_3200
     * @tc.name      testConditionalExpressionObject0032
     * @tc.desc      Conditional expression with object instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionObject0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object|null = new Object();

      // truthy, so result is 'has object'
      let res: string = obj ? 'has object' : 'null';
      expect(res).assertEqual('has object');
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_3300
     * @tc.name      testConditionalAndOrAssignment0033
     * @tc.desc      Assignment with conditional expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrAssignment0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 0;
      let b: number = 0;

      // Assign result of conditional expression
      a = (1 && 2);
      expect(a).assertEqual(2);

      b = (0 || 3);
      expect(b).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_3400
     * @tc.name      testConditionalAndOrInFunctionArgs0034
     * @tc.desc      Conditional expressions in function arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrInFunctionArgs0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = addNumbers((1 && 2), (0 || 3));
      expect(result1).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_3500
     * @tc.name      testConditionalExpressionTemplateLiteral0035
     * @tc.desc      Conditional expression in template literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionTemplateLiteral0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string|null = null;
      let displayName: string = (name || 'Anonymous') as string;

      let result: string = `Welcome, ${displayName}!`;
      expect(result).assertEqual('Welcome, Anonymous!');
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_3600
     * @tc.name      testConditionalAndOrChain0036
     * @tc.desc      Chained conditional expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrChain0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number|null = null;
      let b: number|undefined = undefined;
      let c: number = 3;

      // Chain of || operators
      let result = (a || b || c);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_3700
     * @tc.name      testConditionalAndOrNullishCoalescingComparison0037
     * @tc.desc      Compare &&/|| behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrNullishCoalescingComparison0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let falsyNum: number = 0;
      let truthyObj: Object = new Object();

      // && with falsy value should return falsy value
      let andResult = (truthyObj && falsyNum);
      expect(andResult).assertEqual(0);

      // || with truthy value should return truthy value
      let orResult = (falsyNum || truthyObj);
      expect(orResult == truthyObj).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_3800
     * @tc.name      testConditionalAndOrReturnStatement0038
     * @tc.desc      Conditional expressions in return statements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrReturnStatement0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1;
      let b: number = 0;

      // Using conditional expression in ternary
      expect((true && a) || b).assertEqual(1);
      expect((false && a) || b).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_3900
     * @tc.name      testConditionalExpressionArrowFunction0039
     * @tc.desc      Conditional expressions in arrow functions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionArrowFunction0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let getDefault = (val: number|null): number => (val ?? 0);

      expect(getDefault(null)).assertEqual(0);
      expect(getDefault(5)).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_4000
     * @tc.name      testConditionalExpressionOptionalChaining0040
     * @tc.desc      Combined with optional chaining
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionOptionalChaining0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let container: TestContainer|null = new TestContainer();
      let defaultObj: Object = {};

      // Combining optional chaining with conditional expression
      let result = (container?.value || defaultObj);
      expect(result == defaultObj).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_4100
     * @tc.name      testConditionalAndOrBitwiseComparison0041
     * @tc.desc      Compare &&/|| with bitwise operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrBitwiseComparison0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1;
      let b: number = 0;

      // Logical operators return the actual value, not boolean
      let andResult = (a && b);
      let orResult = (a || b);

      expect(andResult).assertEqual(0);  // Returns b
      expect(orResult).assertEqual(1);    // Returns a
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_4200
     * @tc.name      testConditionalExpressionLongMINVALUETest0042
     * @tc.desc      Conditional expression with Long.MIN_VALUE (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionLongMINVALUETest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConditionalExpressionLongMINVALUETest0042';
      console.log(TAG + ' start');

      // Long.MIN_VALUE is truthy even though it's a large negative number
      let a: number = Long.MIN_VALUE;
      expect(!!a).assertEqual(true);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_4300
     * @tc.name      testConditionalExpressionNumberInfinityTest0043
     * @tc.desc      Conditional expression with Infinity values (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionNumberInfinityTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let posInf: number = Number.POSITIVE_INFINITY;
      let negInf: number = Number.NEGATIVE_INFINITY;

      expect(!!posInf).assertEqual(true);
      expect(!!negInf).assertEqual(true);

      // Both infinities are truthy
      let res1: number = (posInf) ? 1 : 0;
      let res2: number = (negInf) ? 1 : 0;
      expect(res1).assertEqual(1);
      expect(res2).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_4400
     * @tc.name      testConditionalExpressionNumberMAXVALUETest0044
     * @tc.desc      Conditional expression with Number.MAX_VALUE (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionNumberMAXVALUETest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: number = Number.MAX_VALUE;

      expect(!!maxVal).assertEqual(true);

      let res: number = (maxVal) ? 1 : 0;
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_4500
     * @tc.name      testConditionalExpressionNumberMINVALUETest0045
     * @tc.desc      Conditional expression with Number.MIN_VALUE (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionNumberMINVALUETest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: number = Number.MIN_VALUE;

      expect(!!minVal).assertEqual(true);

      let res: number = (minVal) ? 1 : 0;
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_4600
     * @tc.name      testConditionalExpressionBigIntTruthyTest0046
     * @tc.desc      Conditional expression with non-zero bigint (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionBigIntTruthyTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truthyBigInt: bigint = 123n;

      expect(!!truthyBigInt).assertEqual(true);

      let res: number = (truthyBigInt) ? 1 : 0;
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_4700
     * @tc.name      testConditionalAndOrArrayNonEmptyTest0047
     * @tc.desc      Conditional expression with non-empty array (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrArrayNonEmptyTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];

      expect(!!arr).assertEqual(true);

      let result: number = arr ? 4 : 0;
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_4800
     * @tc.name      testConditionalExpressionNonNullAssertion0048
     * @tc.desc      Conditional expression with non-null assertion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionNonNullAssertion0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nullable: Object|null = null;
      let defaultObj: Object = {};

      // Using conditional expression with non-null value
      let result: Object = (nullable || defaultObj) as Object;
      expect(result == defaultObj).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_4900
     * @tc.name      testConditionalAndOrMultipleBranches0049
     * @tc.desc      Multiple branches with conditional expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrMultipleBranches0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object|null = null;
      let b: Object|undefined = undefined;
      let c: Object = 'default';

      // Multiple || operators
      let result = (a || b || c);
      expect(result == 'default').assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_5000
     * @tc.name      testConditionalAndOrSideEffects0050
     * @tc.desc      Test that side effects are handled correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrSideEffects0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConditionalAndOrSideEffects0050';
      console.log(TAG + ' start');

      // Short-circuit should prevent evaluation of second operand
      let result1 = (null && 1);
      expect(result1 == null).assertTrue();

      let result2 = (1 || 0);
      expect(result2).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_5100
     * @tc.name      testConditionalExpressionByteFalsy0051
     * @tc.desc      Conditional expression with byte falsy value (new byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionByteFalsy0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Byte()) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_5200
     * @tc.name      testConditionalExpressionShortFalsy0052
     * @tc.desc      Conditional expression with Short falsy value (new Short())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionShortFalsy0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Short()) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_5300
     * @tc.name      testConditionalExpressionShortTruthy0053
     * @tc.desc      Conditional expression with Short truthy value (new Short(-1))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionShortTruthy0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Short(-1)) ? 1 : 0  // truthy
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_5400
     * @tc.name      testConditionalExpressionFloatNaNFalsy0054
     * @tc.desc      Conditional expression with Float.NaN (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionFloatNaNFalsy0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Float.NaN) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_5500
     * @tc.name      testConditionalExpressionFloatTruthy0055
     * @tc.desc      Conditional expression with Float.MAX_VALUE (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionFloatTruthy0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Float.MAX_VALUE) ? 1 : 0  // truthy
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_5600
     * @tc.name      testConditionalExpressionDoubleTruthy0056
     * @tc.desc      Conditional expression with Double.MAX_VALUE (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionDoubleTruthy0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Double.MAX_VALUE) ? 1 : 0  // truthy
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_5700
     * @tc.name      testConditionalExpressionDoubleNaNFalsy0057
     * @tc.desc      Conditional expression with Double.NaN (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionDoubleNaNFalsy0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Double.NaN) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_5800
     * @tc.name      testConditionalExpressionLongTruthy0058
     * @tc.desc      Conditional expression with Long.MAX_VALUE (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionLongTruthy0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Long.MAX_VALUE) ? 1 : 0  // truthy
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_5900
     * @tc.name      testConditionalExpressionLongFalsy0059
     * @tc.desc      Conditional expression with new Long() (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionLongFalsy0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (new Long()) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_6000
     * @tc.name      testConditionalExpressionIntTruthy0060
     * @tc.desc      Conditional expression with Int.MAX_VALUE (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionIntTruthy0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Int.MAX_VALUE) ? 1 : 0  // truthy
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_6100
     * @tc.name      testConditionalExpressionEmptyStringExpression0061
     * @tc.desc      Conditional expression with empty string expression ("" + "")
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionEmptyStringExpression0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = ("" + "") ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_6200
     * @tc.name      testConditionalExpressionCharNullChar0062
     * @tc.desc      Conditional expression with char '\u0000' (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionCharNullChar0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (c'\u0000') ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_6300
     * @tc.name      testConditionalExpressionCharNonNull0063
     * @tc.desc      Conditional expression with non-null char '\u0001' (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionCharNonNull0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (c'\u0001') ? 1 : 0  // truthy
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_6400
     * @tc.name      testConditionalExpressionCharSpace0064
     * @tc.desc      Conditional expression with char space ' ' (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionCharSpace0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (c' ') ? 1 : 0  // truthy
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_6500
     * @tc.name      testConditionalExpressionNegativeZero0065
     * @tc.desc      Conditional expression with negative zero -0 (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionNegativeZero0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (-0) ? 1 : 0  // falsy
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_6600
     * @tc.name      testConditionalExpressionEnumFalsy0066
     * @tc.desc      Conditional expression with enum first value (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionEnumFalsy0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (Color.Red) ? 1 : 0  // falsy (first enum value is 0)
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_6700
     * @tc.name      testConditionalExpressionEnumTruthy0067
     * @tc.desc      Conditional expression with non-first enum value (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionEnumTruthy0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = (TestSize.L) ? 1 : 0  // truthy (value is 2)
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_6800
     * @tc.name      testConditionalExpressionNumberWrappers0068
     * @tc.desc      Conditional expression with Number wrapper objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionNumberWrappers0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1: number = (new Number(Number.NaN)) ? 1 : 0  // falsy
      expect(res1).assertEqual(0);

      let res2: number = (new Number(1)) ? 1 : 0  // truthy
      expect(res2).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_6900
     * @tc.name      testConditionalExpressionCharWrapper0069
     * @tc.desc      Conditional expression with Char wrapper objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionCharWrapper0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1: number = (new Char(c'\u0000')) ? 1 : 0  // falsy
      expect(res1).assertEqual(0);

      let res2: number = (new Char(c'A')) ? 1 : 0  // truthy
      expect(res2).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_7000
     * @tc.name      testIfStatementFloatNaNFalsy0070
     * @tc.desc      If statement with Float.NaN (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementFloatNaNFalsy0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (Float.NaN) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_7100
     * @tc.name      testIfStatementEmptyStringExpression0071
     * @tc.desc      If statement with empty string expression ("" + "")
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementEmptyStringExpression0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if ("" + "") { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_7200
     * @tc.name      testIfStatementDoubleNaNFalsy0072
     * @tc.desc      If statement with Double.NaN (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementDoubleNaNFalsy0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (Double.NaN) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_7300
     * @tc.name      testIfStatementNegativeZero0073
     * @tc.desc      If statement with negative zero (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementNegativeZero0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (-0) { // falsy
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_7400
     * @tc.name      testIfStatementEnumFalsy0074
     * @tc.desc      If statement with first enum value (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIfStatementEnumFalsy0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: number = 0;
      if (Status.None) { // falsy (value is 0)
        res = 1
      }
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_7500
     * @tc.name      testForLoopFloatNaNFalsy0075
     * @tc.desc      For loop with Float.NaN condition (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForLoopFloatNaNFalsy0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Float.NaN
      let retcode: number = 0

      for (let i: number = 0; v; i++) {  // falsy
        if (i == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_7600
     * @tc.name      testForLoopNegativeZero0076
     * @tc.desc      For loop with negative zero condition (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testForLoopNegativeZero0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -0
      let retcode: number = 0

      for (let i: number = 0; v; i++) {  // falsy
        if (i == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_7700
     * @tc.name      testWhileLoopFloatNaNFalsy0077
     * @tc.desc      While loop with Float.NaN condition (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopFloatNaNFalsy0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Float.NaN
      let retcode: number = 0

      while (v) {  // falsy
        if (retcode == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_7800
     * @tc.name      testWhileLoopNegativeZero0078
     * @tc.desc      While loop with negative zero condition (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testWhileLoopNegativeZero0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -0
      let retcode: number = 0

      while (v) {  // falsy
        if (retcode == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_7900
     * @tc.name      testDoWhileFloatNaNFalsy0079
     * @tc.desc      Do-while loop with Float.NaN condition (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDoWhileFloatNaNFalsy0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Float.NaN  // falsy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_8000
     * @tc.name      testDoWhileNegativeZero0080
     * @tc.desc      Do-while loop with negative zero condition (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDoWhileNegativeZero0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -0  // falsy
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_8100
     * @tc.name      testConditionalAndOrShortMinValueTruthy0081
     * @tc.desc      Conditional-and and conditional-or with Long.MIN_VALUE (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrShortMinValueTruthy0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Long.MIN_VALUE;  // truthy

      expect(!!a).assertEqual(true);

      let b: number = 0;  // falsy
      let andResult = (a && b);
      expect(andResult).assertEqual(0);

      let orResult = (a || b);
      expect(orResult).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_8200
     * @tc.name      testConditionalAndOrCharFalsy0082
     * @tc.desc      Conditional-and and conditional-or with char '\u0000' (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrCharFalsy0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: char = c'\u0000';  // falsy

      expect(!a == true).assertTrue();

      let b: number = 1;  // truthy
      let andResult = (a && b);
      expect(andResult).assertEqual(c'\u0000');

      let orResult = (a || b);
      expect(orResult).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_8300
     * @tc.name      testConditionalAndOrEnumFalsy0083
     * @tc.desc      Conditional-and and conditional-or with first enum value (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrEnumFalsy0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Color = Color.Red;  // falsy (value is 0)

      let b: number = 1;  // truthy
      let andResult = (a && b);
      expect(andResult).assertEqual(0);

      let orResult = (a || b);
      expect(orResult).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_8400
     * @tc.name      testConditionalAndOrEnumTruthy0084
     * @tc.desc      Conditional-and and conditional-or with non-first enum value (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrEnumTruthy0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: TestSize = TestSize.L;  // truthy (value is 2)

      let b: number = 0;  // falsy
      let andResult = (a && b);
      expect(andResult).assertEqual(0);

      let orResult = (a || b);
      expect(orResult).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_8500
     * @tc.name      testConditionalAndOrCharWrapperFalsy0085
     * @tc.desc      Conditional-and and conditional-or with Char wrapper '\u0000' (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrCharWrapperFalsy0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Char = new Char(c'\u0000');  // falsy

      let b: number = 1;  // truthy
      let andResult = (a && b);
      expect(andResult == c'\u0000').assertTrue();

      let orResult = (a || b);
      expect(orResult).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_8600
     * @tc.name      testConditionalAndOrNumberNaNFalsy0086
     * @tc.desc      Conditional-and and conditional-or with Number.NaN (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrNumberNaNFalsy0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Number.NaN;  // falsy

      let b: number = 1;  // truthy
      let andResult = (a && b);
      expect(Number.isNaN(andResult)).assertTrue();

      let orResult = (a || b);
      expect(orResult).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_8700
     * @tc.name      testConditionalAndOrLongWrapperTruthy0087
     * @tc.desc      Conditional-and and conditional-or with Long wrapper (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrLongWrapperTruthy0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(Long.MAX_VALUE);  // truthy

      let b: number = 0;  // falsy
      let andResult = (a && b);
      expect(andResult).assertEqual(0);

      let orResult = (a || b);
      expect(orResult == Long.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_8800
     * @tc.name      testConditionalAndOrLongWrapperFalsy0088
     * @tc.desc      Conditional-and and conditional-or with Long wrapper (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrLongWrapperFalsy0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long();  // falsy

      let b: number = 1;  // truthy
      let andResult = (a && b);
      expect(andResult == 0).assertTrue();

      let orResult = (a || b);
      expect(orResult).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_8900
     * @tc.name      testConditionalAndOrDoubleNaNFalsy0089
     * @tc.desc      Conditional-and and conditional-or with Double.NaN (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrDoubleNaNFalsy0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Double.NaN;  // falsy

      let b: number = 1;  // truthy
      let andResult = (a && b);
      expect(Number.isNaN(andResult)).assertTrue();

      let orResult = (a || b);
      expect(orResult).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_9000
     * @tc.name      testConditionalAndOrFloatNaNFalsy0090
     * @tc.desc      Conditional-and and conditional-or with Float.NaN (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrFloatNaNFalsy0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Float.NaN;  // falsy

      let b: number = 1;  // truthy
      let andResult = (a && b);
      expect(Number.isNaN(andResult)).assertTrue();

      let orResult = (a || b);
      expect(orResult).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_9100
     * @tc.name      testConditionalAndOrByteTruthy0091
     * @tc.desc      Conditional-and and conditional-or with Byte truthy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrByteTruthy0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Byte = new Byte(100);  // truthy (100)

      let b: number = 0;  // falsy
      let andResult = (a && b);
      expect(andResult).assertEqual(0);

      let orResult = (a || b);
      expect(orResult == 100).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_9200
     * @tc.name      testConditionalAndOrShortTruthy0092
     * @tc.desc      Conditional-and and conditional-or with Short truthy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrShortTruthy0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Short = new Short(-1);  // truthy

      let b: number = 0;  // falsy
      let andResult = (a && b);
      expect(andResult).assertEqual(0);

      let orResult = (a || b);
      expect(orResult == -1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_9300
     * @tc.name      testConditionalAndOrShortFalsy0093
     * @tc.desc      Conditional-and and conditional-or with Short falsy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrShortFalsy0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Short = new Short();  // falsy (0)

      let b: number = 1;  // truthy
      let andResult = (a && b);
      expect(andResult == 0).assertTrue();

      let orResult = (a || b);
      expect(orResult).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_9400
     * @tc.name      testConditionalAndOrNumberNegativeInfinity0094
     * @tc.desc      Conditional-and and conditional-or with NEGATIVE_INFINITY (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrNumberNegativeInfinity0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Number.NEGATIVE_INFINITY;  // truthy

      let b: number = 0;  // falsy
      let andResult = (a && b);
      expect(andResult).assertEqual(0);

      let orResult = (a || b);
      expect(Number.isFinite(orResult) == false).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_9500
     * @tc.name      testConditionalAndOrNumberPositiveInfinity0095
     * @tc.desc      Conditional-and and conditional-or with POSITIVE_INFINITY (truthy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrNumberPositiveInfinity0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Number.POSITIVE_INFINITY;  // truthy

      let b: number = 0;  // falsy
      let andResult = (a && b);
      expect(andResult).assertEqual(0);

      let orResult = (a || b);
      expect(Number.isFinite(orResult) == false).assertTrue();
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_9600
     * @tc.name      testConditionalAndOrNegativeZeroFalsy0096
     * @tc.desc      Conditional-and and conditional-or with negative zero (falsy)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrNegativeZeroFalsy0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = -0.0;  // falsy

      let b: number = 1;  // truthy
      let andResult = (a && b);
      expect(andResult).assertEqual(-0.0);

      let orResult = (a || b);
      expect(orResult).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_9700
     * @tc.name      testConditionalAndOrShortestCircuitFalsy0097
     * @tc.desc      Test short-circuit evaluation with falsy first operand
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrShortestCircuitFalsy0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let executed: boolean = false;
      let falsyVal: number = 0;

      // Second operand should not be evaluated
      let result = (falsyVal && (executed = true));
      expect(result).assertEqual(0);
      expect(executed).assertEqual(false);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_9800
     * @tc.name      testConditionalAndOrShortestCircuitTruthy0098
     * @tc.desc      Test short-circuit evaluation with truthy first operand in OR
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrShortestCircuitTruthy0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let executed: boolean = false;
      let truthyVal: number = 1;

      // Second operand should not be evaluated
      let result = (truthyVal || (executed = true));
      expect(result).assertEqual(1);
      expect(executed).assertEqual(false);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_9900
     * @tc.name      testConditionalExpressionTruthySingletonChar0099
     * @tc.desc      Conditional expression with single char '\u0000' (truthy per ArkTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpressionTruthySingletonChar0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // In ArkTS, non-empty strings are truthy
      let res: number = ("\u0000") ? 1 : 0  // truthy (non-empty string)
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EXPRESSIONS_10000
     * @tc.name      testConditionalAndOrStringMethods0100
     * @tc.desc      Conditional-and and conditional-or with string method results
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalAndOrStringMethods0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Empty substring is falsy
      let falsyStr: string = new String("\u0000\u0000").substring(0, 0);
      let truthyStr: string = "hello";

      let andResult = (truthyStr && falsyStr);
      expect(andResult).assertEqual('');

      let orResult = (falsyStr || truthyStr);
      expect(orResult).assertEqual('hello');
    });

  })
}
