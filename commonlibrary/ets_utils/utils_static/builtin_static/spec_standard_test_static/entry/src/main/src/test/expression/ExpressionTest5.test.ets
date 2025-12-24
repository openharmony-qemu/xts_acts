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

interface GeneratedTypeLiteralInterface_6 {
  enabled?: boolean;
}

interface GeneratedTypeLiteralInterface_12 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_33 {
  value: number;
  shift: number;
}

interface GeneratedTypeLiteralInterface_43 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_40 {
  score: number;
}

interface GeneratedTypeLiteralInterface_45 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_46 {
  items: string[];
}

interface GeneratedTypeLiteralInterface_48 {
  value: number;
  shift: number;
}

interface GeneratedTypeLiteralInterface_50 {
  temp: number;
}

interface GeneratedTypeLiteralInterface_52 {
  list: number[];
}

interface GeneratedTypeLiteralInterface_54 {
  a: number;
  b: number;
  result: number;
}

interface GeneratedTypeLiteralInterface_55 {
  role: string;
  accessLevel: number;
}

interface GeneratedTypeLiteralInterface_57 {
  value: number;
  mask: number;
}

interface GeneratedTypeLiteralInterface_58 {
  value: number;
  log: string;
}

interface GeneratedTypeLiteralInterface_9 {
  price: string;
  quantity: string;
}

interface GeneratedTypeLiteralInterface_10 {
  loginCount: number;
  points: number;
}

interface GeneratedTypeLiteralInterface_25 {
  seconds: number;
  interval: number;
}

interface GeneratedTypeLiteralInterface_20 {
  value: number;
}

interface GeneratedTypeLiteralInterface_32 {
  x: number;
  y: number;
}

interface GeneratedTypeLiteralInterface_36 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_37 {
  values: number[];
  threshold: number;
}

interface GeneratedTypeLiteralInterface_38 {
  dividend: number;
  divisor: number;
}

interface GeneratedTypeLiteralInterface_39 {
  num: number;
}

interface GeneratedTypeLiteralInterface_41 {
  arr: string[];
  x: int;
  y: int;
}

interface GeneratedTypeLiteralInterface_42 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_44 {
  value: number;
  min: number;
  max: number;
}

interface GeneratedTypeLiteralInterface_49 {
  x: number;
  y: number;
}

interface GeneratedTypeLiteralInterface_53 {
  values: int[];
  sum: int;
  multiplier: int;
}

interface GeneratedTypeLiteralInterface_51 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_47 {
  grade: number;
}

interface GeneratedTypeLiteralInterface_35 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_5 {
  age?: number;
}

interface GeneratedTypeLiteralInterface_13 {
  title: string;
  pages: number;
  author: string;
}

interface GeneratedTypeLiteralInterface_14 {
  wins: number;
  losses: number;
}

interface GeneratedTypeLiteralInterface_11 {
  debug?: boolean;
}

interface GeneratedTypeLiteralInterface_16 {
  balance: number;
  isActive: boolean;
  type: string;
}

interface GeneratedTypeLiteralInterface_26 {
  theme?: string;
}

interface GeneratedTypeLiteralInterface_27 {
  user: number;
  admin: number;
}

interface GeneratedTypeLiteralInterface_30 {
  base: number;
  exponent: number;
}

interface GeneratedTypeLiteralInterface_34 {
  toCelsius: (f: number) => number;
}

interface GeneratedTypeLiteralInterface_19 {
  add: (a: int, b: int) => int;
  multiply: (a: int, b: int) => int;
}

interface GeneratedTypeLiteralInterface_21 {
  quantity: number;
}

interface GeneratedTypeLiteralInterface_8 {
  name: string;
  age: number;
}

interface GeneratedTypeLiteralInterface_22 {
  score: number;
  level: number;
}

interface GeneratedTypeLiteralInterface_23 {
  price: number;
}

