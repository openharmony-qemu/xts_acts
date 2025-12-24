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

export default function expressionTest6() {
  describe('ExpressionTest6', () => {
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
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0906
     * @tc.name ExpressionTest0906
     * @tc.desc Test array length with multiplication in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0906', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [1, 2, 3, 4, 5];
      let numVar: int = 1;
      let result: int = 0;
      while (numVar <= numArray.length * 0.6) {
        result += numArray[numVar];
        numVar++;
      }
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0907
     * @tc.name ExpressionTest0907
     * @tc.desc Test logical AND with array value conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0907', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [14, 6, 22, 8, 28];
      let numVar: int = 0;
      for (let i: int = 0; i < numArray.length; i++) {
        if (numArray[i] > 10 && numArray[i] % 7 === 0) {
          numVar += numArray[i];
        }
      }
      expect(numVar).assertEqual(14 + 28);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0908
     * @tc.name ExpressionTest0908
     * @tc.desc Test logical OR with array value checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0908', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [4, 15, 7, 21, 3];
      let boolVar: boolean = false;
      for (let i: int = 0; i < numArray.length; i++) {
        boolVar = boolVar || numArray[i] < 5 || numArray[i] === 21;
      }
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0909
     * @tc.name ExpressionTest0909
     * @tc.desc Test compound assignment with modulus and addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0909', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 50;
      numVar %= 13;
      numVar += 7;
      numVar %= 5;
      numVar *= 4;
      expect(numVar).assertEqual(12);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0910
     * @tc.name ExpressionTest0910
     * @tc.desc Test string template with bitwise operations on array indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [0, 1, 2, 3, 4, 5, 6, 7];
      let i: int = 5;
      let j: int = 2;
      let strVar: string = `${i} & ${j} = ${i & j}, arr[${i & j}] = ${numArray[i & j]}`;
      expect(strVar).assertEqual("5 & 2 = 0, arr[0] = 0");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0911
     * @tc.name ExpressionTest0911
     * @tc.desc Test prefix decrement with array index and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0911', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [100, 200, 300, 400, 500];
      let numVar: int = 4;
      let result: int = numArray[--numVar] - --numVar;
      expect(result).assertEqual(398);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0912
     * @tc.name ExpressionTest0912
     * @tc.desc Test postfix increment with array index calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0912', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [5, 10, 15, 20, 25];
      let numVar: int = 1;
      let result: int = numArray[numVar++] + numArray[numVar++];
      expect(result).assertEqual(25);
      expect(numVar).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0913
     * @tc.name ExpressionTest0913
     * @tc.desc Test comma operator in for loop with dual array indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0913', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [2, 4, 6, 8, 10];
      let otherArray: int[] = [1, 3, 5, 7, 9];
      let numVar: int = 0;
      let i: int, j: int;
      for (i = 0, j = otherArray.length - 1; i < numArray.length; i++, j--) {
        numVar += numArray[i] * otherArray[j];
      }
      expect(numVar).assertEqual(2 * 9 + 4 * 7 + 6 * 5 + 8 * 3 + 10 * 1);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0914
     * @tc.name ExpressionTest0914
     * @tc.desc Test string comparison with array values and transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0914', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["Hello", "WORLD", "hello", "world"];
      let strVar: string = "hello";
      let numVar: int = 0;
      for (let i: int = 0; i < strArray.length; i++) {
        if (strArray[i].toLowerCase() === strVar) {
          numVar++;
        }
      }
      expect(numVar).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0915
     * @tc.name ExpressionTest0915
     * @tc.desc Test modulus with array indices in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0915', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
      let results: number[] = [];
      for (let i: number = 0; i < numArray.length; i++) {
        results.push(i % 3);
      }
      const target: number[] = [0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2];
      expect(results).assertDeepEquals(target);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0917
     * @tc.name ExpressionTest0917
     * @tc.desc Test bitwise operations with positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0917', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [18, -7, 12, -5];
      let results: int[] = [];
      for (let i: int = 0; i < numArray.length; i += 2) {
        results.push(numArray[i] | numArray[i + 1]);
      }
      expect(results).assertDeepEquals([18 | -7, 12 | -5]);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0918
     * @tc.name ExpressionTest0918
     * @tc.desc Test array index calculation with complex arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0918', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"];
      let numVar: int = 5;
      let index: int = (numVar * 2) - (numVar / 2);
      let strVar: string = strArray[index];
      expect(strVar).assertEqual("i");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0920
     * @tc.name ExpressionTest0920
     * @tc.desc Test array index with left shift operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
      let numVar: int = 3;
      let result: int = numArray[numVar << 1];
      expect(result).assertEqual(70);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0921
     * @tc.name ExpressionTest0921
     * @tc.desc Test string concatenation with multiple modulus operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0921', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [37, 10, 5, 3];
      let strVar: string = numArray[0] + " mod " + numArray[1] + " = " + (numArray[0] % numArray[1]) +
        ", then mod " + numArray[2] + " = " + ((numArray[0] % numArray[1]) % numArray[2]) +
        ", then mod " + numArray[3] + " = " + (((numArray[0] % numArray[1]) % numArray[2]) % numArray[3]);
      expect(strVar).assertEqual("37 mod 10 = 7, then mod 5 = 2, then mod 3 = 2");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0922
     * @tc.name ExpressionTest0922
     * @tc.desc Test operator precedence with array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0922', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [20, 5, 3];
      let result1: number = numArray[0] / numArray[1] + numArray[2];
      let result2: number = numArray[0] / (numArray[1] + numArray[2]);
      expect(result1).assertEqual(4 + 3);
      expect(result2).assertEqual(20.0 / 8);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0923
     * @tc.name ExpressionTest0923
     * @tc.desc Test grouped expressions in template with array calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0923', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [12, 4, 6, 2];
      let i: int = 0;
      let j: int = 2;
      let strVar: string = `${numArray[i]} / ${numArray[1]} = ${numArray[i] /
      numArray[1]}, (${numArray[i]} + ${numArray[j]}) / ${numArray[3]} = ${(numArray[i] + numArray[j]) / numArray[3]}`;
      expect(strVar).assertEqual("12 / 4 = 3, (12 + 6) / 2 = 9");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0924
     * @tc.name ExpressionTest0924
     * @tc.desc Test array method with calculated parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0924', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
      let numVar: int = 2;
      let start: int = numVar;
      let end: int = numArray.length - numVar;
      let subArray: int[] = numArray.slice(start, end);
      numVar = 0;
      for (let i: int = 0; i < subArray.length; i++) {
        numVar += subArray[i];
      }
      expect(numVar).assertEqual(30 + 40 + 50 + 60 + 70 + 80);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0925
     * @tc.name ExpressionTest0925
     * @tc.desc Test unary minus with string array values in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0925', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["18", "7"];
      let strVar: string = `-${strArray[0]} + ${strArray[1]} = ${-+Number(strArray[0]) + +Number(strArray[1])}`;
      expect(strVar).assertEqual("-18 + 7 = -11");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0926
     * @tc.name ExpressionTest0926
     * @tc.desc Test comparison with bitwise complement results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0926', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [6, 3];
      let boolVar: boolean = ~numArray[0] < ~numArray[1];
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0927
     * @tc.name ExpressionTest0927
     * @tc.desc Test compound assignment with division and subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0927', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 180;
      numVar /= 3; // 60
      numVar -= 15; // 45
      numVar /= 5; // 9
      numVar *= 2; // 18
      expect(numVar).assertEqual(18);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0928
     * @tc.name ExpressionTest0928
     * @tc.desc Test array manipulation with complex conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0928', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [3, 6, 9, 12, 15, 18, 21, 24, 27, 30];
      let filtered: int[] = [];
      for (let i: int = 0; i < numArray.length; i++) {
        if (numArray[i] > 10 && (numArray[i] % 4 === 0 || numArray[i] % 7 === 0)) {
          filtered.push(numArray[i]);
        }
      }
      expect(filtered).assertDeepEquals([12, 21, 24]);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0929
     * @tc.name ExpressionTest0929
     * @tc.desc Test modulus with multiple conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0929', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [41, 53, 67, 79];
      let numVar: int = 0;
      for (let i: int = 0; i < numArray.length; i++) {
        if (numArray[i] % 6 === 5 && numArray[i] % 5 === 4) {
          numVar = numArray[i];
          break;
        }
      }
      expect(numVar).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0930
     * @tc.name ExpressionTest0930
     * @tc.desc Test string concatenation with array values and math operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["Monday", "Tuesday", "Wednesday", "Thursday"];
      let numVar: int = 2;
      let strVar: string = strArray[numVar] + " has " + strArray[numVar].length + " letters, " +
        "next day: " + strArray[numVar + 1] + " (" + strArray[numVar + 1].length + " letters)";
      expect(strVar).assertEqual("Wednesday has 9 letters, next day: Thursday (8 letters)");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0931
     * @tc.name ExpressionTest0931
     * @tc.desc Test comparison with exponentiation results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0931', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [4, 3, 64];
      let boolVar: boolean = numArray[0]**numArray[1] === numArray[2];
      // 4^3 = 64
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0932
     * @tc.name ExpressionTest0932
     * @tc.desc Test template string with array expressions and calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0932', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [2.5, 3.5, 4.5, 5.5];
      let strVar: string = `Sum: ${numArray[0] + numArray[1] + numArray[2] + numArray[3]}, ` +
        `Average: ${(numArray[0] + numArray[1] + numArray[2] + numArray[3]) / numArray.length}`;
      expect(strVar).assertEqual("Sum: 16, Average: 4");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0933
     * @tc.name ExpressionTest0933
     * @tc.desc Test array length with bitwise operations in calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0933', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [1, 2, 3, 4];
      let numVar: number = numArray.length << 2;
      // 4 << 2 = 16
      expect(numVar).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0934
     * @tc.name ExpressionTest0934
     * @tc.desc Test array index calculation with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0934', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["zero", "one", "two", "three", "four", "five", "six", "seven"];
      let numVar: int = 7 & 3;
      let strVar: string = strArray[numVar];
      expect(strVar).assertEqual("three");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0935
     * @tc.name ExpressionTest0935
     * @tc.desc Test template string with array manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0935', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [6, 12, 18, 24, 30];
      let numVar: int = 3;
      let strVar: string =
        `arr[${numVar}] = ${numArray[numVar]}, arr[${numVar}] / ${numVar} = ${numArray[numVar] / numVar}`;
      expect(strVar).assertEqual("arr[3] = 24, arr[3] / 3 = 8");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0936
     * @tc.name ExpressionTest0936
     * @tc.desc Test comparison with array length and calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0936', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [5, 10, 15, 20, 25];
      let numVar: number = 3;
      let boolVar: boolean = numArray.length === numVar + 2;
      // 5 === 3 + 2 → true
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0937
     * @tc.name ExpressionTest0937
     * @tc.desc Test array concatenation with conditional results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0937', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [8, 16, 24, 32, 40, 48];
      let numVar: int = 20;
      let strVar: string = "Numbers >= " + numVar + " and even: ";
      let first: boolean = true;
      for (let i: int = 0; i < numArray.length; i++) {
        if (numArray[i] >= numVar && numArray[i] % 2 === 0) {
          strVar += (first ? "" : ", ") + numArray[i];
          first = false;
        }
      }
      expect(strVar).assertEqual("Numbers >= 20 and even: 24, 32, 40, 48");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0938
     * @tc.name ExpressionTest0938
     * @tc.desc Test range check with arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0938', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [15, 25, 35, 45, 55];
      let numVar: int = 0;
      let min: int = 20;
      let max: int = 50;
      for (let i: int = 0; i < numArray.length; i++) {
        if (numArray[i] > min && numArray[i] < max) {
          numVar += numArray[i];
        }
      }
      expect(numVar).assertEqual(25 + 35 + 45);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0939
     * @tc.name ExpressionTest0939
     * @tc.desc Test array length with arithmetic and bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0939', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [1, 2, 3, 4, 5];
      let numVar: number = (numArray.length * 2) ^ 0x0F;
      expect(numVar).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0940
     * @tc.name ExpressionTest0940
     * @tc.desc Test nested ternary with array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [45, 55, 65, 75, 85, 95];
      let strVar: string = "";
      for (let i: int = 0; i < numArray.length; i++) {
        strVar += numArray[i] >= 90 ? "Excellent " :
          numArray[i] >= 70 ? "Good " :
            numArray[i] >= 50 ? "Average " : "Poor ";
      }
      expect(strVar).assertEqual("Poor Average Average Good Good Excellent ");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0941
     * @tc.name ExpressionTest0941
     * @tc.desc Test comma operator in for loop with array transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0941', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [2, 4, 6, 8, 10];
      let transformed: int[] = [];
      let i: int, factor: int;
      for (i = 0, factor = 3; i < numArray.length; i++, factor -= 1) {
        transformed.push(numArray[i] * factor);
      }
      expect(transformed).assertDeepEquals([2 * 3, 4 * 2, 6 * 1, 8 * 0, 10 * (-1)]);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0942
     * @tc.name ExpressionTest0942
     * @tc.desc Test string comparison with array values and lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0942', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["apple", "apples", "apricot", "application"];
      let strVar: string = "apple";
      let numVar: int = 0;
      for (let i: int = 0; i < strArray.length; i++) {
        if (strArray[i].startsWith(strVar) && strArray[i].length > strVar.length) {
          numVar++;
        }
      }
      expect(numVar).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0943
     * @tc.name ExpressionTest0943
     * @tc.desc Test unary operators with array values in calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0943', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [8, 3, 5, 2];
      let numVar: number = ~numArray[0] + (-numArray[1]) * numArray[2] + ~numArray[3];
      // -9 + (-3)*5 + (-3) = -9 - 15 - 3 = -27
      expect(numVar).assertEqual(-27);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0944
     * @tc.name ExpressionTest0944
     * @tc.desc Test bitwise operations with array values in conditional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0944', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [0b1101, 0b1011, 0b0111, 0b1110];
      let mask: int = 0b1001;
      let numVar: int = 0;
      for (let i: int = 0; i < numArray.length; i++) {
        if ((numArray[i] & mask) === mask) {
          numVar++;
        }
      }
      // Only 0b1101 & 0b1001 = 0b1001
      expect(numVar).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0945
     * @tc.name ExpressionTest0945
     * @tc.desc Test array manipulation with increment in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0945', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [];
      let numVar: number = 2;
      for (let i: number = 0; i < 5; i++) {
        numArray.push(numVar);
        numVar *= 2;
      }
      const target: number[] = [2, 4, 8, 16, 32];
      expect(numArray).assertDeepEquals(target);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0946
     * @tc.name ExpressionTest0946
     * @tc.desc Test comparison with transformed array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0946', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [24, 4, 8, 12];
      let boolVar: boolean = (numArray[0] / numArray[1]) >= (numArray[2] + numArray[3]);
      // 6 >= 20 is false
      expect(boolVar).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0947
     * @tc.name ExpressionTest0947
     * @tc.desc Test comma operator in for loop with filtered array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0947', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [5, 10, 15, 20, 25, 30, 35, 40];
      let filtered: int[] = [];
      let i: int, threshold: int;
      for (i = 0, threshold = 10; i < numArray.length; i++, threshold += 5) {
        if (numArray[i] > 10 && i !== 1 && i !== 3 && i !== 5) {
          filtered.push(numArray[i]);
        }
      }
      expect(filtered).assertDeepEquals([15, 25, 35, 40]);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0948
     * @tc.name ExpressionTest0948
     * @tc.desc Test string concatenation with array index arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0948', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["Q1", "Q2", "Q3", "Q4", "Q1", "Q2"];
      let numVar: int = 3;
      let strVar: string = strArray[numVar] + " + 2 quarters = " + strArray[(numVar + 2) % strArray.length];
      expect(strVar).assertEqual("Q4 + 2 quarters = Q2");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0949
     * @tc.name ExpressionTest0949
     * @tc.desc Test unary plus with array string values in calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0949', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["9.5", "2.5", "3"];
      let numVar: number = +Number(strArray[0]) / +Number(strArray[1]) - +Number(strArray[2]);
      expect(numVar).assertClose(9.5 / 2.5 - 3, 0.001);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0950
     * @tc.name ExpressionTest0950
     * @tc.desc Test comma operator in for loop with array index and value manipulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: int[] = [5, 10, 15, 20, 25];
      let numVar: number = 0;
      let i: int;
      let multiplier: number;
      for (i = 0, multiplier = 1; i < numArray.length; i++, multiplier += 0.5) {
        numVar += numArray[i] * multiplier;
      }
      expect(numVar).assertClose(5 * 1 + 10 * 1.5 + 15 * 2 + 20 * 2.5 + 25 * 3, 0.001);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0951
     * @tc.name ExpressionTest0951
     * @tc.desc Test exponentiation with negative base and even exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0951', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = -3;
      let exponent: number = 4;
      let result: number = base**exponent;
      expect(result).assertEqual(81);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0952
     * @tc.name ExpressionTest0952
     * @tc.desc Test bitwise operations with left shift and addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0952', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num1: number = 5; // 101
      let num2: number = 2;
      let result: number = (num1 << num2) + 3; // 10100 + 11 = 10111 (23)
      expect(result).assertEqual(23);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0954
     * @tc.name ExpressionTest0954
     * @tc.desc Test remainder operator with negative dividend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0954', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dividend: number = -17;
      let divisor: number = 5;
      let result: number = dividend % divisor;
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0955
     * @tc.name ExpressionTest0955
     * @tc.desc Test template string with string methods and calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0955', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "TypeScript";
      let len: number = str.length;
      let strVar: string = `${str.substring(4)} has ${len - 4} letters (original: ${len})`;
      expect(strVar).assertEqual("Script has 6 letters (original: 10)");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0956
     * @tc.name ExpressionTest0956
     * @tc.desc Test prefix increment in array index calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0956', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: int[] = [10, 20, 30, 40, 50];
      let index: int = 2;
      let result: int = arr[++index] - arr[index--];
      expect(result).assertEqual(0);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0957
     * @tc.name ExpressionTest0957
     * @tc.desc Test array index with right shift operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0957', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: string[] = ["a", "b", "c", "d", "e", "f", "g", "h"];
      let num: int = 14;
      let result: string = arr[num >> 2];
      expect(result).assertEqual("d");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0958
     * @tc.name ExpressionTest0958
     * @tc.desc Test bitwise XOR with incrementing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0958', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 12; // 1100
      let y: number = 5; // 0101
      let result: number = x ^ y; // 1001 (9)
      y++; // 6 (0110)
      result += x ^ y; // 1100 ^ 0110 = 1010 (10) → total 19
      expect(result).assertEqual(19);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0959
     * @tc.name ExpressionTest0959
     * @tc.desc Test compound assignment with bitwise AND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0959', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 25; // 11001
      num &= 15; // 11001 & 01111 = 01001 (9)
      num &= 10; // 01001 & 01010 = 01000 (8)
      expect(num).assertEqual(8);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0960
     * @tc.name ExpressionTest0960
     * @tc.desc Test string concatenation with number operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 18;
      let b: number = 7;
      let str: string = a + " divided by " + b + " is " + Math.floor(a / b) +
        " with remainder " + (a % b);
      expect(str).assertEqual("18 divided by 7 is 2 with remainder 4");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0961
     * @tc.name ExpressionTest0961
     * @tc.desc Test nullish coalescing with different falsy values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0961', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let val1: number | null = 0;
      let val2: number | null = null;
      let val3: number | undefined = undefined;
      let val4: number | null = 10;

      let result: number = (val1 ?? 5) + (val2 ?? 5) + (val3 ?? 5) + (val4 ?? 5);
      expect(result).assertEqual(0 + 5 + 5 + 10);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0962
     * @tc.name ExpressionTest0962
     * @tc.desc Test logical OR with string checks in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0962', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let words: string[] = ["apple", "Banana", "cherry", "Date", "elderberry"];
      let count: int = 0;
      for (let i: int = 0; i < words.length; i++) {
        if (words[i].length > 6 || words[i][0] === words[i][0].toUpperCase()) {
          count++;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0963
     * @tc.name ExpressionTest0963
     * @tc.desc Test exponentiation with compound assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0963', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 2;
      num **= 3; // 8
      num **= 2; // 64
      expect(num).assertEqual(64);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0964
     * @tc.name ExpressionTest0964
     * @tc.desc Test postfix decrement in calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0964', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 10;
      let y: number = 5;
      let result: number = x-- + --y;
      // Uses x=10, then x becomes 9; uses y=4 (after decrement)
      expect(result).assertEqual(14);
      expect(x).assertEqual(9);
      expect(y).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0965
     * @tc.name ExpressionTest0965
     * @tc.desc Test template string with boolean expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0965', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 15;
      let b: number = 25;
      let str: string = `${a} > ${b}: ${a > b}, ${a} * 2 <= ${b}: ${a * 2 <= b}`;
      expect(str).assertEqual("15 > 25: false, 15 * 2 <= 25: false");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0966
     * @tc.name ExpressionTest0966
     * @tc.desc Test comma operator in conditional expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0966', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 5;
      let y: number = 10;
      let result: number;
      if (x > 3) {
        x++;
        y *= 2;
        result = x + y;
      } else {
        result = 0;
      }
      // x becomes 6, y becomes 20, result is 6 + 20 = 26
      expect(result).assertEqual(26);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0967
     * @tc.name ExpressionTest0967
     * @tc.desc Test bitwise NOT with arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0967', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 8;
      let result: number = ~num + 16 / 2;
      // -9 + 8 = -1
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0968
     * @tc.name ExpressionTest0968
     * @tc.desc Test string index with calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0968', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "Programming";
      let len: int = str.length;
      let mid: number = len / 2.0;
      let result: string = str[Math.floor(mid).toInt()] + str[Math.ceil(mid).toInt()];
      expect(result).assertEqual("am");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0969
     * @tc.name ExpressionTest0969
     * @tc.desc Test compound assignment with subtraction and multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0969', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 40;
      num -= 15; // 25
      num *= 3; // 75
      num -= 25; // 50
      expect(num).assertEqual(50);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0970
     * @tc.name ExpressionTest0970
     * @tc.desc Test array manipulation with modulus in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [];
      let i: number = 1;
      while (i % 17 !== 0) {
        arr.push(i * 2);
        i++;
      }
      expect(arr.length).assertEqual(16);
      expect(arr[arr.length - 1]).assertEqual(32);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0971
     * @tc.name ExpressionTest0971
     * @tc.desc Test logical NOT with comparison results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0971', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 7;
      let b: number = 12;
      let c: number = 7;

      let result1: boolean = !(a > b);
      let result2: boolean = !(a === c);

      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0972
     * @tc.name ExpressionTest0972
     * @tc.desc Test bitwise OR with compound assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0972', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 0b1010; // 10
      num |= 0b0111; // 10 | 7 = 15 (1111)
      num |= 0b1100; // 15 | 12 = 15 (1111)
      expect(num).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0973
     * @tc.name ExpressionTest0973
     * @tc.desc Test string concatenation with ternary operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0973', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let temp: number = 28;
      let str: string = "The temperature is " + temp + "°C, which is " +
        (temp > 30 ? "hot" : temp > 20 ? "warm" : "cool");
      expect(str).assertEqual("The temperature is 28°C, which is warm");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0974
     * @tc.name ExpressionTest0974
     * @tc.desc Test operator precedence with multiple operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0974', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 2;

      let result1: number = a + b * c;
      let result2: number = (a + b) * c;
      let result3: number = a / b + c;

      expect(result1).assertEqual(11);
      expect(result2).assertEqual(16);
      expect(result3).assertClose(5.0 / 3 + 2, 0.001);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0975
     * @tc.name ExpressionTest0975
     * @tc.desc Test grouped expressions in calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0975', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 10;
      let y: number = 4;

      let result: number = (x + y) * (x - y) / (y * 2);
      // (14) * (6) / 8 = 84 / 8 = 10.5
      expect(result).assertEqual(10.5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0976
     * @tc.name ExpressionTest0976
     * @tc.desc Test array method with calculated parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0976', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: string[] = ["a", "b", "c", "d", "e", "f", "g"];
      let start: int = 2;
      let count: int = 3;
      let subArr: string[] = arr.slice(start, start + count);
      expect(subArr).assertDeepEquals(["c", "d", "e"]);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0977
     * @tc.name ExpressionTest0977
     * @tc.desc Test unary minus with calculations in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0977', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 12;
      let b: number = 5;
      let str: string = `-${a} + ${b} = ${-a + b}, ${a} - ${b} * 2 = ${a - b * 2}`;
      expect(str).assertEqual("-12 + 5 = -7, 12 - 5 * 2 = 2");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0978
     * @tc.name ExpressionTest0978
     * @tc.desc Test comparison with bitwise complement results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0978', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 10;
      let y: number = 3;
      let result: boolean = ~x > ~y;
      // -11 > -4 is false
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0979
     * @tc.name ExpressionTest0979
     * @tc.desc Test compound assignment with division and addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0979', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 100;
      num /= 4; // 25
      num += 15; // 40
      num /= 8; // 5
      num *= 3; // 15
      expect(num).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0980
     * @tc.name ExpressionTest0980
     * @tc.desc Test array manipulation with complex conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: int[] = [14, 22, 28, 35, 42, 50, 63, 70];
      let filtered: int[] = [];
      for (let i: int = 0; i < arr.length; i++) {
        if ((arr[i] % 7 === 0 || arr[i] % 5 === 0) && arr[i] > 30) {
          filtered.push(arr[i]);
        }
      }
      expect(filtered).assertDeepEquals([35, 42, 50, 63, 70]);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0981
     * @tc.name ExpressionTest0981
     * @tc.desc Test modulus with multiple conditions on numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0981', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numbers: int[] = [31, 43, 59, 71, 83];
      let result: int = 0;
      for (let i: int = 0; i < numbers.length; i++) {
        if (numbers[i] % 4 === 3 && numbers[i] % 6 === 5) {
          result = numbers[i];
          break;
        }
      }
      expect(result).assertEqual(59);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0982
     * @tc.name ExpressionTest0982
     * @tc.desc Test string concatenation with length calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0982', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let words: string[] = ["Elephant", "Giraffe", "Hippopotamus", "Zebra"];
      let longest: string = "";
      for (let i: int = 0; i < words.length; i++) {
        if (words[i].length > longest.length) {
          longest = words[i];
        }
      }
      let str: string = "Longest word: " + longest + " (" + longest.length + " letters)";
      expect(str).assertEqual("Longest word: Hippopotamus (12 letters)");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0983
     * @tc.name ExpressionTest0983
     * @tc.desc Test comparison with exponentiation results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0983', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = 5;
      let exp1: number = 3;
      let exp2: number = 2;
      let result: boolean = base**exp1 > base**exp2 * base;
      // 125 > 25 * 5 → 125 > 125 → false
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0984
     * @tc.name ExpressionTest0984
     * @tc.desc Test template string with math operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0984', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let radius: number = 5;
      let pi: number = Math.PI;
      let area: number = pi * radius**2;
      let str: string = `Circle with radius ${radius} has area ~${Math.round(area)} (exact: ${area.toFixed(2)})`;
      expect(str).assertEqual(`Circle with radius 5 has area ~79 (exact: 78.54)`);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0985
     * @tc.name ExpressionTest0985
     * @tc.desc Test array length with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0985', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5, 6, 7];
      let len: number = arr.length; // 7
      let result: number = len << 1 | 3; // 14 | 3 = 15
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0986
     * @tc.name ExpressionTest0986
     * @tc.desc Test index calculation with bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0986', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let colors: string[] = ["red", "green", "blue", "yellow", "purple", "orange", "pink"];
      let index: int = 10 & 5;
      expect(colors[index]).assertEqual("red");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0987
     * @tc.name ExpressionTest0987
     * @tc.desc Test template string with array index calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0987', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: int[] = [10, 20, 30, 40, 50, 60];
      let x: int = 3;
      let y: int = 2;
      let str: string = `arr[${x}] * ${y} = ${arr[x] * y}, arr[${x - y}] = ${arr[x - y]}`;
      expect(str).assertEqual("arr[3] * 2 = 80, arr[1] = 20");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0988
     * @tc.name ExpressionTest0988
     * @tc.desc Test comparison with array length calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0988', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: string[] = ["a", "b", "c", "d", "e"];
      let threshold: number = 3;
      let result: boolean = arr.length - 1 > threshold;
      // 4 > 3 → true
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0989
     * @tc.name ExpressionTest0989
     * @tc.desc Test string concatenation with conditional results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0989', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let scores: number[] = [85, 92, 78, 95, 88];
      let minPass: int = 80;
      let report: string = "Passed: ";
      let first: boolean = true;
      for (let i: int = 0; i < scores.length; i++) {
        if (scores[i] >= minPass) {
          report += (first ? "" : ", ") + scores[i];
          first = false;
        }
      }
      expect(report).assertEqual("Passed: 85, 92, 95, 88");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0990
     * @tc.name ExpressionTest0990
     * @tc.desc Test range check with arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: int[] = [12, 24, 36, 48, 60, 72];
      let total: int = 0;
      let lower: int = 20;
      let upper: int = 60;
      for (let i: int = 0; i < values.length; i++) {
        if (values[i] > lower && values[i] < upper) {
          total += values[i] / 12;
        }
      }
      // 24/12 + 36/12 + 48/12 = 2 + 3 + 4 = 9
      expect(total).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0991
     * @tc.name ExpressionTest0991
     * @tc.desc Test array length with arithmetic and bitwise XOR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0991', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [10, 20, 30, 40];
      let len: number = arr.length; // 4
      let result: number = (len * 3) ^ 5; // 12 ^ 5 = 9
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0992
     * @tc.name ExpressionTest0992
     * @tc.desc Test nested ternary with multiple conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0992', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 75;
      let category: string = value >= 90 ? "Expert" :
        value >= 70 ? "Advanced" :
          value >= 50 ? "Intermediate" : "Beginner";
      expect(category).assertEqual("Advanced");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0993
     * @tc.name ExpressionTest0993
     * @tc.desc Test comma operator in for loop with transformations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0993', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numbers: int[] = [3, 6, 9, 12, 15];
      let transformed: number[] = [];
      let i: int, factor: number;
      for (i = 0, factor = 1; i < numbers.length; i++, factor += 0.5) {
        transformed.push(numbers[i] * factor);
      }
      const target: number[] = [3 * 1, 6 * 1.5, 9 * 2, 12 * 2.5, 15 * 3];
      expect(transformed).assertDeepEquals(target);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0994
     * @tc.name ExpressionTest0994
     * @tc.desc Test string comparison with substring checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0994', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let words: string[] = ["apple", "applet", "application", "applause", "apply"];
      let prefix: string = "app";
      let count: int = 0;
      for (let i: int = 0; i < words.length; i++) {
        if (words[i].startsWith(prefix) && words[i].length > prefix.length + 2) {
          count++;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0995
     * @tc.name ExpressionTest0995
     * @tc.desc Test unary operators with multiple calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0995', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 3;
      let c: number = 2;
      let result: number = ~a + (-b) * c + ~~(a / b);
      // -11 + (-3)*2 + 3 = -11 - 6 + 3 = -14
      expect(result).assertEqual(-14);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0996
     * @tc.name ExpressionTest0996
     * @tc.desc Test bitwise operations with conditional checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0996', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numbers: int[] = [0b1011, 0b1101, 0b1110, 0b0111];
      let mask: int = 0b1011;
      let result: int = 0;
      for (let i: int = 0; i < numbers.length; i++) {
        if ((numbers[i] & mask) === mask) {
          result += numbers[i];
        }
      }
      // Only 0b1011 & 0b1010 = 0b1010
      expect(result).assertEqual(0b1011);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0997
     * @tc.name ExpressionTest0997
     * @tc.desc Test array manipulation with decrement in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0997', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [];
      let num: number = 16;
      while (num >= 1) {
        arr.push(num);
        num /= 2;
      }
      const target: number[] = [16, 8, 4, 2, 1];
      expect(arr).assertDeepEquals(target);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0998
     * @tc.name ExpressionTest0998
     * @tc.desc Test comparison with transformed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0998', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 18;
      let b: number = 5;
      let c: number = 7;
      let result: boolean = (a % b) * 2 > c;
      // (3) * 2 > 7 → 6 > 7 → false
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0999
     * @tc.name ExpressionTest0999
     * @tc.desc Test comma operator in for loop with filtered values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0999', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: int[] = [12, 24, 36, 48, 60, 72, 84];
      let filtered: int[] = [];
      let i: int, divisor: int;
      for (i = 0, divisor = 5; i < values.length; i++, divisor++) {
        if (values[i] % divisor === 0) {
          filtered.push(values[i]);
        }
      }
      expect(filtered).assertDeepEquals([24, 48]);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1000
     * @tc.name ExpressionTest1000
     * @tc.desc Test string concatenation with index arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let months: string[] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
      let current: int = 10;
      let next: int = (current + 2) % 12;
      let str: string = months[current] + " + 2 months = " + months[next];
      expect(str).assertEqual("Nov + 2 months = Jan");
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1001
     * @tc.name ExpressionTest1001
     * @tc.desc Test arithmetic operations with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let result: number = maxVal + 1;
      // Adding 1 to MAX_VALUE still equals MAX_VALUE
      expect(result).assertEqual(maxVal);

      result = maxVal * 2;
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1002
     * @tc.name ExpressionTest1002
     * @tc.desc Test arithmetic operations with Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let minVal: number = Number.MIN_VALUE;
      let result: number = minVal / 2;
      // Dividing MIN_VALUE by 2 underflows to 0
      expect(result).assertEqual(0);

      result = minVal * 0.5;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1003
     * @tc.name ExpressionTest1003
     * @tc.desc Test modulus with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -17;
      let b: number = 5;
      let result1: number = a % b; // -2
      let result2: number = a % -b; // -2
      let result3: number = -a % b; // 2

      expect(result1).assertEqual(-2);
      expect(result2).assertEqual(-2);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1004
     * @tc.name ExpressionTest1004
     * @tc.desc Test division with zero and negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      let b: number = 0;

      let result1: number = a / b; // -Infinity
      let result2: number = b / a; // 0
      let result3: number = -a / b; // Infinity

      expect(result1).assertEqual(-Infinity);
      expect(result2).assertEqual(0);
      expect(result3).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1005
     * @tc.name ExpressionTest1005
     * @tc.desc Test NaN propagation in arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nanVal: number = NaN;
      let num: number = 10;

      let result1: number = nanVal + num;
      let result2: number = num - nanVal;
      let result3: number = nanVal * num;
      let result4: number = num / nanVal;

      expect(isNaN(result1)).assertTrue();
      expect(isNaN(result2)).assertTrue();
      expect(isNaN(result3)).assertTrue();
      expect(isNaN(result4)).assertTrue();
    });

  }
  )
}