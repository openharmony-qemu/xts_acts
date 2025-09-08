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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';

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

function encode(a: number, b: number): number {
  return (a << 4) | (b & 0x0F);
}

interface GeneratedTypeLiteralInterface_1 {
  a: number;
  b: number;
}

function decode(value: number): GeneratedTypeLiteralInterface_1 {
  return {
    a: value >> 4,
    b: value & 0x0F
  };
}

interface GeneratedTypeLiteralInterface_2 {
  name?: string;
}

function innerStrFunc(str: string): string {
  return "Inner: " + str;
}

function outerStrFunc(str: string): string {
  return innerStrFunc("Outer: " + str);
}

interface GeneratedTypeLiteralInterface_3 {
  text?: string;
}

function getGreeting(): string {
  return "Hello";
}

function getName(): string {
  return "Jane";
}

export default function expressionTest2() {
  describe('ExpressionTest2', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0181
     * @tc.name ExpressionTest0181
     * @tc.desc Test bitwise XOR with same number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 42;
      let result: number = a ^ a;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0182
     * @tc.name ExpressionTest0182
     * @tc.desc Test bitwise NOT with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let result: number = ~a;
      let expected: number = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0183
     * @tc.name ExpressionTest0183
     * @tc.desc Test left shift with shift amount larger than 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1;
      let result: number = a << 32;
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0184
     * @tc.name ExpressionTest0184
     * @tc.desc Test right shift with large shift amount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 255;
      let result: number = a >> 10;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0185
     * @tc.name ExpressionTest0185
     * @tc.desc Test unsigned right shift with negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -1;
      let result: number = a >>> 0;
      let expected: number = 4294967295;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0186
     * @tc.name ExpressionTest0186
     * @tc.desc Test conditional operator with NaN condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = NaN;
      let result: string = a ? "truthy" : "falsy";
      let expected: string = "falsy";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0187
     * @tc.name ExpressionTest0187
     * @tc.desc Test comma operator in for loop with multiple variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sum: number = 0;
      let product: number = 1;
      let i: number, j: number;
      for (i = 1, j = 5; i <= 5; i++, j--) {
        sum += i + j;
        product *= i;
      }
      let expectedSum: number = 30;
      let expectedProduct: number = 120;
      expect(sum).assertEqual(expectedSum);
      expect(product).assertEqual(expectedProduct);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0188
     * @tc.name ExpressionTest0188
     * @tc.desc Test typeof with symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let symbolCounter = 0;
      let createSymbol: (description: string) => string = (description: string): string => {
        return `Symbol(${description})_${symbolCounter++}`;
      };
      let sym: string = createSymbol("test");
      let result: string = typeof sym;
      let expected: string = "string";
      expect(result).assertEqual(expected);
      expect(sym).assertContain("test");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0189
     * @tc.name ExpressionTest0189
     * @tc.desc Test typeof with number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 42;
      let result: string = typeof a;
      let expected: string = "number";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0190
     * @tc.name ExpressionTest0190
     * @tc.desc Test unary plus with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let result: number = +a;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0191
     * @tc.name ExpressionTest0191
     * @tc.desc Test unary minus with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let result: number = -a;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0192
     * @tc.name ExpressionTest0192
     * @tc.desc Test logical nullish assignment with negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      a ??= 42;
      let expected: number = -5;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0193
     * @tc.name ExpressionTest0193
     * @tc.desc Test logical nullish assignment with decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number | undefined = undefined;
      a ??= 3.14;
      let expected: number = 3.14;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0194
     * @tc.name ExpressionTest0194
     * @tc.desc Test logical OR assignment with negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      a ||= 42;
      let expected: number = -5;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0195
     * @tc.name ExpressionTest0195
     * @tc.desc Test logical AND assignment with negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      a &&= 42;
      let expected: number = 42;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0196
     * @tc.name ExpressionTest0196
     * @tc.desc Test operator precedence with bitwise and logical operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 7;
      let bitwiseResult: number = a & b;
      let comparisonResult: boolean = c > 5;
      let result: boolean = (bitwiseResult !== 0) || comparisonResult;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0197
     * @tc.name ExpressionTest0197
     * @tc.desc Test optional chaining with nested properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class InnerClass {
        value: number = 10;
      }

      class OuterClass {
        inner: InnerClass = new InnerClass();
      }

      let obj: OuterClass | null = new OuterClass();
      let result1: number | undefined = obj?.inner?.value;
      obj = null;
      let expected1: number = 10;
      expect(result1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0198
     * @tc.name ExpressionTest0198
     * @tc.desc Test comma operator in for loop with complex updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: number = 1;
      for (let i = 0; i < 5; i++, a += b, b *= 2) {
      }
      let expectedA: number = 31;
      let expectedB: number = 32;
      expect(a).assertEqual(expectedA);
      expect(b).assertEqual(expectedB);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0199
     * @tc.name ExpressionTest0199
     * @tc.desc Test operator precedence with arithmetic and comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 5;
      let c: number = 3;
      let result: boolean = a / b > c;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0200
     * @tc.name ExpressionTest0200
     * @tc.desc Test comma operator in for loop initialization with complex expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, j: number;
      for (i = (5 - 2), j = (3 * 4); i < j; i++, j--) {
        result += i + j;
      }
      let expected: number = 75;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0201
     * @tc.name ExpressionTest0201
     * @tc.desc Test addition with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let result: number = maxVal + 1;
      let expected: number = Number.MAX_VALUE;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0202
     * @tc.name ExpressionTest0202
     * @tc.desc Test subtraction with Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let minVal: number = Number.MIN_VALUE;
      let result: number = minVal - 1;
      let expected: number = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0203
     * @tc.name ExpressionTest0203
     * @tc.desc Test multiplication with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let result: number = maxVal * 2;
      let expected: number = Infinity;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0204
     * @tc.name ExpressionTest0204
     * @tc.desc Test division of Infinity by number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Infinity;
      let b: number = 100;
      let result: number = a / b;
      let expected: number = Infinity;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0205
     * @tc.name ExpressionTest0205
     * @tc.desc Test modulus with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = Infinity;
      let result: number = a % b;
      let expected: number = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0206
     * @tc.name ExpressionTest0206
     * @tc.desc Test exponentiation with base 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1;
      let b: number = 1000;
      let result: number = a**b;
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0207
     * @tc.name ExpressionTest0207
     * @tc.desc Test prefix increment in function arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let testFunc: (x: number) => number = (x: number): number => {
        return x * 2;
      };
      let result: number = testFunc(++a);
      let expected: number = 12;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0208
     * @tc.name ExpressionTest0208
     * @tc.desc Test postfix increment in function arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let testFunc: (x: number) => number = (x: number): number => {
        return x * 2;
      };
      let result: number = testFunc(a++);
      let expected: number = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0209
     * @tc.name ExpressionTest0209
     * @tc.desc Test prefix decrement in array access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [10, 20, 30];
      let index: number = 2;
      let result: number = arr[--index];
      let expected: number = 20;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0210
     * @tc.name ExpressionTest0210
     * @tc.desc Test postfix decrement in array access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [10, 20, 30];
      let index: number = 2;
      let result: number = arr[index--];
      let expected: number = 30;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0211
     * @tc.name ExpressionTest0211
     * @tc.desc Test assignment with function return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getValue: () => number = (): number => {
        return 42;
      };
      let result: number = 0;
      result = getValue() + 8;
      let expected: number = 50;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0212
     * @tc.name ExpressionTest0212
     * @tc.desc Test addition assignment with function result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getIncrement: () => number = (): number => {
        return 5;
      };
      let a: number = 10;
      a += getIncrement();
      let expected: number = 15;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0213
     * @tc.name ExpressionTest0213
     * @tc.desc Test subtraction assignment with function result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getDecrement: () => number = (): number => {
        return 3;
      };
      let a: number = 10;
      a -= getDecrement();
      let expected: number = 7;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0214
     * @tc.name ExpressionTest0214
     * @tc.desc Test multiplication assignment with ternary result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag: boolean = true;
      let a: number = 4;
      a *= flag ? 3 : 5;
      let expected: number = 12;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0215
     * @tc.name ExpressionTest0215
     * @tc.desc Test division assignment with logical result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 5;
      let result: number = 20;
      result /= a > b ? 2 : 4;
      let expected: number = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0216
     * @tc.name ExpressionTest0216
     * @tc.desc Test modulus assignment with arithmetic result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 25;
      let b: number = 3 + 2;
      a %= b;
      let expected: number = 0;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0217
     * @tc.name ExpressionTest0217
     * @tc.desc Test exponentiation assignment with variable exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = 3;
      let exponent: number = 3;
      base **= exponent;
      let expected: number = 27;
      expect(base).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0218
     * @tc.name ExpressionTest0218
     * @tc.desc Test strict equality with -0 and 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -0;
      let b: number = 0;
      let result: boolean = a === b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0219
     * @tc.name ExpressionTest0219
     * @tc.desc Test strict inequality with different number types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 5.0;
      let result: boolean = a !== b;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0220
     * @tc.name ExpressionTest0220
     * @tc.desc Test non-strict equality with empty string and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: string = "";
      let b: number = 0;
      let aAsNumber: number = Number(a);
      let result: boolean = aAsNumber === b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0221
     * @tc.name ExpressionTest0221
     * @tc.desc Test greater than with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Number.MAX_VALUE;
      let b: number = 1000000000;
      let result: boolean = a > b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0222
     * @tc.name ExpressionTest0222
     * @tc.desc Test less than with Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Number.MIN_VALUE;
      let b: number = 0.1;
      let result: boolean = a < b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0223
     * @tc.name ExpressionTest0223
     * @tc.desc Test greater than or equal with same large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 999999999999999;
      let b: number = 999999999999999;
      let result: boolean = a >= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0224
     * @tc.name ExpressionTest0224
     * @tc.desc Test less than or equal with very small decimals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0.0000000001;
      let b: number = 0.0000000002;
      let result: boolean = a <= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0225
     * @tc.name ExpressionTest0225
     * @tc.desc Test logical AND with function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let isPositive: (x: number) => boolean = (x: number): boolean => {
        return x > 0;
      };
      let a: number = 5;
      let b: number = 10;
      let result: boolean = isPositive(a) && isPositive(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0226
     * @tc.name ExpressionTest0226
     * @tc.desc Test logical AND short-circuit with function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let called: boolean = false;
      let testFunc: () => boolean = (): boolean => {
        called = true;
        return true;
      };
      let a: boolean = false;
      let result: boolean = a && testFunc();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0227
     * @tc.name ExpressionTest0227
     * @tc.desc Test logical OR with function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let isEven: (x: number) => boolean = (x: number): boolean => {
        return x % 2 === 0;
      };
      let a: number = 3;
      let b: number = 4;
      let result: boolean = isEven(a) || isEven(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0228
     * @tc.name ExpressionTest0228
     * @tc.desc Test logical OR short-circuit with function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let called: boolean = false;
      let testFunc: () => boolean = (): boolean => {
        called = true;
        return false;
      };
      let a: boolean = true;
      let result: boolean = a || testFunc();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0229
     * @tc.name ExpressionTest0229
     * @tc.desc Test bitwise AND with all bits set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0b1111;
      let b: number = 0b1010;
      let result: number = a & b;
      let expected: number = 0b1010;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0230
     * @tc.name ExpressionTest0230
     * @tc.desc Test bitwise OR with no overlapping bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0b1000;
      let b: number = 0b0011;
      let result: number = a | b;
      let expected: number = 0b1011;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0231
     * @tc.name ExpressionTest0231
     * @tc.desc Test bitwise XOR with alternating bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0b1010;
      let b: number = 0b0101;
      let result: number = a ^ b;
      let expected: number = 0b1111;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0232
     * @tc.name ExpressionTest0232
     * @tc.desc Test bitwise NOT with one bit set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0b10000000;
      let result: number = ~a;
      let expected: number = -0b10000001;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0233
     * @tc.name ExpressionTest0233
     * @tc.desc Test left shift with shift amount 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 42;
      let result: number = a << 0;
      let expected: number = 42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0234
     * @tc.name ExpressionTest0234
     * @tc.desc Test right shift with shift amount larger than bit length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0b111;
      let result: number = a >> 5;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0235
     * @tc.name ExpressionTest0235
     * @tc.desc Test unsigned right shift with shift amount 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -2147483648;
      let result: number = a >>> 31;
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0236
     * @tc.name ExpressionTest0236
     * @tc.desc Test conditional operator with function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let add: (a: number, b: number) => number = (a: number, b: number): number => {
        return a + b;
      };
      let multiply: (a: number, b: number) => number = (a: number, b: number): number => {
        return a * b;
      };
      let flag: boolean = false;
      let result: number = flag ? add(2, 3) : multiply(2, 3);
      let expected: number = 6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0237
     * @tc.name ExpressionTest0237
     * @tc.desc Test comma operator in for loop with function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getStart: () => number = (): number => {
        return 1;
      };
      let getEnd: () => number = (): number => {
        return 4;
      };
      let getStep: () => number = (): number => {
        return 1;
      };
      let sum: number = 0;
      let i: number, j: number;
      for (i = getStart(), j = getEnd(); i <= j; i += getStep(), j -= getStep()) {
        sum += i + j;
      }
      let expected: number = 10;
      expect(sum).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0238
     * @tc.name ExpressionTest0238
     * @tc.desc Test typeof with object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class TestObject {
      }

      let obj: TestObject = new TestObject();
      let result: string = typeof obj;
      let expected: string = "object";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0239
     * @tc.name ExpressionTest0239
     * @tc.desc Test typeof with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "hello";
      let result: string = typeof str;
      let expected: string = "string";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0240
     * @tc.name ExpressionTest0240
     * @tc.desc Test unary plus with decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 3.14;
      let result: number = +a;
      let expected: number = 3.14;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0241
     * @tc.name ExpressionTest0241
     * @tc.desc Test unary minus with decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 3.14;
      let result: number = -a;
      let expected: number = -3.14;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0242
     * @tc.name ExpressionTest0242
     * @tc.desc Test logical nullish assignment with function result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getDefault: () => number = (): number => {
        return 10;
      };
      let a: number | undefined = undefined;
      a ??= getDefault();
      let expected: number = 10;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0243
     * @tc.name ExpressionTest0243
     * @tc.desc Test logical nullish assignment with ternary result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag: boolean = true;
      let a: number | null = null;
      a ??= flag ? 5 : 10;
      let expected: number = 5;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0244
     * @tc.name ExpressionTest0244
     * @tc.desc Test logical OR assignment with function result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getFallback: () => number = (): number => {
        return 20;
      };
      let a: number = 0;
      a ||= getFallback();
      let expected: number = 20;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0245
     * @tc.name ExpressionTest0245
     * @tc.desc Test logical AND assignment with function result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getNewValue: () => number = (): number => {
        return 30;
      };
      let a: number = 5;
      a &&= getNewValue();
      let expected: number = 30;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0246
     * @tc.name ExpressionTest0246
     * @tc.desc Test operator precedence with multiple logical operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: boolean = false;
      let c: boolean = true;
      let d: boolean = false;
      let result: boolean = a || b && c || d;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0247
     * @tc.name ExpressionTest0247
     * @tc.desc Test optional chaining with array access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */

    it('ExpressionTest0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] | null = [10, 20, 30];
      let result1: number | undefined = getArrayElement(arr, 1);
      let nullArr: number[] | null = null;
      let result2: number | undefined = getArrayElement(nullArr, 1);
      let expected1: number = 20;
      let expected2: undefined = undefined;
      expect(result1).assertEqual(expected1);
      expect(result2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0248
     * @tc.name ExpressionTest0248
     * @tc.desc Test comma operator in for loop with conditional updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 0;
      let y: number = 10;
      for (let i = 0; i < 3; i++, x += i % 2 === 0 ? 1 : 2, y -= 2) {
      }
      let expectedX: number = 5;
      let expectedY: number = 4;
      expect(x).assertEqual(expectedX);
      expect(y).assertEqual(expectedY);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0249
     * @tc.name ExpressionTest0249
     * @tc.desc Test operator precedence with assignment and comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 10;
      let result: boolean = (a = b) > 7;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0250
     * @tc.name ExpressionTest0250
     * @tc.desc Test comma operator in for loop with multiple conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 0;
      let i: number, j: number;
      for (i = 0, j = 0; i < 5 && j < 10; i++, j += 2) {
        count++;
      }
      let expected: number = 5;
      expect(count).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0251
     * @tc.name ExpressionTest0251
     * @tc.desc Test addition with Number.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1;
      let result: number = a + Number.EPSILON;
      let expected: boolean = result > a;
      expect(expected).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0252
     * @tc.name ExpressionTest0252
     * @tc.desc Test subtraction with Number.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1;
      let result: number = a - Number.EPSILON;
      let expected: boolean = result < a;
      expect(expected).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0253
     * @tc.name ExpressionTest0253
     * @tc.desc Test multiplication with -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -0;
      let b: number = 5;
      let result: number = a * b;
      let expected: number = -0;
      expect(1 / result).assertEqual(-Infinity); // Check for -0 specifically
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0254
     * @tc.name ExpressionTest0254
     * @tc.desc Test division of zero by negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: number = -5;
      let result: number = a / b;
      let expected: number = -0;
      expect(1 / result).assertEqual(-Infinity); // Check for -0 specifically
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0255
     * @tc.name ExpressionTest0255
     * @tc.desc Test modulus with negative divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = -3;
      let result: number = a % b;
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0256
     * @tc.name ExpressionTest0256
     * @tc.desc Test exponentiation with base 0 and positive exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: number = 3;
      let result: number = a**b;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0258
     * @tc.name ExpressionTest0258
     * @tc.desc Test postfix increment in nested function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      let outer: (x: number) => number = (x: number): number => {
        return inner(x) * 2;
      };
      let result: number = outer(a++);
      let expected: number = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0261
     * @tc.name ExpressionTest0261
     * @tc.desc Test assignment with nested function results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getBase: () => number = (): number => {
        return 10;
      };
      let getMultiplier: () => number = (): number => {
        return 3;
      };
      let getOffset: () => number = (): number => {
        return 5;
      };
      let result: number = 0;
      result = getBase() * getMultiplier() + getOffset();
      let expected: number = 35;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0262
     * @tc.name ExpressionTest0262
     * @tc.desc Test addition assignment with nested expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 2;
      a += b * c + (b + c);
      expect(a).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0263
     * @tc.name ExpressionTest0263
     * @tc.desc Test subtraction assignment with nested expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 20;
      let b: number = 4;
      let c: number = 2;
      a -= b / c + (b - c);
      expect(a).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0264
     * @tc.name ExpressionTest0264
     * @tc.desc Test multiplication assignment with logical result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let result: number = 2;
      result *= a > b ? a - b : a + b;
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0265
     * @tc.name ExpressionTest0265
     * @tc.desc Test division assignment with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 15; // 0b1111
      let b: number = 5; // 0b0101
      let result: number = 10;
      result /= a & b;
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0266
     * @tc.name ExpressionTest0266
     * @tc.desc Test modulus assignment with exponentiation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = 3;
      let exponent: number = 3;
      let a: number = 30;
      a %= base**exponent;
      expect(a).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0267
     * @tc.name ExpressionTest0267
     * @tc.desc Test exponentiation assignment with shift result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      let shift: number = 3;
      let base: number = 2;
      base **= a << shift;
      expect(base).assertEqual(65536);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0268
     * @tc.name ExpressionTest0268
     * @tc.desc Test strict equality with different numeric representations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 5.000000000000001;
      let result: boolean = a === b;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0269
     * @tc.name ExpressionTest0269
     * @tc.desc Test strict inequality with same numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 10.0;
      let result: boolean = a !== b;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0271
     * @tc.name ExpressionTest0271
     * @tc.desc Test greater than with Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Number.MAX_SAFE_INTEGER;
      let b: number = Number.MAX_SAFE_INTEGER + 1;
      let result: boolean = a > b;
      expect(result).assertFalse(); // Because beyond safe integer, precision is lost
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0272
     * @tc.name ExpressionTest0272
     * @tc.desc Test less than with Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Number.MIN_SAFE_INTEGER;
      let b: number = Number.MIN_SAFE_INTEGER - 1;
      let result: boolean = a < b;
      expect(result).assertFalse(); // Because beyond safe integer, precision is lost
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0273
     * @tc.name ExpressionTest0273
     * @tc.desc Test greater than or equal with non-integer comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 3.1415926535;
      let b: number = 3.1415926534;
      let result: boolean = a >= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0274
     * @tc.name ExpressionTest0274
     * @tc.desc Test less than or equal with non-integer comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2.7182818284;
      let b: number = 2.7182818285;
      let result: boolean = a <= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0275
     * @tc.name ExpressionTest0275
     * @tc.desc Test logical AND with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class Data {
        value: number;

        constructor(val: number) {
          this.value = val;
        }
      }

      let obj1: Data = new Data(5);
      let obj2: Data = new Data(10);
      let result: boolean = obj1.value > 0 && obj2.value > 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0276
     * @tc.name ExpressionTest0276
     * @tc.desc Test logical AND with mixed number and boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: boolean = true;
      let result: boolean = Boolean(a && b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0277
     * @tc.name ExpressionTest0277
     * @tc.desc Test logical OR with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class Data {
        value: number;

        constructor(val: number) {
          this.value = val;
        }
      }

      let obj1: Data = new Data(0);
      let obj2: Data = new Data(10);
      let result: boolean = obj1.value > 0 || obj2.value > 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0278
     * @tc.name ExpressionTest0278
     * @tc.desc Test logical OR with mixed number and boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: boolean = true;
      let result: boolean = Boolean(a || b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0279
     * @tc.name ExpressionTest0279
     * @tc.desc Test bitwise AND with sign extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0x80000000; // Negative in 32-bit
      let b: number = 0xFFFFFF00;
      let result: number = a & b;
      let expected: number = -2147483648;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0280
     * @tc.name ExpressionTest0280
     * @tc.desc Test bitwise OR with sign extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0x80000000; // -2147483648
      let b: number = 0x000000FF; // 255
      let result: number = a | b;
      let expected: number = -2147483393;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0281
     * @tc.name ExpressionTest0281
     * @tc.desc Test bitwise XOR with sign bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0x80000000; // Negative in 32-bit
      let b: number = 0xFFFFFFFF;
      let result: number = a ^ b;
      let expected: number = 0x7FFFFFFF;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0282
     * @tc.name ExpressionTest0282
     * @tc.desc Test bitwise NOT with sign bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0x40000000;
      let result: number = ~a;
      let expected: number = -0x40000001;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0283
     * @tc.name ExpressionTest0283
     * @tc.desc Test left shift with sign bit set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0x40000000;
      let result: number = (a << 1) >>> 0;
      let expected: number = 0x80000000;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0284
     * @tc.name ExpressionTest0284
     * @tc.desc Test right shift with sign preservation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0x80000000;
      let result: number = a >> 1;
      let expected: number = -1073741824;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0285
     * @tc.name ExpressionTest0285
     * @tc.desc Test unsigned right shift with large number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0x80000000;
      let result: number = a >>> 2;
      let expected: number = 0x20000000;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0286
     * @tc.name ExpressionTest0286
     * @tc.desc Test conditional operator with nested conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 10;
      let c: number = 15;
      let result: number = a > b ? a : (b > c ? b : c);
      let expected: number = 15;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0287
     * @tc.name ExpressionTest0287
     * @tc.desc Test comma operator in for loop with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class Counter {
        value: number;

        constructor(initial: number) {
          this.value = initial;
        }

        increment(): void {
          this.value++;
        }

        decrement(): void {
          this.value--;
        }
      }

      let counter1: Counter = new Counter(1);
      let counter2: Counter = new Counter(5);
      let sum: number = 0;
      let i: number;
      for (i = 0; i < 3; i++, counter1.increment(), counter2.decrement()) {
        sum += counter1.value + counter2.value;
      }
      let expected: number = 18;
      expect(sum).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0288
     * @tc.name ExpressionTest0288
     * @tc.desc Test typeof with boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag: boolean = true;
      let result: string = typeof flag;
      let expected: string = "boolean";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0289
     * @tc.name ExpressionTest0289
     * @tc.desc Test typeof with null (special case)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let val: null = null;
      let result: string = typeof val;
      let expected: string = "object"; // Known JavaScript quirk
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0290
     * @tc.name ExpressionTest0290
     * @tc.desc Test unary plus with large integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 9876543210;
      let result: number = +a;
      let expected: number = 9876543210;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0291
     * @tc.name ExpressionTest0291
     * @tc.desc Test unary minus with large integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 9876543210;
      let result: number = -a;
      let expected: number = -9876543210;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0292
     * @tc.name ExpressionTest0292
     * @tc.desc Test logical nullish assignment with object property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class Config {
        value: number | null = null;
      }

      let config: Config = new Config();
      config.value ??= 42;
      let expected: number = 42;
      expect(config.value).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0293
     * @tc.name ExpressionTest0293
     * @tc.desc Test logical nullish assignment with existing value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class Config {
        value: number = 10;
      }

      let config: Config = new Config();
      config.value ??= 42;
      let expected: number = 10;
      expect(config.value).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0294
     * @tc.name ExpressionTest0294
     * @tc.desc Test logical OR assignment with object property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class Settings {
        threshold: number = 0;
      }

      let settings: Settings = new Settings();
      settings.threshold ||= 5;
      let expected: number = 5;
      expect(settings.threshold).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0295
     * @tc.name ExpressionTest0295
     * @tc.desc Test logical AND assignment with object property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class Settings {
        factor: number = 10;
      }

      let settings: Settings = new Settings();
      settings.factor &&= 3;
      let expected: number = 3;
      expect(settings.factor).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0296
     * @tc.name ExpressionTest0296
     * @tc.desc Test operator precedence with parentheses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 2;
      let result1: number = a + b * c;
      let result2: number = (a + b) * c;
      expect(result1).assertEqual(11);
      expect(result2).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0297
     * @tc.name ExpressionTest0297
     * @tc.desc Test optional chaining with function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class Calculator {
        add(a: number, b: number): number {
          return a + b;
        }
      }

      let calc: Calculator | null = new Calculator();
      let result1: number | undefined = calc?.add(2, 3);
      expect(result1).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0298
     * @tc.name ExpressionTest0298
     * @tc.desc Test comma operator in for loop with multiple counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sum1: number = 0;
      let sum2: number = 0;
      let sum3: number = 0;
      let i: number, j: number, k: number;
      for (i = 1, j = 2, k = 3; i <= 3; i++, j += 2, k *= 2) {
        sum1 += i;
        sum2 += j;
        sum3 += k;
      }
      expect(sum1).assertEqual(6); // 1+2+3
      expect(sum2).assertEqual(12); // 2+4+6
      expect(sum3).assertEqual(21); // 3+6+12
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0299
     * @tc.name ExpressionTest0299
     * @tc.desc Test operator precedence with logical and arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 2;
      let result: boolean = a > b + c;
      expect(result).assertFalse(); // 5 > 5 is false
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0300
     * @tc.name ExpressionTest0300
     * @tc.desc Test comma operator in for loop with complex condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let product: number = 1;
      let i: number, j: number;
      for (i = 1, j = 1; i <= 5 && j <= 120; i++, j *= i) {
        product *= j;
      }
      expect(product).assertEqual(34560);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0301
     * @tc.name ExpressionTest0301
     * @tc.desc Test bitwise AND with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -5; // 0b11111111111111111111111111111011
      const b: number = -3; // 0b11111111111111111111111111111101
      const result: number = a & b;
      const expected: number = -7; // 0b11111111111111111111111111111001
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0302
     * @tc.name ExpressionTest0302
     * @tc.desc Test bitwise AND with mixed signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10; // 0b00000000000000000000000000001010
      const b: number = -10; // 0b11111111111111111111111111110110
      const result: number = a & b;
      const expected: number = 2; // 0b00000000000000000000000000000010
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0303
     * @tc.name ExpressionTest0303
     * @tc.desc Test bitwise OR with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -5; // 0b11111111111111111111111111111011
      const b: number = -3; // 0b11111111111111111111111111111101
      const result: number = a | b;
      const expected: number = -1; // 0b11111111111111111111111111111111
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0304
     * @tc.name ExpressionTest0304
     * @tc.desc Test bitwise OR with mixed signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10; // 0b00000000000000000000000000001010
      const b: number = -10; // 0b11111111111111111111111111110110
      const result: number = a | b;
      const expected: number = -2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0305
     * @tc.name ExpressionTest0305
     * @tc.desc Test bitwise XOR with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -5; // 0b11111111111111111111111111111011
      const b: number = -3; // 0b11111111111111111111111111111101
      const result: number = a ^ b;
      const expected: number = 6; // 0b00000000000000000000000000000110
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0306
     * @tc.name ExpressionTest0306
     * @tc.desc Test bitwise XOR with mixed signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = -10;
      const result: number = a ^ b;
      const expected: number = -4;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0307
     * @tc.name ExpressionTest0307
     * @tc.desc Test bitwise NOT with maximum 32-bit signed integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 2147483647; // 0b01111111111111111111111111111111
      const result: number = ~a;
      const expected: number = -2147483648; // 0b10000000000000000000000000000000
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0308
     * @tc.name ExpressionTest0308
     * @tc.desc Test bitwise NOT with minimum 32-bit signed integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -2147483648; // 0b10000000000000000000000000000000
      const result: number = ~a;
      const expected: number = 2147483647; // 0b01111111111111111111111111111111
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0309
     * @tc.name ExpressionTest0309
     * @tc.desc Test left shift with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -5; // 0b11111111111111111111111111111011
      const result: number = a << 2;
      const expected: number = -20; // 0b11111111111111111111111111101100
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0310
     * @tc.name ExpressionTest0310
     * @tc.desc Test left shift overflow with positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 1073741824; // 0b01000000000000000000000000000000
      const result: number = a << 1;
      const expected: number = -2147483648; // Overflow becomes negative
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0311
     * @tc.name ExpressionTest0311
     * @tc.desc Test right shift with negative numbers (sign preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -20; // 0b11111111111111111111111111101100
      const result: number = a >> 2;
      const expected: number = -5; // 0b11111111111111111111111111111011
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0312
     * @tc.name ExpressionTest0312
     * @tc.desc Test right shift with positive number to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const result: number = a >> 4;
      const expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0313
     * @tc.name ExpressionTest0313
     * @tc.desc Test arithmetic operations with bitwise results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const result: number = (a & b) + (a | b);
      const expected: number = a + b;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0314
     * @tc.name ExpressionTest0314
     * @tc.desc Test multiplication with bitwise AND result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = 9;
      const c: number = 4;
      const result: number = (a & b) * c;
      const expected: number = 36;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0315
     * @tc.name ExpressionTest0315
     * @tc.desc Test division with bitwise OR result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 3;
      const c: number = 4;
      const result: number = (a | b) / c;
      const expected: number = 1.75;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0316
     * @tc.name ExpressionTest0316
     * @tc.desc Test modulus with bitwise XOR result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const c: number = 5;
      const result: number = (a ^ b) % c;
      // 9%5
      const expected: number = 4;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0317
     * @tc.name ExpressionTest0317
     * @tc.desc Test exponentiation with bitwise NOT result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 3;
      const b: number = 2;
      const result: number = (~a)**b;
      // (-4)** 2
      const expected: number = 16;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0318
     * @tc.name ExpressionTest0318
     * @tc.desc Test addition assignment with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      const b: number = 5;
      const c: number = 3;
      a += b & c;
      // 10+1=11
      const expected: number = 11;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0319
     * @tc.name ExpressionTest0319
     * @tc.desc Test subtraction assignment with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      const b: number = 5;
      const c: number = 3;
      a -= b | c;
      //10-7=3
      const expected: number = 3;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0320
     * @tc.name ExpressionTest0320
     * @tc.desc Test multiplication assignment with shift result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 4;
      const b: number = 3;
      a *= b << 1;
      // 4 * 6 = 24
      const expected: number = 24;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0321
     * @tc.name ExpressionTest0321
     * @tc.desc Test strict equality with bitwise results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 2;
      const result: boolean = (a >> b) === (a / (2**b));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0322
     * @tc.name ExpressionTest0322
     * @tc.desc Test strict inequality with bitwise results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -10;
      const b: number = 2;
      const result: boolean = (a >> b) !== (a / (2**b));
      expect(result).assertTrue(); // Different for negative numbers
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0323
     * @tc.name ExpressionTest0323
     * @tc.desc Test greater than with bitwise results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = 4;
      const result: boolean = (a & b) > (a ^ b);
      expect(result).assertFalse(); // 4 > 11 is false
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0324
     * @tc.name ExpressionTest0324
     * @tc.desc Test less than with bitwise results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -15;
      const b: number = 4;
      const result: boolean = (a & b) < (a ^ b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0325
     * @tc.name ExpressionTest0325
     * @tc.desc Test logical AND with bitwise conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 5;
      const result: boolean = (a & 1) === 0 && (b & 1) !== 0;
      // a is even (10 & 1 = 0), b is odd (5 & 1 = 1)
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0326
     * @tc.name ExpressionTest0326
     * @tc.desc Test logical OR with bitwise conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 5;
      const result: boolean = (a & 8) !== 0 || (b & 8) !== 0;
      // a has 8's bit set (1010), b does not (0101)
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0327
     * @tc.name ExpressionTest0327
     * @tc.desc Test logical NOT with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 0;
      const result: boolean = !(a | 0);
      // a | 0 is 0, which is falsy, so !0 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0328
     * @tc.name ExpressionTest0328
     * @tc.desc Test conditional operator with bitwise conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12; // 1100
      const result: string = (a & 0x0F) === a ? "8-bit" : "More than 8 bits";
      // 12 in binary is 1100, which fits in 4 bits
      expect(result).assertEqual("8-bit");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0329
     * @tc.name ExpressionTest0329
     * @tc.desc Test comma operator in for loop with bitwise updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, mask: number;
      for (i = 1, mask = 1; i <= 4; i++, mask <<= 1) {
        result += i * mask;
      }
      // 1*1 + 2*2 + 3*4 + 4*8 = 1 + 4 + 12 + 32 = 49
      expect(result).assertEqual(49);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0330
     * @tc.name ExpressionTest0330
     * @tc.desc Test unary plus with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const result: number = +(a ^ b);
      const expected: number = 9;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0331
     * @tc.name ExpressionTest0331
     * @tc.desc Test unary minus with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const result: number = -(a & b);
      const expected: number = -2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0332
     * @tc.name ExpressionTest0332
     * @tc.desc Test prefix increment with bitwise operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 101
      const result: number = ++a & 0x0F;
      // a becomes 6 (110), 6 & 15 = 6
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0333
     * @tc.name ExpressionTest0333
     * @tc.desc Test postfix increment with bitwise operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 101
      const result: number = a++ & 0x0F;
      // Uses 5 before incrementing, 5 & 15 = 5
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0334
     * @tc.name ExpressionTest0334
     * @tc.desc Test prefix decrement with bitwise operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 6; // 110
      const result: number = --a | 0x10;
      // a becomes 5 (101), 5 | 16 = 21
      expect(result).assertEqual(21);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0335
     * @tc.name ExpressionTest0335
     * @tc.desc Test postfix decrement with bitwise operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 6; // 110
      const result: number = a-- | 0x10;
      // Uses 6 before decrementing, 6 | 16 = 22
      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0336
     * @tc.name ExpressionTest0336
     * @tc.desc Test logical nullish assignment with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number | null = null;
      const b: number = 15;
      const c: number = 8;
      a ??= b & c;
      // b & c = 8, so a becomes 8
      expect(a).assertEqual(8);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0337
     * @tc.name ExpressionTest0337
     * @tc.desc Test logical OR assignment with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      const b: number = 5;
      const c: number = 3;
      a ||= b ^ c;
      // b ^ c = 6, so a becomes 6
      expect(a).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0338
     * @tc.name ExpressionTest0338
     * @tc.desc Test logical AND assignment with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      const b: number = 12;
      const c: number = 3;
      a &&= b >> c;
      // b >> c = 1, so a becomes 1
      expect(a).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0339
     * @tc.name ExpressionTest0339
     * @tc.desc Test operator precedence with bitwise and arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const c: number = 2;
      const result1: number = a + b & c;
      const result2: number = a + (b & c);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(12);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0340
     * @tc.name ExpressionTest0340
     * @tc.desc Test operator precedence with shift and comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 2;
      const c: number = 3;
      const result: boolean = a >> b > c;
      // 10 >> 2 = 2, 2 > 3 is false
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0341
     * @tc.name ExpressionTest0341
     * @tc.desc Test optional chaining with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class BitProcessor {
        process(value: number): number {
          return value ^ 0x0F;
        }
      }

      let processor: BitProcessor | null = new BitProcessor();
      const result1: number | undefined = processor?.process(10);
      processor = null;
      // 10 ^ 15 = 5
      expect(result1).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0342
     * @tc.name ExpressionTest0342
     * @tc.desc Test bitwise operations in function returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const encoded: number = encode(5, 10);
      const decoded = decode(encoded);
      expect(encoded).assertEqual(0x5A); // 90 in decimal
      expect(decoded.a).assertEqual(5);
      expect(decoded.b).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0343
     * @tc.name ExpressionTest0343
     * @tc.desc Test bitwise operations with function parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let checkBit: (value: number, bit: number) => boolean = (value: number, bit: number): boolean => {
        return (value & (1 << bit)) !== 0;
      };
      const num: number = 0b1010; // 10 in decimal
      expect(checkBit(num, 0)).assertFalse(); // Bit 0 is 0
      expect(checkBit(num, 1)).assertTrue(); // Bit 1 is 1
      expect(checkBit(num, 2)).assertFalse(); // Bit 2 is 0
      expect(checkBit(num, 3)).assertTrue(); // Bit 3 is 1
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0344
     * @tc.name ExpressionTest0344
     * @tc.desc Test bitwise operations in array initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 1;
      const mask: number[] = [
        base << 0,
        base << 1,
        base << 2,
        base << 3
      ];
      expect(mask[0]).assertEqual(1);
      expect(mask[1]).assertEqual(2);
      expect(mask[2]).assertEqual(4);
      expect(mask[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0345
     * @tc.name ExpressionTest0345
     * @tc.desc Test bitwise operations with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class Flags {
        value: number = 0;

        setFlag(flag: number): void {
          this.value |= flag;
        }

        clearFlag(flag: number): void {
          this.value &= ~flag;
        }

        hasFlag(flag: number): boolean {
          return (this.value & flag) !== 0;
        }
      }

      const flags: Flags = new Flags();
      const FLAG_A: number = 1 << 0;
      const FLAG_B: number = 1 << 1;

      flags.setFlag(FLAG_A);
      expect(flags.hasFlag(FLAG_A)).assertTrue();
      expect(flags.hasFlag(FLAG_B)).assertFalse();

      flags.setFlag(FLAG_B);
      expect(flags.hasFlag(FLAG_A)).assertTrue();
      expect(flags.hasFlag(FLAG_B)).assertTrue();

      flags.clearFlag(FLAG_A);
      expect(flags.hasFlag(FLAG_A)).assertFalse();
      expect(flags.hasFlag(FLAG_B)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0346
     * @tc.name ExpressionTest0346
     * @tc.desc Test nested bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 0b1010;
      const b: number = 0b0110;
      const c: number = 0b1001;

      // Nested bitwise operations
      const result: number = (a & b) | ~(c << 1);
      // a & b = 0b0010
      // c << 1 = 0b10010
      // ~(c << 1) = all bits except those in 0b10010 are set
      // (a & b) | ~(c << 1) = all bits set except those in 0b10000
      expect(result).assertEqual(~0b10000);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0347
     * @tc.name ExpressionTest0347
     * @tc.desc Test bitwise operations with maximum negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const min32: number = -2147483648; // 0b10000000000000000000000000000000
      const result1: number = min32 >> 1; // Sign-preserving shift
      const result2: number = min32 << 1; // Overflow
      const result3: number = ~min32; // Bitwise NOT

      expect(result1).assertEqual(-1073741824); // Special case for minimum value
      expect(result2).assertEqual(0); // Overflow results in 0
      expect(result3).assertEqual(2147483647); // 0b01111111111111111111111111111111
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0348
     * @tc.name ExpressionTest0348
     * @tc.desc Test bitwise operations with maximum positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const max32: number = 2147483647; // 0b01111111111111111111111111111111
      const result1: number = max32 >> 1;
      const result2: number = max32 << 1;
      const result3: number = ~max32;

      expect(result1).assertEqual(1073741823);
      expect(result2).assertEqual(-2);
      expect(result3).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0349
     * @tc.name ExpressionTest0349
     * @tc.desc Test bitwise operations in loop conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 1; // 0b1
      let count: number = 0;
      while ((value & 0x80) === 0) { // While 8th bit is not set
        value <<= 1;
        count++;
      }
      // Should loop 7 times: 1 → 2 → 4 → 8 → 16 → 32 → 64 → 128
      expect(count).assertEqual(7);
      expect(value).assertEqual(128);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0350
     * @tc.name ExpressionTest0350
     * @tc.desc Test comma operator in for loop with multiple bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let mask: number, shift: number;
      for (mask = 1, shift = 0; mask <= 0x80; mask <<= 1, shift++) {
        if (shift % 2 === 0) { // Only use even shifts
          result |= mask;
        }
      }
      expect(result).assertEqual(85);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0351
     * @tc.name ExpressionTest0351
     * @tc.desc Test string concatenation with + operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Hello";
      const str2: string = " World";
      const result: string = str1 + str2;
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0352
     * @tc.name ExpressionTest0352
     * @tc.desc Test string concatenation with multiple values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "a";
      const str2: string = "b";
      const str3: string = "c";
      const result: string = str1 + str2 + str3;
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0353
     * @tc.name ExpressionTest0353
     * @tc.desc Test string concatenation assignment (+=)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "Hello";
      str += " there";
      expect(str).assertEqual("Hello there");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0354
     * @tc.name ExpressionTest0354
     * @tc.desc Test string concatenation with numbers (same type operations)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 42;
      const strNum: string = "42";
      // Convert number to string first to ensure same type operation
      const result: string = String(num) + strNum;
      expect(result).assertEqual("4242");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0355
     * @tc.name ExpressionTest0355
     * @tc.desc Test string length comparison with numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello";
      const len: number = str.length;
      const result: boolean = len > 3;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0356
     * @tc.name ExpressionTest0356
     * @tc.desc Test string strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "test";
      const str2: string = "test";
      const str3: string = "Test";
      expect(str1 === str2).assertTrue();
      expect(str1 === str3).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0357
     * @tc.name ExpressionTest0357
     * @tc.desc Test string strict inequality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "banana";
      const str3: string = "apple";
      expect(str1 !== str2).assertTrue();
      expect(str1 !== str3).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0358
     * @tc.name ExpressionTest0358
     * @tc.desc Test string comparison with > operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "orange";
      const str2: string = "apple";
      const result: boolean = str1 > str2;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0359
     * @tc.name ExpressionTest0359
     * @tc.desc Test string comparison with < operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "cat";
      const str2: string = "dog";
      const result: boolean = str1 < str2;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0360
     * @tc.name ExpressionTest0360
     * @tc.desc Test string comparison with >= operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "grape";
      const str2: string = "grape";
      const str3: string = "grapevines";
      expect(str1 >= str2).assertTrue();
      expect(str3 >= str1).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0361
     * @tc.name ExpressionTest0361
     * @tc.desc Test string comparison with <= operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "berry";
      const str2: string = "berry";
      const str3: string = "apple";
      expect(str1 <= str2).assertTrue();
      expect(str3 <= str1).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0362
     * @tc.name ExpressionTest0362
     * @tc.desc Test logical AND with string conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello world";
      const result: boolean = str.length > 5 && str.startsWith("hello");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0363
     * @tc.name ExpressionTest0363
     * @tc.desc Test logical OR with string conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "goodbye";
      const result: boolean = str.endsWith("hello") || str.length === 7;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0364
     * @tc.name ExpressionTest0364
     * @tc.desc Test conditional operator with string checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "test";
      const result: string = str.length > 5 ? "long" : "short";
      expect(result).assertEqual("short");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0365
     * @tc.name ExpressionTest0365
     * @tc.desc Test string concatenation in function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatGreeting: (title: string, name: string) => string = (title: string, name: string): string => {
        return "Hello, " + title + " " + name;
      };
      const result: string = formatGreeting("Dr", "Smith");
      expect(result).assertEqual("Hello, Dr Smith");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0366
     * @tc.name ExpressionTest0366
     * @tc.desc Test string return values in arithmetic expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getStringLength: (str: string) => number = (str: string): number => {
        return str.length;
      };
      const result: number = getStringLength("example") * 2;
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0367
     * @tc.name ExpressionTest0367
     * @tc.desc Test string concatenation with ternary operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isMorning: boolean = true;
      const greeting: string = "Good " + (isMorning ? "morning" : "evening");
      expect(greeting).assertEqual("Good morning");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0368
     * @tc.name ExpressionTest0368
     * @tc.desc Test comma operator in for loop with string operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let i: number, char: string;
      for (i = 0, char = "a"; i < 3; i++, char = String.fromCharCode(char.charCodeAt(0) + 1)) {
        result += char;
      }
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0369
     * @tc.name ExpressionTest0369
     * @tc.desc Test typeof with string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "hello";
      const str2: string = "";
      expect(typeof str1).assertEqual("string");
      expect(typeof str2).assertEqual("string");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0370
     * @tc.name ExpressionTest0370
     * @tc.desc Test string concatenation with template strings (expression operator)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const name: string = "Alice";
      const age: number = 30;
      const result: string = `${name} is ${age} years old`;
      expect(result).assertEqual("Alice is 30 years old");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0371
     * @tc.name ExpressionTest0371
     * @tc.desc Test string index access with arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdef";
      const index: number = 2;
      const result: string = str[index + 1];
      expect(result).assertEqual("d");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0372
     * @tc.name ExpressionTest0372
     * @tc.desc Test string concatenation with incremented values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 1;
      const result: string = "Item " + count++ + ", Item " + count++;
      expect(result).assertEqual("Item 1, Item 2");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0373
     * @tc.name ExpressionTest0373
     * @tc.desc Test string methods with operator results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello world";
      const start: number = 6;
      const length: number = 5;
      const result: string = str.substring(start, start + length);
      expect(result).assertEqual("world");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0374
     * @tc.name ExpressionTest0374
     * @tc.desc Test logical NOT with string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "not empty";
      const str2: string = "";
      expect(!str1).assertFalse();
      expect(!str2).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0375
     * @tc.name ExpressionTest0375
     * @tc.desc Test string concatenation assignment in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      const parts: string[] = ["a", "b", "c"];
      for (let i = 0; i < parts.length; i++) {
        result += parts[i];
      }
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0376
     * @tc.name ExpressionTest0376
     * @tc.desc Test string comparison with logical operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "javascript";
      const result: boolean = str.startsWith("java") && str.length > 5;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0377
     * @tc.name ExpressionTest0377
     * @tc.desc Test string length with arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "hello";
      const str2: string = "world";
      const result: number = str1.length + str2.length;
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0378
     * @tc.name ExpressionTest0378
     * @tc.desc Test string concatenation with function return values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getFirstName: () => string = (): string => {
        return "John";
      };
      let getLastName: () => string = (): string => {
        return "Doe";
      };
      const result: string = getFirstName() + " " + getLastName();
      expect(result).assertEqual("John Doe");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0379
     * @tc.name ExpressionTest0379
     * @tc.desc Test string conditions in conditional operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "typescript";
      const result: string = str.includes("type") ? "Type found" : "Type not found";
      expect(result).assertEqual("Type found");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0380
     * @tc.name ExpressionTest0380
     * @tc.desc Test string concatenation with nullish coalescing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const name: string | null = null;
      const defaultName: string = "Guest";
      const result: string = "Hello, " + (name ?? defaultName);
      expect(result).assertEqual("Hello, Guest");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0381
     * @tc.name ExpressionTest0381
     * @tc.desc Test string comparison with bitwise operators (same-type conversion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Convert strings to their numeric representations first
      const str1: string = "10";
      const str2: string = "20";
      const num1: number = Number(str1);
      const num2: number = Number(str2);
      const result: number = num1 & num2;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0382
     * @tc.name ExpressionTest0382
     * @tc.desc Test string index with decrement operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "example";
      let index: number = str.length;
      const result: string = str[--index];
      expect(result).assertEqual("e");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0383
     * @tc.name ExpressionTest0383
     * @tc.desc Test string concatenation with logical assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let message: string = "Error: ";
      const errorDetail: string = "File not found";
      message ||= "Default message"; // Should not change since message is not empty
      message += errorDetail;
      expect(message).assertEqual("Error: File not found");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0384
     * @tc.name ExpressionTest0384
     * @tc.desc Test optional chaining with string properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const data: GeneratedTypeLiteralInterface_2 = {};
      const result1: string | undefined = data.name?.toUpperCase();
      data.name = "test";
      const result2: string | undefined = data.name?.toUpperCase();
      expect(result1).assertUndefined();
      expect(result2).assertEqual("TEST");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0385
     * @tc.name ExpressionTest0385
     * @tc.desc Test string length with modulus operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefgh";
      const result: number = str.length % 3;
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0386
     * @tc.name ExpressionTest0386
     * @tc.desc Test string concatenation with exponentiation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 2;
      const exponent: number = 3;
      const result: string = "Result: " + String(base ** exponent);
      expect(result).assertEqual("Result: 8");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0387
     * @tc.name ExpressionTest0387
     * @tc.desc Test string comparison with operator precedence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "app";
      const str3: string = "apricot";
      const result: boolean = str1 > str2 && str1 < str3;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0388
     * @tc.name ExpressionTest0388
     * @tc.desc Test string concatenation with grouped expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: string = "Hello";
      const b: string = "World";
      const c: string = "!";
      const result: string = a + " " + (b + c);
      expect(result).assertEqual("Hello World!");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0389
     * @tc.name ExpressionTest0389
     * @tc.desc Test string methods with operator results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const start: number = 2;
      const end: number = 7;
      const result: string = str.slice(start, end);
      expect(result).assertEqual("cdefg");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0390
     * @tc.name ExpressionTest0390
     * @tc.desc Test string concatenation with unary plus on numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 42;
      // Convert to string explicitly before concatenation
      const result: string = "Value: " + String(+num);
      expect(result).assertEqual("Value: 42");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0391
     * @tc.name ExpressionTest0391
     * @tc.desc Test string comparison with negative unary operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "5";
      const num: number = 10;
      // Convert string to number first for same-type comparison
      const result: boolean = -Number(str) > -num;
      expect(result).assertTrue(); // -5 > -10 is true
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0392
     * @tc.name ExpressionTest0392
     * @tc.desc Test string length with assignment operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello";
      let result: number = 0;
      result += str.length;
      result *= 2;
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0393
     * @tc.name ExpressionTest0393
     * @tc.desc Test string concatenation with increment in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 1; i <= 3; i++) {
        result += "Item " + i + " ";
      }
      expect(result).assertEqual("Item 1 Item 2 Item 3 ");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0394
     * @tc.name ExpressionTest0394
     * @tc.desc Test string conditions with arithmetic results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdef";
      const result: boolean = str.length / 2 > 2;
      expect(result).assertTrue(); // 6 / 2 = 3 > 2
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0395
     * @tc.name ExpressionTest0395
     * @tc.desc Test string concatenation with bitwise results (converted to string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      // Convert bitwise result to string first
      const result: string = "Result: " + String(a & b);
      expect(result).assertEqual("Result: 2");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0396
     * @tc.name ExpressionTest0396
     * @tc.desc Test string comparison with shifted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "8";
      const shifted: number = 2 << 2; // 8
      // Convert string to number first
      expect(Number(str) === shifted).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0397
     * @tc.name ExpressionTest0397
     * @tc.desc Test string concatenation with logical expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: boolean = true;
      const b: boolean = false;
      // Convert boolean results to strings first
      const result: string = String(a && b) + " " + String(a || b);
      expect(result).assertEqual("false true");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0398
     * @tc.name ExpressionTest0398
     * @tc.desc Test string length with bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "test";
      const result: number = ~str.length;
      expect(result).assertEqual(-5); // ~4 = -5
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0399
     * @tc.name ExpressionTest0399
     * @tc.desc Test string index with arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefgh";
      const result: string = str[(str.length / 2) - 1];
      expect(result).assertEqual("d"); // Length is 8, 8/2 - 1 = 3, index 3 is 'd'
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0400
     * @tc.name ExpressionTest0400
     * @tc.desc Test comma operator in for loop with string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const strings: string[] = ["a", "bb", "ccc", "dddd"];
      let totalLength: number = 0;
      let i: number, current: string;
      for (i = 0, current = strings[0]; i < strings.length; i++, current = strings[i]) {
        totalLength += current.length;
      }
      expect(totalLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0401
     * @tc.name ExpressionTest0401
     * @tc.desc Test string concatenation with escaped characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "He said, \"Hello\"";
      const str2: string = "World\n";
      const result: string = str1 + " " + str2;
      expect(result).assertEqual("He said, \"Hello\" World\n");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0402
     * @tc.name ExpressionTest0402
     * @tc.desc Test string concatenation with Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Café";
      const str2: string = " au lait";
      const result: string = str1 + str2;
      expect(result).assertEqual("Café au lait");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0403
     * @tc.name ExpressionTest0403
     * @tc.desc Test string comparison with Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "äpple"; // With umlaut
      const result: boolean = str1 < str2;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0404
     * @tc.name ExpressionTest0404
     * @tc.desc Test string concatenation with empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Hello";
      const str2: string = "";
      const str3: string = "World";
      const result: string = str1 + str2 + str3;
      expect(result).assertEqual("HelloWorld");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0405
     * @tc.name ExpressionTest0405
     * @tc.desc Test string concatenation assignment with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "Test";
      const empty: string = "";
      str += empty;
      expect(str).assertEqual("Test");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0406
     * @tc.name ExpressionTest0406
     * @tc.desc Test string length comparison with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "";
      const str2: string = "non-empty";
      expect(str1.length === 0).assertTrue();
      expect(str2.length === 0).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0407
     * @tc.name ExpressionTest0407
     * @tc.desc Test string strict equality with whitespace differences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "hello world";
      const str2: string = "hello  world"; // Extra space
      expect(str1 === str2).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0408
     * @tc.name ExpressionTest0408
     * @tc.desc Test string comparison with case differences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Hello";
      const str2: string = "hello";
      expect(str1 > str2).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0409
     * @tc.name ExpressionTest0409
     * @tc.desc Test logical AND with string length checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "moderate length";
      const result: boolean = str.length > 5 && str.length < 20;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0410
     * @tc.name ExpressionTest0410
     * @tc.desc Test logical OR with string content checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "password";
      const result: boolean = str.includes("admin") || str.length < 6;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0411
     * @tc.name ExpressionTest0411
     * @tc.desc Test conditional operator with string length ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "short";
      const result: string = str.length > 10 ? "long" :
        str.length > 5 ? "medium" : "short";
      expect(result).assertEqual("short");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0412
     * @tc.name ExpressionTest0412
     * @tc.desc Test string concatenation in nested function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: string = outerStrFunc("content");
      expect(result).assertEqual("Inner: Outer: content");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0413
     * @tc.name ExpressionTest0413
     * @tc.desc Test string return values in comparison expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getString: () => string = (): string => {
        return "comparison";
      };
      const result: boolean = getString() > "compare";
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0414
     * @tc.name ExpressionTest0414
     * @tc.desc Test template strings with arithmetic expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 3;
      const result: string = `${a} + ${b} = ${a + b}`;
      expect(result).assertEqual("5 + 3 = 8");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0415
     * @tc.name ExpressionTest0415
     * @tc.desc Test comma operator in for loop with string manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let i: number, currentChar: string;
      for (i = 65, currentChar = String.fromCharCode(i); i <= 67; i++, currentChar = String.fromCharCode(i)) {
        result += currentChar;
      }
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0416
     * @tc.name ExpressionTest0416
     * @tc.desc Test typeof with string literals vs variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const strVar: string = "test";
      const result1: string = typeof strVar;
      const result2: string = typeof "literal";
      expect(result1).assertEqual("string");
      expect(result2).assertEqual("string");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0417
     * @tc.name ExpressionTest0417
     * @tc.desc Test string index access with variable arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmno";
      const offset: number = 3;
      const step: number = 2;
      const result: string = str[offset + step * 2];
      expect(result).assertEqual("h"); // 3 + 4 = 7, index 7 is 'i'
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0418
     * @tc.name ExpressionTest0418
     * @tc.desc Test string concatenation with post-increment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 5;
      const result: string = "Count: " + count++ + ", Next: " + count;
      expect(result).assertEqual("Count: 5, Next: 6");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0419
     * @tc.name ExpressionTest0419
     * @tc.desc Test string methods with operator results in parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const start: number = 2;
      const length: number = 4;
      const result: string = str.substr(start, length + 1);
      expect(result).assertEqual("cdefg");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0420
     * @tc.name ExpressionTest0420
     * @tc.desc Test logical NOT with string methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "hello";
      const str2: string = "world";
      expect(!str1.includes("x")).assertTrue();
      expect(!str2.startsWith("w")).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0421
     * @tc.name ExpressionTest0421
     * @tc.desc Test string concatenation assignment with loop index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 0; i < 3; i++) {
        result += "[" + i + "]";
      }
      expect(result).assertEqual("[0][1][2]");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0422
     * @tc.name ExpressionTest0422
     * @tc.desc Test string comparison with combined logical operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "typescript";
      const result: boolean = (str.length > 5 && str.startsWith("type")) || str.endsWith("script");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0423
     * @tc.name ExpressionTest0423
     * @tc.desc Test string length with multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "abc";
      const str2: string = "defgh";
      const result: number = str1.length * str2.length;
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0424
     * @tc.name ExpressionTest0424
     * @tc.desc Test string concatenation with function return values in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: string = getGreeting() + ", " + getName() + "!";
      expect(result).assertEqual("Hello, Jane!");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0425
     * @tc.name ExpressionTest0425
     * @tc.desc Test nested conditional operators with string checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "apple";
      const result: string = str.length > 6 ? "Very long" :
        str.length > 4 ? "Long" :
          str.length > 2 ? "Medium" : "Short";
      expect(result).assertEqual("Long");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0426
     * @tc.name ExpressionTest0426
     * @tc.desc Test string concatenation with nullish coalescing in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const title: string | null = null;
      const defaultTitle: string = "Document";
      const result: string = `${title ?? defaultTitle} - Page 1`;
      expect(result).assertEqual("Document - Page 1");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0427
     * @tc.name ExpressionTest0427
     * @tc.desc Test string to number conversion before bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "12";
      const str2: string = "5";
      const num1: number = Number(str1);
      const num2: number = Number(str2);
      const result: number = num1 ^ num2;
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0428
     * @tc.name ExpressionTest0428
     * @tc.desc Test string index with prefix decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdef";
      let index: number = 3;
      const result: string = str[--index] + str[index++];
      expect(result).assertEqual("cc");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0429
     * @tc.name ExpressionTest0429
     * @tc.desc Test logical AND assignment with string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let message: string = "Success";
      const error: string = "Error occurred";
      message &&= error; // Should update since message is truthy
      expect(message).assertEqual("Error occurred");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0430
     * @tc.name ExpressionTest0430
     * @tc.desc Test optional chaining with string methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const data: GeneratedTypeLiteralInterface_3 = { text: "example" };
      const result1: string | undefined = data.text?.replace("example", "test");
      data.text = undefined;
      expect(result1).assertEqual("test");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0431
     * @tc.name ExpressionTest0431
     * @tc.desc Test string length with division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijkl";
      const result: number = str.length / 4;
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0432
     * @tc.name ExpressionTest0432
     * @tc.desc Test string concatenation with exponentiation in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 3;
      const exponent: number = 3;
      const result: string = `${base} to the power of ${exponent} is ${base** exponent}`;
      expect(result).assertEqual("3 to the power of 3 is 27");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0433
     * @tc.name ExpressionTest0433
     * @tc.desc Test string comparison with operator precedence and parentheses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "app";
      const str3: string = "apricot";
      const result1: boolean = str1 > str2 && str1 < str3;
      const temp: string = str2 && str1;
      const result2: boolean = str1 > temp && temp < str3;
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0434
     * @tc.name ExpressionTest0434
     * @tc.desc Test string concatenation with grouped template expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 20;
      const result: string = `Total: ${a + b}, Average: ${(a + b) / 2}`;
      expect(result).assertEqual("Total: 30, Average: 15");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0435
     * @tc.name ExpressionTest0435
     * @tc.desc Test string methods with arithmetic in parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      const start: number = 0;
      const count: number = 5;
      const result: string = str.substring(start, start + count * 2);
      expect(result).assertEqual("abcdefghij");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0436
     * @tc.name ExpressionTest0436
     * @tc.desc Test string concatenation with unary minus in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 42;
      const result: string = `Value: ${-num}`;
      expect(result).assertEqual("Value: -42");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0437
     * @tc.name ExpressionTest0437
     * @tc.desc Test string comparison with unary operator results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "100";
      const num: number = 50;
      const result: boolean = Number(str) > -num;
      expect(result).assertTrue(); // 100 > -50 is true
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0438
     * @tc.name ExpressionTest0438
     * @tc.desc Test string length with subtraction assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello world";
      let result: number = 20;
      result -= str.length;
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0439
     * @tc.name ExpressionTest0439
     * @tc.desc Test string concatenation with increment in nested loops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 0; i < 2; i++) {
        for (let j = 0; j < 2; j++) {
          result += `(${i},${j})`;
        }
      }
      expect(result).assertEqual("(0,0)(0,1)(1,0)(1,1)");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0440
     * @tc.name ExpressionTest0440
     * @tc.desc Test string conditions with modulus results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const result: boolean = str.length % 2 === 0;
      expect(result).assertTrue(); // Length is 10, 10 % 2 = 0
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0441
     * @tc.name ExpressionTest0441
     * @tc.desc Test string concatenation with bitwise shift results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const result: string = `5 shifted left by 2: ${a << 2}`;
      expect(result).assertEqual("5 shifted left by 2: 20");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0442
     * @tc.name ExpressionTest0442
     * @tc.desc Test string comparison with bitwise NOT results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "3";
      const num: number = 3;
      const result: boolean = Number(str) === ~~num; // Double bitwise NOT truncates
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0443
     * @tc.name ExpressionTest0443
     * @tc.desc Test string concatenation with logical expressions in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 20;
      const result: string = `${a} < ${b}: ${a < b}, ${a} > ${b}: ${a > b}`;
      expect(result).assertEqual("10 < 20: true, 10 > 20: false");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0444
     * @tc.name ExpressionTest0444
     * @tc.desc Test string length with bitwise AND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello world";
      const result: number = str.length & 1;
      expect(result).assertEqual(1); // Length is 11, 11 & 1 = 1 (odd)
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0445
     * @tc.name ExpressionTest0445
     * @tc.desc Test string index with bitwise OR operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const a: number = 2;
      const b: number = 3;
      const result: string = str[a | b];
      expect(result).assertEqual("d");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0446
     * @tc.name ExpressionTest0446
     * @tc.desc Test string concatenation with XOR result in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 5;
      const result: string = `${a} XOR ${b} = ${a ^ b}`;
      expect(result).assertEqual("12 XOR 5 = 9");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0447
     * @tc.name ExpressionTest0447
     * @tc.desc Test string comparison with shifted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "16";
      const shifted: number = 4 << 2; // 16
      expect(Number(str) === shifted).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0448
     * @tc.name ExpressionTest0448
     * @tc.desc Test string concatenation with multiple logical expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 10;
      const c: number = 15;
      const result: string = `a < b: ${a < b}, b < c: ${b < c}, both: ${a < b && b < c}`;
      expect(result).assertEqual("a < b: true, b < c: true, both: true");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0449
     * @tc.name ExpressionTest0449
     * @tc.desc Test string length with bitwise NOT in condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "test";
      const result: boolean = ~str.length < -5;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0450
     * @tc.name ExpressionTest0450
     * @tc.desc Test comma operator in for loop with string length and index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "reverse me";
      let reversed: string = "";
      let i: number, len: number;
      for (i = str.length - 1, len = str.length; i >= 0; i--, len--) {
        reversed += str[i];
      }
      expect(reversed).assertEqual("em esrever");
      expect(len).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0451
     * @tc.name ExpressionTest0451
     * @tc.desc Test string concatenation with ternary operator and length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0451', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "Hello";
      const result: string = str + (str.length > 4 ? " there" : "");
      expect(result).assertEqual("Hello there");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0452
     * @tc.name ExpressionTest0452
     * @tc.desc Test numeric operations with unary plus in string template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0452', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      const result: string = `Value: ${+num}, Incremented: ${+num++}`;
      expect(result).assertEqual("Value: 5, Incremented: 5");
      expect(num).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0453
     * @tc.name ExpressionTest0453
     * @tc.desc Test bitwise operations in for loop with comma operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0453', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, mask: number;
      for (i = 0, mask = 1; i < 4; i++, mask <<= 1) {
        result += mask;
      }
      expect(result).assertEqual(15); // 1 + 2 + 4 + 8
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0454
     * @tc.name ExpressionTest0454
     * @tc.desc Test string comparison with logical NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0454', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "apple";
      const result: boolean = !(str1 === str2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0455
     * @tc.name ExpressionTest0455
     * @tc.desc Test numeric equality with bitwise results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0455', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 6;
      const result: boolean = (a & b) === 2;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0456
     * @tc.name ExpressionTest0456
     * @tc.desc Test string concatenation with multiple conditionals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0456', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const score: number = 85;
      let result: string = "Score: " + score + " - ";
      result += score > 90 ? "Excellent" :
        score > 80 ? "Good" :
          score > 70 ? "Average" : "Poor";
      expect(result).assertEqual("Score: 85 - Good");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0457
     * @tc.name ExpressionTest0457
     * @tc.desc Test unary minus with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0457', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const result: number = - (a << 1);
      expect(result).assertEqual(-20);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0458
     * @tc.name ExpressionTest0458
     * @tc.desc Test string length with arithmetic in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0458', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "looping";
      let count: number = 0;
      for (let i = 0; i < str.length / 2; i++) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0459
     * @tc.name ExpressionTest0459
     * @tc.desc Test logical AND with numeric range checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0459', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 42;
      const result: boolean = num > 10 && num < 50;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0460
     * @tc.name ExpressionTest0460
     * @tc.desc Test logical OR with string checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "example";
      const result: boolean = str.startsWith("test") || str.endsWith("ple");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0461
     * @tc.name ExpressionTest0461
     * @tc.desc Test compound assignment with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0461', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 10;
      num &= 15; // 1010 & 1111 = 1010 (10)
      num |= 4;  // 1010 | 0100 = 1110 (14)
      num ^= 3;  // 1110 ^ 0011 = 1101 (13)
      expect(num).assertEqual(13);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0462
     * @tc.name ExpressionTest0462
     * @tc.desc Test string template with logical expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0462', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 10;
      const result: string = `${a} is ${a > b ? 'greater than' : 'less than'} ${b}`;
      expect(result).assertEqual("5 is less than 10");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0463
     * @tc.name ExpressionTest0463
     * @tc.desc Test increment operator in string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0463', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 0;
      const result: string = "Count: " + ++count + ", Next: " + count++;
      expect(result).assertEqual("Count: 1, Next: 1");
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0464
     * @tc.name ExpressionTest0464
     * @tc.desc Test decrement operator in numeric expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0464', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      const result: number = num-- * 2 + --num;
      // (5 * 2) + 3 = 10 + 3 = 13
      expect(result).assertEqual(13);
      expect(num).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0465
     * @tc.name ExpressionTest0465
     * @tc.desc Test comma operator in for loop with string manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0465', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: string = "item";
      let result: string = "";
      let i: number, current: string;
      for (i = 1, current = base + i; i <= 3; i++, current = base + i) {
        result += current + " ";
      }
      expect(result).assertEqual("item1 item2 item3 ");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0466
     * @tc.name ExpressionTest0466
     * @tc.desc Test string comparison with length and content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0466', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "app";
      const result: boolean = str1.length > str2.length && str1 > str2;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0467
     * @tc.name ExpressionTest0467
     * @tc.desc Test numeric operations with modulus in condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0467', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 15;
      let result: string = "";
      if (num % 2 === 0) {
        result = "Even";
      } else {
        result = "Odd";
      }
      expect(result).assertEqual("Odd");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0468
     * @tc.name ExpressionTest0468
     * @tc.desc Test string concatenation with nullish coalescing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0468', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const name: string | null = null;
      const defaultName: string = "User";
      const result: string = "Hello, " + (name ?? defaultName);
      expect(result).assertEqual("Hello, User");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0469
     * @tc.name ExpressionTest0469
     * @tc.desc Test bitwise operations with negative numbers in condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0469', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -5;
      const b: number = -3;
      const result: boolean = (a & b) === -7;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0470
     * @tc.name ExpressionTest0470
     * @tc.desc Test string index access with arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const index: number = 3;
      const result: string = str[index] + str[index + 2];
      expect(result).assertEqual("df");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0471
     * @tc.name ExpressionTest0471
     * @tc.desc Test logical assignment with string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0471', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let message: string = "";
      const defaultMsg: string = "Default message";
      message ||= defaultMsg;
      expect(message).assertEqual("Default message");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0472
     * @tc.name ExpressionTest0472
     * @tc.desc Test optional chaining with string properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0472', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Info {
        name?: string;
      }

      interface Data {
        info?: Info;
      }
      const data: Data = { info: { name: "Test" } };
      const result1: string | undefined = data.info?.name?.toUpperCase();
      data.info = undefined;
      const info = data.info as Info | undefined;
      const result2: string | undefined = info?.name?.toUpperCase();
      expect(result1).assertEqual("TEST");
      expect(result2).assertUndefined();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0473
     * @tc.name ExpressionTest0473
     * @tc.desc Test numeric comparison with shifted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0473', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const result: boolean = (a << 1) > (a * 1.5);
      // 10 > 7.5 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0474
     * @tc.name ExpressionTest0474
     * @tc.desc Test string concatenation with exponentiation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0474', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 2;
      const exp: number = 3;
      const result: string = base + "^" + exp + " = " + (base **exp);
      expect(result).assertEqual("2^3 = 8");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0475
     * @tc.name ExpressionTest0475
     * @tc.desc Test operator precedence with arithmetic and bitwise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0475', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const c: number = 2;
      const result1: number = a + b * c;
      const result2: number = (a + b) * c;
      expect(result1).assertEqual(16);
      expect(result2).assertEqual(26);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0476
     * @tc.name ExpressionTest0476
     * @tc.desc Test grouped expressions in string template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0476', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const x: number = 5;
      const y: number = 3;
      const result: string = `${x} + ${y} = ${x + y}, ${x} * ${y} = ${x * y}`;
      expect(result).assertEqual("5 + 3 = 8, 5 * 3 = 15");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0477
     * @tc.name ExpressionTest0477
     * @tc.desc Test string methods with operator results as parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0477', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const start: number = 2;
      const length: number = 4;
      const result: string = str.substr(start, length);
      expect(result).assertEqual("cdef");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0478
     * @tc.name ExpressionTest0478
     * @tc.desc Test unary minus with arithmetic in string template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0478', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 15;
      const result: string = `Negative: ${-num}, Absolute: ${-(-num)}`;
      expect(result).assertEqual("Negative: -15, Absolute: 15");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0479
     * @tc.name ExpressionTest0479
     * @tc.desc Test numeric comparison with unary operator results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0479', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 5;
      const result: boolean = -a < -b;
      // -10 < -5 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0480
     * @tc.name ExpressionTest0480
     * @tc.desc Test compound assignment with arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 10;
      num += 5;  // 15
      num *= 2;  // 30
      num -= 8;  // 22
      num /= 2;  // 11
      expect(num).assertEqual(11);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0481
     * @tc.name ExpressionTest0481
     * @tc.desc Test string concatenation with loop index and conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0481', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 1; i <= 5; i++) {
        result += i + (i % 2 === 0 ? " even " : " odd ");
      }
      expect(result).assertEqual("1 odd 2 even 3 odd 4 even 5 odd ");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0482
     * @tc.name ExpressionTest0482
     * @tc.desc Test numeric conditions with modulus results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0482', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 23;
      const result: string = num % 3 === 0 ? "Divisible by 3" :
        num % 3 === 1 ? "Remainder 1" : "Remainder 2";
      expect(result).assertEqual("Remainder 2");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0483
     * @tc.name ExpressionTest0483
     * @tc.desc Test string concatenation with bitwise results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0483', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 5;
      const result: string = a + " & " + b + " = " + (a & b);
      expect(result).assertEqual("12 & 5 = 4");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0484
     * @tc.name ExpressionTest0484
     * @tc.desc Test numeric comparison with bitwise NOT results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0484', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 4;
      const result: boolean = ~num < -5;
      // ~4 = -5, so -5 < -5 is false
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0485
     * @tc.name ExpressionTest0485
     * @tc.desc Test string template with logical expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0485', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 7;
      const b: number = 3;
      const c: number = 10;
      const result: string = `${a} > ${b}: ${a > b}, ${b} > ${c}: ${b > c}, both: ${a > b && b > c}`;
      expect(result).assertEqual("7 > 3: true, 3 > 10: false, both: false");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0486
     * @tc.name ExpressionTest0486
     * @tc.desc Test string length with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0486', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "Hello World";
      const result: number = str.length | 0x0F;
      // 11 | 15 = 15
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0487
     * @tc.name ExpressionTest0487
     * @tc.desc Test string index with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0487', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmno";
      const a: number = 2;
      const b: number = 4;
      const result: string = str[a + b];
      expect(result).assertEqual("g");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0488
     * @tc.name ExpressionTest0488
     * @tc.desc Test string template with XOR result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0488', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 6;
      const result: string = `${a} XOR ${b} = ${a ^ b}`;
      expect(result).assertEqual("10 XOR 6 = 12");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0489
     * @tc.name ExpressionTest0489
     * @tc.desc Test numeric comparison with shifted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0489', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 8;
      const result: boolean = (a >> 1) === (a / 2);
      // 4 === 4 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0490
     * @tc.name ExpressionTest0490
     * @tc.desc Test string concatenation with multiple logical checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "TypeScript";
      const result: string = "Checks: " +
        "Length>5=" + (str.length > 5) + ", " +
        "Starts='Type'=" + str.startsWith("Type") + ", " +
        "Ends='Script'=" + str.endsWith("Script");
      expect(result).assertEqual("Checks: Length>5=true, Starts='Type'=true, Ends='Script'=true");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0491
     * @tc.name ExpressionTest0491
     * @tc.desc Test numeric range check with logical operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0491', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const score: number = 75;
      const result: boolean = score >= 60 && score < 80;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0492
     * @tc.name ExpressionTest0492
     * @tc.desc Test string length with arithmetic and bitwise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0492', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdef";
      const result: number = (str.length * 2) & 0x0F;
      // 12 & 15 = 12
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0493
     * @tc.name ExpressionTest0493
     * @tc.desc Test ternary operator with nested conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0493', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const temp: number = 25;
      const result: string = temp > 30 ? "Hot" :
        temp > 20 ? "Warm" :
          temp > 10 ? "Cool" : "Cold";
      expect(result).assertEqual("Warm");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0494
     * @tc.name ExpressionTest0494
     * @tc.desc Test comma operator in for loop with multiple counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0494', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sumEven: number = 0;
      let sumOdd: number = 0;
      let i: number, isEven: boolean;
      for (i = 1, isEven = false; i <= 5; i++, isEven = !isEven) {
        if (isEven) {
          sumEven += i;
        } else {
          sumOdd += i;
        }
      }
      expect(sumEven).assertEqual(6); // 2 + 4
      expect(sumOdd).assertEqual(9);  // 1 + 3 + 5
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0495
     * @tc.name ExpressionTest0495
     * @tc.desc Test string comparison with case conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0495', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Hello";
      const str2: string = "HELLO";
      const result: boolean = str1.toLowerCase() === str2.toLowerCase();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0496
     * @tc.name ExpressionTest0496
     * @tc.desc Test numeric operations with unary operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0496', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      const result: number = -num + +num * 2;
      // -5 + 5 * 2 = -5 + 10 = 5
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0497
     * @tc.name ExpressionTest0497
     * @tc.desc Test bitwise operations in conditional expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0497', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const flags: number = 0b1010;
      const result: string = (flags & 0b1000) ? "Flag A set" : "Flag A not set";
      expect(result).assertEqual("Flag A set");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0498
     * @tc.name ExpressionTest0498
     * @tc.desc Test string concatenation with increment in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0498', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let count: number = 0;
      while (count < 3) {
        result += "Iteration " + ++count + " ";
      }
      expect(result).assertEqual("Iteration 1 Iteration 2 Iteration 3 ");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0499
     * @tc.name ExpressionTest0499
     * @tc.desc Test numeric comparison with bitwise results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0499', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = 8;
      const result: boolean = (a ^ b) > (a & b);
      // 7 > 8 is false
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0500
     * @tc.name ExpressionTest0500
     * @tc.desc Test comma operator in for loop with string and number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let i: number, prefix: string;
      for (i = 1, prefix = "step-"; i <= 3; i++, prefix = "step-") {
        result += prefix + i + " ";
      }
      expect(result).assertEqual("step-1 step-2 step-3 ");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0501
     * @tc.name ExpressionTest0501
     * @tc.desc Test string concatenation with ternary and logical operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "typescript";
      const result: string = str + (str.length > 5 && str.includes("type") ? " is valid" : " is invalid");
      expect(result).assertEqual("typescript is valid");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0502
     * @tc.name ExpressionTest0502
     * @tc.desc Test unary plus with arithmetic in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sum: number = 0;
      let value: string = "2";
      let numericValue: number = Number(value);
      for (let i = 0; i < 3; i++) {
        sum += numericValue;
        numericValue++; //
      }
      expect(sum).assertEqual(9); // 2 + 3 + 4 = 9
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0503
     * @tc.name ExpressionTest0503
     * @tc.desc Test comma operator in for loop with bitwise counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, mask: number;
      for (i = 0, mask = 1; i < 5; i++, mask = mask << 1) {
        result |= mask;
      }
      expect(result).assertEqual(31); // 1 | 2 | 4 | 8 | 16 = 31
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0504
     * @tc.name ExpressionTest0504
     * @tc.desc Test logical NOT with string length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "";
      const result: boolean = !!(str.length === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0505
     * @tc.name ExpressionTest0505
     * @tc.desc Test bitwise XOR with equality check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 10;
      const result: boolean = (a ^ b) === 6;
      expect(result).assertTrue(); // 12 ^ 10 = 6
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0506
     * @tc.name ExpressionTest0506
     * @tc.desc Test string concatenation with nested ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 3;
      let result: string = "Number " + num + " is ";
      result += num > 5 ? "large" : num > 2 ? "medium" : "small";
      expect(result).assertEqual("Number 3 is medium");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0507
     * @tc.name ExpressionTest0507
     * @tc.desc Test unary minus with bitwise shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const result: number = - (a >> 1);
      expect(result).assertEqual(-2); // -(5 >> 1) = -2
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0508
     * @tc.name ExpressionTest0508
     * @tc.desc Test string length with arithmetic in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefgh";
      let result: string = "";
      for (let i = 0; i < str.length; i += 2) {
        result += str[i];
      }
      expect(result).assertEqual("aceg");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0509
     * @tc.name ExpressionTest0509
     * @tc.desc Test logical AND with string and number checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0509', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello";
      const num: number = 5;
      const result: boolean = str.length === num && num > 3;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0510
     * @tc.name ExpressionTest0510
     * @tc.desc Test logical OR with mixed conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "test";
      const num: number = 2;
      const result: boolean = str.length > 5 || num * 3 > 5;
      expect(result).assertTrue(); // 2*3=6>5
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0511
     * @tc.name ExpressionTest0511
     * @tc.desc Test compound assignment with bitwise OR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0511', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flags: number = 0b0010;
      flags |= 0b1000; // Set bit 3
      flags |= 0b0100; // Set bit 2
      expect(flags).assertEqual(0b1110);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0512
     * @tc.name ExpressionTest0512
     * @tc.desc Test string template with arithmetic expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0512', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const x: number = 10;
      const y: number = 4;
      const result: string = `${x} / ${y} = ${x / y}, remainder ${x % y}`;
      expect(result).assertEqual("10 / 4 = 2.5, remainder 2");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0513
     * @tc.name ExpressionTest0513
     * @tc.desc Test prefix increment in string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0513', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 3;
      const result: string = "Count: " + ++count + ", Next: " + ++count;
      expect(result).assertEqual("Count: 4, Next: 5");
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0514
     * @tc.name ExpressionTest0514
     * @tc.desc Test postfix decrement in numeric expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0514', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 8;
      const result: number = num-- - 2 + num--;
      // 8 - 2 + 7 = 13
      expect(result).assertEqual(13);
      expect(num).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0515
     * @tc.name ExpressionTest0515
     * @tc.desc Test comma operator in for loop with string index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0515', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefgh";
      let result: string = "";
      let i: number, char: string;
      for (i = 0, char = str[i]; i < str.length; i += 2, char = str[i]) {
        result += char;
      }
      expect(result).assertEqual("aceg");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0516
     * @tc.name ExpressionTest0516
     * @tc.desc Test string comparison with logical operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0516', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "apricot";
      const result: boolean = str1 < str2 && str1.length < str2.length;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0517
     * @tc.name ExpressionTest0517
     * @tc.desc Test modulus in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0517', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      for (let i = 1; i <= 10; i++) {
        if (i % 3 === 0) {
          result += i;
        }
      }
      expect(result).assertEqual(3 + 6 + 9);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0518
     * @tc.name ExpressionTest0518
     * @tc.desc Test nullish coalescing in string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0518', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: string | undefined = undefined;
      const fallback: string = "default";
      const result: string = "Value: " + (value ?? fallback);
      expect(result).assertEqual("Value: default");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0519
     * @tc.name ExpressionTest0519
     * @tc.desc Test bitwise operations with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0519', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -10;
      const b: number = -5;
      const result: boolean = (a | b) === -11;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0520
     * @tc.name ExpressionTest0520
     * @tc.desc Test string index with compound arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "0123456789";
      let index: number = 2;
      index *= 2; // 4
      const result: string = str[index] + str[index + 3];
      expect(result).assertEqual("47");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0521
     * @tc.name ExpressionTest0521
     * @tc.desc Test logical AND assignment with numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0521', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 15;
      const mask: number = 10;
      value &&= mask; // 15 is truthy, so value = 10
      expect(value).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0523
     * @tc.name ExpressionTest0523
     * @tc.desc Test comparison with left shift results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0523', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 7;
      const result: boolean = (a << 2) === a * 4;
      // 28 === 28 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0524
     * @tc.name ExpressionTest0524
     * @tc.desc Test string concatenation with exponentiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0524', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 5;
      const exp: number = 3;
      const result: string = base + " to the power of " + exp + " equals " + (base** exp);
      expect(result).assertEqual("5 to the power of 3 equals 125");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0525
     * @tc.name ExpressionTest0525
     * @tc.desc Test operator precedence with bitwise and arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0525', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 8;
      const b: number = 3;
      const c: number = 2;
      const result1: number = a / b * c;
      const result2: number = a / (b * c);
      expect(result1).assertClose(5.3333333, 0.0000001);
      expect(result2).assertClose(1.3333333, 0.0000001);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0526
     * @tc.name ExpressionTest0526
     * @tc.desc Test grouped expressions in template string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0526', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 4;
      const b: number = 6;
      const result: string = `${a} + ${b} * 2 = ${a + b * 2}, (${a} + ${b}) * 2 = ${(a + b) * 2}`;
      expect(result).assertEqual("4 + 6 * 2 = 16, (4 + 6) * 2 = 20");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0527
     * @tc.name ExpressionTest0527
     * @tc.desc Test string method with arithmetic parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0527', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmno";
      const start: number = 3;
      const length: number = 5;
      const result: string = str.substring(start, start + length);
      expect(result).assertEqual("defgh");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0528
     * @tc.name ExpressionTest0528
     * @tc.desc Test unary minus with arithmetic in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0528', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 4;
      const result: string = `-${a} + ${b} = ${-a + b}`;
      expect(result).assertEqual("-10 + 4 = -6");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0529
     * @tc.name ExpressionTest0529
     * @tc.desc Test comparison with unary results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0529', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 6;
      const b: number = 3;
      const result: boolean = -a <= -b;
      // -6 <= -3 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0530
     * @tc.name ExpressionTest0530
     * @tc.desc Test compound assignment with modulus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 25;
      num %= 7;  // 25 % 7 = 4
      num += 3;  // 7
      num %= 5;  // 2
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0531
     * @tc.name ExpressionTest0531
     * @tc.desc Test string concatenation with loop index conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0531', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 0; i < 5; i++) {
        result += (i % 2 === 0 ? "even" : "odd") + i + " ";
      }
      expect(result).assertEqual("even0 odd1 even2 odd3 even4 ");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0532
     * @tc.name ExpressionTest0532
     * @tc.desc Test modulus with conditional results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0532', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 37;
      const mod: number = 10;
      const result: string = num % mod === 0 ? "Multiple of 10" :
        "Last digit: " + (num % mod);
      expect(result).assertEqual("Last digit: 7");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0533
     * @tc.name ExpressionTest0533
     * @tc.desc Test string concatenation with bitwise OR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0533', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 3;
      const result: string = a + " | " + b + " = " + (a | b);
      expect(result).assertEqual("5 | 3 = 7");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0534
     * @tc.name ExpressionTest0534
     * @tc.desc Test comparison with bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0534', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 7;
      const result: boolean = ~num < -7;
      // ~7 = -8 < -7 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0535
     * @tc.name ExpressionTest0535
     * @tc.desc Test template string with multiple logical checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0535', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const x: number = 5;
      const y: number = 10;
      const result: string = `${x} < ${y}: ${x < y}, ${x} * 2 >= ${y}: ${x * 2 >= y}, ${x} == ${y}: ${x === y}`;
      expect(result).assertEqual("5 < 10: true, 5 * 2 >= 10: true, 5 == 10: false");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0536
     * @tc.name ExpressionTest0536
     * @tc.desc Test string length with bitwise XOR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0536', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello";
      const mask: number = 0x0F;
      const result: number = str.length ^ mask;
      // 5 ^ 15 = 10
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0537
     * @tc.name ExpressionTest0537
     * @tc.desc Test string index with bitwise shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0537', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "0123456789abcdef";
      const shift: number = 2;
      const result: string = str[1 << shift];
      // 1 << 2 = 4, str[4] = "4"
      expect(result).assertEqual("4");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0538
     * @tc.name ExpressionTest0538
     * @tc.desc Test template string with bitwise shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0538', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 3;
      const b: number = 2;
      const result: string = `${a} << ${b} = ${a << b}, ${a} >> ${b} = ${a >> b}`;
      expect(result).assertEqual("3 << 2 = 12, 3 >> 2 = 0");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0539
     * @tc.name ExpressionTest0539
     * @tc.desc Test comparison with right shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0539', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 16;
      const b: number = 4;
      const result: boolean = (a >> 2) === b;
      // 16 >> 2 = 4
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0540
     * @tc.name ExpressionTest0540
     * @tc.desc Test string concatenation with logical expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const temp: number = 22;
      const result: string = "Temperature " + temp + ": " +
        (temp > 30 ? "Hot" :
          temp > 20 ? "Warm" : "Cool");
      expect(result).assertEqual("Temperature 22: Warm");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0541
     * @tc.name ExpressionTest0541
     * @tc.desc Test range check with logical AND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0541', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const age: number = 25;
      const result: boolean = age >= 18 && age <= 30;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0542
     * @tc.name ExpressionTest0542
     * @tc.desc Test string length with arithmetic and bitwise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0542', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const result: number = (str.length + 2) & 0x0F;
      // 12 & 15 = 12
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0543
     * @tc.name ExpressionTest0543
     * @tc.desc Test nested ternary with arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0543', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const score: number = 85;
      const result: string = score >= 90 ? "A" :
        score >= 80 ? "B" :
          score >= 70 ? "C" :
            score >= 60 ? "D" : "F";
      expect(result).assertEqual("B");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0544
     * @tc.name ExpressionTest0544
     * @tc.desc Test comma operator in for loop with multiple variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0544', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sum: number = 0;
      let product: number = 1;
      let i: number, count: number;
      for (i = 1, count = 0; count < 4; i++, count++) {
        sum += i;
        product *= i;
      }
      expect(sum).assertEqual(1 + 2 + 3 + 4);
      expect(product).assertEqual(1 * 2 * 3 * 4);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0545
     * @tc.name ExpressionTest0545
     * @tc.desc Test string comparison with case conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0545', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "HelloWorld";
      const str2: string = "helloworld";
      const result: boolean = str1.toUpperCase() === str2.toUpperCase();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0546
     * @tc.name ExpressionTest0546
     * @tc.desc Test unary operators with arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0546', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 10;
      const result: number = -num + (+num / 2);
      // -10 + 5 = -5
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0547
     * @tc.name ExpressionTest0547
     * @tc.desc Test bitwise operations in conditional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0547', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const flags: number = 0b1100;
      const result: string = (flags & 0b1000) ? "Flag 3 set" : "Flag 3 not set";
      expect(result).assertEqual("Flag 3 set");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0548
     * @tc.name ExpressionTest0548
     * @tc.desc Test string concatenation with increment in while loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0548', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let count: number = 1;
      while (count <= 3) {
        result += count++ + ". item ";
      }
      expect(result).assertEqual("1. item 2. item 3. item ");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0549
     * @tc.name ExpressionTest0549
     * @tc.desc Test comparison with bitwise results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0549', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 20;
      const b: number = 12;
      const result: boolean = (a & b) < (a ^ b);
      // 4 < 16 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0550
     * @tc.name ExpressionTest0550
     * @tc.desc Test comma operator in for loop with string manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: string = "character_";
      let result: string = "";
      let i: number, current: string;
      for (i = 65, current = base + String.fromCharCode(i); i <= 67; i++, current = base + String.fromCharCode(i)) {
        result += current + " ";
      }
      expect(result).assertEqual("character_A character_B character_C ");
    });


  })
}