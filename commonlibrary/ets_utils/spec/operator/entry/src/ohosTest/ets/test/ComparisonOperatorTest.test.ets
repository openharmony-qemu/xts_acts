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

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function ComparisonOperatorTest() {

  describe('ComparisonOperatorTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0110
     * @tc.name testComparisonOperator001
     * @tc.desc Verify two equal positive integers with ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3 == 3).assertTrue()
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0130
     * @tc.name testComparisonOperator003
     * @tc.desc Verify positive number compared with negative number using ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = -1
      let b = 1;
      expect(a == b).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0140
     * @tc.name testComparisonOperator004
     * @tc.desc Verify equal negative numbers with ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-5 == -5).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0150
     * @tc.name testComparisonOperator005
     * @tc.desc Verify equal floating point numbers with ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3.14 == 3.14).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0160
     * @tc.name testComparisonOperator006
     * @tc.desc Verify integer compared with equal value floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 == 5.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0170
     * @tc.name testComparisonOperator007
     * @tc.desc Verify zero equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 == 0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0180
     * @tc.name testComparisonOperator008
     * @tc.desc Verify positive zero equals negative zero with ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 == -0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0190
     * @tc.name testComparisonOperator009
     * @tc.desc Verify NaN is not equal to NaN with ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = NaN
      let b = NaN
      expect(a == b).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0200
     * @tc.name testComparisonOperator010
     * @tc.desc Verify NaN is not equal to ESObject number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = NaN
      let b = 0
      let c = Infinity
      expect(a == b).assertFalse()
      expect(a == c).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0210
     * @tc.name testComparisonOperator011
     * @tc.desc Verify Infinity equals Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity == Infinity).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0220
     * @tc.name testComparisonOperator012
     * @tc.desc Verify Infinity is not equal to negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity == -Infinity).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0230
     * @tc.name testComparisonOperator013
     * @tc.desc Verify MAX_SAFE_INTEGER equality comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MAX_SAFE_INTEGER == 9007199254740991).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0240
     * @tc.name testComparisonOperator014
     * @tc.desc Verify MAX_VALUE equality comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MAX_VALUE == Number.MAX_VALUE).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0250
     * @tc.name testComparisonOperator015
     * @tc.desc Verify same strings are equal with ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("hello" == "hello").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0260
     * @tc.name testComparisonOperator016
     * @tc.desc Verify different strings are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 'hello'
      let b = 'world'
      expect(a == b).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0270
     * @tc.name testComparisonOperator017
     * @tc.desc Verify empty strings are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("" == "").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0280
     * @tc.name testComparisonOperator018
     * @tc.desc Verify single character strings are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a" == "a").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0290
     * @tc.name testComparisonOperator019
     * @tc.desc Verify Chinese strings are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("你好" == "你好").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0300
     * @tc.name testComparisonOperator020
     * @tc.desc Verify case-sensitive string comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 'abc'
      let b = 'ABC'
      expect(a == b).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0310
     * @tc.name testComparisonOperator021
     * @tc.desc Verify strings with spaces comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 'hello';
      expect(" hello" == a).assertFalse()
      expect("hello " == a).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0320
     * @tc.name testComparisonOperator022
     * @tc.desc Verify emoji string comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("😀" == "😀").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0330
     * @tc.name testComparisonOperator023
     * @tc.desc Verify strings with escape characters comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a\nb" == "a\nb").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0340
     * @tc.name testComparisonOperator024
     * @tc.desc Verify strings with tab character comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a\tb" == "a\tb").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0350
     * @tc.name testComparisonOperator025
     * @tc.desc Verify very long string comparison with 10000 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let long: string = "A".repeat(10000)
      expect(long == "A".repeat(10000)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0360
     * @tc.name testComparisonOperator026
     * @tc.desc Verify true equals true with ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(true == true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0370
     * @tc.name testComparisonOperator027
     * @tc.desc Verify false equals false with ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(false == false).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0470
     * @tc.name testComparisonOperator037
     * @tc.desc Verify null equals undefined with loose equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(null == undefined).assertTrue()
      expect(undefined == null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0490
     * @tc.name testComparisonOperator039
     * @tc.desc Verify null is not equal to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(null == 0).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0500
     * @tc.name testComparisonOperator040
     * @tc.desc Verify null is not equal to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(null == false).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0510
     * @tc.name testComparisonOperator041
     * @tc.desc Verify null is not equal to empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(null == "").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0520
     * @tc.name testComparisonOperator042
     * @tc.desc Verify undefined is not equal to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(undefined == 0).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0540
     * @tc.name testComparisonOperator044
     * @tc.desc Verify null equals null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(null == null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0550
     * @tc.name testComparisonOperator045
     * @tc.desc Verify undefined equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(undefined == undefined).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0670
     * @tc.name testComparisonOperator057
     * @tc.desc Verify same object reference equality with ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { a: 1 }
      expect(obj == obj).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0680
     * @tc.name testComparisonOperator058
     * @tc.desc Verify different objects with same content are not equal by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ESObject = { a: 1 }
      let b: ESObject = { a: 1 }
      expect(a == b).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0690
     * @tc.name testComparisonOperator059
     * @tc.desc Verify same array reference equality with ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3]
      expect(arr == arr).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0700
     * @tc.name testComparisonOperator060
     * @tc.desc Verify different arrays with same content are not equal by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [1, 2]
      let b: number[] = [1, 2]
      expect(a == b).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0710
     * @tc.name testComparisonOperator061
     * @tc.desc Verify equality comparison result is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = (1 == 1)
      expect(typeof result).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0720
     * @tc.name testComparisonOperator062
     * @tc.desc Verify equality comparison in conditional expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      if (x == 5) {
        expect(true).assertTrue()
      } else {
        expect().assertFail()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0730
     * @tc.name testComparisonOperator063
     * @tc.desc Verify same positive integers with strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3 === 3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0760
     * @tc.name testComparisonOperator066
     * @tc.desc Verify integer strictly equal to equivalent float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 === 5.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0770
     * @tc.name testComparisonOperator067
     * @tc.desc Verify 0 strictly equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 === 0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0780
     * @tc.name testComparisonOperator068
     * @tc.desc Verify 0 strictly equals negative 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 === -0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0790
     * @tc.name testComparisonOperator069
     * @tc.desc Verify NaN is not strictly equal to NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = NaN
      let b = NaN
      expect(a === b).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0800
     * @tc.name testComparisonOperator070
     * @tc.desc Verify Infinity strictly equals Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity === Infinity).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0810
     * @tc.name testComparisonOperator071
     * @tc.desc Verify Infinity is not strictly equal to negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity === -Infinity).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0820
     * @tc.name testComparisonOperator072
     * @tc.desc Verify MAX_SAFE_INTEGER strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MAX_SAFE_INTEGER === Number.MAX_SAFE_INTEGER).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0850
     * @tc.name testComparisonOperator075
     * @tc.desc Verify same strings strictly equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("hello" === "hello").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0870
     * @tc.name testComparisonOperator077
     * @tc.desc Verify empty strings strictly equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("" === "").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0880
     * @tc.name testComparisonOperator078
     * @tc.desc Verify strict equality is case-sensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 'ABC'
      let b = 'abc'
      expect(a === b).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0890
     * @tc.name testComparisonOperator079
     * @tc.desc Verify Chinese strings strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("测试" === "测试").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0900
     * @tc.name testComparisonOperator080
     * @tc.desc Verify true strictly equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(true === true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0910
     * @tc.name testComparisonOperator081
     * @tc.desc Verify false strictly equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(false === false).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0950
     * @tc.name testComparisonOperator085
     * @tc.desc Verify null strictly equals null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(null === null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0960
     * @tc.name testComparisonOperator086
     * @tc.desc Verify undefined strictly equals undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(undefined === undefined).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_0970
     * @tc.name testComparisonOperator087
     * @tc.desc Verify null is not strictly equal to undefined due to different type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(null === undefined).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1020
     * @tc.name testComparisonOperator092
     * @tc.desc Verify strict and loose equality produce same result for same type and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 === 42).assertTrue()
      expect(42 == 42).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1030
     * @tc.name testComparisonOperator093
     * @tc.desc Verify same reference strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { a: 1 }
      expect(obj === obj).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1040
     * @tc.name testComparisonOperator094
     * @tc.desc Verify different references with same content are not strictly equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ESObject = { a: 1 }
      let b: ESObject = { a: 1 }
      expect(a === b).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1050
     * @tc.name testComparisonOperator095
     * @tc.desc Verify array reference strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = [1, 2]
      expect(arr === arr).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1060
     * @tc.name testComparisonOperator096
     * @tc.desc Verify unequal integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 3
      let b = 4
      expect(a != b).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1070
     * @tc.name testComparisonOperator097
     * @tc.desc Verify equal integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3 != 3).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1080
     * @tc.name testComparisonOperator098
     * @tc.desc Verify positive and negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1
      let b = -1
      expect(a != b).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1090
     * @tc.name testComparisonOperator099
     * @tc.desc Verify NaN is not equal to ESObject value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = NaN
      let b = 0
      expect(a != a).assertTrue()
      expect(a != b).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1100
     * @tc.name testComparisonOperator100
     * @tc.desc Verify Infinity is not equal to finite number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity != 9999999).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1110
     * @tc.name testComparisonOperator101
     * @tc.desc Verify 0 not equal to negative 0 is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 != -0).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1170
     * @tc.name testComparisonOperator107
     * @tc.desc Verify null not equal to undefined is false with loose equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(null != undefined).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1180
     * @tc.name testComparisonOperator108
     * @tc.desc Verify null not equal to 0 is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(null != 0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1200
     * @tc.name testComparisonOperator110
     * @tc.desc Verify equal integers with strict inequality is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3 !== 3).assertFalse()
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1220
     * @tc.name testComparisonOperator112
     * @tc.desc Verify NaN strict inequality with NaN is always true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = NaN
      expect(a !== a).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1230
     * @tc.name testComparisonOperator113
     * @tc.desc Verify 0 strict not equal to negative 0 is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 !== -0).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1240
     * @tc.name testComparisonOperator114
     * @tc.desc Verify Infinity strict not equal to negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity !== -Infinity).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1290
     * @tc.name testComparisonOperator119
     * @tc.desc Verify null strict not equal to undefined due to different type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(null !== undefined).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1310
     * @tc.name testComparisonOperator121
     * @tc.desc Verify difference between not equal and strict not equal for null and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(null != undefined).assertFalse()
      expect(null !== undefined).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1330
     * @tc.name testComparisonOperator123
     * @tc.desc Verify larger number is greater than smaller number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 > 3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1340
     * @tc.name testComparisonOperator124
     * @tc.desc Verify smaller number is not greater than larger number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3 > 5).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1350
     * @tc.name testComparisonOperator125
     * @tc.desc Verify equal numbers are not greater than each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 > 5).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1360
     * @tc.name testComparisonOperator126
     * @tc.desc Verify positive number is greater than negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 > -1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1370
     * @tc.name testComparisonOperator127
     * @tc.desc Verify floating point greater than comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3.5 > 3.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1380
     * @tc.name testComparisonOperator128
     * @tc.desc Verify Infinity is greater than ESObject finite number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity > Number.MAX_VALUE).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1390
     * @tc.name testComparisonOperator129
     * @tc.desc Verify ESObject finite number is greater than negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-Number.MAX_VALUE > -Infinity).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1400
     * @tc.name testComparisonOperator130
     * @tc.desc Verify NaN comparison always returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN > 1).assertFalse()
      expect(1 > NaN).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1410
     * @tc.name testComparisonOperator131
     * @tc.desc Verify MAX_VALUE is greater than MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MAX_VALUE > Number.MAX_SAFE_INTEGER).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1420
     * @tc.name testComparisonOperator132
     * @tc.desc Verify alphabetical order comparison b greater than a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("b" > "a").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1430
     * @tc.name testComparisonOperator133
     * @tc.desc Verify same character is not greater than itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a" > "a").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1440
     * @tc.name testComparisonOperator134
     * @tc.desc Verify uppercase letter is less than lowercase in ASCII order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a" > "Z").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1450
     * @tc.name testComparisonOperator135
     * @tc.desc Verify multi-character string comparison character by character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc" > "abd").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1460
     * @tc.name testComparisonOperator136
     * @tc.desc Verify prefix string comparison shorter is smaller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc" > "ab").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1470
     * @tc.name testComparisonOperator137
     * @tc.desc Verify empty string is less than ESObject non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a" > "").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1480
     * @tc.name testComparisonOperator138
     * @tc.desc Verify numeric string lexicographic comparison 12 greater than 2 is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("12" > "2").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1490
     * @tc.name testComparisonOperator139
     * @tc.desc Verify equal length numeric string lexicographic comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("99" > "10").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1500
     * @tc.name testComparisonOperator140
     * @tc.desc Verify Chinese character string comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("一" > "二").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1570
     * @tc.name testComparisonOperator147
     * @tc.desc Verify greater than operator returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = (5 > 3)
      expect(typeof result).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1580
     * @tc.name testComparisonOperator148
     * @tc.desc Verify greater than scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 >= 3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1590
     * @tc.name testComparisonOperator149
     * @tc.desc Verify equal scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 >= 5).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1600
     * @tc.name testComparisonOperator150
     * @tc.desc Verify less than scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3 >= 5).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1610
     * @tc.name testComparisonOperator151
     * @tc.desc Verify negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-1 >= -5).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1620
     * @tc.name testComparisonOperator152
     * @tc.desc Verify NaN greater than or equal to NaN is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN >= NaN).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1630
     * @tc.name testComparisonOperator153
     * @tc.desc Verify NaN greater than or equal to ESObject value is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN >= 0).assertFalse()
      expect(0 >= NaN).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1640
     * @tc.name testComparisonOperator154
     * @tc.desc Verify Infinity greater than or equal to Infinity is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity >= Infinity).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1650
     * @tc.name testComparisonOperator155
     * @tc.desc Verify 0 greater than or equal to negative 0 is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 >= -0).assertTrue()
      expect(-0 >= 0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1660
     * @tc.name testComparisonOperator156
     * @tc.desc Verify letter greater than or equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("b" >= "a").assertTrue()
      expect("a" >= "a").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1670
     * @tc.name testComparisonOperator157
     * @tc.desc Verify multi-character string comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("apple" >= "apple").assertTrue()
      expect("banana" >= "apple").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1700
     * @tc.name testComparisonOperator160
     * @tc.desc Verify smaller number is less than larger number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3 < 5).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1710
     * @tc.name testComparisonOperator161
     * @tc.desc Verify larger number is not less than smaller number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 < 3).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1720
     * @tc.name testComparisonOperator162
     * @tc.desc Verify equal numbers are not less than each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 < 5).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1730
     * @tc.name testComparisonOperator163
     * @tc.desc Verify negative number is less than positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-1 < 1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1740
     * @tc.name testComparisonOperator164
     * @tc.desc Verify comparison of two negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-10 < -5).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1750
     * @tc.name testComparisonOperator165
     * @tc.desc Verify negative Infinity is less than Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-Infinity < Infinity).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1760
     * @tc.name testComparisonOperator166
     * @tc.desc Verify finite number is less than Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MAX_VALUE < Infinity).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1770
     * @tc.name testComparisonOperator167
     * @tc.desc Verify NaN comparison always returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN < 1).assertFalse()
      expect(1 < NaN).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1780
     * @tc.name testComparisonOperator168
     * @tc.desc Verify MIN_SAFE_INTEGER is less than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.MIN_SAFE_INTEGER < 0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1790
     * @tc.name testComparisonOperator169
     * @tc.desc Verify alphabetical order a less than b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a" < "b").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1800
     * @tc.name testComparisonOperator170
     * @tc.desc Verify uppercase is less than lowercase in ASCII order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Z" < "a").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1810
     * @tc.name testComparisonOperator171
     * @tc.desc Verify shorter string is less than longer string with same prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("ab" < "abc").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1820
     * @tc.name testComparisonOperator172
     * @tc.desc Verify empty string is less than ESObject non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("" < "a").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1830
     * @tc.name testComparisonOperator173
     * @tc.desc Verify numeric string lexicographic 2 less than 12 is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("2" < "12").assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1880
     * @tc.name testComparisonOperator178
     * @tc.desc Verify less than scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3 <= 5).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1890
     * @tc.name testComparisonOperator179
     * @tc.desc Verify equal scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 <= 5).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1900
     * @tc.name testComparisonOperator180
     * @tc.desc Verify greater than scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 <= 3).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1910
     * @tc.name testComparisonOperator181
     * @tc.desc Verify NaN less than or equal to ESObject value is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN <= 0).assertFalse()
      expect(0 <= NaN).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1920
     * @tc.name testComparisonOperator182
     * @tc.desc Verify negative Infinity is less than or equal to ESObject finite number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-Infinity <= -Number.MAX_VALUE).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1930
     * @tc.name testComparisonOperator183
     * @tc.desc Verify 0 less than or equal to negative 0 is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 <= -0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1940
     * @tc.name testComparisonOperator184
     * @tc.desc Verify letter less than or equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a" <= "b").assertTrue()
      expect("a" <= "a").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1950
     * @tc.name testComparisonOperator185
     * @tc.desc Verify multi-character string comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc" <= "abd").assertTrue()
      expect("abc" <= "abc").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_1990
     * @tc.name testComparisonOperator189
     * @tc.desc Verify correct multi-condition comparison using logical and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 3, b: number = 5, c: number = 7
      let result: boolean = a < b && b < c
      expect(result).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2000
     * @tc.name testComparisonOperator190
     * @tc.desc Verify equality used in if condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      if (x == 10) {
        expect(true).assertTrue()
      } else {
        expect().assertFail()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2010
     * @tc.name testComparisonOperator191
     * @tc.desc Verify strict equality used in if condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "10"
      if (x === "10") {
        expect(true).assertTrue()
      } else {
        expect().assertFail()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2020
     * @tc.name testComparisonOperator192
     * @tc.desc Verify greater than used in if condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let score: number = 85
      if (score >= 60) {
        expect(true).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2030
     * @tc.name testComparisonOperator193
     * @tc.desc Verify comparison in ternary expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let age: number = 20
      let result: string = age >= 18 ? "adult" : "minor"
      expect(result).assertEqual("adult")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2040
     * @tc.name testComparisonOperator194
     * @tc.desc Verify strict equality in ternary expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let type: string = "admin"
      let access: number = type === "admin" ? 5 : 1
      expect(access).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2050
     * @tc.name testComparisonOperator195
     * @tc.desc Verify multiple comparisons combined with logical and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 50
      expect(x > 0 && x < 100).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2060
     * @tc.name testComparisonOperator196
     * @tc.desc Verify equality combined with logical and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 5, b: number = 5
      expect(a == b && a > 0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2070
     * @tc.name testComparisonOperator197
     * @tc.desc Verify comparisons combined with logical or
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -5
      expect(x < 0 || x > 100).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2090
     * @tc.name testComparisonOperator199
     * @tc.desc Verify greater than used in array filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 5, 3, 8, 2, 7]
      let result: number[] = arr.filter(n => n > 4)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2100
     * @tc.name testComparisonOperator200
     * @tc.desc Verify strict equality used in array filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["a", "b", "c", "b", "a"]
      let result: string[] = arr.filter(s => s === "b")
      expect(result.length).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2110
     * @tc.name testComparisonOperator201
     * @tc.desc Verify less than used in sort for ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [3, 1, 4, 1, 5, 9, 2, 6]
      let sorted: number[] = [...arr].sort((a, b) => a < b ? -1 : a > b ? 1 : 0)
      expect(sorted[0]).assertEqual(1)
      expect(sorted[7]).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2120
     * @tc.name testComparisonOperator202
     * @tc.desc Verify greater than used in sort for descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [3, 1, 4, 1, 5]
      let sorted: number[] = [...arr].sort((a, b) => a > b ? -1 : a < b ? 1 : 0)
      expect(sorted[0]).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2130
     * @tc.name testComparisonOperator203
     * @tc.desc Verify strict equality used in array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5]
      let found: number | undefined = arr.find(n => n === 3)
      expect(found).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2140
     * @tc.name testComparisonOperator204
     * @tc.desc Verify greater than used in array findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 5, 3, 8, 2]
      let idx: number = arr.findIndex(n => n > 4)
      expect(idx).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2150
     * @tc.name testComparisonOperator205
     * @tc.desc Verify short-circuit when first comparison is false with logical and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let x: number = 0
      let result: boolean = x > 0 && (() => {
        called = true;
        return true
      })()
      expect(result).assertFalse()
      expect(called).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2160
     * @tc.name testComparisonOperator206
     * @tc.desc Verify short-circuit when first comparison is true with logical or
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let x: number = 5
      let result: boolean = x > 0 || (() => {
        called = true;
        return false
      })()
      expect(result).assertTrue()
      expect(called).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2170
     * @tc.name testComparisonOperator207
     * @tc.desc Verify comparing objects with same content via JSON.stringify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ESObject = { x: 1, y: 2 }
      let b: ESObject = { x: 1, y: 2 }
      expect(JSON.stringify(a) === JSON.stringify(b)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2180
     * @tc.name testComparisonOperator208
     * @tc.desc Verify JSON.stringify comparing objects with different property order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ESObject = { x: 1, y: 2 }
      let b: ESObject = { y: 2, x: 1 }
      expect(JSON.stringify(a) === JSON.stringify(b)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2190
     * @tc.name testComparisonOperator209
     * @tc.desc Verify custom deep equality comparison function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(deepEqual209({ x: 1 }, { x: 1 })).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2200
     * @tc.name testComparisonOperator210
     * @tc.desc Verify negative 0 equals 0 in both loose and strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-0 == 0).assertTrue()
      expect(-0 === 0).assertTrue()
      expect(-0 >= 0).assertTrue()
      expect(-0 <= 0).assertTrue()
      expect(-0 > 0).assertFalse()
      expect(-0 < 0).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2220
     * @tc.name testComparisonOperator212
     * @tc.desc Verify NaN is never true in ESObject comparison operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = NaN
      expect(a == a).assertFalse()
      expect(a === a).assertFalse()
      expect(NaN > NaN).assertFalse()
      expect(NaN < NaN).assertFalse()
      expect(NaN >= NaN).assertFalse()
      expect(NaN <= NaN).assertFalse()
      expect(a != a).assertTrue()
      expect(a !== a).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2230
     * @tc.name testComparisonOperator213
     * @tc.desc Verify Number.isNaN for NaN detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(NaN)).assertTrue()
      expect(Number.isNaN(0)).assertFalse()
      expect(Number.isNaN("NaN")).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2240
     * @tc.name testComparisonOperator214
     * @tc.desc Verify Infinity comparison summary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity === Infinity).assertTrue()
      expect(Infinity !== -Infinity).assertTrue()
      expect(Infinity > -Infinity).assertTrue()
      expect(-Infinity < Infinity).assertTrue()
      expect(Infinity >= Number.MAX_VALUE).assertTrue()
      expect(-Infinity <= -Number.MAX_VALUE).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2260
     * @tc.name testComparisonOperator216
     * @tc.desc Verify union type comparison using typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | string = "hello"
      if (typeof val === "string") {
        expect(val.length).assertEqual(5)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2270
     * @tc.name testComparisonOperator217
     * @tc.desc Verify literal type comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      type Direction = "left" | "right"
      let d: Direction = "left"
      expect(d === "left").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COMPARISON_OPERATOR_2280
     * @tc.name testComparisonOperator218
     * @tc.desc Verify enum comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testComparisonOperator218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      enum Color { Red, Green, Blue }

      let c: Color = Color.Red
      expect(c === Color.Red).assertTrue()
      expect(c === 0).assertTrue()
    });
