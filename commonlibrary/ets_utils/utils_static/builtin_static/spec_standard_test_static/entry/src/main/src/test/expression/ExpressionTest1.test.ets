/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';


class TestClass1 {
  prop: number = 42;
}

class MyClass2 {
}

class TestClass3 {
  getValue(): number {
    return 42;
  }
}

class InnerClass4 {
  value: number = 10;
}

class OuterClass5 {
  inner: InnerClass4 = new InnerClass4();
}

function getArrayElement<T>(array: T[] | null, index: number): T | undefined {
  if (array === null) {
    return undefined;
  }
  for (let i = 0; i < array.length; i++) {
    if (i === index) {
      return array[i];
    }
  }
  return undefined;
}


function inner(y: number): number {
  return y + 3;
}

export default function expressionTest1() {
  describe('ExpressionTest1', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0001
     * @tc.name ExpressionTest0001
     * @tc.desc Test addition operator with numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let result: number = a + b;
      let expected: number = 8;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0002
     * @tc.name ExpressionTest0002
     * @tc.desc Test subtraction operator with numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 4;
      let result: number = a - b;
      let expected: number = 6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0003
     * @tc.name ExpressionTest0003
     * @tc.desc Test multiplication operator with numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 7;
      let b: number = 6;
      let result: number = a * b;
      let expected: number = 42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0004
     * @tc.name ExpressionTest0004
     * @tc.desc Test division operator with numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 24;
      let b: number = 4;
      let result: number = a / b;
      let expected: number = 6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0005
     * @tc.name ExpressionTest0005
     * @tc.desc Test modulus operator with positive numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 17;
      let b: number = 5;
      let result: number = a % b;
      let expected: number = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0006
     * @tc.name ExpressionTest0006
     * @tc.desc Test exponentiation operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      let b: number = 5;
      let result: number = a**b;
      let expected: number = 32;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0007
     * @tc.name ExpressionTest0007
     * @tc.desc Test prefix increment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      let result: number = ++num;
      let expected: number = 6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0008
     * @tc.name ExpressionTest0008
     * @tc.desc Test postfix increment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      let result: number = num++;
      let expected: number = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0009
     * @tc.name ExpressionTest0009
     * @tc.desc Test prefix decrement operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      let result: number = --num;
      let expected: number = 4;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0010
     * @tc.name ExpressionTest0010
     * @tc.desc Test postfix decrement operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      let result: number = num--;
      let expected: number = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0011
     * @tc.name ExpressionTest0011
     * @tc.desc Test assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 0;
      num = 10;
      let expected: number = 10;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0012
     * @tc.name ExpressionTest0012
     * @tc.desc Test addition assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      num += 3;
      let expected: number = 8;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0013
     * @tc.name ExpressionTest0013
     * @tc.desc Test subtraction assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 10;
      num -= 4;
      let expected: number = 6;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0014
     * @tc.name ExpressionTest0014
     * @tc.desc Test multiplication assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 6;
      num *= 7;
      let expected: number = 42;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0015
     * @tc.name ExpressionTest0015
     * @tc.desc Test division assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 28;
      num /= 4;
      let expected: number = 7;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0016
     * @tc.name ExpressionTest0016
     * @tc.desc Test modulus assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 17;
      num %= 5;
      let expected: number = 2;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0017
     * @tc.name ExpressionTest0017
     * @tc.desc Test exponentiation assignment operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 3;
      num **= 3;
      let expected: number = 27;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0018
     * @tc.name ExpressionTest0018
     * @tc.desc Test strict equality operator with same values and types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 5;
      let result: boolean = a === b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0019
     * @tc.name ExpressionTest0019
     * @tc.desc Test strict equality operator with different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: string = "5";
      let result: boolean = a === Number(b);
      let expected: boolean = true;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0020
     * @tc.name ExpressionTest0020
     * @tc.desc Test non-strict equality operator with different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: string = "5";
      let result: boolean = a == Number(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0021
     * @tc.name ExpressionTest0021
     * @tc.desc Test strict inequality operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let result: boolean = a !== b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0022
     * @tc.name ExpressionTest0022
     * @tc.desc Test greater than operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 5;
      let result: boolean = a > b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0023
     * @tc.name ExpressionTest0023
     * @tc.desc Test less than operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 3;
      let b: number = 7;
      let result: boolean = a < b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0024
     * @tc.name ExpressionTest0024
     * @tc.desc Test greater than or equal operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 5;
      let result: boolean = a >= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0025
     * @tc.name ExpressionTest0025
     * @tc.desc Test less than or equal operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 4;
      let b: number = 5;
      let result: boolean = a <= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0026
     * @tc.name ExpressionTest0026
     * @tc.desc Test logical AND operator with true values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: boolean = true;
      let result: boolean = a && b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0027
     * @tc.name ExpressionTest0027
     * @tc.desc Test logical AND operator with false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: boolean = false;
      let result: boolean = a && b;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0028
     * @tc.name ExpressionTest0028
     * @tc.desc Test logical OR operator with true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = false;
      let b: boolean = true;
      let result: boolean = a || b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0029
     * @tc.name ExpressionTest0029
     * @tc.desc Test logical NOT operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let result: boolean = !a;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0030
     * @tc.name ExpressionTest0030
     * @tc.desc Test bitwise AND operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 0101
      let b: number = 3; // 0011
      let result: number = a & b; // 0001 = 1
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0031
     * @tc.name ExpressionTest0031
     * @tc.desc Test bitwise OR operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 0101
      let b: number = 3; // 0011
      let result: number = a | b; // 0111 = 7
      let expected: number = 7;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0032
     * @tc.name ExpressionTest0032
     * @tc.desc Test bitwise XOR operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 0101
      let b: number = 3; // 0011
      let result: number = a ^ b; // 0110 = 6
      let expected: number = 6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0033
     * @tc.name ExpressionTest0033
     * @tc.desc Test bitwise NOT operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 00000000000000000000000000000101
      let result: number = ~a; // 11111111111111111111111111111010 = -6
      let expected: number = -6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0034
     * @tc.name ExpressionTest0034
     * @tc.desc Test left shift operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 101
      let result: number = a << 2; // 10100 = 20
      let expected: number = 20;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0035
     * @tc.name ExpressionTest0035
     * @tc.desc Test right shift operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 20; // 10100
      let result: number = a >> 2; // 101 = 5
      let expected: number = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0036
     * @tc.name ExpressionTest0036
     * @tc.desc Test unsigned right shift operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: int = -20;
      let result: int = a >>> 2;
      let expected: int = 1073741819;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0037
     * @tc.name ExpressionTest0037
     * @tc.desc Test conditional operator with true condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 5;
      let result: string = a > b ? "greater" : "less";
      let expected: string = "greater";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0038
     * @tc.name ExpressionTest0038
     * @tc.desc Test comma operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1;
      let b: number = 2;
      a++;
      b++;
      let result: number = a + b;
      let expected: number = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0039
     * @tc.name ExpressionTest0039
     * @tc.desc Test typeof operator with number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 42;
      let result: string = typeof a;
      let expected: string = "number";
      expect(result).assertEqual(expected);
      expect(result).assertContain(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0040
     * @tc.name ExpressionTest0040
     * @tc.desc Test typeof operator with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: string = "test";
      let result: string = typeof a;
      let expected: string = "string";
      expect(result).assertEqual(expected);
      expect(result).assertContain(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0041
     * @tc.name ExpressionTest0041
     * @tc.desc Test typeof operator with boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let result: string = typeof a;
      let expected: string = "boolean";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0042
     * @tc.name ExpressionTest0042
     * @tc.desc Test typeof operator with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: undefined;
      let result: string = typeof a;
      let expected: string = "undefined";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0043
     * @tc.name ExpressionTest0043
     * @tc.desc Test unary plus operator with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 42;
      let result: number = +a;
      let expected: number = 42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0044
     * @tc.name ExpressionTest0044
     * @tc.desc Test unary minus operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 42;
      let result: number = -a;
      let expected: number = -42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0049
     * @tc.name ExpressionTest0049
     * @tc.desc Test array destructuring with multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3];
      let a: number = arr[0];
      let b: number = arr[1];
      let c: number = arr[2];
      let expectedA: number = 1;
      let expectedB: number = 2;
      let expectedC: number = 3;
      expect(a).assertEqual(expectedA);
      expect(b).assertEqual(expectedB);
      expect(c).assertEqual(expectedC);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0050
     * @tc.name ExpressionTest0050
     * @tc.desc Test operator precedence with multiplication and addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      let b: number = 3;
      let c: number = 4;
      let result: number = a + b * c; // 2 + (3 * 4) = 14
      let expected: number = 14;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0051
     * @tc.name ExpressionTest0051
     * @tc.desc Test operator precedence with parentheses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      let b: number = 3;
      let c: number = 4;
      let result: number = (a + b) * c;
      let expected: number = 20;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0052
     * @tc.name ExpressionTest0052
     * @tc.desc Test string concatenation with + operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str1: string = "Hello";
      let str2: string = "World";
      let result: string = str1 + " " + str2;
      let expected: string = "Hello World";
      expect(result).assertEqual(expected);
      expect(result).assertContain(str1);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0053
     * @tc.name ExpressionTest0053
     * @tc.desc Test string concatenation with number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "Count: ";
      let num: number = 5;
      let result: string = str + num;
      let expected: string = "Count: 5";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0054
     * @tc.name ExpressionTest0054
     * @tc.desc Test addition assignment with strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "Hello";
      str += " there";
      let expected: string = "Hello there";
      expect(str).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0055
     * @tc.name ExpressionTest0055
     * @tc.desc Test array index validation using string key conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: string[] = ["a", "b", "c"];
      let key: string = "1";
      let result: boolean = parseInt(key, 10) >= 0 && parseInt(key, 10) < arr.length;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0057
     * @tc.name ExpressionTest0057
     * @tc.desc Test instanceof operator with array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3];
      let result: boolean = arr instanceof Array;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0058
     * @tc.name ExpressionTest0058
     * @tc.desc Test void operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: undefined = undefined;
      let expected: undefined = undefined;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0059
     * @tc.name ExpressionTest0059
     * @tc.desc Test comma operator in for loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let i: number = 0;
      let j: number = 0;
      for (; i < 3; i++, j += 2) {
      }
      let expectedI: number = 3;
      let expectedJ: number = 6;
      expect(i).assertEqual(expectedI);
      expect(j).assertEqual(expectedJ);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0060
     * @tc.name ExpressionTest0060
     * @tc.desc Test array destructuring with skip elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let a: number = 0;
      let b: number = 0;
      for (let i = 0, j = 3; i < 1; i++, j++) {
        a = arr[i];
        b = arr[j];
      }
      let expectedA: number = 1;
      let expectedB: number = 4;
      expect(a).assertEqual(expectedA);
      expect(b).assertEqual(expectedB);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0063
     * @tc.name ExpressionTest0063
     * @tc.desc Test logical AND short-circuit evaluation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = false;
      let b: string = "not evaluated";
      let result: boolean | string = a && b;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0064
     * @tc.name ExpressionTest0064
     * @tc.desc Test logical OR short-circuit evaluation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: string = "not evaluated";
      let result: boolean | string = a || b;
      let expected: boolean = true;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0065
     * @tc.name ExpressionTest0065
     * @tc.desc Test nullish coalescing operator with null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: null = null;
      let b: number = 42;
      let result: null | number = a ?? b;
      let expected: number = 42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0066
     * @tc.name ExpressionTest0066
     * @tc.desc Test nullish coalescing operator with 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: number = 42;
      let result: number = a ?? b;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0067
     * @tc.name ExpressionTest0067
     * @tc.desc Test optional chaining operator with existing property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj: TestClass1 = new TestClass1();
      let result: number | undefined = obj?.prop;
      let expected: number = 42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0069
     * @tc.name ExpressionTest0069
     * @tc.desc Test exponentiation with negative base
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = -2;
      let exponent: number = 3;
      let result: number = base**exponent;
      let expected: number = -8;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0070
     * @tc.name ExpressionTest0070
     * @tc.desc Test division by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 0;
      let result: number = a / b;
      let expected: number = Infinity;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0071
     * @tc.name ExpressionTest0071
     * @tc.desc Test unary plus with boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let booleanToNumber: (value: boolean) => number = (value: boolean): number => {
        return value ? 1 : 0;
      };
      let result: number = booleanToNumber(a);
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0073
     * @tc.name ExpressionTest0073
     * @tc.desc Test prefix increment in expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let result: number = ++a * 2;
      let expected: number = 12;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0074
     * @tc.name ExpressionTest0074
     * @tc.desc Test postfix increment in expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let result: number = a++ * 2;
      let expected: number = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0075
     * @tc.name ExpressionTest0075
     * @tc.desc Test multiple logical operators precedence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: boolean = false;
      let c: boolean = true;
      let result: boolean = a && b || c;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0076
     * @tc.name ExpressionTest0076
     * @tc.desc Test bitwise left shift with negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -4;
      let result: number = a << 1;
      let expected: number = -8;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0077
     * @tc.name ExpressionTest0077
     * @tc.desc Test bitwise right shift with negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -8;
      let result: number = a >> 1;
      let expected: number = -4;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0078
     * @tc.name ExpressionTest0078
     * @tc.desc Test string comparison with > operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str1: string = "apple";
      let str2: string = "banana";
      let result: boolean = str1 > str2;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0079
     * @tc.name ExpressionTest0079
     * @tc.desc Test string comparison with < operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str1: string = "apple";
      let str2: string = "banana";
      let result: boolean = str1 < str2;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0080
     * @tc.name ExpressionTest0080
     * @tc.desc Test conditional operator with multiple conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let score: number = 85;
      let result: string = score > 90 ? "A" : score > 80 ? "B" : "C";
      let expected: string = "B";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0081
     * @tc.name ExpressionTest0081
     * @tc.desc Test modulus with negative divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 17;
      let b: number = -5;
      let result: number = a % b;
      let expected: number = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0082
     * @tc.name ExpressionTest0082
     * @tc.desc Test typeof null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: null = null;
      let result: string = typeof a;
      let expected: string = "object";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0083
     * @tc.name ExpressionTest0083
     * @tc.desc Test logical NOT with truthy value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let result: boolean = !a;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0084
     * @tc.name ExpressionTest0084
     * @tc.desc Test logical NOT with falsy value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let result: boolean = !a;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0085
     * @tc.name ExpressionTest0085
     * @tc.desc Test double logical NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let result: boolean = !!a;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0086
     * @tc.name ExpressionTest0086
     * @tc.desc Test left shift assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 101
      a <<= 2; // 10100 = 20
      let expected: number = 20;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0087
     * @tc.name ExpressionTest0087
     * @tc.desc Test right shift assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 20; // 10100
      a >>= 2; // 101 = 5
      let expected: number = 5;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0088
     * @tc.name ExpressionTest0088
     * @tc.desc Test bitwise AND assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 0101
      a &= 3; // 0011
      let expected: number = 1; // 0001
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0089
     * @tc.name ExpressionTest0089
     * @tc.desc Test bitwise OR assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 0101
      a |= 3; // 0011
      let expected: number = 7; // 0111
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0090
     * @tc.name ExpressionTest0090
     * @tc.desc Test bitwise XOR assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 0101
      a ^= 3; // 0011
      let expected: number = 6; // 0110
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0091
     * @tc.name ExpressionTest0091
     * @tc.desc Test exponentiation assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      a **= 3;
      let expected: number = 8;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0092
     * @tc.name ExpressionTest0092
     * @tc.desc Test instanceof with object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj: MyClass2 = new MyClass2();
      let result: boolean = obj instanceof MyClass2;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0094
     * @tc.name ExpressionTest0094
     * @tc.desc Test multiple assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number;
      let b: number;
      a = b = 5;
      let expected: number = 5;
      expect(a).assertEqual(expected);
      expect(b).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0096
     * @tc.name ExpressionTest0096
     * @tc.desc Test boolean and number comparison with ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: number = 1;
      let result: boolean = (a ? 1 : 0) === b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0097
     * @tc.name ExpressionTest0097
     * @tc.desc Test null and undefined comparison with ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: null = null;
      let b: undefined = undefined;
      let result: boolean = a == b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0098
     * @tc.name ExpressionTest0098
     * @tc.desc Test array and string comparison with ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: string[] = ["1", "2", "3"];
      let b: string = "1,2,3";
      let result: boolean = a.join(",") === b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0099
     * @tc.name ExpressionTest0099
     * @tc.desc Test operator precedence with logical and arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 2;
      let result: boolean = a > b + c;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0101
     * @tc.name ExpressionTest0101
     * @tc.desc Test addition with maximum safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxInt: number = 9007199254740991;
      let result: number = maxInt + 1;
      let expected: number = 9007199254740992;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0102
     * @tc.name ExpressionTest0102
     * @tc.desc Test subtraction with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      let b: number = -3;
      let result: number = a - b;
      let expected: number = -2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0103
     * @tc.name ExpressionTest0103
     * @tc.desc Test multiplication with decimal numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2.5;
      let b: number = 4.0;
      let result: number = a * b;
      let expected: number = 10.0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0104
     * @tc.name ExpressionTest0104
     * @tc.desc Test division with decimal result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 7;
      let b: number = 2;
      let result: number = a / b;
      let expected: number = 3.5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0105
     * @tc.name ExpressionTest0105
     * @tc.desc Test modulus with decimal numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10.5;
      let b: number = 3;
      let result: number = a % b;
      let expected: number = 1.5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0106
     * @tc.name ExpressionTest0106
     * @tc.desc Test exponentiation with decimal exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 16;
      let b: number = 0.25;
      let result: number = a**b;
      let expected: number = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0107
     * @tc.name ExpressionTest0107
     * @tc.desc Test prefix increment in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 0;
      let i: number = 0;
      while (++i < 5) {
        count++;
      }
      let expected: number = 4;
      expect(count).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0108
     * @tc.name ExpressionTest0108
     * @tc.desc Test postfix increment in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 0;
      let i: number = 0;
      while (i++ < 5) {
        count++;
      }
      let expected: number = 5;
      expect(count).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0109
     * @tc.name ExpressionTest0109
     * @tc.desc Test prefix decrement in calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let result: number = --a - b;
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0110
     * @tc.name ExpressionTest0110
     * @tc.desc Test postfix decrement in calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let result: number = a-- - b;
      let expected: number = 2;
      expect(result).assertEqual(expected);
    });

  })
}
