'use static'
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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorModule2Test(): void {
  describe('testBigIntOperatorModule2Test', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_0800
     * @tc.name testBigIntOperatorModule2Test008
     * @tc.desc Mindmap input: operatorModule positive dividend and modulus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorModule(BigInt(3)).toString()).assertEqual('2');
      expect(BigInt(10).operatorModule(BigInt(7)).toString()).assertEqual('3');
      expect(BigInt(100).operatorModule(BigInt(30)).toString()).assertEqual('10');
      expect(BigInt(7).operatorModule(BigInt(10)).toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_0900
     * @tc.name testBigIntOperatorModule2Test009
     * @tc.desc Mindmap input: operatorModule mod 1 and self-mod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorModule(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt(5).operatorModule(BigInt(5)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_1000
     * @tc.name testBigIntOperatorModule2Test010
     * @tc.desc Mindmap input: operatorModule negative dividend with positive modulus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-5).operatorModule(BigInt(3)).toString()).assertEqual('-2');
      expect(BigInt(-10).operatorModule(BigInt(7)).toString()).assertEqual('-3');
      expect(BigInt(-7).operatorModule(BigInt(10)).toString()).assertEqual('-7');
      expect(BigInt(-5).operatorModule(BigInt(1)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_1100
     * @tc.name testBigIntOperatorModule2Test011
     * @tc.desc Mindmap input: operatorModule positive dividend with negative modulus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorModule(BigInt(-3)).toString()).assertEqual('2');
      expect(BigInt(10).operatorModule(BigInt(-7)).toString()).assertEqual('3');
      expect(BigInt(7).operatorModule(BigInt(-10)).toString()).assertEqual('7');
      expect(BigInt(5).operatorModule(BigInt(-1)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_1200
     * @tc.name testBigIntOperatorModule2Test012
     * @tc.desc Mindmap input: operatorModule both negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-5).operatorModule(BigInt(-3)).toString()).assertEqual('-2');
      expect(BigInt(-10).operatorModule(BigInt(-7)).toString()).assertEqual('-3');
      expect(BigInt(-7).operatorModule(BigInt(-10)).toString()).assertEqual('-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_1300
     * @tc.name testBigIntOperatorModule2Test013
     * @tc.desc Mindmap input: operatorModule with large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9007199254740993').operatorModule(BigInt(2)).toString()).assertEqual('1');
      expect(BigInt('9223372036854775807').operatorModule(BigInt(10)).toString()).assertEqual('7');
      expect(BigInt('-9223372036854775808').operatorModule(BigInt(10)).toString()).assertEqual('-8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_1400
     * @tc.name testBigIntOperatorModule2Test014
     * @tc.desc Mindmap input: operatorModule with super large (10^30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('1000000000000000000000000000000').operatorModule(BigInt(3)).toString()).assertEqual('1');
      expect(BigInt('1000000000000000000000000000001').operatorModule(BigInt(3)).toString()).assertEqual('2');
      expect(BigInt('1000000000000000000000000000002').operatorModule(BigInt(3)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_1500
     * @tc.name testBigIntOperatorModule2Test015
     * @tc.desc Mindmap input: operatorModule with different base string constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('0xFF').operatorModule(BigInt(10)).toString()).assertEqual('5');
      expect(BigInt('0o77').operatorModule(BigInt(10)).toString()).assertEqual('3');
      expect(BigInt('0b101010').operatorModule(BigInt(10)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_1600
     * @tc.name testBigIntOperatorModule2Test016
     * @tc.desc Mindmap input: operatorModule boolean constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(true).operatorModule(BigInt(3)).toString()).assertEqual('1');
      expect(BigInt(false).operatorModule(BigInt(3)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_1700
     * @tc.name testBigIntOperatorModule2Test017
     * @tc.desc Mindmap input: operatorModule chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorModule(BigInt(7)).operatorModule(BigInt(3)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_1800
     * @tc.name testBigIntOperatorModule2Test018
     * @tc.desc Mindmap input: operatorModule byte/short/int boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorModule(BigInt(-128)).toString()).assertEqual('127');
      expect(BigInt(-128).operatorModule(BigInt(127)).toString()).assertEqual('-1');
      expect(BigInt(32767).operatorModule(BigInt(-32768)).toString()).assertEqual('32767');
      expect(BigInt(-32768).operatorModule(BigInt(32767)).toString()).assertEqual('-1');
      expect(BigInt(2147483647).operatorModule(BigInt(-2147483648)).toString()).assertEqual('2147483647');
      expect(BigInt(-2147483648).operatorModule(BigInt(2147483647)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_1900
     * @tc.name testBigIntOperatorModule2Test019
     * @tc.desc Mindmap error handling: operatorModule throws on big number div by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt('9223372036854775807').operatorModule(BigInt(0));
      }).assertThrowError('Error');
      expect((): void => {
        BigInt('-9223372036854775808').operatorModule(BigInt(0));
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_2000
     * @tc.name testBigIntOperatorModule2Test020
     * @tc.desc Mindmap input: operatorModule remaining positive dividend and modulus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(17).operatorModule(BigInt(5)).toString()).assertEqual('2');
      expect(BigInt(3).operatorModule(BigInt(2)).toString()).assertEqual('1');
      expect(BigInt(4).operatorModule(BigInt(2)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_2100
     * @tc.name testBigIntOperatorModule2Test021
     * @tc.desc Mindmap input: operatorModule remaining negative dividend with positive modulus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-5).operatorModule(BigInt(5)).toString()).assertEqual('0');
      expect(BigInt(-17).operatorModule(BigInt(5)).toString()).assertEqual('-2');
      expect(BigInt(-3).operatorModule(BigInt(2)).toString()).assertEqual('-1');
      expect(BigInt(-4).operatorModule(BigInt(2)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_2200
     * @tc.name testBigIntOperatorModule2Test022
     * @tc.desc Mindmap input: operatorModule remaining positive dividend with negative modulus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorModule(BigInt(-5)).toString()).assertEqual('0');
      expect(BigInt(17).operatorModule(BigInt(-5)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_2300
     * @tc.name testBigIntOperatorModule2Test023
     * @tc.desc Mindmap input: operatorModule remaining both negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-5).operatorModule(BigInt(-1)).toString()).assertEqual('0');
      expect(BigInt(-5).operatorModule(BigInt(-5)).toString()).assertEqual('0');
      expect(BigInt(-17).operatorModule(BigInt(-5)).toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_2400
     * @tc.name testBigIntOperatorModule2Test024
     * @tc.desc Mindmap input: operatorModule remaining large number mod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9007199254740993').operatorModule(BigInt(10)).toString()).assertEqual('3');
      expect(BigInt('9223372036854775807').operatorModule(BigInt('9223372036854775807')).toString()).assertEqual('0');
      expect(BigInt('9223372036854775807').operatorModule(BigInt('9223372036854775806')).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_2500
     * @tc.name testBigIntOperatorModule2Test025
     * @tc.desc Mindmap return value: operatorModule value correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(20).operatorModule(BigInt(6)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_2600
     * @tc.name testBigIntOperatorModule2Test026
     * @tc.desc Mindmap return value: operatorModule this immutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(10);
      const orig = a.toString();
      a.operatorModule(BigInt(3));
      expect(a.toString()).assertEqual(orig);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_2700
     * @tc.name testBigIntOperatorModule2Test027
     * @tc.desc Mindmap return value: operatorModule other immutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = BigInt(10);
      const c = BigInt(3);
      const origC = c.toString();
      b.operatorModule(c);
      expect(c.toString()).assertEqual(origC);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_2800
     * @tc.name testBigIntOperatorModule2Test028
     * @tc.desc Mindmap error handling: operatorModule throws on zero dividend with zero divisor and negative with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt(0).operatorModule(BigInt(0));
      }).assertThrowError('Error');
      expect((): void => {
        BigInt(-1).operatorModule(BigInt(0));
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_2900
     * @tc.name testBigIntOperatorModule2Test029
     * @tc.desc Mindmap input: operatorModule with addition result as dividend (TP#91)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorAdd(BigInt(5)).operatorModule(BigInt(4)).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_3000
     * @tc.name testBigIntOperatorModule2Test030
     * @tc.desc Mindmap input: operatorModule with subtraction result as dividend (TP#92)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(20).operatorSubtract(BigInt(7)).operatorModule(BigInt(5)).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_3100
     * @tc.name testBigIntOperatorModule2Test031
     * @tc.desc Mindmap input: operatorModule with multiplication result as dividend (TP#93)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(6).operatorMultiply(BigInt(4)).operatorModule(BigInt(7)).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_3200
     * @tc.name testBigIntOperatorModule2Test032
     * @tc.desc Mindmap input: operatorModule with division result as dividend (TP#94)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(30).operatorDivide(BigInt(5)).operatorModule(BigInt(4)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_3300
     * @tc.name testBigIntOperatorModule2Test033
     * @tc.desc Mindmap input: operatorModule with left shift result as dividend (TP#95)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(4).operatorLeftShift(BigInt(2)).operatorModule(BigInt(5)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_3400
     * @tc.name testBigIntOperatorModule2Test034
     * @tc.desc Mindmap input: operatorModule with right shift result as dividend (TP#96)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(16).operatorRightShift(BigInt(2)).operatorModule(BigInt(3)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_3500
     * @tc.name testBigIntOperatorModule2Test035
     * @tc.desc Mindmap input: operatorModule with pow result as dividend (TP#97)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(3).pow(BigInt(4)).operatorModule(BigInt(10)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_3600
     * @tc.name testBigIntOperatorModule2Test036
     * @tc.desc Mindmap input: operatorModule with increment result as dividend (TP#99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorIncrement().operatorModule(BigInt(4)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_3700
     * @tc.name testBigIntOperatorModule2Test037
     * @tc.desc Mindmap input: operatorModule with decrement result as dividend (TP#100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorDecrement().operatorModule(BigInt(7)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_3800
     * @tc.name testBigIntOperatorModule2Test038
     * @tc.desc Mindmap input: operatorModule with addition result as divisor (TP#111)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorModule(BigInt(3).operatorAdd(BigInt(4))).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_3900
     * @tc.name testBigIntOperatorModule2Test039
     * @tc.desc Mindmap input: operatorModule with multiplication result as divisor (TP#112)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(200).operatorModule(BigInt(2).operatorMultiply(BigInt(3))).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_4000
     * @tc.name testBigIntOperatorModule2Test040
     * @tc.desc Mindmap input: operatorModule with left shift result as divisor (TP#113)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-50).operatorModule(BigInt(4).operatorLeftShift(BigInt(1))).toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_4100
     * @tc.name testBigIntOperatorModule2Test041
     * @tc.desc Mindmap input: operatorModule with negative super large number (TP#115)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-9007199254740993').operatorModule(BigInt(10)).toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_4200
     * @tc.name testBigIntOperatorModule2Test042
     * @tc.desc Mindmap input: operatorModule with 100-digit all-ones number mod 9 (TP#116)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('1'.repeat(100)).operatorModule(BigInt(9)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_4300
     * @tc.name testBigIntOperatorModule2Test043
     * @tc.desc Mindmap input: operatorModule with negative 100-digit all-ones number mod 9 (TP#117)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-' + '1'.repeat(100)).operatorModule(BigInt(9)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_4400
     * @tc.name testBigIntOperatorModule2Test044
     * @tc.desc Mindmap input: operatorModule with 2^64 value mod 1000 (TP#118)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('18446744073709551616').operatorModule(BigInt(1000)).toString()).assertEqual('616');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_4500
     * @tc.name testBigIntOperatorModule2Test045
     * @tc.desc Mindmap input: operatorModule with -2^64 value mod 1000 (TP#119)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-18446744073709551616').operatorModule(BigInt(1000)).toString()).assertEqual('-616');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_4600
     * @tc.name testBigIntOperatorModule2Test046
     * @tc.desc Mindmap input: operatorModule with copy constructed large number (TP#110)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt('999999999999999999')).operatorModule(BigInt(1000)).toString()).assertEqual('999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_4700
     * @tc.name testBigIntOperatorModule2Test047
     * @tc.desc Mindmap input: operatorModule with positive dividend and negative divisor remainder > 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorModule(BigInt(-3)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_4800
     * @tc.name testBigIntOperatorModule2Test048
     * @tc.desc Mindmap input: operatorModule max long dividend with min long neg divisor boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9223372036854775807').operatorModule(BigInt('-9223372036854775808')).toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MODULE_4900
     * @tc.name testBigIntOperatorModule2Test049
     * @tc.desc Mindmap input: operatorModule with fromULong 0 dividend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModule2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(0).operatorModule(BigInt(7)).toString()).assertEqual('0');
    });
  });
}
