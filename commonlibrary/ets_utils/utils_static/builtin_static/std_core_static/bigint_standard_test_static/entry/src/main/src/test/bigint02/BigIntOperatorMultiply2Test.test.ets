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
import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorMultiply2Test(): void {
  describe('testBigIntOperatorMultiply2Test', (): void => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_0800
     * @tc.name testBigIntOperatorMultiply2Test008
     * @tc.desc Mindmap input: zero multiplied by zero, one, negative one, and type boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorMultiply(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(0).operatorMultiply(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt(0).operatorMultiply(BigInt(-1)).toString()).assertEqual('0');
      expect(BigInt(0).operatorMultiply(BigInt(127)).toString()).assertEqual('0');
      expect(BigInt(0).operatorMultiply(BigInt(-128)).toString()).assertEqual('0');
      expect(BigInt(0).operatorMultiply(BigInt(32767)).toString()).assertEqual('0');
      expect(BigInt(0).operatorMultiply(BigInt(-32768)).toString()).assertEqual('0');
      expect(BigInt(0).operatorMultiply(BigInt(2147483647)).toString()).assertEqual('0');
      expect(BigInt(0).operatorMultiply(BigInt(-2147483648)).toString()).assertEqual('0');
      expect(BigInt(0).operatorMultiply(BigInt('9223372036854775807')).toString()).assertEqual('0');
      expect(BigInt(0).operatorMultiply(BigInt('-9223372036854775808')).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_0900
     * @tc.name testBigIntOperatorMultiply2Test009
     * @tc.desc Mindmap input: identity 1 multiplier with boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorMultiply(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(1).operatorMultiply(BigInt(1)).toString()).assertEqual('1');
      expect(BigInt(1).operatorMultiply(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(1).operatorMultiply(BigInt(127)).toString()).assertEqual('127');
      expect(BigInt(1).operatorMultiply(BigInt(-128)).toString()).assertEqual('-128');
      expect(BigInt(1).operatorMultiply(BigInt(2147483647)).toString()).assertEqual('2147483647');
      expect(BigInt(1).operatorMultiply(BigInt(-2147483648)).toString()).assertEqual('-2147483648');
      expect(BigInt(1).operatorMultiply(BigInt('9007199254740993')).toString()).assertEqual('9007199254740993');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_1000
     * @tc.name testBigIntOperatorMultiply2Test010
     * @tc.desc Mindmap input: identity -1 multiplier with boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-1).operatorMultiply(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(-1).operatorMultiply(BigInt(1)).toString()).assertEqual('-1');
      expect(BigInt(-1).operatorMultiply(BigInt(-1)).toString()).assertEqual('1');
      expect(BigInt(-1).operatorMultiply(BigInt(127)).toString()).assertEqual('-127');
      expect(BigInt(-1).operatorMultiply(BigInt(-128)).toString()).assertEqual('128');
      expect(BigInt(-1).operatorMultiply(BigInt(32767)).toString()).assertEqual('-32767');
      expect(BigInt(-1).operatorMultiply(BigInt(-32768)).toString()).assertEqual('32768');
      expect(BigInt(-1).operatorMultiply(BigInt(2147483647)).toString()).assertEqual('-2147483647');
      expect(BigInt(-1).operatorMultiply(BigInt(-2147483648)).toString()).assertEqual('2147483648');
      expect(BigInt(-1).operatorMultiply(BigInt('9007199254740993')).toString()).assertEqual('-9007199254740993');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_1100
     * @tc.name testBigIntOperatorMultiply2Test011
     * @tc.desc Mindmap input: sign combinations positive, negative mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).operatorMultiply(BigInt(3)).toString()).assertEqual('6');
      expect(BigInt(-2).operatorMultiply(BigInt(3)).toString()).assertEqual('-6');
      expect(BigInt(2).operatorMultiply(BigInt(-3)).toString()).assertEqual('-6');
      expect(BigInt(-2).operatorMultiply(BigInt(-3)).toString()).assertEqual('6');
      expect(BigInt(100).operatorMultiply(BigInt(200)).toString()).assertEqual('20000');
      expect(BigInt(-100).operatorMultiply(BigInt(200)).toString()).assertEqual('-20000');
      expect(BigInt(-100).operatorMultiply(BigInt(-200)).toString()).assertEqual('20000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_1200
     * @tc.name testBigIntOperatorMultiply2Test012
     * @tc.desc Mindmap input: byte, short, int, long boundaries multiplied by 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorMultiply(BigInt(2)).toString()).assertEqual('254');
      expect(BigInt(-128).operatorMultiply(BigInt(2)).toString()).assertEqual('-256');
      expect(BigInt(32767).operatorMultiply(BigInt(2)).toString()).assertEqual('65534');
      expect(BigInt(-32768).operatorMultiply(BigInt(2)).toString()).assertEqual('-65536');
      expect(BigInt(2147483647).operatorMultiply(BigInt(2)).toString()).assertEqual('4294967294');
      expect(BigInt(-2147483648).operatorMultiply(BigInt(2)).toString()).assertEqual('-4294967296');
      expect(BigInt('9223372036854775807').operatorMultiply(BigInt(2)).toString()).assertEqual('18446744073709551614');
      expect(BigInt('-9223372036854775808').operatorMultiply(BigInt(2)).toString()).assertEqual('-18446744073709551616');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_1300
     * @tc.name testBigIntOperatorMultiply2Test013
     * @tc.desc Mindmap input: Boolean true/false as multiplier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorMultiply(BigInt(true)).toString()).assertEqual('127');
      expect(BigInt(127).operatorMultiply(BigInt(false)).toString()).assertEqual('0');
      expect(BigInt(-128).operatorMultiply(BigInt(true)).toString()).assertEqual('-128');
      expect(BigInt(-128).operatorMultiply(BigInt(false)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_1400
     * @tc.name testBigIntOperatorMultiply2Test014
     * @tc.desc Mindmap input: string-constructed BigInt multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('123').operatorMultiply(BigInt('456')).toString()).assertEqual('56088');
      expect(BigInt('-123').operatorMultiply(BigInt('456')).toString()).assertEqual('-56088');
      expect(BigInt('-123').operatorMultiply(BigInt('-456')).toString()).assertEqual('56088');
      expect(BigInt('12345678901234567890').operatorMultiply(BigInt('2')).toString()).assertEqual('24691357802469135780');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_1500
     * @tc.name testBigIntOperatorMultiply2Test015
     * @tc.desc Mindmap input: large precision and overflow safety
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9999999999999999999').operatorMultiply(BigInt('9999999999999999999')).toString()).assertEqual('99999999999999999980000000000000000001');
      expect(BigInt('1000000000000000000000000000000').operatorMultiply(BigInt('1000000000000000000000000000000')).toString()).assertEqual('1000000000000000000000000000000000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_1600
     * @tc.name testBigIntOperatorMultiply2Test016
     * @tc.desc Mindmap return value: chained call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).operatorMultiply(BigInt(3)).operatorMultiply(BigInt(4)).toString()).assertEqual('24');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_1700
     * @tc.name testBigIntOperatorMultiply2Test017
     * @tc.desc Mindmap return value: operand immutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(5);
      const b = BigInt(3);
      const r = a.operatorMultiply(b);
      expect(a.toString()).assertEqual('5');
      expect(b.toString()).assertEqual('3');
      expect(r.toString()).assertEqual('15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_1800
     * @tc.name testBigIntOperatorMultiply2Test018
     * @tc.desc Mindmap return value: commutativity and nested BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(123);
      const b = BigInt(456);
      const r1 = a.operatorMultiply(b);
      const r2 = b.operatorMultiply(a);
      expect(r1.toString()).assertEqual(r2.toString());
      expect(BigInt(BigInt(50)).operatorMultiply(BigInt(2)).toString()).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_1900
     * @tc.name testBigIntOperatorMultiply2Test019
     * @tc.desc Mindmap input: double-constructed BigInt as multiplier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(15).operatorMultiply(BigInt(3.0)).toString()).assertEqual('45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_2000
     * @tc.name testBigIntOperatorMultiply2Test020
     * @tc.desc Mindmap input: negative int multiplied by double-constructed positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-15).operatorMultiply(BigInt(3.0)).toString()).assertEqual('-45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_2100
     * @tc.name testBigIntOperatorMultiply2Test021
     * @tc.desc Mindmap input: fromULong-constructed BigInt as multiplier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(3).operatorMultiply(BigInt.fromULong(100)).toString()).assertEqual('300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_2200
     * @tc.name testBigIntOperatorMultiply2Test022
     * @tc.desc Mindmap input: negative int multiplied by fromULong positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-5).operatorMultiply(BigInt.fromULong(200)).toString()).assertEqual('-1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_2300
     * @tc.name testBigIntOperatorMultiply2Test023
     * @tc.desc Mindmap input: copy-constructed BigInt as multiplier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(6).operatorMultiply(BigInt(BigInt(7))).toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_2400
     * @tc.name testBigIntOperatorMultiply2Test024
     * @tc.desc Mindmap input: positive int multiplied by copy-constructed negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(8).operatorMultiply(BigInt(BigInt(-9))).toString()).assertEqual('-72');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_2500
     * @tc.name testBigIntOperatorMultiply2Test025
     * @tc.desc Mindmap input: add result as multiplicand in chained multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorAdd(BigInt(5)).operatorMultiply(BigInt(4)).toString()).assertEqual('60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_2600
     * @tc.name testBigIntOperatorMultiply2Test026
     * @tc.desc Mindmap input: subtract result as multiplicand in chained multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(20).operatorSubtract(BigInt(7)).operatorMultiply(BigInt(5)).toString()).assertEqual('65');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_2700
     * @tc.name testBigIntOperatorMultiply2Test027
     * @tc.desc Mindmap input: divide result as multiplicand in chained multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(30).operatorDivide(BigInt(5)).operatorMultiply(BigInt(7)).toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_2800
     * @tc.name testBigIntOperatorMultiply2Test028
     * @tc.desc Mindmap input: modulo result as multiplicand in chained multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(11).operatorModule(BigInt(3)).operatorMultiply(BigInt(10)).toString()).assertEqual('20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_2900
     * @tc.name testBigIntOperatorMultiply2Test029
     * @tc.desc Mindmap input: negate result as multiplicand in chained multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).negate().operatorMultiply(BigInt(3)).toString()).assertEqual('-30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_3000
     * @tc.name testBigIntOperatorMultiply2Test030
     * @tc.desc Mindmap input: increment result as multiplicand in chained multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test030', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorIncrement().operatorMultiply(BigInt(4)).toString()).assertEqual('24');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_3100
     * @tc.name testBigIntOperatorMultiply2Test031
     * @tc.desc Mindmap input: decrement result as multiplicand in chained multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test031', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorDecrement().operatorMultiply(BigInt(7)).toString()).assertEqual('63');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_3200
     * @tc.name testBigIntOperatorMultiply2Test032
     * @tc.desc Mindmap input: asIntN truncation result as multiplicand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test032', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(8, BigInt(100)).operatorMultiply(BigInt(2)).toString()).assertEqual('200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_3300
     * @tc.name testBigIntOperatorMultiply2Test033
     * @tc.desc Mindmap input: asUintN truncation result as multiplicand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test033', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(8, BigInt(200)).operatorMultiply(BigInt(2)).toString()).assertEqual('400');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_3400
     * @tc.name testBigIntOperatorMultiply2Test034
     * @tc.desc Mindmap input: add result as multiplier in chained multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test034', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorMultiply(BigInt(3).operatorAdd(BigInt(4))).toString()).assertEqual('700');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_3500
     * @tc.name testBigIntOperatorMultiply2Test035
     * @tc.desc Mindmap input: multiply result as multiplier in nested multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test035', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(200).operatorMultiply(BigInt(2).operatorMultiply(BigInt(3))).toString()).assertEqual('1200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_3600
     * @tc.name testBigIntOperatorMultiply2Test036
     * @tc.desc Mindmap input: doubleValue converted result as multiplicand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test036', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(75).doubleValue()).operatorMultiply(BigInt(10)).toString()).assertEqual('750');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_3700
     * @tc.name testBigIntOperatorMultiply2Test037
     * @tc.desc Mindmap input: getLong converted result as multiplicand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test037', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(12345).getLong()).operatorMultiply(BigInt(2)).toString()).assertEqual('24690');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_3800
     * @tc.name testBigIntOperatorMultiply2Test038
     * @tc.desc Mindmap input: string-constructed negative BigInt as multiplier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test038', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(50).operatorMultiply(BigInt('-100')).toString()).assertEqual('-5000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_3900
     * @tc.name testBigIntOperatorMultiply2Test039
     * @tc.desc Mindmap input: bitwise not result as multiplicand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test039', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorBitwiseNot().operatorMultiply(BigInt(2)).toString()).assertEqual('-12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_MULTIPLY_4000
     * @tc.name testBigIntOperatorMultiply2Test040
     * @tc.desc operatorMultiply on null/undefined/string receiver throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiply2Test040', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        (null as Object as BigInt).operatorMultiply(BigInt(1));
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (undefined as Object as BigInt).operatorMultiply(BigInt(1));
      }).assertThrowError('ClassCastError');
      expect((): void => {
        ('abc' as Object as BigInt).operatorMultiply(BigInt(1));
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (123 as Object as BigInt).operatorMultiply(BigInt(1));
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (true as Object as BigInt).operatorMultiply(BigInt(1));
      }).assertThrowError('ClassCastError');
    });
  });
}
