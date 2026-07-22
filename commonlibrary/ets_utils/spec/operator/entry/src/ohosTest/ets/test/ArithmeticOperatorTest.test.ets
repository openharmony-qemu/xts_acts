/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ESObject KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function ArithmeticOperatorTest() {
  describe('ArithmeticOperatorTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0110
     * @tc.name testArithmeticOperator001
     * @tc.desc Verify adding two positive integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 + 3).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0120
     * @tc.name testArithmeticOperator002
     * @tc.desc Verify positive number plus negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 + (-3)).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0130
     * @tc.name testArithmeticOperator003
     * @tc.desc Verify adding two negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-2 + (-3)).assertEqual(-5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0140
     * @tc.name testArithmeticOperator004
     * @tc.desc Verify adding floating point numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1.5 + 2.5).assertEqual(4.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0150
     * @tc.name testArithmeticOperator005
     * @tc.desc Verify integer plus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 + 0).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0160
     * @tc.name testArithmeticOperator006
     * @tc.desc Verify zero plus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 + 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0190
     * @tc.name testArithmeticOperator009
     * @tc.desc Verify Infinity plus finite number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity + 100).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0200
     * @tc.name testArithmeticOperator010
     * @tc.desc Verify Infinity plus negative Infinity equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(Infinity + (-Infinity))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0210
     * @tc.name testArithmeticOperator011
     * @tc.desc Verify negative Infinity plus finite number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-Infinity + 100).assertEqual(-Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0220
     * @tc.name testArithmeticOperator012
     * @tc.desc Verify NaN plus ESObject number equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(NaN + 5)).assertTrue()
      expect(Number.isNaN(5 + NaN)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0230
     * @tc.name testArithmeticOperator013
     * @tc.desc Verify MAX_SAFE_INTEGER plus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MAX_SAFE_INTEGER + 1).assertEqual(9007199254740992)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0240
     * @tc.name testArithmeticOperator014
     * @tc.desc Verify MAX_SAFE_INTEGER plus 2 with precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MAX_SAFE_INTEGER + 2).assertEqual(9007199254740992)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0250
     * @tc.name testArithmeticOperator015
     * @tc.desc Verify MAX_VALUE plus finite number does not overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MAX_VALUE + 1).assertEqual(Number.MAX_VALUE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0260
     * @tc.name testArithmeticOperator016
     * @tc.desc Verify 0.1 plus 0.2 does not equal 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.1 + 0.2).assertEqual(0.30000000000000004)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0270
     * @tc.name testArithmeticOperator017
     * @tc.desc Verify adding extremely small floating point numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MIN_VALUE + 0).assertEqual(Number.MIN_VALUE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0280
     * @tc.name testArithmeticOperator018
     * @tc.desc Verify Number.EPSILON addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 + Number.EPSILON).assertEqual(1 + Number.EPSILON)
      expect(1 + Number.EPSILON > 1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0290
     * @tc.name testArithmeticOperator019
     * @tc.desc Verify concatenating two strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Hello" + " " + "World").assertEqual("Hello World")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0300
     * @tc.name testArithmeticOperator020
     * @tc.desc Verify concatenating with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("" + "abc").assertEqual("abc")
      expect("abc" + "").assertEqual("abc")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0310
     * @tc.name testArithmeticOperator021
     * @tc.desc Verify concatenating Chinese strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("你好" + "世界").assertEqual("你好世界")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0320
     * @tc.name testArithmeticOperator022
     * @tc.desc Verify concatenating strings with special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("line1\n" + "line2").assertEqual("line1\nline2")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0330
     * @tc.name testArithmeticOperator023
     * @tc.desc Verify string plus number concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("count: " + 42).assertEqual("count: 42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0340
     * @tc.name testArithmeticOperator024
     * @tc.desc Verify number plus string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 + " items").assertEqual("42 items")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0350
     * @tc.name testArithmeticOperator025
     * @tc.desc Verify string plus floating point number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("pi: " + 3.14).assertEqual("pi: 3.14")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0360
     * @tc.name testArithmeticOperator026
     * @tc.desc Verify string plus NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("val: " + NaN).assertEqual("val: NaN")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0370
     * @tc.name testArithmeticOperator027
     * @tc.desc Verify string plus Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("val: " + Infinity).assertEqual("val: Infinity")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0380
     * @tc.name testArithmeticOperator028
     * @tc.desc Verify string plus true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("flag: " + true).assertEqual("flag: true")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0390
     * @tc.name testArithmeticOperator029
     * @tc.desc Verify string plus false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("flag: " + false).assertEqual("flag: false")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0400
     * @tc.name testArithmeticOperator030
     * @tc.desc Verify string plus null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("val: " + (null as ESObject)).assertEqual("val: null")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0410
     * @tc.name testArithmeticOperator031
     * @tc.desc Verify string plus undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("val: " + (undefined as ESObject)).assertEqual("val: undefined")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0420
     * @tc.name testArithmeticOperator032
     * @tc.desc Verify string plus object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("obj: " + ({ a: 1 } as ESObject)).assertEqual("obj: [object Object]")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0430
     * @tc.name testArithmeticOperator033
     * @tc.desc Verify string plus array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("arr: " + ([1, 2, 3] as ESObject)).assertEqual("arr: 1,2,3")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0440
     * @tc.name testArithmeticOperator034
     * @tc.desc Verify addition evaluates left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 + 2 + 3).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0450
     * @tc.name testArithmeticOperator035
     * @tc.desc Verify operation order of mixed numbers and strings from left to right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 + 2 + "3").assertEqual("33")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0460
     * @tc.name testArithmeticOperator036
     * @tc.desc Verify string first results in all concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("1" + 2 + 3).assertEqual("123")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0470
     * @tc.name testArithmeticOperator037
     * @tc.desc Verify number plus number returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof (1 + 2)).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0480
     * @tc.name testArithmeticOperator038
     * @tc.desc Verify string involved in addition returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof ("a" + 1)).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0490
     * @tc.name testArithmeticOperator039
     * @tc.desc Verify positive number subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10 - 3).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0500
     * @tc.name testArithmeticOperator040
     * @tc.desc Verify subtraction result is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3 - 10).assertEqual(-7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0510
     * @tc.name testArithmeticOperator041
     * @tc.desc Verify positive number minus negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 - (-3)).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0520
     * @tc.name testArithmeticOperator042
     * @tc.desc Verify subtracting two negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-5 - (-3)).assertEqual(-2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0530
     * @tc.name testArithmeticOperator043
     * @tc.desc Verify floating point number subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5.5 - 2.5).assertEqual(3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0540
     * @tc.name testArithmeticOperator044
     * @tc.desc Verify number minus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 - 0).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0550
     * @tc.name testArithmeticOperator045
     * @tc.desc Verify zero minus number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 - 5).assertEqual(-5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0560
     * @tc.name testArithmeticOperator046
     * @tc.desc Verify positive number minus negative zero keeps value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 - (-0)).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0610
     * @tc.name testArithmeticOperator051
     * @tc.desc Verify Infinity minus finite number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity - 100).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0620
     * @tc.name testArithmeticOperator052
     * @tc.desc Verify Infinity minus Infinity equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(Infinity - Infinity)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0630
     * @tc.name testArithmeticOperator053
     * @tc.desc Verify negative Infinity minus negative Infinity equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(-Infinity - (-Infinity))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0640
     * @tc.name testArithmeticOperator054
     * @tc.desc Verify finite number minus Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(100 - Infinity).assertEqual(-Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0650
     * @tc.name testArithmeticOperator055
     * @tc.desc Verify NaN minus ESObject number equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(NaN - 5)).assertTrue()
      expect(Number.isNaN(5 - NaN)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0660
     * @tc.name testArithmeticOperator056
     * @tc.desc Verify MIN_SAFE_INTEGER minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MIN_SAFE_INTEGER - 1).assertEqual(-9007199254740992)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0670
     * @tc.name testArithmeticOperator057
     * @tc.desc Verify 0.3 minus 0.1 does not equal 0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.3 - 0.1).assertEqual(0.19999999999999998)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0680
     * @tc.name testArithmeticOperator058
     * @tc.desc Verify numeric string subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("10" as ESObject) - ("3" as ESObject)).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0690
     * @tc.name testArithmeticOperator059
     * @tc.desc Verify string number minus numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("10" as ESObject) - 3).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0700
     * @tc.name testArithmeticOperator060
     * @tc.desc Verify non-numeric string subtraction converts to NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(("abc" as ESObject) - 1)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0710
     * @tc.name testArithmeticOperator061
     * @tc.desc Verify empty string subtraction converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("" as ESObject) - 5).assertEqual(-5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0720
     * @tc.name testArithmeticOperator062
     * @tc.desc Verify true minus false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) - (false as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0730
     * @tc.name testArithmeticOperator063
     * @tc.desc Verify true minus number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) - 1).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0740
     * @tc.name testArithmeticOperator064
     * @tc.desc Verify null minus null both convert to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) - (null as ESObject)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0750
     * @tc.name testArithmeticOperator065
     * @tc.desc Verify undefined subtraction converts to NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((undefined as ESObject) - 1)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0760
     * @tc.name testArithmeticOperator066
     * @tc.desc Verify subtraction always returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof (10 - 3)).assertEqual("number")
      expect(typeof (("10" as ESObject) - ("3" as ESObject))).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0770
     * @tc.name testArithmeticOperator067
     * @tc.desc Verify multiplying two positive integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(6 * 7).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0780
     * @tc.name testArithmeticOperator068
     * @tc.desc Verify positive number multiplied by negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(6 * (-7)).assertEqual(-42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0790
     * @tc.name testArithmeticOperator069
     * @tc.desc Verify multiplying two negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-6) * (-7)).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0800
     * @tc.name testArithmeticOperator070
     * @tc.desc Verify multiplying floating point numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2.5 * 4).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0810
     * @tc.name testArithmeticOperator071
     * @tc.desc Verify ESObject number multiplied by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 * 1).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0820
     * @tc.name testArithmeticOperator072
     * @tc.desc Verify ESObject number multiplied by 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 * 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0850
     * @tc.name testArithmeticOperator075
     * @tc.desc Verify Infinity multiplied by positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity * 2).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0860
     * @tc.name testArithmeticOperator076
     * @tc.desc Verify Infinity multiplied by negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity * (-2)).assertEqual(-Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0870
     * @tc.name testArithmeticOperator077
     * @tc.desc Verify Infinity multiplied by 0 equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(Infinity * 0)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0880
     * @tc.name testArithmeticOperator078
     * @tc.desc Verify Infinity multiplied by Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity * Infinity).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0890
     * @tc.name testArithmeticOperator079
     * @tc.desc Verify Infinity multiplied by negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity * (-Infinity)).assertEqual(-Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0900
     * @tc.name testArithmeticOperator080
     * @tc.desc Verify NaN multiplied by ESObject number equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(NaN * 5)).assertTrue()
      expect(Number.isNaN(5 * NaN)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0910
     * @tc.name testArithmeticOperator081
     * @tc.desc Verify large number overflow multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1e154 * 10).assertEqual(1e+155)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0920
     * @tc.name testArithmeticOperator082
     * @tc.desc Verify MIN_VALUE times large number underflows to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MIN_VALUE * 0.5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0930
     * @tc.name testArithmeticOperator083
     * @tc.desc Verify MIN_VALUE multiplied by 1 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MIN_VALUE * 1).assertEqual(Number.MIN_VALUE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0940
     * @tc.name testArithmeticOperator084
     * @tc.desc Verify numeric string multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("6" as ESObject) * ("7" as ESObject)).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0950
     * @tc.name testArithmeticOperator085
     * @tc.desc Verify floating point string multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("2.5" as ESObject) * ("4" as ESObject)).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0960
     * @tc.name testArithmeticOperator086
     * @tc.desc Verify non-numeric string converts to NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(("abc" as ESObject) * 2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0970
     * @tc.name testArithmeticOperator087
     * @tc.desc Verify true multiplied by true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) * (true as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0980
     * @tc.name testArithmeticOperator088
     * @tc.desc Verify null multiplied by null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) * (null as ESObject)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_0990
     * @tc.name testArithmeticOperator089
     * @tc.desc Verify undefined multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((undefined as ESObject) * 2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1000
     * @tc.name testArithmeticOperator090
     * @tc.desc Verify exact division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 / 6).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1010
     * @tc.name testArithmeticOperator091
     * @tc.desc Verify non-exact division producing floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(7 / 2).assertEqual(3.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1020
     * @tc.name testArithmeticOperator092
     * @tc.desc Verify negative number division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-12 / 3).assertEqual(-4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1030
     * @tc.name testArithmeticOperator093
     * @tc.desc Verify dividing two negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-12) / (-3)).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1040
     * @tc.name testArithmeticOperator094
     * @tc.desc Verify floating point division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10.0 / 4.0).assertEqual(2.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1050
     * @tc.name testArithmeticOperator095
     * @tc.desc Verify 1 divided by 2 equals 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 / 2).assertEqual(0.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1060
     * @tc.name testArithmeticOperator096
     * @tc.desc Verify 1/2 equals 1.0/2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 / 2 == 1.0 / 2.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1070
     * @tc.name testArithmeticOperator097
     * @tc.desc Verify ESObject number divided by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 / 1).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1080
     * @tc.name testArithmeticOperator098
     * @tc.desc Verify positive number divided by 0 equals Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 / 0).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1090
     * @tc.name testArithmeticOperator099
     * @tc.desc Verify negative number divided by 0 equals negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-42 / 0).assertEqual(-Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1100
     * @tc.name testArithmeticOperator100
     * @tc.desc Verify zero divided by zero equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(0 / 0)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1110
     * @tc.name testArithmeticOperator101
     * @tc.desc Verify positive number divided by negative zero equals negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 / (-0)).assertEqual(-Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1120
     * @tc.name testArithmeticOperator102
     * @tc.desc Verify negative number divided by negative zero equals Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-42 / (-0)).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1130
     * @tc.name testArithmeticOperator103
     * @tc.desc Verify Infinity divided by finite number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity / 2).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1140
     * @tc.name testArithmeticOperator104
     * @tc.desc Verify finite number divided by Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 / Infinity).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1150
     * @tc.name testArithmeticOperator105
     * @tc.desc Verify Infinity divided by Infinity equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(Infinity / Infinity)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1160
     * @tc.name testArithmeticOperator106
     * @tc.desc Verify negative Infinity divided by negative Infinity equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(-Infinity / -Infinity)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1170
     * @tc.name testArithmeticOperator107
     * @tc.desc Verify NaN divided by ESObject number equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(NaN / 5)).assertTrue()
      expect(Number.isNaN(5 / NaN)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1180
     * @tc.name testArithmeticOperator108
     * @tc.desc Verify MIN_VALUE divided by 2 underflows to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MIN_VALUE / 2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1190
     * @tc.name testArithmeticOperator109
     * @tc.desc Verify MAX_VALUE divided by tiny number overflows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MAX_VALUE / 0.5).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1200
     * @tc.name testArithmeticOperator110
     * @tc.desc Verify 0.1 divided by 0.3 is imprecise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.1 / 0.3).assertEqual(0.33333333333333337)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1210
     * @tc.name testArithmeticOperator111
     * @tc.desc Verify numeric string division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("42" as ESObject) / ("6" as ESObject)).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1220
     * @tc.name testArithmeticOperator112
     * @tc.desc Verify non-numeric string division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(("abc" as ESObject) / 2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1230
     * @tc.name testArithmeticOperator113
     * @tc.desc Verify empty string division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("" as ESObject) / 5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1240
     * @tc.name testArithmeticOperator114
     * @tc.desc Verify true divided by true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) / (true as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1250
     * @tc.name testArithmeticOperator115
     * @tc.desc Verify null divided by null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((null as ESObject) / (null as ESObject))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1260
     * @tc.name testArithmeticOperator116
     * @tc.desc Verify positive number modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(12 % 5).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1270
     * @tc.name testArithmeticOperator117
     * @tc.desc Verify remainder is 0 when evenly divisible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10 % 5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1280
     * @tc.name testArithmeticOperator118
     * @tc.desc Verify dividend less than divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3 % 5).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1290
     * @tc.name testArithmeticOperator119
     * @tc.desc Verify floating point modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5.5 % 2).assertEqual(1.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1300
     * @tc.name testArithmeticOperator120
     * @tc.desc Verify floating point modulo 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(7.5 % 2.5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1310
     * @tc.name testArithmeticOperator121
     * @tc.desc Verify negative dividend produces negative remainder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-12) % 5).assertEqual(-2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1320
     * @tc.name testArithmeticOperator122
     * @tc.desc Verify negative divisor remainder sign follows dividend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(12 % (-5)).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1330
     * @tc.name testArithmeticOperator123
     * @tc.desc Verify both dividend and divisor negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-12) % (-5)).assertEqual(-2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1340
     * @tc.name testArithmeticOperator124
     * @tc.desc Verify negative floating point modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-5.5) % 2).assertEqual(-1.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1350
     * @tc.name testArithmeticOperator125
     * @tc.desc Verify ESObject number modulo 1 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 % 1).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1360
     * @tc.name testArithmeticOperator126
     * @tc.desc Verify finite number modulo Infinity equals itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 % Infinity).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1370
     * @tc.name testArithmeticOperator127
     * @tc.desc Verify Infinity modulo ESObject number equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(Infinity % 5)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1380
     * @tc.name testArithmeticOperator128
     * @tc.desc Verify ESObject number modulo 0 equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(42 % 0)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1390
     * @tc.name testArithmeticOperator129
     * @tc.desc Verify zero modulo ESObject number equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 % 5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1400
     * @tc.name testArithmeticOperator130
     * @tc.desc Verify NaN modulo equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(NaN % 5)).assertTrue()
      expect(Number.isNaN(5 % NaN)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1410
     * @tc.name testArithmeticOperator131
     * @tc.desc Verify Infinity modulo Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(Infinity % Infinity)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1420
     * @tc.name testArithmeticOperator132
     * @tc.desc Verify numeric string modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("12" as ESObject) % ("5" as ESObject)).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1430
     * @tc.name testArithmeticOperator133
     * @tc.desc Verify non-numeric string modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(("abc" as ESObject) % 5)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1440
     * @tc.name testArithmeticOperator134
     * @tc.desc Verify using modulo 2 to check odd numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(7 % 2).assertEqual(1)
      expect(8 % 2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1450
     * @tc.name testArithmeticOperator135
     * @tc.desc Verify using modulo for circular indexing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idx: number = 10
      let arr: string[] = ["a", "b", "c"]
      expect(arr[idx % arr.length]).assertEqual("b")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1460
     * @tc.name testArithmeticOperator136
     * @tc.desc Verify using modulo 1 to get fractional part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3.14 % 1).assertEqual(0.14000000000000012)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1470
     * @tc.name testArithmeticOperator137
     * @tc.desc Verify positive integer power
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2**3).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1480
     * @tc.name testArithmeticOperator138
     * @tc.desc Verify power of 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10**3).assertEqual(1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1490
     * @tc.name testArithmeticOperator139
     * @tc.desc Verify negative base odd power
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2)**3).assertEqual(-8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1500
     * @tc.name testArithmeticOperator140
     * @tc.desc Verify negative base even power
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2)**4).assertEqual(16)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1510
     * @tc.name testArithmeticOperator141
     * @tc.desc Verify negative exponent power producing decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10**(-1)).assertEqual(0.1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1520
     * @tc.name testArithmeticOperator142
     * @tc.desc Verify fractional exponent power as square root
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(9**0.5).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1530
     * @tc.name testArithmeticOperator143
     * @tc.desc Verify fractional exponent power as cube root
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(27**(1 / 3)).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1540
     * @tc.name testArithmeticOperator144
     * @tc.desc Verify 1 to ESObject power equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1**1000000).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1550
     * @tc.name testArithmeticOperator145
     * @tc.desc Verify 0 to positive integer power equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0**5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1560
     * @tc.name testArithmeticOperator146
     * @tc.desc Verify 0 to power 0 equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0**0).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1570
     * @tc.name testArithmeticOperator147
     * @tc.desc Verify 0 to negative power equals Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0**(-1)).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1580
     * @tc.name testArithmeticOperator148
     * @tc.desc Verify ESObject number to power 0 equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42**0).assertEqual(1)
      expect((-42)**0).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1590
     * @tc.name testArithmeticOperator149
     * @tc.desc Verify ESObject number to power 1 equals itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42**1).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1620
     * @tc.name testArithmeticOperator152
     * @tc.desc Verify negative zero to negative odd power
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-0)**(-1)).assertEqual(-Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1630
     * @tc.name testArithmeticOperator153
     * @tc.desc Verify negative zero to negative even power
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-0)**(-2)).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1640
     * @tc.name testArithmeticOperator154
     * @tc.desc Verify NaN to ESObject power equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(NaN**2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1650
     * @tc.name testArithmeticOperator155
     * @tc.desc Verify ESObject base to NaN power equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(2**NaN)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1660
     * @tc.name testArithmeticOperator156
     * @tc.desc Verify base greater than 1 to Infinity power
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2**Infinity).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1670
     * @tc.name testArithmeticOperator157
     * @tc.desc Verify base between 0 and 1 to Infinity power
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.5**Infinity).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1680
     * @tc.name testArithmeticOperator158
     * @tc.desc Verify 1 to Infinity power equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(1**Infinity)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1690
     * @tc.name testArithmeticOperator159
     * @tc.desc Verify Infinity to positive power
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity**2).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1700
     * @tc.name testArithmeticOperator160
     * @tc.desc Verify Infinity to negative power
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity**(-1)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1710
     * @tc.name testArithmeticOperator161
     * @tc.desc Verify negative base fractional exponent equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((-4)**0.5)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1720
     * @tc.name testArithmeticOperator162
     * @tc.desc Verify negative base one-third power equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((-8)**(1 / 3))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1730
     * @tc.name testArithmeticOperator163
     * @tc.desc Verify large number exponentiation overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10**309).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1740
     * @tc.name testArithmeticOperator164
     * @tc.desc Verify extremely large exponent overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2**1024).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1750
     * @tc.name testArithmeticOperator165
     * @tc.desc Verify numeric string exponentiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("2" as ESObject)**("3" as ESObject)).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1760
     * @tc.name testArithmeticOperator166
     * @tc.desc Verify non-numeric string exponentiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(("abc" as ESObject)**2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1770
     * @tc.name testArithmeticOperator167
     * @tc.desc Verify prefix increment returns new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 3
      let result: number = ++x
      expect(result).assertEqual(4)
      expect(x).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1780
     * @tc.name testArithmeticOperator168
     * @tc.desc Verify prefix increment of negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -5
      let result: number = ++x
      expect(result).assertEqual(-4)
      expect(x).assertEqual(-4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1790
     * @tc.name testArithmeticOperator169
     * @tc.desc Verify prefix increment of zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      let result: number = ++x
      expect(result).assertEqual(1)
      expect(x).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1800
     * @tc.name testArithmeticOperator170
     * @tc.desc Verify prefix increment of floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 2.5
      let result: number = ++x
      expect(result).assertEqual(3.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1810
     * @tc.name testArithmeticOperator171
     * @tc.desc Verify prefix increment of MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number.MAX_SAFE_INTEGER
      let result: number = ++x
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER + 1)
    });