interface GeneratedTypeLiteralInterface_24 {
  price: number;
}

interface GeneratedTypeLiteralInterface_18 {
  speed: number;
}

interface GeneratedTypeLiteralInterface_17 {
  isAdmin: boolean;
  hasPermission: boolean;
  role: string;
}

interface GeneratedTypeLiteralInterface_15 {
  values: number[];
}

interface GeneratedTypeLiteralInterface_28 {
  values: int[];
  offset: int;
}

interface GeneratedTypeLiteralInterface_31 {
  a: number;
  b: number;
  c: number;
}

interface GeneratedTypeLiteralInterface_29 {
  maxSize?: number;
}

export default function expressionTest5() {
  describe('ExpressionTest5', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0741
     * @tc.name ExpressionTest0741
     * @tc.desc Test range check with logical operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0741', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const percentage: number = 75;
      const result: boolean = percentage >= 70 && percentage < 80;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0742
     * @tc.name ExpressionTest0742
     * @tc.desc Test string length with arithmetic and bitwise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0742', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      const result: number = (str.length / 2) | 0x0F;
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0743
     * @tc.name ExpressionTest0743
     * @tc.desc Test nested ternary with multiple conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0743', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const weight: number = 75;
      const height: number = 1.8;
      const bmi: number = weight / (height * height);
      const result: string = bmi > 30 ? "Obese" :
        bmi > 25 ? "Overweight" :
          bmi > 18.5 ? "Normal" : "Underweight";
      expect(result).assertEqual("Normal");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0744
     * @tc.name ExpressionTest0744
     * @tc.desc Test comma operator in for loop with multiple variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0744', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, j: number;
      for (i = 5, j = 1; i >= 1; i--, j *= 2) {
        result += i * j;
      }
      expect(result).assertEqual(5 * 1 + 4 * 2 + 3 * 4 + 2 * 8 + 1 * 16);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0745
     * @tc.name ExpressionTest0745
     * @tc.desc Test string comparison with substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0745', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "Hello TypeScript";
      const substr: string = "Type";
      const result: boolean = str.substring(6, 10) === substr;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0746
     * @tc.name ExpressionTest0746
     * @tc.desc Test unary operators with arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0746', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 6;
      const result: number = ~num * 2 + (-num);
      expect(result).assertEqual(-20);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0747
     * @tc.name ExpressionTest0747
     * @tc.desc Test bitwise operations in conditional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0747', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 0b101101;
      const mask: number = 0b001000;
      const result: boolean = (value & mask) === 0;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0748
     * @tc.name ExpressionTest0748
     * @tc.desc Test string concatenation with increment in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0748', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let count: number = 0;
      do {
        result += count % 2 === 0 ? "even" : "odd";
        result += count + " ";
        count++;
      } while (count < 4);
      expect(result).assertEqual("even0 odd1 even2 odd3 ");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0749
     * @tc.name ExpressionTest0749
     * @tc.desc Test comparison with bitwise results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0749', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 30;
      const b: number = 17;
      const result: boolean = (a | b) < (a ^ b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0750
     * @tc.name ExpressionTest0750
     * @tc.desc Test comma operator in for loop with string manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      let result: string = "";
      let i: int, step: int;
      for (i = 0, step = 1; i < str.length; i += step, step = step < 5 ? step + 1 : 1) {
        result += str[i];
      }
      expect(result).assertEqual("abdgkpqsvz");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0751
     * @tc.name ExpressionTest0751
     * @tc.desc Test string concatenation with multiple arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0751', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = 3;
      const result: string = "Result: " + (a + b) + ", " + (a - b) + ", " + (a * b) + ", " + (a / b);
      expect(result).assertEqual("Result: 18, 12, 45, 5");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0752
     * @tc.name ExpressionTest0752
     * @tc.desc Test unary minus with logical operations in ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0752', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 7;
      const result: number = -num > -10 ? 1 : 0;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0753
     * @tc.name ExpressionTest0753
     * @tc.desc Test comma operator in for loop with array indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0753', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: int[] = [10, 20, 30, 40, 50, 60, 70];
      let result: int = 0;
      let i: int, step: int;
      for (i = 0, step = 2; i < arr.length; i += step, step = Math.min(step + 1, 3).toInt()) {
        result += arr[i];
      }
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0754
     * @tc.name ExpressionTest0754
     * @tc.desc Test logical NOT with object property check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0754', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const user: GeneratedTypeLiteralInterface_5 = { age: 25 };
      const result: boolean = !(user.age === undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0755
     * @tc.name ExpressionTest0755
     * @tc.desc Test bitwise OR with range check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0755', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 0b1010;
      const b: number = 0b0111;
      const result: boolean = (a | b) >= 0b1111 && (a | b) <= 0b1111;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0756
     * @tc.name ExpressionTest0756
     * @tc.desc Test string template with conditional expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0756', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const temperature: number = 32;
      const result: string = `${temperature}°C is ${temperature > 30 ? 'hot' : temperature > 20 ? 'warm' : 'cool'}`;
      expect(result).assertEqual("32°C is hot");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0757
     * @tc.name ExpressionTest0757
     * @tc.desc Test unary plus with string to number conversion in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0757', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "123";
      const str2: string = "45";
      const result: number = +Number(str1) - +Number(str2);
      expect(result).assertEqual(78);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0758
     * @tc.name ExpressionTest0758
     * @tc.desc Test array length with arithmetic in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0758', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      let result: number = 0;
      for (let i = 0; i < arr.length / 2; i++) {
        result += arr[i];
      }
      expect(result).assertEqual(1 + 2 + 3 + 4 + 5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0759
     * @tc.name ExpressionTest0759
     * @tc.desc Test logical AND with mixed conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0759', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 17;
      const str: string = "test";
      const result: boolean = num > 10 && str.length === 4 && num % 2 === 1;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0760
     * @tc.name ExpressionTest0760
     * @tc.desc Test logical OR with mixed conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const flag: boolean = false;
      const value: number = 5;
      const result: boolean = flag || value < 3 || value > 4;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0761
     * @tc.name ExpressionTest0761
     * @tc.desc Test compound assignment with modulus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0761', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 100;
      const divisor: number = 13;
      value %= divisor;
      value += 5;
      value %= divisor;
      expect(value).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0762
     * @tc.name ExpressionTest0762
     * @tc.desc Test string template with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0762', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 0b1010;
      const b: number = 0b0110;
      const result: string = `${a} & ${b} = ${a & b}, ${a} | ${b} = ${a | b}, ${a} ^ ${b} = ${a ^ b}`;
      expect(result).assertEqual("10 & 6 = 2, 10 | 6 = 14, 10 ^ 6 = 12");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0763
     * @tc.name ExpressionTest0763
     * @tc.desc Test prefix decrement in arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0763', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 10;
      const result: number = --num * 2 + --num;
      expect(result).assertEqual(26);
      expect(num).assertEqual(8);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0764
     * @tc.name ExpressionTest0764
     * @tc.desc Test postfix increment in expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0764', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 3;
      const result: number = num++ * 5 + num++;
      expect(result).assertEqual(19);
      expect(num).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0765
     * @tc.name ExpressionTest0765
     * @tc.desc Test comma operator in for loop with multiple counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0765', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, j: number;
      for (i = 1, j = 10; i <= 5; i++, j -= 2) {
        result += i * j;
      }
      expect(result).assertEqual(1 * 10 + 2 * 8 + 3 * 6 + 4 * 4 + 5 * 2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0766
     * @tc.name ExpressionTest0766
     * @tc.desc Test string comparison with case transformation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0766', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Hello";
      const str2: string = "HELLO";
      const result: boolean = str1.toLowerCase() === str2.toLowerCase();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0767
     * @tc.name ExpressionTest0767
     * @tc.desc Test modulus with array indices in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0767', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
      let result: number = 0;
      for (let i = 0; i < arr.length; i++) {
        if (i % 3 === 0) {
          result += arr[i];
        }
      }
      expect(result).assertEqual(10 + 40 + 70 + 100);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0768
     * @tc.name ExpressionTest0768
     * @tc.desc Test nullish coalescing with boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0768', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const config: GeneratedTypeLiteralInterface_6 = { enabled: false };
      const defaultValue: boolean = true;
      const result: boolean = config.enabled ?? defaultValue;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0769
     * @tc.name ExpressionTest0769
     * @tc.desc Test bitwise operations with positive and negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0769', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = -7;
      const result: number = a & b;
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0770
     * @tc.name ExpressionTest0770
     * @tc.desc Test array index with arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: string[] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"];
      let index: int = 2;
      index = index * 2 + 1;
      const result: string = arr[index];
      expect(result).assertEqual("f");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0773
     * @tc.name ExpressionTest0773
     * @tc.desc Test comparison with right shift results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0773', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 64;
      const b: number = 3;
      const result: boolean = (a >> b) === 8;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0774
     * @tc.name ExpressionTest0774
     * @tc.desc Test string concatenation with modulus operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0774', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dividend: number = 25;
      const divisor: number = 7;
      const result: string = dividend + " divided by " + divisor +
        " is " + Math.floor(dividend / divisor) +
        " with remainder " + (dividend % divisor);
      expect(result).assertEqual("25 divided by 7 is 3 with remainder 4");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0775
     * @tc.name ExpressionTest0775
     * @tc.desc Test operator precedence with mixed operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0775', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const c: number = 2;
      const result1: number = a % b + c;
      const result2: number = a % (b + c);
      expect(result1).assertEqual(1 + 2);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0776
     * @tc.name ExpressionTest0776
     * @tc.desc Test grouped expressions in template with array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0776', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [5, 8, 3, 12, 6];
      const index1: int = 1;
      const index2: int = 3;
      const result: string = `arr[${index1}] + arr[${index2}] = ${arr[index1] + arr[index2]}, ` +
        `arr[${index1}] * arr[${index2}] = ${arr[index1] * arr[index2]}`;
      expect(result).assertEqual("arr[1] + arr[3] = 20, arr[1] * arr[3] = 96");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0777
     * @tc.name ExpressionTest0777
     * @tc.desc Test array method with arithmetic parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0777', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: int[] = [10, 20, 30, 40, 50, 60, 70, 80];
      const start: int = 2;
      const count: int = 2;
      const result: int[] = arr.slice(start, start + count * 2);
      expect(result).assertDeepEquals([30, 40, 50, 60]);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0778
     * @tc.name ExpressionTest0778
     * @tc.desc Test unary plus with arithmetic in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0778', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "15";
      const str2: string = "7";
      const result: string = `+${str1} + +${str2} = ${+Number(str1) + +Number(str2)}`;
      expect(result).assertEqual("+15 + +7 = 22");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0779
     * @tc.name ExpressionTest0779
     * @tc.desc Test comparison with bitwise complement results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0779', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 5;
      const result: boolean = ~a < ~b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0780
     * @tc.name ExpressionTest0780
     * @tc.desc Test compound assignment with division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 100;
      num /= 4;
      num += 5;
      num /= 3;
      expect(num).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0781
     * @tc.name ExpressionTest0781
     * @tc.desc Test array manipulation with loop conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0781', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result: number[] = [];
      for (let i = 0; i < arr.length; i++) {
        if (arr[i] % 2 === 0 && arr[i] > 5) {
          result.push(arr[i]);
        }
      }
      const target:number[] = [6, 8, 10]
      expect(result).assertDeepEquals(target);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0782
     * @tc.name ExpressionTest0782
     * @tc.desc Test modulus with multiple conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0782', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 37;
      const result: boolean = num % 3 === 1 && num % 4 === 1 && num % 5 === 2;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0783
     * @tc.name ExpressionTest0783
     * @tc.desc Test string concatenation with array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0783', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fruits: string[] = ["apple", "banana", "cherry"];
      const index: int = 1;
      const result: string = "I like " + fruits[index] + "s, they have " + fruits[index].length + " letters";
      expect(result).assertEqual("I like bananas, they have 6 letters");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0784
     * @tc.name ExpressionTest0784
     * @tc.desc Test comparison with exponentiation results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0784', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 3;
      const exp: number = 4;
      const result: boolean = base**exp === 81;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0785
     * @tc.name ExpressionTest0785
     * @tc.desc Test template string with array expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0785', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numbers: number[] = [4, 7, 2, 9, 5];
      const result: string = `Max: ${Math.max(...numbers)}, Sum: ${numbers[0] + numbers[1] + numbers[2]}`;
      expect(result).assertEqual("Max: 9, Sum: 13");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0786
     * @tc.name ExpressionTest0786
     * @tc.desc Test array length with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0786', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result: number = arr.length << 1;
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0787
     * @tc.name ExpressionTest0787
     * @tc.desc Test array index with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0787', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: string[] = ["zero", "one", "two", "three", "four", "five", "six", "seven"];
      const a: int = 5;
      const b: int = 2;
      const result: string = arr[a ^ b];
      expect(result).assertEqual("seven");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0788
     * @tc.name ExpressionTest0788
     * @tc.desc Test template string with array manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0788', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [10, 20, 30, 40, 50];
      const index: int = 2;
      const result: string = `values[${index}] = ${values[index]}, values[${index}] * 2 = ${values[index] * 2}`;
      expect(result).assertEqual("values[2] = 30, values[2] * 2 = 60");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0789
     * @tc.name ExpressionTest0789
     * @tc.desc Test comparison with array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0789', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const threshold: number = 4;
      const result: boolean = arr.length > threshold;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0790
     * @tc.name ExpressionTest0790
     * @tc.desc Test array concatenation with conditional results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numbers: number[] = [1, 2, 3, 4, 5];
      const filter: number = 3;
      let result: string = "Numbers ";
      result += numbers.filter(n => n > filter).join(", ") + " are greater than " + filter;
      expect(result).assertEqual("Numbers 4, 5 are greater than 3");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0791
     * @tc.name ExpressionTest0791
     * @tc.desc Test range check with arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0791', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 17;
      const min: number = 10;
      const max: number = 20;
      const result: boolean = value >= min && value <= max;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0792
     * @tc.name ExpressionTest0792
     * @tc.desc Test array length with arithmetic and bitwise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0792', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
      const result: number = (arr.length * 2) & 0x0F;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0794
     * @tc.name ExpressionTest0794
     * @tc.desc Test comma operator in for loop with array manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0794', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: int[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result: int[] = [];
      let i: int, multiplier: int;
      for (i = 0, multiplier = 1; i < arr.length; i += 2, multiplier *= 2) {
        result.push(arr[i] * multiplier);
      }
      expect(result).assertDeepEquals([1 * 1, 3 * 2, 5 * 4, 7 * 8, 9 * 16]);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0795
     * @tc.name ExpressionTest0795
     * @tc.desc Test string comparison with array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0795', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const words: string[] = ["apple", "banana", "cherry", "date"];
      const target: string = "cherry";
      let result: boolean = false;
      for (let i = 0; i < words.length; i++) {
        if (words[i] === target) {
          result = true;
          break;
        }
      }
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0796
     * @tc.name ExpressionTest0796
     * @tc.desc Test unary operators with array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0796', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [5, 3, 8, 2];
      let num: number = arr[0];
      const result: number = ~num + (-arr[1]) * arr[2];
      expect(result).assertEqual(-30);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0797
     * @tc.name ExpressionTest0797
     * @tc.desc Test bitwise operations with array values in conditional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0797', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const flags: number[] = [0b1010, 0b0110, 0b1100];
      const mask: number = 0b1000;
      let result: number = 0;
      for (let i = 0; i < flags.length; i++) {
        if ((flags[i] & mask) !== 0) {
          result++;
        }
      }
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0798
     * @tc.name ExpressionTest0798
     * @tc.desc Test array manipulation with increment in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0798', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      let count: number = 1;
      while (count <= 5) {
        arr.push(count * 3);
        count++;
      }
      const target:number[] = [3, 6, 9, 12, 15];
      expect(arr).assertDeepEquals(target);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0799
     * @tc.name ExpressionTest0799
     * @tc.desc Test comparison with array value transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0799', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number[] = [12, 5];
      const b: number[] = [3, 8];
      const result: boolean = (a[0] / a[1]) > (b[0] * b[1]);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0800
     * @tc.name ExpressionTest0800
     * @tc.desc Test comma operator in for loop with array filtering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: int[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
      const result: int[] = [];
      let i: int, threshold: int;
      for (i = 0, threshold = 4; i < arr.length; i++, threshold = 4) {
        if (arr[i] > threshold) {
          result.push(arr[i]);
        }
      }
      expect(result).assertDeepEquals([5, 6, 7, 8, 9, 10, 11, 12]);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0801
     * @tc.name ExpressionTest0801
     * @tc.desc Test string concatenation with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const person: GeneratedTypeLiteralInterface_8 = { name: "Alice", age: 30 };
      const result: string = person.name + " is " + person.age + " years old";
      expect(result).assertEqual("Alice is 30 years old");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0802
     * @tc.name ExpressionTest0802
     * @tc.desc Test unary plus with object properties in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const product: GeneratedTypeLiteralInterface_9 = { price: "19.99", quantity: "3" };
      const total: number = +Number(product.price) * +Number(product.quantity);
      expect(total).assertClose(59.97, 0.001);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0803
     * @tc.name ExpressionTest0803
     * @tc.desc Test comma operator in for loop with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const user: GeneratedTypeLiteralInterface_10 = { loginCount: 0, points: 100 };
      let result: string = "";
      let i: number, multiplier: number;
      for (i = 0, multiplier = 1; i < 5; i++, user.loginCount++, multiplier *= 2) {
        user.points += 5 * multiplier;
        result += `Login ${user.loginCount}: ${user.points}, `;
      }
      expect(result).assertEqual("Login 0: 105, Login 1: 115, Login 2: 135, Login 3: 175, Login 4: 255, ");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0804
     * @tc.name ExpressionTest0804
     * @tc.desc Test logical NOT with object property check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0804', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const config: GeneratedTypeLiteralInterface_11 = { debug: false };
      const result: boolean = !config.debug;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0805
     * @tc.name ExpressionTest0805
     * @tc.desc Test bitwise XOR with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0805', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const flags: GeneratedTypeLiteralInterface_12 = { a: 0b1010, b: 0b0111 };
      const result: number = flags.a ^ flags.b;
      expect(result).assertEqual(0b1101);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0806
     * @tc.name ExpressionTest0806
     * @tc.desc Test string template with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0806', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const book: GeneratedTypeLiteralInterface_13 = {
        title: "The Hobbit",
        pages: 310,
        author: "J.R.R. Tolkien"
      };
      const result: string = `${book.title} by ${book.author} has ${book.pages} pages`;
      expect(result).assertEqual("The Hobbit by J.R.R. Tolkien has 310 pages");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0807
     * @tc.name ExpressionTest0807
     * @tc.desc Test unary minus with object properties in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0807', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stats: GeneratedTypeLiteralInterface_14 = { wins: 15, losses: 5 };
      const result: number = -(stats.wins - stats.losses) / 2;
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0808
     * @tc.name ExpressionTest0808
     * @tc.desc Test object property access with arithmetic in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0808', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const data: GeneratedTypeLiteralInterface_15 = { values: [10, 20, 30, 40, 50] };
      let result: number = 0;
      for (let i = 0; i < data.values.length; i++) {
        result += data.values[i] * (i + 1);
      }
      expect(result).assertEqual(10 * 1 + 20 * 2 + 30 * 3 + 40 * 4 + 50 * 5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0809
     * @tc.name ExpressionTest0809
     * @tc.desc Test logical AND with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0809', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const account: GeneratedTypeLiteralInterface_16 = {
        balance: 500,
        isActive: true,
        type: "premium"
      };
      const result: boolean = account.isActive && account.balance > 100 && account.type === "premium";
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0810
     * @tc.name ExpressionTest0810
     * @tc.desc Test logical OR with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const user: GeneratedTypeLiteralInterface_17 = {
        isAdmin: false,
        hasPermission: false,
        role: "editor"
      };
      const result: boolean = user.isAdmin || user.hasPermission || user.role === "editor";
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0811
     * @tc.name ExpressionTest0811
     * @tc.desc Test compound assignment with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0811', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const car: GeneratedTypeLiteralInterface_18 = { speed: 50 };
      car.speed += 20;
      car.speed *= 1.1;
      car.speed -= 5;
      expect(car.speed).assertEqual(72);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0812
     * @tc.name ExpressionTest0812
     * @tc.desc Test string template with object methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0812', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const calculator: GeneratedTypeLiteralInterface_19 = {
        add: (a:int, b:int) => a + b,
        multiply: (a:int, b:int) => a * b
      };
      const a: int = 5;
      const b: int = 3;
      const result: string = `${a} + ${b} = ${calculator.add(a, b)}, ${a} * ${b} = ${calculator.multiply(a, b)}`;
      expect(result).assertEqual("5 + 3 = 8, 5 * 3 = 15");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0813
     * @tc.name ExpressionTest0813
     * @tc.desc Test prefix increment with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0813', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const counter: GeneratedTypeLiteralInterface_20 = { value: 4 };
      const result: number = ++counter.value * 2 + ++counter.value;
      expect(result).assertEqual(16);
      expect(counter.value).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0814
     * @tc.name ExpressionTest0814
     * @tc.desc Test postfix decrement with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0814', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stock: GeneratedTypeLiteralInterface_21 = { quantity: 10 };
      const result: number = stock.quantity-- * 2 + stock.quantity--;
      expect(result).assertEqual(29);
      expect(stock.quantity).assertEqual(8);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0815
     * @tc.name ExpressionTest0815
     * @tc.desc Test comma operator in for loop with object updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0815', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stats: GeneratedTypeLiteralInterface_22 = { score: 0, level: 1 };
      let i: number, multiplier: number;
      for (i = 0, multiplier = 10; i < 5; i++, stats.level++, multiplier += 5) {
        stats.score += stats.level * multiplier;
      }
      expect(stats.score).assertEqual(1 * 10 + 2 * 15 + 3 * 20 + 4 * 25 + 5 * 30);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0816
     * @tc.name ExpressionTest0816
     * @tc.desc Test object property comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0816', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const productA: GeneratedTypeLiteralInterface_23 = { price: 19.99 };
      const productB: GeneratedTypeLiteralInterface_24 = { price: 24.99 };
      const result: boolean = productA.price < productB.price;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0817
     * @tc.name ExpressionTest0817
     * @tc.desc Test modulus with object properties in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0817', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const timer: GeneratedTypeLiteralInterface_25 = { seconds: 0, interval: 3 };
      let result: string = "";
      while (timer.seconds < 15) {
        timer.seconds++;
        if (timer.seconds % timer.interval === 0) {
          result += timer.seconds + " ";
        }
      }
      expect(result).assertEqual("3 6 9 12 15 ");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0818
     * @tc.name ExpressionTest0818
     * @tc.desc Test nullish coalescing with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0818', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const settings: GeneratedTypeLiteralInterface_26 = {};
      const defaultTheme: string = "light";
      const result: string = settings.theme ?? defaultTheme;
      expect(result).assertEqual("light");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0819
     * @tc.name ExpressionTest0819
     * @tc.desc Test bitwise operations with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0819', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const permissions: GeneratedTypeLiteralInterface_27 = { user: 0b0011, admin: 0b1100 };
      const result: number = permissions.user | permissions.admin;
      expect(result).assertEqual(0b1111);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0820
     * @tc.name ExpressionTest0820
     * @tc.desc Test object property access with arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const data: GeneratedTypeLiteralInterface_28 = { values: [10, 20, 30, 40, 50], offset: 1 };
      const index: int = 2;
      const result: int = data.values[index + data.offset];
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0823
     * @tc.name ExpressionTest0823
     * @tc.desc Test comparison with object properties and bitwise shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0823', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const metrics: GeneratedTypeLiteralInterface_33 = { value: 16, shift: 3 };
      const result: boolean = (metrics.value >> metrics.shift) === 2;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0824
     * @tc.name ExpressionTest0824
     * @tc.desc Test string concatenation with object properties and exponentiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0824', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const math: GeneratedTypeLiteralInterface_30 = { base: 2, exponent: 10 };
      const result: string = math.base + " to the power of " + math.exponent + " is " + (math.base**math.exponent);
      expect(result).assertEqual("2 to the power of 10 is 1024");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0825
     * @tc.name ExpressionTest0825
     * @tc.desc Test operator precedence with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0825', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const calc: GeneratedTypeLiteralInterface_31 = { a: 20, b: 4, c: 2 };
      const result1: number = calc.a / calc.b + calc.c;
      const result2: number = calc.a / (calc.b + calc.c);
      expect(result1).assertEqual(5 + 2);
      expect(result2).assertEqual(3.3333333333333335);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0826
     * @tc.name ExpressionTest0826
     * @tc.desc Test grouped expressions in template with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0826', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GeneratedTypeLiteralInterface_32 = { x: 6, y: 4 };
      const result: string =
        `${obj.x} + ${obj.y} * 2 = ${obj.x + obj.y * 2}, (${obj.x} + ${obj.y}) * 2 = ${(obj.x + obj.y) * 2}`;
      expect(result).assertEqual("6 + 4 * 2 = 14, (6 + 4) * 2 = 20");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0827
     * @tc.name ExpressionTest0827
     * @tc.desc Test object method with arithmetic parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0827', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const converter: GeneratedTypeLiteralInterface_34 = {
        toCelsius: (f:number) => (f - 32) * 5 / 9
      };
      const fahrenheit: number = 98.6;
      const result: number = converter.toCelsius(fahrenheit);
      expect(result).assertClose(37, 0.1);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0828
     * @tc.name ExpressionTest0828
     * @tc.desc Test unary minus with object properties in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0828', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: GeneratedTypeLiteralInterface_35 = { a: 15, b: 7 };
      const result: string = `-${values.a} + ${values.b} = ${-values.a + values.b}`;
      expect(result).assertEqual("-15 + 7 = -8");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0829
     * @tc.name ExpressionTest0829
     * @tc.desc Test comparison with unary operators on object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0829', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums: GeneratedTypeLiteralInterface_36 = { a: 8, b: 5 };
      const result: boolean = ~nums.a < -nums.b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0830
     * @tc.name ExpressionTest0830
     * @tc.desc Test compound assignment with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const game: GeneratedTypeLiteralInterface_40 = { score: 50 };
      game.score += 25;
      game.score *= 2;
      game.score -= 30;
      expect(game.score).assertEqual(120);
    });

  })
}