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

interface TreeNode280 {
  name: string
  children?: TreeNode280[]
}

class Animal306 {
  toString(): string {
    return "Animal"
  }
}

class Dog306 extends Animal306 {
  toString(): string {
    return "Dog"
  }
}

class Money307 {
  amount: number
  currency: string

  constructor(amount: number, currency: string) {
    this.amount = amount
    this.currency = currency
  }

  toString(): string {
    return this.amount + " " + this.currency
  }
}

interface GeneratedObjectLiteralInterface_1 {
  a: number;
}

interface GeneratedObjectLiteralInterface_2 {
  name: string;
  age: number;
}

interface GeneratedObjectLiteralInterface_3 {
  name: string;
  age: number;
}

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function StringOperatorTest() {
  describe('StringOperatorTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0110
     * @tc.name testStringOperator001
     * @tc.desc Verify two plain English strings concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Hello" + " " + "World").assertEqual("Hello World")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0120
     * @tc.name testStringOperator002
     * @tc.desc Verify two Chinese strings concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("你好" + "世界").assertEqual("你好世界")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0130
     * @tc.name testStringOperator003
     * @tc.desc Verify two Japanese strings concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("こんにちは" + "世界").assertEqual("こんにちは世界")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0140
     * @tc.name testStringOperator004
     * @tc.desc Verify mixed Chinese and English concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Hello" + "世界").assertEqual("Hello世界")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0150
     * @tc.name testStringOperator005
     * @tc.desc Verify two numeric string concatenation without numeric addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("123" + "456").assertEqual("123456")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0160
     * @tc.name testStringOperator006
     * @tc.desc Verify two boolean string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("true" + "false").assertEqual("truefalse")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0170
     * @tc.name testStringOperator007
     * @tc.desc Verify empty string plus non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("" + "abc").assertEqual("abc")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0180
     * @tc.name testStringOperator008
     * @tc.desc Verify non-empty string plus empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc" + "").assertEqual("abc")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0190
     * @tc.name testStringOperator009
     * @tc.desc Verify two empty strings concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("" + "").assertEqual("")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0200
     * @tc.name testStringOperator010
     * @tc.desc Verify length of two empty strings concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("" + "").length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0210
     * @tc.name testStringOperator011
     * @tc.desc Verify single char plus single char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a" + "b").assertEqual("ab")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0220
     * @tc.name testStringOperator012
     * @tc.desc Verify single char plus multi chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a" + "bcd").assertEqual("abcd")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0230
     * @tc.name testStringOperator013
     * @tc.desc Verify concatenating two long strings of 1000 chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let long1: string = "a".repeat(1000)
      let long2: string = "b".repeat(1000)
      let result: string = long1 + long2
      expect(result.length).assertEqual(2000)
      expect(result.startsWith("a")).assertTrue()
      expect(result.endsWith("b")).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0240
     * @tc.name testStringOperator014
     * @tc.desc Verify concatenating 100 short strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parts: string[] = []
      for (let i = 0; i < 100; i++) {
        parts.push(`${i}`)
      }
      let result: string = parts.join("")
      expect(result.length).assertEqual(190)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0250
     * @tc.name testStringOperator015
     * @tc.desc Verify string plus positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + 42).assertEqual("x42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0260
     * @tc.name testStringOperator016
     * @tc.desc Verify string plus negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + (-42)).assertEqual("x-42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0270
     * @tc.name testStringOperator017
     * @tc.desc Verify string plus float number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + 3.14).assertEqual("x3.14")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0280
     * @tc.name testStringOperator018
     * @tc.desc Verify string plus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + 0).assertEqual("x0")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0290
     * @tc.name testStringOperator019
     * @tc.desc Verify string plus negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + (-0)).assertEqual("x0")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0300
     * @tc.name testStringOperator020
     * @tc.desc Verify string plus Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + Infinity).assertEqual("xInfinity")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0310
     * @tc.name testStringOperator021
     * @tc.desc Verify string plus negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + (-Infinity)).assertEqual("x-Infinity")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0320
     * @tc.name testStringOperator022
     * @tc.desc Verify string plus NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + NaN).assertEqual("xNaN")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0330
     * @tc.name testStringOperator023
     * @tc.desc Verify string plus scientific notation number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + 1e10).assertEqual("x10000000000")
      expect(("x" as ESObject) + 1e-10).assertEqual("x1e-10")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0340
     * @tc.name testStringOperator024
     * @tc.desc Verify string plus BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + (123n as ESObject)).assertEqual("x123")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0350
     * @tc.name testStringOperator025
     * @tc.desc Verify positive integer plus string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((42 as ESObject) + "x").assertEqual("42x")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0360
     * @tc.name testStringOperator026
     * @tc.desc Verify negative integer plus string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-42 as ESObject) + "x").assertEqual("-42x")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0370
     * @tc.name testStringOperator027
     * @tc.desc Verify zero plus string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0 as ESObject) + "x").assertEqual("0x")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0380
     * @tc.name testStringOperator028
     * @tc.desc Verify Infinity plus string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((Infinity as ESObject) + "x").assertEqual("Infinityx")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0390
     * @tc.name testStringOperator029
     * @tc.desc Verify NaN plus string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((NaN as ESObject) + "x").assertEqual("NaNx")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0400
     * @tc.name testStringOperator030
     * @tc.desc Verify string plus true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + true).assertEqual("xtrue")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0410
     * @tc.name testStringOperator031
     * @tc.desc Verify string plus false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + false).assertEqual("xfalse")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0420
     * @tc.name testStringOperator032
     * @tc.desc Verify true plus string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) + "x").assertEqual("truex")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0430
     * @tc.name testStringOperator033
     * @tc.desc Verify false plus string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((false as ESObject) + "x").assertEqual("falsex")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0440
     * @tc.name testStringOperator034
     * @tc.desc Verify string plus null converts to null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + null).assertEqual("xnull")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0450
     * @tc.name testStringOperator035
     * @tc.desc Verify null plus string converts to null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) + "x").assertEqual("nullx")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0460
     * @tc.name testStringOperator036
     * @tc.desc Verify string plus undefined converts to undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + undefined).assertEqual("xundefined")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0470
     * @tc.name testStringOperator037
     * @tc.desc Verify undefined plus string converts to undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((undefined as ESObject) + "x").assertEqual("undefinedx")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0480
     * @tc.name testStringOperator038
     * @tc.desc Verify string plus plain object returns object Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + ({ a: 1 } as ESObject)).assertEqual("x[object Object]")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0490
     * @tc.name testStringOperator039
     * @tc.desc Verify object plus string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(({ a: 1 } as ESObject) + "x").assertEqual("[object Object]x")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0500
     * @tc.name testStringOperator040
     * @tc.desc Verify string plus object with custom toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = {
        toString() {
          return "CustomStr"
        }
      }
      expect(("x" as ESObject) + obj).assertEqual("xCustomStr")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0510
     * @tc.name testStringOperator041
     * @tc.desc Verify object toString returning numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = {
        toString() {
          return "123"
        }
      }
      expect(("x" as ESObject) + obj).assertEqual("x123")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0520
     * @tc.name testStringOperator042
     * @tc.desc Verify plus prefers toString when object has both valueOf and toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = {
        valueOf() {
          return 42
        },
        toString() {
          return "ObjStr"
        }
      }
      expect(("x" as ESObject) + obj).assertEqual("x42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0530
     * @tc.name testStringOperator043
     * @tc.desc Verify object with valueOf but no toString inherits Object prototype toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = {
        valueOf() {
          return 42
        }
      }
      expect(("x" as ESObject) + obj).assertEqual("x42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0540
     * @tc.name testStringOperator044
     * @tc.desc Verify string plus new String object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sObj = new String("Wrapped")
      expect(("x" as ESObject) + (sObj as ESObject)).assertEqual("xWrapped")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0550
     * @tc.name testStringOperator045
     * @tc.desc Verify string plus new Number object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nObj = new Number(42)
      expect(("x" as ESObject) + (nObj as ESObject)).assertEqual("x42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0560
     * @tc.name testStringOperator046
     * @tc.desc Verify string plus new Boolean object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bObj = new Boolean(true)
      expect(("x" as ESObject) + (bObj as ESObject)).assertEqual("xtrue")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0570
     * @tc.name testStringOperator047
     * @tc.desc Verify string plus empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + ([] as ESObject)).assertEqual("x")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0580
     * @tc.name testStringOperator048
     * @tc.desc Verify string plus single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + ([1] as ESObject)).assertEqual("x1")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0590
     * @tc.name testStringOperator049
     * @tc.desc Verify string plus multi element array with comma join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + ([1, 2, 3] as ESObject)).assertEqual("x1,2,3")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0600
     * @tc.name testStringOperator050
     * @tc.desc Verify string plus string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + (["a", "b"] as ESObject)).assertEqual("xa,b")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0610
     * @tc.name testStringOperator051
     * @tc.desc Verify array plus string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(([1, 2] as ESObject) + "x").assertEqual("1,2x")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0620
     * @tc.name testStringOperator052
     * @tc.desc Verify string plus nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + ([[1, 2], [3]] as ESObject)).assertEqual("x1,2,3")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0630
     * @tc.name testStringOperator053
     * @tc.desc Verify string plus array containing null and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("x" as ESObject) + ([null, undefined] as ESObject)).assertEqual("x,")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0650
     * @tc.name testStringOperator055
     * @tc.desc Verify string plus arrow function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = () => 42
      let result: string = ("x" as ESObject) + (fn as ESObject)
      expect(result.startsWith("x() =>")).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0690
     * @tc.name testStringOperator059
     * @tc.desc Verify 1 plus 2 plus string 3 does numeric addition then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) + (2 as ESObject) + ("3" as ESObject)).assertEqual("33")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0700
     * @tc.name testStringOperator060
     * @tc.desc Verify 1 plus 2 plus 3 plus string 4 evaluates left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) + (2 as ESObject) + (3 as ESObject) + ("4" as ESObject)).assertEqual("64")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0710
     * @tc.name testStringOperator061
     * @tc.desc Verify string 1 plus 2 plus 3 concatenates all after first string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("1" as ESObject) + (2 as ESObject) + (3 as ESObject)).assertEqual("123")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0720
     * @tc.name testStringOperator062
     * @tc.desc Verify string 1 plus 2 plus 3 plus 4 concatenates after first string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("1" as ESObject) + (2 as ESObject) + (3 as ESObject) + (4 as ESObject)).assertEqual("1234")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0730
     * @tc.name testStringOperator063
     * @tc.desc Verify 1 plus string 2 plus 3 evaluates left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) + ("2" as ESObject) + (3 as ESObject)).assertEqual("123")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0740
     * @tc.name testStringOperator064
     * @tc.desc Verify string a plus 1 plus 2 plus string b concatenates after first string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("a" as ESObject) + (1 as ESObject) + (2 as ESObject) + ("b" as ESObject)).assertEqual("a12b")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0750
     * @tc.name testStringOperator065
     * @tc.desc Verify 1 plus 2 plus string a plus 3 plus 4 evaluates left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) + (2 as ESObject) + ("a" as ESObject) + (3 as ESObject) + (4 as ESObject))
        .assertEqual("3a34")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0760
     * @tc.name testStringOperator066
     * @tc.desc Verify string a plus parentheses 1 plus 2 does numeric addition in parentheses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("a" as ESObject) + ((1 as ESObject) + (2 as ESObject))).assertEqual("a3")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0770
     * @tc.name testStringOperator067
     * @tc.desc Verify parentheses string a plus 1 plus parentheses 2 plus 3 evaluates first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((("a" as ESObject) + (1 as ESObject)) + ((2 as ESObject) + (3 as ESObject))).assertEqual("a15")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0780
     * @tc.name testStringOperator068
     * @tc.desc Verify 1 plus nested parentheses 2 plus string 3 plus 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) + ((2 as ESObject) + (("3" as ESObject) + (4 as ESObject)))).assertEqual("1234")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0790
     * @tc.name testStringOperator069
     * @tc.desc Verify plus has higher precedence than less than
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((("a" as ESObject) + ("b" as ESObject)) < ("c" as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0800
     * @tc.name testStringOperator070
     * @tc.desc Verify basic string concatenation assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Hello"
      s += " World"
      expect(s).assertEqual("Hello World")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0810
     * @tc.name testStringOperator071
     * @tc.desc Verify empty string plus equals string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = ""
      s += "data"
      expect(s).assertEqual("data")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0820
     * @tc.name testStringOperator072
     * @tc.desc Verify string plus equals empty string with no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "abc"
      s += ""
      expect(s).assertEqual("abc")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0830
     * @tc.name testStringOperator073
     * @tc.desc Verify string plus equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Count: "
      s += (42 as ESObject)
      expect(s).assertEqual("Count: 42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0840
     * @tc.name testStringOperator074
     * @tc.desc Verify string plus equals negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Temp: "
      s += (-5 as ESObject)
      expect(s).assertEqual("Temp: -5")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0850
     * @tc.name testStringOperator075
     * @tc.desc Verify string plus equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Result: "
      s += (NaN as ESObject)
      expect(s).assertEqual("Result: NaN")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0860
     * @tc.name testStringOperator076
     * @tc.desc Verify string plus equals Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Value: "
      s += (Infinity as ESObject)
      expect(s).assertEqual("Value: Infinity")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0870
     * @tc.name testStringOperator077
     * @tc.desc Verify string plus equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Flag: "
      s += (true as ESObject)
      expect(s).assertEqual("Flag: true")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0880
     * @tc.name testStringOperator078
     * @tc.desc Verify string plus equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Flag: "
      s += (false as ESObject)
      expect(s).assertEqual("Flag: false")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0890
     * @tc.name testStringOperator079
     * @tc.desc Verify string plus equals null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Val: "
      s += (null as ESObject)
      expect(s).assertEqual("Val: null")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0900
     * @tc.name testStringOperator080
     * @tc.desc Verify string plus equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Val: "
      s += (undefined as ESObject)
      expect(s).assertEqual("Val: undefined")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0910
     * @tc.name testStringOperator081
     * @tc.desc Verify string plus equals plain object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Obj: "
      s += ({ a: 1 } as ESObject)
      expect(s).assertEqual("Obj: [object Object]")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0920
     * @tc.name testStringOperator082
     * @tc.desc Verify string plus equals array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Arr: "
      s += ([1, 2, 3] as ESObject)
      expect(s).assertEqual("Arr: 1,2,3")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0930
     * @tc.name testStringOperator083
     * @tc.desc Verify three consecutive plus equals concatenations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = ""
      s += "Hello"
      s += " "
      s += "World"
      expect(s).assertEqual("Hello World")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0940
     * @tc.name testStringOperator084
     * @tc.desc Verify plus equals concatenation in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = ""
      for (let i = 0; i < 5; i++) {
        s += `${i},`
      }
      expect(s).assertEqual("0,1,2,3,4,")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0950
     * @tc.name testStringOperator085
     * @tc.desc Verify plus equals concatenation with numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Numbers: "
      let nums: number[] = [10, 20, 30]
      for (let n of nums) {
        s += `${n} `
      }
      expect(s).assertEqual("Numbers: 10 20 30 ")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0960
     * @tc.name testStringOperator086
     * @tc.desc Verify plus equals expression returns concatenated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "abc"
      let result = (s += "def")
      expect(result).assertEqual("abcdef")
      expect(s).assertEqual("abcdef")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0970
     * @tc.name testStringOperator087
     * @tc.desc Verify backtick string equals normal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(`Hello World`).assertEqual("Hello World")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0980
     * @tc.name testStringOperator088
     * @tc.desc Verify template string can contain quotes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(`He said "Hi"`).assertEqual('He said "Hi"')
      expect(`It's mine`).assertEqual("It's mine")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_0990
     * @tc.name testStringOperator089
     * @tc.desc Verify single variable interpolation equals plus concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = "Alice"
      expect(`Hello ${name}`).assertEqual("Hello " + name)
      expect(`Hello ${name}`).assertEqual("Hello Alice")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1000
     * @tc.name testStringOperator090
     * @tc.desc Verify multi variable interpolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1
      let b: number = 2
      expect(`${a} + ${b} = ${a + b}`).assertEqual("1 + 2 = 3")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1010
     * @tc.name testStringOperator091
     * @tc.desc Verify arithmetic expression in interpolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      expect(`Result: ${x * 2 + 5}`).assertEqual("Result: 25")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1020
     * @tc.name testStringOperator092
     * @tc.desc Verify function call in interpolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(`Upper: ${"abc".toUpperCase()}`).assertEqual("Upper: ABC")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1030
     * @tc.name testStringOperator093
     * @tc.desc Verify ternary expression in interpolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let age: number = 20
      expect(`Status: ${age >= 18 ? "adult" : "minor"}`).assertEqual("Status: adult")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1040
     * @tc.name testStringOperator094
     * @tc.desc Verify template string equals plus concatenation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      let y: string = "test"
      let tpl: string = `Value=${x}, Str=${y}`
      let concat: string = "Value=" + x + ", Str=" + y
      expect(tpl).assertEqual(concat)
      expect(tpl).assertEqual("Value=42, Str=test")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1050
     * @tc.name testStringOperator095
     * @tc.desc Verify template string preserves newlines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = `Line1
      Line2
      Line3`
      expect(s.length).assertEqual(29)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1060
     * @tc.name testStringOperator096
     * @tc.desc Verify multi line template string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = `A
      B`
      expect(s.length).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1080
     * @tc.name testStringOperator098
     * @tc.desc Verify template string inside dollar brace interpolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let items: string[] = ["a", "b"]
      let result: string = `Items: ${items.map(i => `[${i}]`).join(", ")}`
      expect(result).assertEqual("Items: [a], [b]")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1090
     * @tc.name testStringOperator099
     * @tc.desc Verify multi level nested template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      let result: string = `${`Value=${x}`}`
      expect(result).assertEqual("Value=5")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1100
     * @tc.name testStringOperator100
     * @tc.desc Verify backtick in template string needs escaping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(`Backtick: \``).assertEqual("Backtick: `")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1110
     * @tc.name testStringOperator101
     * @tc.desc Verify dollar brace in template string needs escaping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(`Dollar: \${notVar}`).assertEqual("Dollar: ${notVar}")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1120
     * @tc.name testStringOperator102
     * @tc.desc Verify backslash in template string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(`Path: C:\\Users`).assertEqual("Path: C:\\Users")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1130
     * @tc.name testStringOperator103
     * @tc.desc Verify string concatenation with unicode escape sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("\u0041" + "\u0042").assertEqual("AB")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1140
     * @tc.name testStringOperator104
     * @tc.desc Verify Chinese unicode concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("\u4f60" + "\u597d").assertEqual("你好")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1150
     * @tc.name testStringOperator105
     * @tc.desc Verify two emoji characters concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "😀" + "🎉"
      expect(result.length).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1160
     * @tc.name testStringOperator106
     * @tc.desc Verify emoji plus ASCII character concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hi " + "😀"
      expect(result).assertEqual("Hi 😀")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1170
     * @tc.name testStringOperator107
     * @tc.desc Verify ZWJ combined emoji concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let family: string = "👨" + "\u200d" + "👩" + "\u200d" + "👦"
      expect(family).assertEqual("👨‍👩‍👦")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1180
     * @tc.name testStringOperator108
     * @tc.desc Verify surrogate pair characters are not split
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathA: string = "\uD835\uDC00"
      expect(mathA.length).assertEqual(2)
      expect(mathA + "B").assertEqual("𝐀B")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1190
     * @tc.name testStringOperator109
     * @tc.desc Verify string plus newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Line1" + "\n" + "Line2").assertEqual("Line1\nLine2")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1200
     * @tc.name testStringOperator110
     * @tc.desc Verify string plus tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Col1" + "\t" + "Col2").assertEqual("Col1\tCol2")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1210
     * @tc.name testStringOperator111
     * @tc.desc Verify string plus carriage return character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("A" + "\r" + "B").assertEqual("A\rB")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1220
     * @tc.name testStringOperator112
     * @tc.desc Verify string plus backslash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Path" + "\\").assertEqual("Path\\")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1230
     * @tc.name testStringOperator113
     * @tc.desc Verify hex escape x41 concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("\x41" + "\x42").assertEqual("AB")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1240
     * @tc.name testStringOperator114
     * @tc.desc Verify null byte x00 concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("A" + "\x00" + "B").length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1250
     * @tc.name testStringOperator115
     * @tc.desc Verify string a plus string b equals concat method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a" + "b").assertEqual("a".concat("b"))
      expect("a" + "b").assertEqual("ab")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1260
     * @tc.name testStringOperator116
     * @tc.desc Verify multiple string concatenation vs concat with multiple params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a" + "b" + "c").assertEqual("a".concat("b", "c"))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1270
     * @tc.name testStringOperator117
     * @tc.desc Verify concat calls toString on number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("x".concat((42 as ESObject) as string)).assertEqual("x42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1280
     * @tc.name testStringOperator118
     * @tc.desc Verify array join equals loop plus equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = ""
      let parts: string[] = ["a", "b", "c", "d"]
      for (let p of parts) {
        s1 += p
      }
      let s2: string = parts.join("")
      expect(s1).assertEqual(s2)
      expect(s1).assertEqual("abcd")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1290
     * @tc.name testStringOperator119
     * @tc.desc Verify join with specified separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parts: string[] = ["2024", "01", "15"]
      let result: string = parts.join("-")
      expect(result).assertEqual("2024-01-15")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1300
     * @tc.name testStringOperator120
     * @tc.desc Verify conditional join is clearer than plus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = "Alice"
      let age: number = 30
      let hasEmail: boolean = true
      let s1: string = `Name: ${name}, Age: ${age}` + (hasEmail ? ", Email: yes" : "")
      let parts: string[] = [`Name: ${name}`, `Age: ${age}`]
      if (hasEmail) {
        parts.push("Email: yes")
      }
      let s2: string = parts.join(", ")
      expect(s1).assertEqual("Name: Alice, Age: 30, Email: yes")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1310
     * @tc.name testStringOperator121
     * @tc.desc Verify number plus empty string equals String number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 42
      expect((n as ESObject) + "").assertEqual(String(n))
      expect((n as ESObject) + "").assertEqual("42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1320
     * @tc.name testStringOperator122
     * @tc.desc Verify boolean plus empty string equals String boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: boolean = true
      expect((b as ESObject) + "").assertEqual(String(b))
      expect((b as ESObject) + "").assertEqual("true")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1330
     * @tc.name testStringOperator123
     * @tc.desc Verify null plus empty string equals String null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) + "").assertEqual("null")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1340
     * @tc.name testStringOperator124
     * @tc.desc Verify undefined plus empty string equals String undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((undefined as ESObject) + "").assertEqual("undefined")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1350
     * @tc.name testStringOperator125
     * @tc.desc Verify object plus empty string equals String object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: GeneratedObjectLiteralInterface_1 = { a: 1 }
      expect((obj as ESObject) + "").assertEqual(String(obj))
      expect((obj as ESObject) + "").assertEqual("[object Object]")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1360
     * @tc.name testStringOperator126
     * @tc.desc Verify 0 converts to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(0)).assertEqual("0")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1370
     * @tc.name testStringOperator127
     * @tc.desc Verify negative zero converts to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(-0)).assertEqual("0")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1380
     * @tc.name testStringOperator128
     * @tc.desc Verify large integer converts to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(123456789)).assertEqual("123456789")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1390
     * @tc.name testStringOperator129
     * @tc.desc Verify normal float converts to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(3.14)).assertEqual("3.14")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1400
     * @tc.name testStringOperator130
     * @tc.desc Verify integer float with dot zero omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(5.0)).assertEqual("5")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1410
     * @tc.name testStringOperator131
     * @tc.desc Verify very small float converts to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(0.000001)).assertEqual("0.000001")
      expect(String(0.0000001)).assertEqual("1e-7")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1420
     * @tc.name testStringOperator132
     * @tc.desc Verify NaN converts to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(NaN)).assertEqual("NaN")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1430
     * @tc.name testStringOperator133
     * @tc.desc Verify Infinity converts to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(Infinity)).assertEqual("Infinity")
      expect(String(-Infinity)).assertEqual("-Infinity")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1440
     * @tc.name testStringOperator134
     * @tc.desc Verify true converts to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(true)).assertEqual("true")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1450
     * @tc.name testStringOperator135
     * @tc.desc Verify false converts to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(false)).assertEqual("false")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1460
     * @tc.name testStringOperator136
     * @tc.desc Verify null converts to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(null)).assertEqual("null")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1470
     * @tc.name testStringOperator137
     * @tc.desc Verify undefined converts to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(undefined)).assertEqual("undefined")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1480
     * @tc.name testStringOperator138
     * @tc.desc Verify plain object toString returns object Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String({})).assertEqual("[object Object]")
      expect(String({ x: 1 })).assertEqual("[object Object]")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1490
     * @tc.name testStringOperator139
     * @tc.desc Verify empty array toString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String([])).assertEqual("")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1500
     * @tc.name testStringOperator140
     * @tc.desc Verify array toString joins elements with comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String([1, 2, 3])).assertEqual("1,2,3")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1510
     * @tc.name testStringOperator141
     * @tc.desc Verify single element array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String([42])).assertEqual("42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1520
     * @tc.name testStringOperator142
     * @tc.desc Verify array with null and undefined toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String([1, null, 3])).assertEqual("1,,3")
      expect(String([1, undefined, 3])).assertEqual("1,,3")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1530
     * @tc.name testStringOperator143
     * @tc.desc Verify Date object toString returns date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Date(2024, 0, 1)
      let s: string = String(d)
      expect(s.includes("2024")).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1540
     * @tc.name testStringOperator144
     * @tc.desc Verify RegExp object toString returns regex string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re = /abc/gi
      expect(String(re)).assertEqual("/abc/gi")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1570
     * @tc.name testStringOperator147
     * @tc.desc Verify comparison of same case lowercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("apple" < "banana").assertTrue()
      expect("banana" < "apple").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1580
     * @tc.name testStringOperator148
     * @tc.desc Verify comparison of same prefix different length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc" < "abcd").assertTrue()
      expect("abcd" < "abc").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1590
     * @tc.name testStringOperator149
     * @tc.desc Verify comparison of identical strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc" < "abc").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1600
     * @tc.name testStringOperator150
     * @tc.desc Verify uppercase letter is less than lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Z" < "a").assertTrue()
      expect("a" < "Z").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1610
     * @tc.name testStringOperator151
     * @tc.desc Verify comparison of same letter different case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("A" < "a").assertTrue()
      expect("a" < "A").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1620
     * @tc.name testStringOperator152
     * @tc.desc Verify numeric string comparison by lexicographic order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("10" < "9").assertTrue()
      expect("9" < "10").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1630
     * @tc.name testStringOperator153
     * @tc.desc Verify numeric string lexicographic vs numeric order difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("100" < "20").assertTrue()
      expect(100 < 20).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1640
     * @tc.name testStringOperator154
     * @tc.desc Verify Chinese character comparison by Unicode code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("啊" < "阿").assertTrue()
      expect("你" < "好").assertTrue()
    });
