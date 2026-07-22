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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1820
     * @tc.name testArithmeticOperator172
     * @tc.desc Verify prefix increment of Infinity unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Infinity
      let result: number = ++x
      expect(result).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1830
     * @tc.name testArithmeticOperator173
     * @tc.desc Verify prefix increment of NaN unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = NaN
      let result: number = ++x
      expect(Number.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1840
     * @tc.name testArithmeticOperator174
     * @tc.desc Verify postfix increment returns old value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 3
      let result: number = x++
      expect(result).assertEqual(3)
      expect(x).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1850
     * @tc.name testArithmeticOperator175
     * @tc.desc Verify postfix increment of negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -5
      let result: number = x++
      expect(result).assertEqual(-5)
      expect(x).assertEqual(-4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1860
     * @tc.name testArithmeticOperator176
     * @tc.desc Verify postfix increment of zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      let result: number = x++
      expect(result).assertEqual(0)
      expect(x).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1870
     * @tc.name testArithmeticOperator177
     * @tc.desc Verify postfix increment of floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1.5
      let result: number = x++
      expect(result).assertEqual(1.5)
      expect(x).assertEqual(2.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1880
     * @tc.name testArithmeticOperator178
     * @tc.desc Verify postfix increment of Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Infinity
      let result: number = x++
      expect(result).assertEqual(Infinity)
      expect(x).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1890
     * @tc.name testArithmeticOperator179
     * @tc.desc Verify postfix increment of NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = NaN
      let result: number = x++
      expect(Number.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1900
     * @tc.name testArithmeticOperator180
     * @tc.desc Verify difference between prefix and postfix in expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 5
      let b: number = 5
      expect(++a).assertEqual(6)
      expect(b++).assertEqual(5)
      expect(a).assertEqual(6)
      expect(b).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1910
     * @tc.name testArithmeticOperator181
     * @tc.desc Verify prefix increment in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0
      for (let i = 0; i < 3; ++i) {
        count++
      }
      expect(count).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1920
     * @tc.name testArithmeticOperator182
     * @tc.desc Verify postfix increment in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0
      for (let i = 0; i < 3; i++) {
        count++
      }
      expect(count).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1930
     * @tc.name testArithmeticOperator183
     * @tc.desc Verify prefix increment equals plus equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 10
      let b: number = 10
      ++a
      b += 1
      expect(a).assertEqual(b)
      expect(a).assertEqual(11)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1940
     * @tc.name testArithmeticOperator184
     * @tc.desc Verify postfix increment assigned to another variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      let y: number = x++
      expect(y).assertEqual(10)
      expect(x).assertEqual(11)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1950
     * @tc.name testArithmeticOperator185
     * @tc.desc Verify prefix decrement returns new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      let result: number = --x
      expect(result).assertEqual(4)
      expect(x).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1960
     * @tc.name testArithmeticOperator186
     * @tc.desc Verify prefix decrement of negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -3
      let result: number = --x
      expect(result).assertEqual(-4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1970
     * @tc.name testArithmeticOperator187
     * @tc.desc Verify prefix decrement of zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      let result: number = --x
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1980
     * @tc.name testArithmeticOperator188
     * @tc.desc Verify prefix decrement of floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 3.5
      let result: number = --x
      expect(result).assertEqual(2.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_1990
     * @tc.name testArithmeticOperator189
     * @tc.desc Verify prefix decrement of MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number.MIN_SAFE_INTEGER
      let result: number = --x
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER - 1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2000
     * @tc.name testArithmeticOperator190
     * @tc.desc Verify prefix decrement of Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Infinity
      let result: number = --x
      expect(result).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2010
     * @tc.name testArithmeticOperator191
     * @tc.desc Verify prefix decrement of NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = NaN
      let result: number = --x
      expect(Number.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2020
     * @tc.name testArithmeticOperator192
     * @tc.desc Verify postfix decrement returns old value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      let result: number = x--
      expect(result).assertEqual(5)
      expect(x).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2030
     * @tc.name testArithmeticOperator193
     * @tc.desc Verify postfix decrement of negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -3
      let result: number = x--
      expect(result).assertEqual(-3)
      expect(x).assertEqual(-4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2040
     * @tc.name testArithmeticOperator194
     * @tc.desc Verify postfix decrement of zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      let result: number = x--
      expect(result).assertEqual(0)
      expect(x).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2050
     * @tc.name testArithmeticOperator195
     * @tc.desc Verify postfix decrement of floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 2.5
      let result: number = x--
      expect(result).assertEqual(2.5)
      expect(x).assertEqual(1.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2060
     * @tc.name testArithmeticOperator196
     * @tc.desc Verify difference between prefix and postfix decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 5
      let b: number = 5
      expect(--a).assertEqual(4)
      expect(b--).assertEqual(5)
      expect(a).assertEqual(4)
      expect(b).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2070
     * @tc.name testArithmeticOperator197
     * @tc.desc Verify postfix decrement in countdown loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0
      for (let i = 5; i > 0; i--) {
        count++
      }
      expect(count).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2080
     * @tc.name testArithmeticOperator198
     * @tc.desc Verify prefix decrement equals minus equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 10
      let b: number = 10
      --a
      b -= 1
      expect(a).assertEqual(b)
      expect(a).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2090
     * @tc.name testArithmeticOperator199
     * @tc.desc Verify unary plus on integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(+42).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2100
     * @tc.name testArithmeticOperator200
     * @tc.desc Verify unary plus on negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(+(-5)).assertEqual(-5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2110
     * @tc.name testArithmeticOperator201
     * @tc.desc Verify unary plus on floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(+3.14).assertEqual(3.14)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2120
     * @tc.name testArithmeticOperator202
     * @tc.desc Verify unary plus on zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(+0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2270
     * @tc.name testArithmeticOperator217
     * @tc.desc Verify negation of negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-(-5)).assertEqual(5)
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2300
     * @tc.name testArithmeticOperator220
     * @tc.desc Verify negation of negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-(-Infinity)).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2310
     * @tc.name testArithmeticOperator221
     * @tc.desc Verify negation of Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-Infinity).assertEqual(-Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2320
     * @tc.name testArithmeticOperator222
     * @tc.desc Verify negation of NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(-NaN)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2330
     * @tc.name testArithmeticOperator223
     * @tc.desc Verify negation of MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-Number.MAX_SAFE_INTEGER).assertEqual(Number.MIN_SAFE_INTEGER)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2340
     * @tc.name testArithmeticOperator224
     * @tc.desc Verify negation of MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-Number.MAX_VALUE).assertEqual(-Number.MAX_VALUE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2420
     * @tc.name testArithmeticOperator232
     * @tc.desc Verify multiplication and division before addition and subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 + 3 * 4).assertEqual(14)
      expect(10 - 6 / 2).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2430
     * @tc.name testArithmeticOperator233
     * @tc.desc Verify parentheses change operator precedence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((2 + 3) * 4).assertEqual(20)
      expect((10 - 6) / 2).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2440
     * @tc.name testArithmeticOperator234
     * @tc.desc Verify modulo has same precedence as multiplication and division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 + 10 % 3).assertEqual(3)
      expect(10 % 3 * 2).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2450
     * @tc.name testArithmeticOperator235
     * @tc.desc Verify exponentiation has higher precedence than multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2 * 3**2).assertEqual(18)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2460
     * @tc.name testArithmeticOperator236
     * @tc.desc Verify exponentiation is right-associative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2**3**2).assertEqual(512)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2470
     * @tc.name testArithmeticOperator237
     * @tc.desc Verify unary negation and exponentiation precedence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-(2**2)).assertEqual(-4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2480
     * @tc.name testArithmeticOperator238
     * @tc.desc Verify unary plus precedence over addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((5 as ESObject) + 3).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2490
     * @tc.name testArithmeticOperator239
     * @tc.desc Verify increment and decrement precedence higher than arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      expect(++x * 2).assertEqual(12)
      expect(x).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2500
     * @tc.name testArithmeticOperator240
     * @tc.desc Verify mixed four fundamental operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 + 2 * 3 - 4 / 2).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2510
     * @tc.name testArithmeticOperator241
     * @tc.desc Verify complex expression with parentheses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 + 2) * (3 + 4)).assertEqual(21)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2520
     * @tc.name testArithmeticOperator242
     * @tc.desc Verify mixed expression with modulo and exponentiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(7 % 3 + 2**3).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2530
     * @tc.name testArithmeticOperator243
     * @tc.desc Verify prefix increment with addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      let result: number = ++x + 3
      expect(result).assertEqual(9)
      expect(x).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2540
     * @tc.name testArithmeticOperator244
     * @tc.desc Verify postfix increment with addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      let result: number = x++ + 3
      expect(result).assertEqual(8)
      expect(x).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2550
     * @tc.name testArithmeticOperator245
     * @tc.desc Verify multiple increments in same expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 1, b: number = 2
      let result: number = ++a + b++
      expect(result).assertEqual(4)
      expect(a).assertEqual(2)
      expect(b).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2560
     * @tc.name testArithmeticOperator246
     * @tc.desc Verify number plus number as addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 + 2).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2570
     * @tc.name testArithmeticOperator247
     * @tc.desc Verify string plus string as concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("1" + "2").assertEqual("12")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2580
     * @tc.name testArithmeticOperator248
     * @tc.desc Verify number plus string as concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 + "2").assertEqual("12")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2590
     * @tc.name testArithmeticOperator249
     * @tc.desc Verify string plus number as concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("1" + 2).assertEqual("12")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2600
     * @tc.name testArithmeticOperator250
     * @tc.desc Verify boolean plus string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(true + "2").assertEqual("true2")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2610
     * @tc.name testArithmeticOperator251
     * @tc.desc Verify boolean plus number as addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) + (1 as ESObject)).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2620
     * @tc.name testArithmeticOperator252
     * @tc.desc Verify null plus string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) + "x").assertEqual("nullx")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2630
     * @tc.name testArithmeticOperator253
     * @tc.desc Verify string minus number as numeric subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("10" as ESObject) - 3).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2640
     * @tc.name testArithmeticOperator254
     * @tc.desc Verify string multiplied by number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("10" as ESObject) * 3).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2650
     * @tc.name testArithmeticOperator255
     * @tc.desc Verify string divided by number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("10" as ESObject) / 2).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2660
     * @tc.name testArithmeticOperator256
     * @tc.desc Verify hexadecimal addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xFF + 0x01).assertEqual(256)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2670
     * @tc.name testArithmeticOperator257
     * @tc.desc Verify octal addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0o17 + 0o01).assertEqual(16)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2680
     * @tc.name testArithmeticOperator258
     * @tc.desc Verify binary addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b1010 + 0b0101).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2690
     * @tc.name testArithmeticOperator259
     * @tc.desc Verify mixed radix arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xFF + 0b1).assertEqual(256)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2700
     * @tc.name testArithmeticOperator260
     * @tc.desc Verify scientific notation addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1e3 + 2e2).assertEqual(1200)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2710
     * @tc.name testArithmeticOperator261
     * @tc.desc Verify negative exponent scientific notation multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1e3 * 1e-2).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2720
     * @tc.name testArithmeticOperator262
     * @tc.desc Verify sum from 1 to 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0
      for (let i = 1; i <= 100; i++) {
        sum += i
      }
      expect(sum).assertEqual(5050)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2730
     * @tc.name testArithmeticOperator263
     * @tc.desc Verify factorial calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factorial: number = 1
      for (let i = 1; i <= 5; i++) {
        factorial *= i
      }
      expect(factorial).assertEqual(120)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2740
     * @tc.name testArithmeticOperator264
     * @tc.desc Verify continuous subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 100
      for (let i = 0; i < 5; i++) {
        result -= 10
      }
      expect(result).assertEqual(50)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2750
     * @tc.name testArithmeticOperator265
     * @tc.desc Verify continuous division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 1024
      for (let i = 0; i < 5; i++) {
        result /= 2
      }
      expect(result).assertEqual(32)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2760
     * @tc.name testArithmeticOperator266
     * @tc.desc Verify reduce for summation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5]
      let sum: number = arr.reduce((a, b) => a + b, 0)
      expect(sum).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2770
     * @tc.name testArithmeticOperator267
     * @tc.desc Verify reduce for product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4]
      let product: number = arr.reduce((a, b) => a * b, 1)
      expect(product).assertEqual(24)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2780
     * @tc.name testArithmeticOperator268
     * @tc.desc Verify adjacent element differences in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [10, 7, 4, 1]
      let diffs: number[] = []
      for (let i = 0; i < arr.length - 1; i++) {
        diffs.push(arr[i] - arr[i + 1])
      }
      expect(diffs[0]).assertEqual(3)
      expect(diffs[2]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2790
     * @tc.name testArithmeticOperator269
     * @tc.desc Verify 0.1 plus 0.2 does not equal 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.1 + 0.2 === 0.3).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2800
     * @tc.name testArithmeticOperator270
     * @tc.desc Verify using EPSILON to fix comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.abs(0.1 + 0.2 - 0.3) < Number.EPSILON).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2810
     * @tc.name testArithmeticOperator271
     * @tc.desc Verify large integer precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(9007199254740992 + 1 === 9007199254740992).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2820
     * @tc.name testArithmeticOperator272
     * @tc.desc Verify floating point multiplication precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.1 * 3).assertEqual(0.30000000000000004)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2830
     * @tc.name testArithmeticOperator273
     * @tc.desc Verify floating point division precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.3 / 0.1).assertEqual(2.9999999999999996)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2840
     * @tc.name testArithmeticOperator274
     * @tc.desc Verify NaN in all arithmetic operations produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(NaN + 1)).assertTrue()
      expect(Number.isNaN(NaN - 1)).assertTrue()
      expect(Number.isNaN(NaN * 1)).assertTrue()
      expect(Number.isNaN(NaN / 1)).assertTrue()
      expect(Number.isNaN(NaN % 1)).assertTrue()
      expect(Number.isNaN(NaN**1)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2850
     * @tc.name testArithmeticOperator275
     * @tc.desc Verify Infinity addition and subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity + 1).assertEqual(Infinity)
      expect(Infinity - 1).assertEqual(Infinity)
      expect(Number.isNaN(Infinity - Infinity)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2860
     * @tc.name testArithmeticOperator276
     * @tc.desc Verify Infinity multiplication and division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity * 2).assertEqual(Infinity)
      expect(1 / Infinity).assertEqual(0)
      expect(Number.isNaN(Infinity * 0)).assertTrue()
      expect(Number.isNaN(Infinity / Infinity)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2870
     * @tc.name testArithmeticOperator277
     * @tc.desc Verify Infinity exponentiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity**2).assertEqual(Infinity)
      expect(Infinity**(-1)).assertEqual(0)
      expect(2**Infinity).assertEqual(Infinity)
      expect(0.5**Infinity).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2880
     * @tc.name testArithmeticOperator278
     * @tc.desc Verify division behavior of zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 / 0).assertEqual(Infinity)
      expect(-1 / 0).assertEqual(-Infinity)
      expect(1 / (-0)).assertEqual(-Infinity)
      expect(-1 / (-0)).assertEqual(Infinity)
      expect(Number.isNaN(0 / 0)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2900
     * @tc.name testArithmeticOperator280
     * @tc.desc Verify Pythagorean theorem hypotenuse calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 3, b: number = 4
      let c: number = Math.sqrt(a * a + b * b)
      expect(c).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2910
     * @tc.name testArithmeticOperator281
     * @tc.desc Verify calculate average value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: number[] = [10, 20, 30, 40, 50]
      let avg: number = nums.reduce((s, n) => s + n, 0) / nums.length
      expect(avg).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2920
     * @tc.name testArithmeticOperator282
     * @tc.desc Verify calculate percentage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obtained: number = 85
      let total: number = 100
      let percentage: number = obtained / total * 100
      expect(percentage).assertEqual(85)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2970
     * @tc.name testArithmeticOperator287
     * @tc.desc Verify binary arithmetic operations return number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof (1 + 2)).assertEqual("number")
      expect(typeof (1 - 2)).assertEqual("number")
      expect(typeof (1 * 2)).assertEqual("number")
      expect(typeof (1 / 2)).assertEqual("number")
      expect(typeof (1 % 2)).assertEqual("number")
      expect(typeof (1**2)).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2980
     * @tc.name testArithmeticOperator288
     * @tc.desc Verify unary arithmetic operations return number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      expect(typeof (+x)).assertEqual("number")
      expect(typeof (-x)).assertEqual("number")
      expect(typeof (++x)).assertEqual("number")
      expect(typeof (x++)).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_2990
     * @tc.name testArithmeticOperator289
     * @tc.desc Verify plus operator returns string when string involved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof ("a" + 1)).assertEqual("string")
      expect(typeof (1 + "a")).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3000
     * @tc.name testArithmeticOperator290
     * @tc.desc Verify number plus number equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 + 2).assertEqual(3)
      expect(typeof (1 + 2)).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3010
     * @tc.name testArithmeticOperator291
     * @tc.desc Verify string plus number equals string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("a" as ESObject) + 2).assertEqual("a2")
      expect(typeof ("a" + 2)).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3020
     * @tc.name testArithmeticOperator292
     * @tc.desc Verify number plus string equals string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) + "a").assertEqual("1a")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3030
     * @tc.name testArithmeticOperator293
     * @tc.desc Verify string plus string equals string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("a" as ESObject) + "b").assertEqual("ab")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3040
     * @tc.name testArithmeticOperator294
     * @tc.desc Verify boolean plus number equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) + (1 as ESObject)).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3050
     * @tc.name testArithmeticOperator295
     * @tc.desc Verify number plus boolean equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((5 as ESObject) + (false as ESObject)).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3060
     * @tc.name testArithmeticOperator296
     * @tc.desc Verify boolean plus boolean equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) + (true as ESObject)).assertEqual(2)
      expect((true as ESObject) + (false as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3070
     * @tc.name testArithmeticOperator297
     * @tc.desc Verify null plus number equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) + (5 as ESObject)).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3080
     * @tc.name testArithmeticOperator298
     * @tc.desc Verify undefined plus number equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((undefined as ESObject) + 5)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3090
     * @tc.name testArithmeticOperator299
     * @tc.desc Verify null plus null equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) + (null as ESObject)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3100
     * @tc.name testArithmeticOperator300
     * @tc.desc Verify null plus string equals string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) + "x").assertEqual("nullx")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3110
     * @tc.name testArithmeticOperator301
     * @tc.desc Verify undefined plus string equals string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((undefined as ESObject) + "x").assertEqual("undefinedx")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3120
     * @tc.name testArithmeticOperator302
     * @tc.desc Verify null plus boolean equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) + (true as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3130
     * @tc.name testArithmeticOperator303
     * @tc.desc Verify undefined plus boolean equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((undefined as ESObject) + (true as ESObject))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3140
     * @tc.name testArithmeticOperator304
     * @tc.desc Verify number plus number plus string equals string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) + (2 as ESObject) + "3").assertEqual("33")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3150
     * @tc.name testArithmeticOperator305
     * @tc.desc Verify string plus number plus number equals string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("1" as ESObject) + (2 as ESObject) + (3 as ESObject)).assertEqual("123")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3160
     * @tc.name testArithmeticOperator306
     * @tc.desc Verify boolean plus number plus string equals string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) + (1 as ESObject) + "x").assertEqual("2x")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3170
     * @tc.name testArithmeticOperator307
     * @tc.desc Verify null plus undefined plus number equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((null as ESObject) + (undefined as ESObject) + 5)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3180
     * @tc.name testArithmeticOperator308
     * @tc.desc Verify string minus number equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("10" as ESObject) - (3 as ESObject)).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3190
     * @tc.name testArithmeticOperator309
     * @tc.desc Verify boolean minus boolean equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) - (false as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3200
     * @tc.name testArithmeticOperator310
     * @tc.desc Verify null minus number equals number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) - (5 as ESObject)).assertEqual(-5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3210
     * @tc.name testArithmeticOperator311
     * @tc.desc Verify undefined minus number equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((undefined as ESObject) - 5)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3220
     * @tc.name testArithmeticOperator312
     * @tc.desc Verify null minus undefined equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((null as ESObject) - (undefined as ESObject))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3230
     * @tc.name testArithmeticOperator313
     * @tc.desc Verify null minus null equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) - (null as ESObject)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3240
     * @tc.name testArithmeticOperator314
     * @tc.desc Verify string multiplied by number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("6" as ESObject) * (7 as ESObject)).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3250
     * @tc.name testArithmeticOperator315
     * @tc.desc Verify boolean multiplied by boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) * (false as ESObject)).assertEqual(0)
      expect((true as ESObject) * (true as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3260
     * @tc.name testArithmeticOperator316
     * @tc.desc Verify null multiplied by number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) * (5 as ESObject)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3270
     * @tc.name testArithmeticOperator317
     * @tc.desc Verify undefined multiplied by number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((undefined as ESObject) * 5)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3280
     * @tc.name testArithmeticOperator318
     * @tc.desc Verify string divided by string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("10" as ESObject) / ("2" as ESObject)).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3290
     * @tc.name testArithmeticOperator319
     * @tc.desc Verify boolean divided by boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) / (true as ESObject)).assertEqual(1)
      expect(Number.isNaN((false as ESObject) / (false as ESObject))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3300
     * @tc.name testArithmeticOperator320
     * @tc.desc Verify null divided by null equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((null as ESObject) / (null as ESObject))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3310
     * @tc.name testArithmeticOperator321
     * @tc.desc Verify string modulo number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("10" as ESObject) % (3 as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3320
     * @tc.name testArithmeticOperator322
     * @tc.desc Verify null modulo null equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((null as ESObject) % (null as ESObject))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3330
     * @tc.name testArithmeticOperator323
     * @tc.desc Verify string exponent number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("2" as ESObject)**("3" as ESObject)).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3340
     * @tc.name testArithmeticOperator324
     * @tc.desc Verify boolean exponent number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject)**(10 as ESObject)).assertEqual(1)
      expect((false as ESObject)**(2 as ESObject)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3350
     * @tc.name testArithmeticOperator325
     * @tc.desc Verify null to power 0 equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject)**(0 as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3360
     * @tc.name testArithmeticOperator326
     * @tc.desc Verify null to power 1 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject)**(1 as ESObject)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3370
     * @tc.name testArithmeticOperator327
     * @tc.desc Verify undefined to power undefined equals NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((undefined as ESObject)**(undefined as ESObject))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3380
     * @tc.name testArithmeticOperator328
     * @tc.desc Verify 0.1 plus 0.2 equals 0.30000000000000004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.1 + 0.2).assertEqual(0.30000000000000004)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3390
     * @tc.name testArithmeticOperator329
     * @tc.desc Verify 0.1 plus 0.7 equals 0.7999999999999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.1 + 0.7).assertEqual(0.7999999999999999)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3400
     * @tc.name testArithmeticOperator330
     * @tc.desc Verify 0.2 plus 0.4 equals 0.6000000000000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.2 + 0.4).assertEqual(0.6000000000000001)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3410
     * @tc.name testArithmeticOperator331
     * @tc.desc Verify integer addition has no precision issues
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(123456 + 789012).assertEqual(912468)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3420
     * @tc.name testArithmeticOperator332
     * @tc.desc Verify 0.3 minus 0.1 equals 0.19999999999999998
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.3 - 0.1).assertEqual(0.19999999999999998)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3430
     * @tc.name testArithmeticOperator333
     * @tc.desc Verify 1.0 minus 0.9 equals 0.09999999999999998
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1.0 - 0.9).assertEqual(0.09999999999999998)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3440
     * @tc.name testArithmeticOperator334
     * @tc.desc Verify 0.5 minus 0.2 equals 0.3 with no error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.5 - 0.2).assertEqual(0.3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3450
     * @tc.name testArithmeticOperator335
     * @tc.desc Verify 0.1 times 3 equals 0.30000000000000004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.1 * 3).assertEqual(0.30000000000000004)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3460
     * @tc.name testArithmeticOperator336
     * @tc.desc Verify 0.7 times 100 equals 70.00000000000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 0.7 * 100
      expect(result >= 69.99 && result <= 70.01).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3470
     * @tc.name testArithmeticOperator337
     * @tc.desc Verify 19.9 times 100 integer conversion precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 19.9 * 100
      expect(Math.round(result)).assertEqual(1990)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3480
     * @tc.name testArithmeticOperator338
     * @tc.desc Verify 0.3 divided by 0.1 equals 2.9999999999999996
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0.3 / 0.1).assertEqual(2.9999999999999996)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3490
     * @tc.name testArithmeticOperator339
     * @tc.desc Verify 1 divided by 3 cannot be exactly represented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 / 3).assertEqual(0.3333333333333333)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3500
     * @tc.name testArithmeticOperator340
     * @tc.desc Verify integer division has no precision issues
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(100 / 4).assertEqual(25)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3510
     * @tc.name testArithmeticOperator341
     * @tc.desc Verify EPSILON correction for addition comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 0.1 + 0.2
      let b: number = 0.3
      expect(Math.abs(a - b) < Number.EPSILON).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3520
     * @tc.name testArithmeticOperator342
     * @tc.desc Verify toFixed corrects display precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 0.1 + 0.2
      expect(result.toFixed(2)).assertEqual("0.30")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3530
     * @tc.name testArithmeticOperator343
     * @tc.desc Verify toFixed rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0.125).toFixed(2)).assertEqual("0.13")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3540
     * @tc.name testArithmeticOperator344
     * @tc.desc Verify multiply scale round then divide back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.round((0.1 + 0.2) * 100) / 100
      expect(result).assertEqual(0.3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3550
     * @tc.name testArithmeticOperator345
     * @tc.desc Verify money calculation precision correction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(moneyRound345(0.1 + 0.2)).assertEqual(0.3)
      expect(moneyRound345(19.9 * 100)).assertEqual(1990)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3560
     * @tc.name testArithmeticOperator346
     * @tc.desc Verify MAX_SAFE_INTEGER plus 1 can be exactly represented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MAX_SAFE_INTEGER + 1).assertEqual(9007199254740992)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3570
     * @tc.name testArithmeticOperator347
     * @tc.desc Verify MAX_SAFE_INTEGER plus 2 precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MAX_SAFE_INTEGER + 2).assertEqual(9007199254740992)
      expect(Number.MAX_SAFE_INTEGER + 2 === Number.MAX_SAFE_INTEGER + 1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3580
     * @tc.name testArithmeticOperator348
     * @tc.desc Verify MAX_SAFE_INTEGER plus 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MAX_SAFE_INTEGER + 3).assertEqual(9007199254740994)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3590
     * @tc.name testArithmeticOperator349
     * @tc.desc Verify precision alternation beyond safe range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: number = Number.MAX_SAFE_INTEGER
      expect(base + 2).assertEqual(base + 1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3600
     * @tc.name testArithmeticOperator350
     * @tc.desc Verify Number.isSafeInteger check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isSafeInteger(Number.MAX_SAFE_INTEGER)).assertTrue()
      expect(Number.isSafeInteger(Number.MAX_SAFE_INTEGER + 1)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARITHMETIC_OPERATOR_3610
     * @tc.name testArithmeticOperator351
     * @tc.desc Verify MIN_SAFE_INTEGER minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArithmeticOperator351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MIN_SAFE_INTEGER - 1).assertEqual(-9007199254740992)
    });
