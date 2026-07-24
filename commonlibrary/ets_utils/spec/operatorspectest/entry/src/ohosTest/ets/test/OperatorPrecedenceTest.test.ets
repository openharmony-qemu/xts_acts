/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ESObject KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

class MyClass063 {
  value: number = 42

  getValue(): number {
    return this.value
  }
}

class Counter064 {
  count: number = 10
}

class Builder128 {
  parts: string[] = []

  add(s: string): Builder128 {
    this.parts.push(s);
    return this
  }

  build(): string {
    return this.parts.join("-")
  }
}

let order: number[] = []
let order102: string[] = []
let count: number = 0

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function OperatorPrecedenceTest() :void {
  describe('OperatorPrecedenceTest', () :void => {
    beforeAll(() => {
    });
    beforeEach(async() => {
      await sleep(30)
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0110
     * @tc.name testOperatorPrecedence001
     * @tc.desc Verify member access takes precedence over arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { a: 10 }
      expect(obj.a + 5).assertEqual(15)
      expect(obj.a * 2).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0120
     * @tc.name testOperatorPrecedence002
     * @tc.desc Verify member access takes precedence over operations in function call arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { val: 5 }
      expect(double002(obj.val + 10)).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0130
     * @tc.name testOperatorPrecedence003
     * @tc.desc Verify bracket access has same precedence as dot access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { x: 42 }
      expect(obj["x"] + 8).assertEqual(50)
      let arr: ESObject[] = [10, 20, 30]
      expect(arr[1] * 2).assertEqual(40)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0140
     * @tc.name testOperatorPrecedence004
     * @tc.desc Verify function call executes before arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getValue004() + 5).assertEqual(15)
      expect(getValue004() * getValue004()).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0150
     * @tc.name testOperatorPrecedence005
     * @tc.desc Verify new instance creation takes precedence before member access results participate in operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Date(2024, 0, 1)
      expect(d.getFullYear() + 1).assertEqual(2025)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0160
     * @tc.name testOperatorPrecedence006
     * @tc.desc Verify unary negation executes before multiplication in -a * b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 5
      expect(-a * 2).assertEqual(-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0170
     * @tc.name testOperatorPrecedence007
     * @tc.desc Verify typeof executes before participating in operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof 42 + "!").assertEqual("number!")
      expect(typeof "hi" === "string").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0200
     * @tc.name testOperatorPrecedence010
     * @tc.desc Verify void executes expression first then returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(void 0 === undefined).assertTrue()
      expect(typeof void 42).assertEqual("undefined")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0210
     * @tc.name testOperatorPrecedence011
     * @tc.desc Verify multiplication before addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 + 2 * 3).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0220
     * @tc.name testOperatorPrecedence012
     * @tc.desc Verify division before subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10 - 6 / 2).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0230
     * @tc.name testOperatorPrecedence013
     * @tc.desc Verify modulo is same precedence as multiplication and division, left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10 % 3 + 1).assertEqual(2)
      expect(2 * 3 % 4).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0240
     * @tc.name testOperatorPrecedence014
     * @tc.desc Verify documentation examples a + b * c and (a + b) * c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1, b: number = 2, c: number = 3
      expect(a + b * c).assertEqual(7)
      expect((a + b) * c).assertEqual(9)
      expect(a * c + b * c).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0250
     * @tc.name testOperatorPrecedence015
     * @tc.desc Verify multiplication and division are same precedence, left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10 / 2 * 3).assertEqual(15)
      expect(10 * 2 / 5).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0260
     * @tc.name testOperatorPrecedence016
     * @tc.desc Verify addition and subtraction are same precedence, left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10 - 3 + 2).assertEqual(9)
      expect(10 + 3 - 2).assertEqual(11)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0270
     * @tc.name testOperatorPrecedence017
     * @tc.desc Verify division and modulo are same precedence, left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(100 / 10 % 3).assertEqual(1)
      expect(100 / (10 % 3)).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0280
     * @tc.name testOperatorPrecedence018
     * @tc.desc Verify exponentiation takes precedence over multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 * 3**2).assertEqual(18)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0290
     * @tc.name testOperatorPrecedence019
     * @tc.desc Verify exponentiation takes precedence over division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(16 / 2**3).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0310
     * @tc.name testOperatorPrecedence021
     * @tc.desc Verify parentheses force addition before multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 + 2) * 3).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0320
     * @tc.name testOperatorPrecedence022
     * @tc.desc Verify nested parentheses evaluate from inner to outer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((1 + 2) * 3) + 4).assertEqual(13)
      expect(1 + (2 * (3 + 4))).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0330
     * @tc.name testOperatorPrecedence023
     * @tc.desc Verify parentheses do not change result but improve readability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 + 2) + 3).assertEqual(1 + 2 + 3)
      expect((a => a)((5))).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0340
     * @tc.name testOperatorPrecedence024
     * @tc.desc Verify parentheses force numeric addition before string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) + (2 as ESObject) + ("3" as ESObject)).assertEqual("33")
      expect(("1" as ESObject) + ((2 as ESObject) + (3 as ESObject))).assertEqual("15")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0350
     * @tc.name testOperatorPrecedence025
     * @tc.desc Verify ternary result in operations requires parentheses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond: boolean = true
      expect((cond ? 10 : 20) + 5).assertEqual(15)
      expect(cond ? 10 : 20 + 5).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0360
     * @tc.name testOperatorPrecedence026
     * @tc.desc Verify left shift executes before comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 << 2) > 2).assertTrue()
      expect((8 >> 1) < 5).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0370
     * @tc.name testOperatorPrecedence027
     * @tc.desc Verify bitwise AND executes before XOR before OR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0b1100 & 0b1010 ^ 0b0011 | 0b0100) as ESObject).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0390
     * @tc.name testOperatorPrecedence029
     * @tc.desc Verify addition executes before left shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 + 2) << 2).assertEqual(12)
      expect((1 as ESObject) + (2 as ESObject) << 2).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0400
     * @tc.name testOperatorPrecedence030
     * @tc.desc Verify left shift executes before bitwise AND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 << 3) & 7).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0410
     * @tc.name testOperatorPrecedence031
     * @tc.desc Verify less-than comparison executes before equality check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((3 < 5) === true).assertTrue()
      expect((5 > 3) === true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0420
     * @tc.name testOperatorPrecedence032
     * @tc.desc Verify not-equal has lower precedence than less-than
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((3 < 5) !== false).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0430
     * @tc.name testOperatorPrecedence033
     * @tc.desc Verify arithmetic before comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 + 2 < 4).assertTrue()
      expect(3 * 2 >= 5).assertTrue()
      expect(10 % 3 > 0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0440
     * @tc.name testOperatorPrecedence034
     * @tc.desc Verify precedence between string concatenation and comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((("a" as ESObject) + ("b" as ESObject)) < ("c" as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0450
     * @tc.name testOperatorPrecedence035
     * @tc.desc Verify instanceof is same precedence as relational operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { a: 1 }
      let d = new Date()
      expect((d instanceof Date) === true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0460
     * @tc.name testOperatorPrecedence036
     * @tc.desc Verify logical NOT executes before logical AND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!false && true).assertTrue()
      expect(!true || false).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0470
     * @tc.name testOperatorPrecedence037
     * @tc.desc Verify comparison before negation before logical AND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(1 > 2) && true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0480
     * @tc.name testOperatorPrecedence038
     * @tc.desc Verify a || b && c is parsed as a || (b && c)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) || ((false as ESObject) && (false as ESObject))).assertTrue()
      expect((false as ESObject) || ((true as ESObject) && (false as ESObject))).assertFalse()
      expect((false as ESObject) || ((true as ESObject) && (true as ESObject))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0490
     * @tc.name testOperatorPrecedence039
     * @tc.desc Verify mixing && and || without parentheses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = false
      let b: boolean = true
      let c: boolean = false
      let result: boolean = a || b && c
      expect(result).assertFalse()
      let result2: boolean = (a || b) && c
      expect(result2).assertFalse()
      let d: boolean = true
      let e: boolean = false
      expect(d || a && e).assertTrue()
      expect((d || a) && e).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0500
     * @tc.name testOperatorPrecedence040
     * @tc.desc Verify bitwise AND executes before logical AND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((((5 as ESObject) & (3 as ESObject)) as ESObject) && (2 as ESObject)).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0510
     * @tc.name testOperatorPrecedence041
     * @tc.desc Verify logical OR takes precedence over nullish coalescing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) ?? "default").assertEqual("default")
      expect((0 as ESObject) || "fallback").assertEqual("fallback")
      expect((0 as ESObject) ?? "fallback").assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0520
     * @tc.name testOperatorPrecedence042
     * @tc.desc Verify || in condition is evaluated first in ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = false
      let b: boolean = true
      let result: string = a || b ? "yes" : "no"
      expect(result).assertEqual("yes")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0530
     * @tc.name testOperatorPrecedence043
     * @tc.desc Verify && in condition is evaluated first in ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true
      let b: boolean = true
      let result: string = a && b ? "both" : "not both"
      expect(result).assertEqual("both")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0540
     * @tc.name testOperatorPrecedence044
     * @tc.desc Verify ternary is right-associative a ? b : c ? d : e
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 0
      let result: string = n > 0 ? "pos" : n < 0 ? "neg" : "zero"
      expect(result).assertEqual("zero")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0550
     * @tc.name testOperatorPrecedence045
     * @tc.desc Verify arithmetic in ternary branch executes first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond: boolean = false
      expect(cond ? 10 : 20 + 5).assertEqual(25)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0560
     * @tc.name testOperatorPrecedence046
     * @tc.desc Verify comparison in ternary condition executes first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      expect(x > 3 ? "big" : "small").assertEqual("big")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0570
     * @tc.name testOperatorPrecedence047
     * @tc.desc Verify ternary executes before assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let age: number = 20
      let category: string = age >= 18 ? "adult" : "minor"
      expect(category).assertEqual("adult")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0580
     * @tc.name testOperatorPrecedence048
     * @tc.desc Verify right-side arithmetic executes before assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 2 + 3 * 4
      expect(x).assertEqual(14)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0590
     * @tc.name testOperatorPrecedence049
     * @tc.desc Verify right-side logical operation executes before assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true
      let b: boolean = false
      let result: boolean = a && b
      expect(result).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0600
     * @tc.name testOperatorPrecedence050
     * @tc.desc Verify chained assignment a = b = c is right-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number, b: number
      a = b = 42
      expect(a).assertEqual(42)
      expect(b).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0610
     * @tc.name testOperatorPrecedence051
     * @tc.desc Verify compound assignment is right-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      x += 5 * 2
      expect(x).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0620
     * @tc.name testOperatorPrecedence052
     * @tc.desc Verify assignment executes before comma operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x = 5
      expect(x).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0650
     * @tc.name testOperatorPrecedence055
     * @tc.desc Verify member access and function call have highest precedence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { getVal: () => 10 }
      expect(obj.getVal() * 2 + 3).assertEqual(23)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0660
     * @tc.name testOperatorPrecedence056
     * @tc.desc Verify unary negation then multiplication then shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 3
      expect(-a * 2 << 1).assertEqual(-12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0670
     * @tc.name testOperatorPrecedence057
     * @tc.desc Verify shift then comparison then equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((((4 >> 1) as ESObject) < 3) === true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0680
     * @tc.name testOperatorPrecedence058
     * @tc.desc Verify equality then bitwise operation chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((((true as ESObject) === (true as ESObject)) as ESObject) & (1 as ESObject))).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0690
     * @tc.name testOperatorPrecedence059
     * @tc.desc Verify complete precedence chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number
      x = (1 | 0) && true || false ? 42 : 0
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0700
     * @tc.name testOperatorPrecedence060
     * @tc.desc Verify classic mixed precedence with string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) + ("2" as ESObject) + (3 as ESObject)).assertEqual("123")
      expect(("1" as ESObject) + (2 as ESObject) + (3 as ESObject)).assertEqual("123")
      expect((1 as ESObject) + (2 as ESObject) + ("3" as ESObject)).assertEqual("33")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0710
     * @tc.name testOperatorPrecedence061
     * @tc.desc Verify logical operator precedence trap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true && false) || true).assertTrue()
      expect(true && false || true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0720
     * @tc.name testOperatorPrecedence062
     * @tc.desc Verify unary negation vs binary subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-5 - 3).assertEqual(-8)
      expect(5 - -3).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0730
     * @tc.name testOperatorPrecedence063
     * @tc.desc Verify member access after new instance creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new MyClass063().getValue()).assertEqual(42)
      expect(new MyClass063().value).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0740
     * @tc.name testOperatorPrecedence064
     * @tc.desc Verify new instance creation before participating in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Counter064().count + 5).assertEqual(15)
      expect(new Counter064().count * 2).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0750
     * @tc.name testOperatorPrecedence065
     * @tc.desc Verify prefix increment executes first in ++a * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 5
      expect(++a * 2).assertEqual(12)
      expect(a).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0760
     * @tc.name testOperatorPrecedence066
     * @tc.desc Verify prefix decrement executes first in --a + 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 5
      expect(--a + 3).assertEqual(7)
      expect(a).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0770
     * @tc.name testOperatorPrecedence067
     * @tc.desc Verify postfix increment returns original value in a++ * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 5
      expect(a++ * 2).assertEqual(10)
      expect(a).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0780
     * @tc.name testOperatorPrecedence068
     * @tc.desc Verify postfix decrement returns original value in a-- - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 5
      expect(a-- - 1).assertEqual(4)
      expect(a).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0790
     * @tc.name testOperatorPrecedence069
     * @tc.desc Verify mixing prefix and postfix increment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 3
      let result: number = ++a + a++
      expect(result).assertEqual(8)
      expect(a).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0800
     * @tc.name testOperatorPrecedence070
     * @tc.desc Verify mixing postfix and prefix increment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 3
      let result: number = a++ + ++a
      expect(result).assertEqual(8)
      expect(a).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0810
     * @tc.name testOperatorPrecedence071
     * @tc.desc Verify 1 + 2 + "3" equals "33" not "123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) + (2 as ESObject) + ("3" as ESObject)).assertEqual("33")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0820
     * @tc.name testOperatorPrecedence072
     * @tc.desc Verify 1 + (2 + "3") equals "123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) + ((2 as ESObject) + ("3" as ESObject))).assertEqual("123")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0830
     * @tc.name testOperatorPrecedence073
     * @tc.desc Verify a && b || c is not equal to a && (b || c)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true
      let b: boolean = false
      let c: boolean = true
      expect(a && b || c).assertTrue()
      expect(a && (b || c)).assertTrue()
      let a2: boolean = false
      let b2: boolean = true
      let c2: boolean = false
      expect(a2 && b2 || c2).assertFalse()
      expect(a2 && (b2 || c2)).assertFalse()
      expect((false && false || true) as ESObject).assertTrue()
      expect((false && (false || true)) as ESObject).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0840
     * @tc.name testOperatorPrecedence074
     * @tc.desc Verify the trap of string concatenation with ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cond: boolean = false
      let r1: ESObject = ("x" + (cond as ESObject)) ? "a" : "b"
      expect(r1).assertEqual("a")
      let r2: string = "x" + (cond ? "a" : "b")
      expect(r2).assertEqual("xb")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0850
     * @tc.name testOperatorPrecedence075
     * @tc.desc Verify the trap of bitwise AND with strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: ESObject = (5 as ESObject) & (((3 as ESObject) === (1 as ESObject)) as ESObject)
      expect(r1).assertEqual(0)
      let r2: boolean = ((5 as ESObject) & (3 as ESObject)) === 1
      expect(r2).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0860
     * @tc.name testOperatorPrecedence076
     * @tc.desc Verify precedence between assignment and comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x = 1
      expect(x).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0870
     * @tc.name testOperatorPrecedence077
     * @tc.desc Verify unary negation with exponentiation requires parentheses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-(2**2)).assertEqual(-4)
      expect((-2)**2).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0880
     * @tc.name testOperatorPrecedence078
     * @tc.desc Verify mixing multiple operator types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 5, b: number = 3, c: number = 7
      let result: number = (a + b > c) && a < c ? a * b : c
      expect(result).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0890
     * @tc.name testOperatorPrecedence079
     * @tc.desc Verify mixing bitwise and logical operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flags: number = 0b1010
      let mask: number = 0b0010
      let result: string = ((flags as ESObject) & (mask as ESObject)) ? "has" : "no"
      expect(result).assertEqual("has")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0900
     * @tc.name testOperatorPrecedence080
     * @tc.desc Verify ternary precedence in template strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isAdmin: boolean = true
      let score: number = 85
      let label: string = `${isAdmin ? "Admin" : "User"}: ${score >= 80 ? "Good" : "OK"}`
      expect(label).assertEqual("Admin: Good")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0910
     * @tc.name testOperatorPrecedence081
     * @tc.desc Verify mixing || and ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let config: ESObject = { timeout: 0 }
      let timeout: number = config.timeout || 5000
      let result: string = timeout > 3000 ? "long" : "short"
      expect(result).assertEqual("long")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0920
     * @tc.name testOperatorPrecedence082
     * @tc.desc Verify JS does not support chained comparison a < b < c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = ((3 as ESObject) < (5 as ESObject)) < (10 as ESObject) as ESObject
      expect(result).assertTrue()
      let correct: boolean = 3 < 5 && 5 < 10
      expect(correct).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0930
     * @tc.name testOperatorPrecedence083
     * @tc.desc Verify documentation grouping operator examples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1, b: number = 2, c: number = 3
      expect(a + b * c).assertEqual(7)
      expect((a + b) * c).assertEqual(9)
      expect(a * c + b * c).assertEqual(9)
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0950
     * @tc.name testOperatorPrecedence085
     * @tc.desc Verify complex expressions benefit from parentheses for readability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: number = 1 + 2 * 3**2 % 5
      expect(r1).assertEqual(4)
      let r2: number = 1 + ((2 * (3**2)) % 5)
      expect(r2).assertEqual(4)
      expect(r1).assertEqual(r2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0960
     * @tc.name testOperatorPrecedence086
     * @tc.desc Verify basic behavior of each operator category from documentation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10;
      x += 5
      expect(x).assertEqual(15)
      expect(3 > 2 === true).assertTrue()
      expect(2**3 + 1).assertEqual(9)
      expect((5 & 3) | 8).assertEqual(9)
      expect(true && false || true).assertTrue()
      expect(5 > 3 ? "yes" : "no").assertEqual("yes")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0970
     * @tc.name testOperatorPrecedence087
     * @tc.desc Verify 2**3**2 is right-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2**3**2).assertEqual(512)
      expect((2**3)**2).assertEqual(64)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0980
     * @tc.name testOperatorPrecedence088
     * @tc.desc Verify multi-level exponentiation is right-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2**3**(2**1)).assertEqual(512)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_0990
     * @tc.name testOperatorPrecedence089
     * @tc.desc Verify chained assignment a = b = c = 42 is right-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number, b: number, c: number
      a = b = c = 42
      expect(a).assertEqual(42)
      expect(b).assertEqual(42)
      expect(c).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1000
     * @tc.name testOperatorPrecedence090
     * @tc.desc Verify compound assignment chain is right-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 10
      let b: number = 20
      a += b += 5
      expect(a).assertEqual(35)
      expect(b).assertEqual(25)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1010
     * @tc.name testOperatorPrecedence091
     * @tc.desc Verify ternary a ? b : c ? d : e is right-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = -5
      let r1: string = n > 0 ? "pos" : n < 0 ? "neg" : "zero"
      let r2: string = n > 0 ? "pos" : (n < 0 ? "neg" : "zero")
      expect(r1).assertEqual(r2)
      expect(r1).assertEqual("neg")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1020
     * @tc.name testOperatorPrecedence092
     * @tc.desc Verify deep nested ternary is right-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(classify092(95)).assertEqual("A")
      expect(classify092(75)).assertEqual("C")
      expect(classify092(45)).assertEqual("F")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1030
     * @tc.name testOperatorPrecedence093
     * @tc.desc Verify subtraction is left-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10 - 3 - 2).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1040
     * @tc.name testOperatorPrecedence094
     * @tc.desc Verify division is left-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(100 / 5 / 2).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1050
     * @tc.name testOperatorPrecedence095
     * @tc.desc Verify modulo is left-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(100 % 7 % 3).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1060
     * @tc.name testOperatorPrecedence096
     * @tc.desc Verify bitwise AND is left-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0b1111 & 0b1100 & 0b1010) as ESObject).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1070
     * @tc.name testOperatorPrecedence097
     * @tc.desc Verify bitwise OR is left-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0b0001 | 0b0010 | 0b0100) as ESObject).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1080
     * @tc.name testOperatorPrecedence098
     * @tc.desc Verify logical AND is left-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(true && true && false).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1090
     * @tc.name testOperatorPrecedence099
     * @tc.desc Verify logical OR is left-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(false || false || true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1100
     * @tc.name testOperatorPrecedence100
     * @tc.desc Verify multiple parameters are evaluated left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = sum100(track100(1), track100(2), track100(3))
      expect(result).assertEqual(6)
      expect(order).assertDeepEquals([1, 2, 3])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1110
     * @tc.name testOperatorPrecedence101
     * @tc.desc Verify addition operands are evaluated left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      order = []
      let result: number = f101(1) + f101(2) + f101(3)
      expect(result).assertEqual(6)
      expect(order).assertDeepEquals([1, 2, 3])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1120
     * @tc.name testOperatorPrecedence102
     * @tc.desc Verify && short-circuit changes evaluation order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      order102 =[];
      let result: boolean = fa102() && fb102()
      expect(result).assertFalse()
      expect(order102).assertDeepEquals(["a"])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1130
     * @tc.name testOperatorPrecedence103
     * @tc.desc Verify || short-circuit changes evaluation order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      order102 = []
      let result: boolean = fa103() || fb103()
      expect(result).assertTrue()
      expect(order102).assertDeepEquals(["a"])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1140
     * @tc.name testOperatorPrecedence104
     * @tc.desc Verify only matching branch is executed in ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      order102 = []
      let result: string = cond104() ? branchA104() : branchB104()
      expect(result).assertEqual("A")
      expect(order102).assertDeepEquals(["cond", "A"])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1150
     * @tc.name testOperatorPrecedence105
     * @tc.desc Verify side effects in condition execute only once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = check105() ? "yes" : "no"
      expect(r1).assertEqual("no")
      let r2: string = check105() ? "yes" : "no"
      expect(r2).assertEqual("no")
      let r3: string = check105() ? "yes" : "no"
      expect(r3).assertEqual("yes")
      expect(count).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1160
     * @tc.name testOperatorPrecedence106
     * @tc.desc Verify right side of assignment is fully evaluated first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      let arr: number[] = [10, 20]
      arr[x] = 30
      expect(arr[0]).assertEqual(30)
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1170
     * @tc.name testOperatorPrecedence107
     * @tc.desc Verify f() executes first in a[f()] += g()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      order102 = []
      let arr: number[] = [10]
      arr[f107()] += g107()
      expect(arr[0]).assertEqual(15)
      expect(order102).assertDeepEquals(["f", "g"])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1180
     * @tc.name testOperatorPrecedence108
     * @tc.desc Verify correct evaluation of mixed operations in if condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let age: number = 20
      let hasLicense: boolean = true
      if (age >= 18 && hasLicense) {
        expect(true).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1190
     * @tc.name testOperatorPrecedence109
     * @tc.desc Verify correct grouping of complex multiple conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isAdmin: boolean = false
      let isActive: boolean = true
      let hasPermission: boolean = true
      if ((isAdmin && isActive) || hasPermission) {
        expect(true).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1200
     * @tc.name testOperatorPrecedence110
     * @tc.desc Verify && and comparison in while condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 0
      let count: number = 0
      while (i < 5 && count < 3) {
        i++
        count++
      }
      expect(count).assertEqual(3)
      expect(i).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1210
     * @tc.name testOperatorPrecedence111
     * @tc.desc Verify comma in for condition only takes last value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0
      for (let i = 0, j = 100; i < 5; i++, j--) {
        count++
      }
      expect(count).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1220
     * @tc.name testOperatorPrecedence112
     * @tc.desc Verify ternary precedence in arrow function body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let classify = (n: number): string => n > 0 ? "pos" : n < 0 ? "neg" : "zero"
      expect(classify(5)).assertEqual("pos")
      expect(classify(-3)).assertEqual("neg")
      expect(classify(0)).assertEqual("zero")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1230
     * @tc.name testOperatorPrecedence113
     * @tc.desc Verify || as conditional return in arrow function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let getDefault = (val: ESObject, fallback: string): string => val || fallback
      expect(getDefault("hello", "default")).assertEqual("hello")
      expect(getDefault("", "default")).assertEqual("default")
      expect(getDefault(0, "default")).assertEqual("default")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1240
     * @tc.name testOperatorPrecedence114
     * @tc.desc Verify method chain executes before participating in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = [1, 2, 3, 4, 5]
        .filter(n => n > 2)
        .map(n => n * 2)
        .reduce((a, b) => a + b, 0)
      expect(result).assertEqual(24)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1250
     * @tc.name testOperatorPrecedence115
     * @tc.desc Verify ternary selects different method chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: number[] = [1, -2, 3, -4, 5]
      let getPositives: boolean = true
      let result: number[] = getPositives
        ? nums.filter(n => n > 0)
        : nums.filter(n => n < 0)
      expect(result).assertDeepEquals([1, 3, 5])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1260
     * @tc.name testOperatorPrecedence116
     * @tc.desc Verify operator precedence in callback function parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: number[] = [1, 2, 3]
      let result: number[] = nums.map(n => n * 2 + 1)
      expect(result).assertDeepEquals([3, 5, 7])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1270
     * @tc.name testOperatorPrecedence117
     * @tc.desc Verify ternary and logical combination in callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: number[] = [1, 2, 3, 4, 5, 6]
      let result: string[] = nums.map(n =>
      n % 2 === 0 && n > 2 ? "even-big" :
        n % 2 === 0 ? "even" : "odd"
      )
      expect(result).assertDeepEquals(["odd", "even", "odd", "even-big", "odd", "even-big"])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1280
     * @tc.name testOperatorPrecedence118
     * @tc.desc Verify arithmetic in template string interpolation follows precedence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 2, b: number = 3, c: number = 4
      expect(`${a + b * c}`).assertEqual("14")
      expect(`${(a + b) * c}`).assertEqual("20")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1290
     * @tc.name testOperatorPrecedence119
     * @tc.desc Verify ternary conditional rendering in template strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let score: number = 85
      let label: string = `Score: ${score} (${score >= 90 ? "A" : score >= 80 ? "B" : "C"})`
      expect(label).assertEqual("Score: 85 (B)")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1300
     * @tc.name testOperatorPrecedence120
     * @tc.desc Verify && false concatenation trap in template strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isVIP: boolean = false
      let bad: string = `${isVIP && "VIP"}`
      expect(bad).assertEqual("false")
      let good: string = `${isVIP ? "VIP" : "Regular"}`
      expect(good).assertEqual("Regular")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1310
     * @tc.name testOperatorPrecedence121
     * @tc.desc Verify bitwise operation results in template strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flags: number = 0b1010
      let mask: number = 0b0011
      expect(`${flags & mask}`).assertEqual("2")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1320
     * @tc.name testOperatorPrecedence122
     * @tc.desc Verify ambiguity of + between numbers and strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) + (2 as ESObject) + ("3" as ESObject)).assertEqual("33")
      expect(("1" as ESObject) + (2 as ESObject) + (3 as ESObject)).assertEqual("123")
      expect((1 as ESObject) + (("2" as ESObject) + (3 as ESObject))).assertEqual("123")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1330
     * @tc.name testOperatorPrecedence123
     * @tc.desc Verify true + true + true equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) + (true as ESObject)).assertEqual(2)
      expect((true as ESObject) + (true as ESObject) + (true as ESObject)).assertEqual(3)
      expect((true as ESObject) + (false as ESObject) + (true as ESObject)).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1340
     * @tc.name testOperatorPrecedence124
     * @tc.desc Verify multiple logical NOT is equivalent to single NOT for odd count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!true).assertTrue()
      expect(!!!true).assertFalse()
      expect(!!!!true).assertTrue()
      expect(!!!!!true).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1360
     * @tc.name testOperatorPrecedence126
     * @tc.desc Verify double unary negation on 5 equals 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 5
      expect(-(-a)).assertEqual(5)
      expect(5 - -3).assertEqual(8)
      expect(5 - -(-3) as ESObject).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1370
     * @tc.name testOperatorPrecedence127
     * @tc.desc Verify 0 == "" == false but chained comparison is not recommended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0 as ESObject) == ("" as ESObject)).assertTrue()
      expect(("" as ESObject) == (false as ESObject)).assertTrue()
      expect((0 as ESObject) == (false as ESObject)).assertTrue()
      expect((0 as ESObject) === ("" as ESObject)).assertFalse()
      expect(("" as ESObject) === (false as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1380
     * @tc.name testOperatorPrecedence128
     * @tc.desc Verify difference between new Foo().bar and new (Foo.bar)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Builder128().add("a").add("b").build()).assertEqual("a-b")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1390
     * @tc.name testOperatorPrecedence129
     * @tc.desc Verify assignment in ternary branches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isAdmin: boolean = true
      let msg: string = ""
      isAdmin ? (msg = "Welcome Admin") : (msg = "Welcome User")
      expect(msg).assertEqual("Welcome Admin")
      msg = isAdmin ? "Welcome Admin" : "Welcome User"
      expect(msg).assertEqual("Welcome Admin")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1400
     * @tc.name testOperatorPrecedence130
     * @tc.desc Verify spread operator vs comma separator in arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1, b: number = 2
      let arr1: number[] = [a, b]
      expect(arr1).assertDeepEquals([1, 2])
      let more: number[] = [3, 4]
      let arr2: number[] = [a, b, ...more]
      expect(arr2).assertDeepEquals([1, 2, 3, 4])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1430
     * @tc.name testOperatorPrecedence133
     * @tc.desc Verify precedence handling in configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isDev: boolean = true
      let isTest: boolean = false
      let apiBase: string = isDev && !isTest
        ? "http://dev.api.com"
        : isTest
          ? "http://test.api.com"
          : "https://api.com"
      expect(apiBase).assertEqual("http://dev.api.com")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OPERATOR_PRECEDENCE_1440
     * @tc.name testOperatorPrecedence134
     * @tc.desc Verify complex mathematical expression precedence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testOperatorPrecedence134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1, b: number = -5, c: number = 6
      let discriminant: number = b * b - 4 * a * c
      expect(discriminant).assertEqual(1)
      let root1: number = (-b + Math.sqrt(discriminant)) / (2 * a)
      let root2: number = (-b - Math.sqrt(discriminant)) / (2 * a)
      expect(root1).assertEqual(3)
      expect(root2).assertEqual(2)
    });
  });
}

function getValue004(): number {
  return 10
}

function classify092(n: number): string {
  return n >= 90 ? "A"
    : n >= 80 ? "B"
      : n >= 70 ? "C"
        : n >= 60 ? "D"
          : "F"
}

function track100(n: number): number {
  order.push(n);
  return n
}

function sum100(a: number, b: number, c: number): number {
  return a + b + c
}

function f101(n: number): number {
  order.push(n);
  return n
}


function fa102(): boolean {
  order102.push("a");
  return false
}

function fb102(): boolean {
  order102.push("b");
  return true
}


function fa103(): boolean {
  order102.push("a");
  return true
}

function fb103(): boolean {
  order102.push("b");
  return false
}


function cond104(): boolean {
  order102.push("cond");
  return true
}

function branchA104(): string {
  order102.push("A");
  return "A"
}

function branchB104(): string {
  order102.push("B");
  return "B"
}

function check105(): boolean {
  count++;
  return count > 2
}

function f107(): number {
  order102.push("f");
  return 0
}

function g107(): number {
  order102.push("g");
  return 5
}

function double002(n: number): number {
  return n * 2
}