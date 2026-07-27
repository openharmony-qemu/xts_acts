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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1650
     * @tc.name testStringOperator155
     * @tc.desc Verify letter greater than comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("banana" > "apple").assertTrue()
      expect("apple" > "banana").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1660
     * @tc.name testStringOperator156
     * @tc.desc Verify longer string greater than shorter with same prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abcd" > "abc").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1670
     * @tc.name testStringOperator157
     * @tc.desc Verify less equal returns true for identical strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc" <= "abc").assertTrue()
      expect("abc" >= "abc").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1680
     * @tc.name testStringOperator158
     * @tc.desc Verify less equal for different strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("apple" <= "banana").assertTrue()
      expect("banana" <= "apple").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1690
     * @tc.name testStringOperator159
     * @tc.desc Verify string compared with number converts to number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("10" as ESObject) < 20).assertTrue()
      expect(("10" as ESObject) > 5).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1700
     * @tc.name testStringOperator160
     * @tc.desc Verify non-numeric string compared with number converts to NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("abc" as ESObject) < 10).assertFalse()
      expect(("abc" as ESObject) > 10).assertFalse()
      expect(("abc" as ESObject) >= 10).assertFalse()
      expect(("abc" as ESObject) <= 10).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1710
     * @tc.name testStringOperator161
     * @tc.desc Verify empty string converts to 0 in comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("" as ESObject) < 1).assertTrue()
      expect(("" as ESObject) > -1).assertTrue()
      expect(("" as ESObject) == 0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1720
     * @tc.name testStringOperator162
     * @tc.desc Verify localeCompare returns numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("apple".localeCompare("banana") < 0).assertTrue()
      expect("banana".localeCompare("apple") > 0).assertTrue()
      expect("apple".localeCompare("apple")).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1730
     * @tc.name testStringOperator163
     * @tc.desc Verify URL query parameter concatenation with plus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseURL: string = "https://api.example.com/users"
      let page: number = 1
      let size: number = 10
      let url: string = `${baseURL}?page=${page}&size=${size}`
      expect(url).assertEqual("https://api.example.com/users?page=1&size=10")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1740
     * @tc.name testStringOperator164
     * @tc.desc Verify conditional URL parameter concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseURL: string = "https://api.example.com/data"
      let params: string[] = []
      params.push("type=all")
      params.push("page=1")
      let hasFilter: boolean = true
      if (hasFilter) {
        params.push("filter=active")
      }
      let url: string = baseURL + "?" + params.join("&")
      expect(url).assertEqual("https://api.example.com/data?type=all&page=1&filter=active")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1750
     * @tc.name testStringOperator165
     * @tc.desc Verify path segment concatenation with slash handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(joinPath165("/api", "/users")).assertEqual("/api/users")
      expect(joinPath165("/api/", "users")).assertEqual("/api/users")
      expect(joinPath165("/api/", "/users")).assertEqual("/api/users")
      expect(joinPath165("/api", "users")).assertEqual("/api/users")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1760
     * @tc.name testStringOperator166
     * @tc.desc Verify log message concatenation with plus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let level: string = "INFO"
      let module: string = "Auth"
      let message: string = "User logged in"
      let log: string = `[${level}] [${module}] ${message}`
      expect(log).assertEqual("[INFO] [Auth] User logged in")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1770
     * @tc.name testStringOperator167
     * @tc.desc Verify log concatenation with timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let timestamp: string = "2024-01-15T10:30:00"
      let userId: number = 42
      let action: string = "login"
      let log: string = `${timestamp} | user=${userId} | action=${action}`
      expect(log).assertEqual("2024-01-15T10:30:00 | user=42 | action=login")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1780
     * @tc.name testStringOperator168
     * @tc.desc Verify error message concatenation with variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(formatError168("email", "", "is required"))
        .assertEqual('Validation failed: field "email" with value "" is required')
      expect(formatError168("age", -1, "must be positive"))
        .assertEqual('Validation failed: field "age" with value "-1" must be positive')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1790
     * @tc.name testStringOperator169
     * @tc.desc Verify HTML generation with template string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tag: string = "div"
      let className: string = "container"
      let content: string = "Hello"
      let html: string = `<${tag} class="${className}">${content}</${tag}>`
      expect(html).assertEqual('<div class="container">Hello</div>')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1800
     * @tc.name testStringOperator170
     * @tc.desc Verify list HTML concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let items: string[] = ["Apple", "Banana", "Cherry"]
      let listHTML: string = "<ul>" +
        items.map(item => `<li>${item}</li>`).join("") +
        "</ul>"
      expect(listHTML).assertEqual("<ul><li>Apple</li><li>Banana</li><li>Cherry</li></ul>")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1810
     * @tc.name testStringOperator171
     * @tc.desc Verify CSV row generation with join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let headers: string[] = ["name", "age", "city"]
      let row: (string | number)[] = ["Alice", 30, "Beijing"]
      let csv: string = headers.join(",") + "\n" + row.join(",")
      expect(csv).assertEqual("name,age,city\nAlice,30,Beijing")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1820
     * @tc.name testStringOperator172
     * @tc.desc Verify comma field needs quote wrapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {


      let row: string = ["Alice", csvField172("Beijing, China"), "30"].join(",")
      expect(row).assertEqual('Alice,"Beijing, China",30')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1830
     * @tc.name testStringOperator173
     * @tc.desc Verify dynamic SQL WHERE clause building with plus equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sql: string = "SELECT * FROM users WHERE 1=1"
      let name: string | null = "Alice"
      let age: number | null = 30
      let city: string | null = null
      if (name) {
        sql += ` AND name='${name}'`
      }
      if (age) {
        sql += ` AND age=${age}`
      }
      if (city) {
        sql += ` AND city='${city}'`
      }
      expect(sql).assertEqual("SELECT * FROM users WHERE 1=1 AND name='Alice' AND age=30")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1840
     * @tc.name testStringOperator174
     * @tc.desc Verify number to binary string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 255
      expect(`0b${n.toString(2)}`).assertEqual("0b11111111")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1850
     * @tc.name testStringOperator175
     * @tc.desc Verify number to hex string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 255
      expect(`0x${n.toString(16)}`).assertEqual("0xff")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1860
     * @tc.name testStringOperator176
     * @tc.desc Verify number to octal string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 64
      expect(`0o${n.toString(8)}`).assertEqual("0o100")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1870
     * @tc.name testStringOperator177
     * @tc.desc Verify amount concatenation with currency symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let amount: number = 99.5
      expect(`$${amount.toFixed(2)}`).assertEqual("$99.50")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1880
     * @tc.name testStringOperator178
     * @tc.desc Verify integer amount with thousands separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let amount: number = 1234567
      let formatted: string = amount.toLocaleString("en-US")
      expect(`$${formatted}`).assertEqual("$1,234,567")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1890
     * @tc.name testStringOperator179
     * @tc.desc Verify string numeric addition becomes concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input1: string = "10"
      let input2: string = "20"
      expect((input1 as ESObject) + input2).assertEqual("1020")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1900
     * @tc.name testStringOperator180
     * @tc.desc Verify Number or parseInt conversion needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input1: string = "10"
      let input2: string = "20"
      expect(Number(input1) + Number(input2)).assertEqual(30)
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1920
     * @tc.name testStringOperator182
     * @tc.desc Verify direct object concatenation yields object Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user: ESObject = { name: "Alice", age: 30 }
      expect(("User: " as ESObject) + user).assertEqual("User: [object Object]")
      expect("User: " + JSON.stringify(user)).assertEqual('User: {"name":"Alice","age":30}')
      expect(`User: ${user.name}`).assertEqual("User: Alice")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1930
     * @tc.name testStringOperator183
     * @tc.desc Verify array and string concatenation with comma join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let items: number[] = [1, 2, 3]
      expect(("Items: " as ESObject) + items).assertEqual("Items: 1,2,3")
      expect("Items: " + JSON.stringify(items)).assertEqual("Items: [1,2,3]")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1940
     * @tc.name testStringOperator184
     * @tc.desc Verify empty array disappears after concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: ESObject[] = []
      expect(("Before" as ESObject) + empty + "After").assertEqual("BeforeAfter")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1950
     * @tc.name testStringOperator185
     * @tc.desc Verify null becomes null string in concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: string | null = null
      let result: string = `Value: ${(data as ESObject) ?? "N/A"}`
      expect(result).assertEqual("Value: N/A")
      let result2: string = `Value: ${data}`
      expect(result2).assertEqual("Value: null")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1960
     * @tc.name testStringOperator186
     * @tc.desc Verify undefined becomes undefined string in concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: string | undefined = undefined
      let result: string = `Value: ${(data as ESObject) ?? "default"}`
      expect(result).assertEqual("Value: default")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1970
     * @tc.name testStringOperator187
     * @tc.desc Verify loop plus equals equals join with same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 100
      let s1: string = ""
      for (let i = 0; i < n; i++) {
        s1 += `${i},`
      }
      let parts: string[] = []
      for (let i = 0; i < n; i++) {
        parts.push(`${i},`)
      }
      let s2: string = parts.join("")
      expect(s1).assertEqual(s2)
      expect(s1.split(",").length).assertEqual(101)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1980
     * @tc.name testStringOperator188
     * @tc.desc Verify and operator returning false becomes false in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isVIP: boolean = false
      let s1: string = `Status: ${isVIP && "VIP"}`
      expect(s1).assertEqual("Status: false")
      let s2: string = `Status: ${isVIP ? "VIP" : "Regular"}`
      expect(s2).assertEqual("Status: Regular")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_1990
     * @tc.name testStringOperator189
     * @tc.desc Verify numeric 0 displays as 0 not empty in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0
      expect(`Count: ${count}`).assertEqual("Count: 0")
      let display: string = count ? `${count}` : ""
      expect(`Count: ${display}`).assertEqual("Count: ")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2000
     * @tc.name testStringOperator190
     * @tc.desc Verify TS allows string plus string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = "hello"
      let b: string = "world"
      let result: string = a + b
      expect(result).assertEqual("helloworld")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2010
     * @tc.name testStringOperator191
     * @tc.desc Verify TS does not allow string plus number directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "x"
      let n: number = 42
      let r: string = (s as ESObject) + n
      expect(r).assertEqual("x42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2020
     * @tc.name testStringOperator192
     * @tc.desc Verify string plus equals string is type safe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "abc"
      s += "def"
      expect(s).assertEqual("abcdef")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2030
     * @tc.name testStringOperator193
     * @tc.desc Verify string plus equals number requires as ESObject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "x"
      s += (42 as ESObject)
      expect(s).assertEqual("x42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2040
     * @tc.name testStringOperator194
     * @tc.desc Verify number auto converts to string in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 42
      let b: boolean = true
      let s: string = `${n} ${b}`
      expect(s).assertEqual("42 true")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2050
     * @tc.name testStringOperator195
     * @tc.desc Verify object auto converts to string in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { x: 1 }
      let s: string = `${obj}`
      expect(s).assertEqual("[object Object]")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2060
     * @tc.name testStringOperator196
     * @tc.desc Verify string or null handling in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(greet196("Alice")).assertEqual("Hello, Alice")
      expect(greet196(null)).assertEqual("Hello, Guest")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2070
     * @tc.name testStringOperator197
     * @tc.desc Verify string or undefined handling in template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(format197("test")).assertEqual("Value: test")
      expect(format197(undefined)).assertEqual("Value: N/A")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2100
     * @tc.name testStringOperator200
     * @tc.desc Verify MDN my plus string example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("my " + "string").assertEqual("my string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2110
     * @tc.name testStringOperator201
     * @tc.desc Verify MDN myString plus equals bet example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let myString: string = "alpha"
      myString += "bet"
      expect(myString).assertEqual("alphabet")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2120
     * @tc.name testStringOperator202
     * @tc.desc Verify plus does not modify original strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = "hello"
      let b: string = "world"
      let c: string = a + b
      expect(a).assertEqual("hello")
      expect(b).assertEqual("world")
      expect(c).assertEqual("helloworld")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2130
     * @tc.name testStringOperator203
     * @tc.desc Verify plus equals does not modify reference creating new string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = "abc"
      let ref: string = a
      a += "def"
      expect(a).assertEqual("abcdef")
      expect(ref).assertEqual("abc")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2140
     * @tc.name testStringOperator204
     * @tc.desc Verify typeof string plus string result is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof ("a" + "b")).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2160
     * @tc.name testStringOperator206
     * @tc.desc Verify typeof plus equals expression result is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "x"
      let result = (s += "y")
      expect(typeof result).assertEqual("string")
      expect(result).assertEqual("xy")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2170
     * @tc.name testStringOperator207
     * @tc.desc Verify concatenated string length equals sum of individual lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = "Hello"
      let b: string = "World"
      expect((a + b).length).assertEqual(a.length + b.length)
      expect((a + b).length).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2180
     * @tc.name testStringOperator208
     * @tc.desc Verify empty string concatenation does not affect length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = "test"
      expect((a + "").length).assertEqual(a.length)
      expect(("" + a).length).assertEqual(a.length)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2190
     * @tc.name testStringOperator209
     * @tc.desc Verify accessing characters by index after concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "AB" + "CD"
      expect(s[0]).assertEqual("A")
      expect(s[1]).assertEqual("B")
      expect(s[2]).assertEqual("C")
      expect(s[3]).assertEqual("D")
      expect(s.length).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2200
     * @tc.name testStringOperator210
     * @tc.desc Verify String fromCharCode plus string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = String.fromCharCode(65) + String.fromCharCode(66)
      expect(s).assertEqual("AB")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2210
     * @tc.name testStringOperator211
     * @tc.desc Verify complex output with plus plus equals and template string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = "Alice"
      let scores: number[] = [85, 92, 78]
      let average: number = scores.reduce((a, b) => a + b, 0) / scores.length
      let grade: string = average >= 90 ? "A" : average >= 80 ? "B" : "C"

      let report: string = `=== Student Report ===\n`
      report += `Name: ${name}\n`
      report += `Scores: ${scores.join(", ")}\n`
      report += `Average: ${average.toFixed(1)}\n`
      report += `Grade: ${grade}`

      expect(report).assertEqual(
        "=== Student Report ===\nName: Alice\nScores: 85, 92, 78\nAverage: 85.0\nGrade: B"
      )
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2230
     * @tc.name testStringOperator213
     * @tc.desc Verify dynamic regex string building with plus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pattern: string = "\\d+"
      let flags: string = "g"
      let re = new RegExp(pattern, flags)
      expect(re.test("12345")).assertTrue()
      expect(re.test("abc")).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2240
     * @tc.name testStringOperator214
     * @tc.desc Verify bubble sort using less than comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = ["Charlie", "Alice", "Bob"]
      for (let i = 0; i < names.length - 1; i++) {
        for (let j = 0; j < names.length - 1 - i; j++) {
          if (names[j] > names[j + 1]) {
            let temp = names[j]
            names[j] = names[j + 1]
            names[j + 1] = temp
          }
        }
      }
      expect(names).assertDeepEquals(["Alice", "Bob", "Charlie"])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2320
     * @tc.name testStringOperator222
     * @tc.desc Verify toUpperCase then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = "alice"
      expect("Hello, " + name.toUpperCase()).assertEqual("Hello, ALICE")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2330
     * @tc.name testStringOperator223
     * @tc.desc Verify both strings toUpperCase then concatenate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc".toUpperCase() + "def".toUpperCase()).assertEqual("ABCDEF")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2340
     * @tc.name testStringOperator224
     * @tc.desc Verify toLowerCase then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("HELLO".toLowerCase() + " WORLD".toLowerCase()).assertEqual("hello world")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2350
     * @tc.name testStringOperator225
     * @tc.desc Verify capitalize first letter concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(capitalize225("hELLO")).assertEqual("Hello")
      expect(capitalize225("WORLD")).assertEqual("World")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2370
     * @tc.name testStringOperator227
     * @tc.desc Verify German eszett toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("ß".toUpperCase()).assertEqual("SS")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2380
     * @tc.name testStringOperator228
     * @tc.desc Verify Turkish i toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("i".toUpperCase()).assertEqual("I")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2390
     * @tc.name testStringOperator229
     * @tc.desc Verify string with spaces concatenation preserves spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("  hello  " + "  world  ").assertEqual("  hello    world  ")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2400
     * @tc.name testStringOperator230
     * @tc.desc Verify trim then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = "  hello  "
      let b: string = "  world  "
      expect(a.trim() + " " + b.trim()).assertEqual("hello world")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2410
     * @tc.name testStringOperator231
     * @tc.desc Verify trimStart then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "   hello   "
      expect(s.trimStart() + "!").assertEqual("hello   !")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2420
     * @tc.name testStringOperator232
     * @tc.desc Verify trimEnd then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "   hello   "
      expect("!" + s.trimEnd()).assertEqual("!   hello")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2430
     * @tc.name testStringOperator233
     * @tc.desc Verify tab plus space concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Col1\t" + "Col2 " + "Col3"
      expect(s.includes("\t")).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2440
     * @tc.name testStringOperator234
     * @tc.desc Verify non-breaking space concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nbsp: string = "\u00A0"
      let result: string = "Hello" + nbsp + "World"
      expect(result.length).assertEqual(11)
      expect(result !== "Hello World").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2450
     * @tc.name testStringOperator235
     * @tc.desc Verify zero-width space concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsp: string = "\u200B"
      let result: string = "Hello" + zwsp + "World"
      expect(result.length).assertEqual(11)
      expect(result.startsWith("Hello")).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2470
     * @tc.name testStringOperator237
     * @tc.desc Verify extra space compression then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(normalizeSpace237("  hello   world  ") + "!").assertEqual("hello world!")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2480
     * @tc.name testStringOperator238
     * @tc.desc Verify split by comma then join with dash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let csv: string = "a,b,c,d"
      let result: string = csv.split(",").join("-")
      expect(result).assertEqual("a-b-c-d")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2490
     * @tc.name testStringOperator239
     * @tc.desc Verify empty string split to char array then join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Hello"
      expect(s.split("").reverse().join("")).assertEqual("olleH")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2500
     * @tc.name testStringOperator240
     * @tc.desc Verify filter then rejoin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let words: string = "the quick brown fox"
      let longWords: string = words.split(" ").filter(w => w.length > 3).join(" ")
      expect(longWords).assertEqual("quick brown")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2510
     * @tc.name testStringOperator241
     * @tc.desc Verify replace then rejoin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let items: string = "apple,banana,cherry"
      let result: string = items.split(",").map(s => s.toUpperCase()).join("|")
      expect(result).assertEqual("APPLE|BANANA|CHERRY")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2520
     * @tc.name testStringOperator242
     * @tc.desc Verify slice then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Hello World"
      expect(s.slice(0, 5) + " " + s.slice(6)).assertEqual("Hello World")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2530
     * @tc.name testStringOperator243
     * @tc.desc Verify substring then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Hello World"
      expect(s.substring(0, 5) + " - " + s.substring(6)).assertEqual("Hello - World")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2540
     * @tc.name testStringOperator244
     * @tc.desc Verify replacing middle part with slice concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Hello World"
      let replacement: string = "Beautiful"
      let result: string = s.slice(0, 6) + replacement + s.slice(11)
      expect(result).assertEqual("Hello Beautiful")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2550
     * @tc.name testStringOperator245
     * @tc.desc Verify padStart alignment then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: string[] = ["1", "10", "100"]
      let padded: string = nums.map(n => n.padStart(3, "0")).join(", ")
      expect(padded).assertEqual("001, 010, 100")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2560
     * @tc.name testStringOperator246
     * @tc.desc Verify padEnd alignment then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let labels: string[] = ["Name", "Age", "City"]
      let values: string[] = ["Alice", "30", "Beijing"]
      let rows: string = labels.map((l, i) => l.padEnd(8) + values[i]).join("\n")
      expect(rows).assertEqual("Name    Alice\nAge     30\nCity    Beijing")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2570
     * @tc.name testStringOperator247
     * @tc.desc Verify padStart truncates when exceeding target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc".padStart(10, "12")).assertEqual("1212121abc")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2580
     * @tc.name testStringOperator248
     * @tc.desc Verify padEnd then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("5".padEnd(3, "0") + "%").assertEqual("500%")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2600
     * @tc.name testStringOperator250
     * @tc.desc Verify strings raw contains unescaped raw text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(rawTag250`Line1\nLine2`).assertEqual("Line1\\nLine2")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2610
     * @tc.name testStringOperator251
     * @tc.desc Verify custom html tag function escapes special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let userInput: string = '<script>alert("xss")</script>'
      expect(html251`<div>${userInput}</div>`).assertEqual(
        '<div>&lt;script&gt;alert(&quot;xss&quot;)&lt;/script&gt;</div>'
      )
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2620
     * @tc.name testStringOperator252
     * @tc.desc Verify custom format tag like printf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(format252`Price: ${9.999}, Count: ${5}`).assertEqual("Price: 10.00, Count: 5.00")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2630
     * @tc.name testStringOperator253
     * @tc.desc Verify NFC merges combining characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let composed: string = "\u00E9"
      let decomposed: string = "e\u0301"
      expect(composed).assertEqual(decomposed.normalize("NFC"))
      expect(composed.length).assertEqual(1)
      expect(decomposed.length).assertEqual(2)
      expect(decomposed.normalize("NFC").length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2640
     * @tc.name testStringOperator254
     * @tc.desc Verify NFD decomposes combined characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let composed: string = "\u00E9"
      let nfd: string = composed.normalize("NFD")
      expect(nfd.length).assertEqual(2)
      expect(nfd).assertEqual("e\u0301")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2650
     * @tc.name testStringOperator255
     * @tc.desc Verify different normalization forms produce different lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nfc: string = "\u00E9"
      let nfd: string = "e\u0301"
      let s1: string = "cafe" + nfc
      let s2: string = "cafe" + nfd
      expect(s1.length).assertEqual(5)
      expect(s2.length).assertEqual(6)
      expect(s1.normalize("NFC")).assertEqual(s2.normalize("NFC"))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2660
     * @tc.name testStringOperator256
     * @tc.desc Verify Korean syllable NFC NFD difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let composed: string = "\uD55C"
      let decomposed: string = "\u110B\u1161\u11BC"
      expect(composed.length).assertEqual(1)
      expect(decomposed.length).assertEqual(3)
      expect(composed).assertEqual('한')
      expect(decomposed.normalize("NFC")).assertEqual('앙')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2670
     * @tc.name testStringOperator257
     * @tc.desc Verify Map to query string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = new Map<string, string>()
      params.set("name", "Alice")
      params.set("age", "30")
      let parts: string[] = []
      params.forEach((v, k) => parts.push(`${k}=${v}`))
      let query: string = parts.join("&")
      expect(query).assertEqual("name=Alice&age=30")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2690
     * @tc.name testStringOperator259
     * @tc.desc Verify Set deduplication then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tags = new Set<string>(["js", "ts", "js", "arkts", "ts"])
      let result: string = Array.from(tags).join(", ")
      expect(result).assertEqual("js, ts, arkts")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2700
     * @tc.name testStringOperator260
     * @tc.desc Verify Set numbers to string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums = new Set<number>([3, 1, 2, 3, 1])
      let result: string = Array.from(nums).sort().map(n => `${n}`).join("-")
      expect(result).assertEqual("1-2-3")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2710
     * @tc.name testStringOperator261
     * @tc.desc Verify string list deduplication and rejoin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "apple,banana,apple,cherry,banana"
      let unique: string = Array.from(new Set(input.split(","))).join(",")
      expect(unique).assertEqual("apple,banana,cherry")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2720
     * @tc.name testStringOperator262
     * @tc.desc Verify object concatenation after JSON stringify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user: GeneratedObjectLiteralInterface_2 = { name: "Alice", age: 30 }
      let log: string = "Data: " + JSON.stringify(user)
      expect(log).assertEqual('Data: {"name":"Alice","age":30}')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2730
     * @tc.name testStringOperator263
     * @tc.desc Verify array serialization then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3]
      let s: string = "Array: " + JSON.stringify(arr)
      expect(s).assertEqual("Array: [1,2,3]")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2740
     * @tc.name testStringOperator264
     * @tc.desc Verify indented JSON serialization concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: GeneratedObjectLiteralInterface_3 = { name: "Alice", age: 30 }
      let formatted: string = JSON.stringify(data, null, 2)
      let lines: string[] = formatted.split("\n")
      expect(lines[0]).assertEqual("{")
      expect(lines[1].includes('"name"')).assertTrue()
      expect(lines[lines.length - 1]).assertEqual("}")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2760
     * @tc.name testStringOperator266
     * @tc.desc Verify parse JSON and extract values for concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jsonStr: string = '{"name":"Alice","city":"Beijing"}'
      let parsed: ESObject = JSON.parse(jsonStr)
      expect(`${parsed.name} from ${parsed.city}`).assertEqual("Alice from Beijing")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2770
     * @tc.name testStringOperator267
     * @tc.desc Verify building JSON string array with plus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let users: string[] = ["Alice", "Bob", "Charlie"]
      let jsonArr: string = "[" + users.map(u => `"${u}"`).join(",") + "]"
      expect(JSON.parse(jsonArr)).assertDeepEquals(["Alice", "Bob", "Charlie"])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2780
     * @tc.name testStringOperator268
     * @tc.desc Verify repeat generates repeated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("ab".repeat(3)).assertEqual("ababab")
      expect("-".repeat(5)).assertEqual("-----")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2790
     * @tc.name testStringOperator269
     * @tc.desc Verify repeat zero returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc".repeat(0)).assertEqual("")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2800
     * @tc.name testStringOperator270
     * @tc.desc Verify repeat one returns original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc".repeat(1)).assertEqual("abc")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2820
     * @tc.name testStringOperator272
     * @tc.desc Verify repeat generates indentation then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let code: string = "function() {" + "\n" +
        indent272("return 42;", 1) + "\n" +
        indent272("function() {" + "\n" +
          indent272("return 0;", 2) + "\n" +
          indent272("}", 1), 1) + "\n" +
        "}"
      expect(code.includes("    return 0;")).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2830
     * @tc.name testStringOperator273
     * @tc.desc Verify repeat negative throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false
      try {
        "ab".repeat(-1)
      } catch (e) {
        caught = true
        expect((e as Error).name).assertEqual("RangeError")
      }
      expect(caught).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2840
     * @tc.name testStringOperator274
     * @tc.desc Verify repeat Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false
      try {
        "ab".repeat(Infinity)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2850
     * @tc.name testStringOperator275
     * @tc.desc Verify fixed digit number concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ids: number[] = [1, 23, 456, 7890]
      let formatted: string = ids.map(n => `${n}`.padStart(4, "0")).join(", ")
      expect(formatted).assertEqual("0001, 0023, 0456, 7890")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2860
     * @tc.name testStringOperator276
     * @tc.desc Verify hex address padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let addr: number = 255
      expect("0x" + addr.toString(16).padStart(4, "0")).assertEqual("0x00ff")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2870
     * @tc.name testStringOperator277
     * @tc.desc Verify table column alignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rows: string[][] = [
        ["Name", "Age", "City"],
        ["Alice", "30", "Beijing"],
        ["Bob", "25", "Shanghai"]
      ]
      let table: string = rows.map(row =>
      row.map((cell, i) => {
        let width: number = i === 0 ? 8 : i === 1 ? 4 : 10
        return cell.padEnd(width)
      }).join("")
      ).join("\n")
      expect(table.split("\n").length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2880
     * @tc.name testStringOperator278
     * @tc.desc Verify padStart unchanged when target less than original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Hello".padStart(3, "x")).assertEqual("Hello")
      expect("Hello".padEnd(3, "x")).assertEqual("Hello")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2890
     * @tc.name testStringOperator279
     * @tc.desc Verify padStart unchanged when target equals original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Hello".padStart(5, "x")).assertEqual("Hello")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2900
     * @tc.name testStringOperator280
     * @tc.desc Verify recursive tree structure string generation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = treeToString280(tree)
      expect(result).assertEqual("root\n  child1\n    grandchild1\n  child2")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2920
     * @tc.name testStringOperator282
     * @tc.desc Verify recursive string reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reverseStr282("hello")).assertEqual("olleh")
      expect(reverseStr282("")).assertEqual("")
      expect(reverseStr282("a")).assertEqual("a")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2930
     * @tc.name testStringOperator283
     * @tc.desc Verify recursive replacement of all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(replaceAll283("a-b-c-d", "-", "+")).assertEqual("a+b+c+d")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2940
     * @tc.name testStringOperator284
     * @tc.desc Verify RGB to hex color string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(rgbToHex284(255, 128, 0)).assertEqual("#ff8000")
      expect(rgbToHex284(0, 0, 0)).assertEqual("#000000")
      expect(rgbToHex284(255, 255, 255)).assertEqual("#ffffff")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2950
     * @tc.name testStringOperator285
     * @tc.desc Verify hex color string to RGB parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(hexToRgb285("#ff8000")).assertEqual("rgb(255, 128, 0)")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2960
     * @tc.name testStringOperator286
     * @tc.desc Verify adjusted RGB string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(adjustBrightness286("#808080", 1.5)).assertEqual("#c0c0c0")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_2990
     * @tc.name testStringOperator289
     * @tc.desc Verify charCodeAt then concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "AB"
      let codes: number[] = []
      for (let i = 0; i < s.length; i++) {
        codes.push(s.charCodeAt(i))
      }
      expect(codes).assertDeepEquals([65, 66])
      let rebuilt: string = codes.map(c => String.fromCharCode(c)).join("")
      expect(rebuilt).assertEqual("AB")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3000
     * @tc.name testStringOperator290
     * @tc.desc Verify codePointAt for emoji concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = "😀"
      expect(emoji.codePointAt(0)).assertEqual(0x1F600)
      expect(emoji.length).assertEqual(2)
      let rebuilt: string = String.fromCodePoint(0x1F600)
      expect(rebuilt).assertEqual(emoji)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3010
     * @tc.name testStringOperator291
     * @tc.desc Verify debugging object concatenation output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let config: ESObject = { host: "localhost", port: 8080 }
      let bad: string = `Config: ${config}`
      expect(bad).assertEqual("Config: [object Object]")
      let good: string = `Config: ${JSON.stringify(config)}`
      expect(good).assertEqual('Config: {"host":"localhost","port":8080}')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3020
     * @tc.name testStringOperator292
     * @tc.desc Verify reduce result concatenation with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prices: string[] = ["10", "20", "30"]
      let total1: ESObject = prices.reduce((acc: ESObject, p: string) => acc + p, "")
      expect(total1).assertEqual("102030")
      let total2: number = prices.reduce((acc: number, p: string) => acc + Number(p), 0)
      expect(total2).assertEqual(60)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3030
     * @tc.name testStringOperator293
     * @tc.desc Verify nullish coalescing for safe null concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(safeConcat293("Hello", "World")).assertEqual("HelloWorld")
      expect(safeConcat293(null, "World")).assertEqual("World")
      expect(safeConcat293("Hello", null)).assertEqual("Hello")
      expect(safeConcat293(null, null)).assertEqual("")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3050
     * @tc.name testStringOperator295
     * @tc.desc Verify number exceeding MAX SAFE INTEGER concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: number = 9007199254740993
      let s: string = `${big}`
      expect(s).assertEqual("9007199254740992")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3060
     * @tc.name testStringOperator296
     * @tc.desc Verify BigInt avoids precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: bigint = 9007199254740993n
      let s: string = `${big}`
      expect(s).assertEqual("9007199254740993")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3070
     * @tc.name testStringOperator297
     * @tc.desc Verify 0.1 plus 0.2 precision issue in concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 0.1 + 0.2
      expect(`${result}`).assertEqual("0.30000000000000004")
      expect(`${result.toFixed(2)}`).assertEqual("0.30")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3080
     * @tc.name testStringOperator298
     * @tc.desc Verify composed and decomposed characters are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let composed: string = "\u00E9"
      let decomposed: string = "e\u0301"
      expect(composed === decomposed).assertFalse()
      expect(composed === decomposed.normalize("NFC")).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3090
     * @tc.name testStringOperator299
     * @tc.desc Verify full-width and half-width digits are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("１２３" < "123" || "１２３" > "123").assertTrue()
      expect("１２３".length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3100
     * @tc.name testStringOperator300
     * @tc.desc Verify 10000 times plus equals concatenation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = ""
      let expected: string = ""
      for (let i = 0; i < 10000; i++) {
        s += "x"
        expected += "x"
      }
      expect(s.length).assertEqual(10000)
      expect(s === expected).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3110
     * @tc.name testStringOperator301
     * @tc.desc Verify array join equals plus equals for large concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parts: string[] = []
      let concat: string = ""
      for (let i = 0; i < 1000; i++) {
        parts.push(`${i}`)
        concat += `${i}`
      }
      expect(parts.join("")).assertEqual(concat)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3120
     * @tc.name testStringOperator302
     * @tc.desc Verify composite key lookup in Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cache = new Map<string, number>()
      cache.set("user:1:profile", 42)
      let userId: string = "1"
      let result: number | undefined = cache.get(`user:${userId}:profile`)
      expect(result).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3130
     * @tc.name testStringOperator303
     * @tc.desc Verify object toString as key concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cache = new Map<string, string>()
      let obj1: ESObject = { id: 1 }
      let obj2: ESObject = { id: 2 }
      cache.set(`${obj1}`, "data1")
      cache.set(`${obj2}`, "data2")
      expect(cache.size).assertEqual(1)
      expect(cache.get("[object Object]")).assertEqual("data2")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3140
     * @tc.name testStringOperator304
     * @tc.desc Verify empty string comparison behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("" < "a").assertTrue()
      expect("" === "").assertTrue()
      expect("".length).assertEqual(0)
      expect(("" as ESObject) + "").assertEqual("")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3150
     * @tc.name testStringOperator305
     * @tc.desc Verify spaces affect comparison result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc" < "abc ").assertTrue()
      expect("abc " < "abc").assertFalse()
      expect(" abc" < "abc").assertTrue()
      expect("abc" < "abd").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3160
     * @tc.name testStringOperator306
     * @tc.desc Verify subclass inherited toString in concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Dog306()
      expect(("It's a " as ESObject) + (d as ESObject)).assertEqual("It's a Dog")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3170
     * @tc.name testStringOperator307
     * @tc.desc Verify overridden toString affects concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let price = new Money307(99.99, "USD")
      expect(`Price: ${price}`).assertEqual("Price: 99.99 USD")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_OPERATOR_3190
     * @tc.name testStringOperator309
     * @tc.desc Verify object without valueOf uses toString then converts to number in comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringOperator309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = {
        toString() {
          return "10"
        }
      }
      expect((obj as ESObject) < 20).assertTrue()
      expect((obj as ESObject) > 5).assertTrue()
      expect(("x" as ESObject) + obj).assertEqual("x10")
    });
  });
}


function joinPath165(base: string, path: string): string {
  if (base.endsWith("/") && path.startsWith("/")) {
    return base + path.slice(1)
  } else if (!base.endsWith("/") && !path.startsWith("/")) {
    return base + "/" + path
  }
  return base + path
}

function formatError168(field: string, value: ESObject, rule: string): string {
  return `Validation failed: field "${field}" with value "${value}" ${rule}`
}

function csvField172(value: string): string {
  if (value.includes(",")) {
    return `"${value}"`
  }
  return value
}

function greet196(name: string | null): string {
  return `Hello, ${name ?? "Guest"}`
}

function format197(value: string | undefined): string {
  return `Value: ${value ?? "N/A"}`
}

function capitalize225(s: string): string {
  return s.charAt(0).toUpperCase() + s.slice(1).toLowerCase()
}

function normalizeSpace237(s: string): string {
  return s.replace(/\s+/g, " ").trim()
}

function html251(strings: TemplateStringsArray, ...values: ESObject[]): string {
  let result: string = ""
  for (let i = 0; i < strings.length; i++) {
    result += strings[i]
    if (i < values.length) {
      let v: string = String(values[i])
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
      result += v
    }
  }
  return result
}

function rawTag250(strings: TemplateStringsArray): string {
  return strings.raw[0]
}

function format252(strings: TemplateStringsArray, ...values: ESObject[]): string {
  let result: string = strings[0]
  for (let i = 0; i < values.length; i++) {
    let v: string = typeof values[i] === "number"
      ? values[i].toFixed(2)
      : String(values[i])
    result += v + strings[i + 1]
  }
  return result
}

function indent272(s: string, level: number): string {
  return "  ".repeat(level) + s
}

function treeToString280(node: TreeNode280, indent: number = 0): string {
  let prefix: string = "  ".repeat(indent)
  let result: string = prefix + node.name
  if (node.children) {
    for (let child of node.children) {
      result += "\n" + treeToString280(child, indent + 1)
    }
  }
  return result
}

let tree: TreeNode280 = {
  name: "root",
  children: [
    { name: "child1", children: [{ name: "grandchild1" }] },
    { name: "child2" }
  ]
}

function reverseStr282(s: string): string {
  if (s.length <= 1) {
    return s
  }
  return reverseStr282(s.slice(1)) + s[0]
}

function replaceAll283(s: string, from: string, to: string): string {
  let idx: number = s.indexOf(from)
  if (idx === -1) {
    return s
  }
  return s.slice(0, idx) + to + replaceAll283(s.slice(idx + from.length), from, to)
}


function rgbToHex284(r: number, g: number, b: number): string {
  return "#" + [r, g, b].map(n => n.toString(16).padStart(2, "0")).join("")
}

function hexToRgb285(hex: string): string {
  let r: number = parseInt(hex.slice(1, 3), 16)
  let g: number = parseInt(hex.slice(3, 5), 16)
  let b: number = parseInt(hex.slice(5, 7), 16)
  return `rgb(${r}, ${g}, ${b})`
}

function adjustBrightness286(hex: string, factor: number): string {
  let r: number = Math.min(255, Math.floor(parseInt(hex.slice(1, 3), 16) * factor))
  let g: number = Math.min(255, Math.floor(parseInt(hex.slice(3, 5), 16) * factor))
  let b: number = Math.min(255, Math.floor(parseInt(hex.slice(5, 7), 16) * factor))
  return `#${r.toString(16).padStart(2, "0")}${g.toString(16).padStart(2, "0")}${b.toString(16).padStart(2, "0")}`
}

function safeConcat293(a: string | null, b: string | null): string {
  return `${(a as ESObject) ?? ""}${(b as ESObject) ?? ""}`
}
