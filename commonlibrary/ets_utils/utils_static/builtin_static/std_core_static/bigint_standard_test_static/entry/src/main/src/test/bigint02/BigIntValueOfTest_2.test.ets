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

export default function BigIntValueOfTest_2(): void {
  describe('BigIntValueOfTest_2', () => {


    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0001
     * @tc.name testBigIntValueOfRadixPrefixCombined0001
     * @tc.desc Verify valueOf toString on hex/octal/binary prefixed string construction, including cross-radix zero equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfRadixPrefixCombined0001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt('0xFF').valueOf().toString()).assertEqual('255');
      expect(BigInt('0xFF').negate().valueOf().toString()).assertEqual('-255');
      expect(BigInt('0x7FFFFFFFFFFFFFFF').valueOf().toString()).assertEqual('9223372036854775807');
      expect(BigInt('0x8000000000000000').negate().valueOf().toString()).assertEqual('-9223372036854775808');

      expect(BigInt('0o77').valueOf().toString()).assertEqual('63');
      expect(BigInt('0o77').negate().valueOf().toString()).assertEqual('-63');
      expect(BigInt('0o777777777777777777777').valueOf().toString()).assertEqual('9223372036854775807');
      expect(BigInt('0o777777777777777777777').negate().valueOf().toString()).assertEqual('-9223372036854775807');

      expect(BigInt('0b1010').valueOf().toString()).assertEqual('10');
      expect(BigInt('0b1010').negate().valueOf().toString()).assertEqual('-10');
      expect(BigInt('0b11111111111111111111111111111111111111111111111111111').valueOf().toString()).assertEqual('9007199254740991');
      expect(BigInt('0b1000000000000000000000000000000000000000000000000000').negate().valueOf().toString()).assertEqual('-2251799813685248');
    });


    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0002
     * @tc.name testBigIntValueOfUltraLargeNegative0002
     * @tc.desc Verify valueOf toString on extremely large negative BigInt (100+ digits)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfUltraLargeNegative0002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s = '-9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';
      expect(BigInt(s).valueOf().toString()).assertEqual(s);
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0003
     * @tc.name testBigIntValueOfSmallExhaustive0003
     * @tc.desc Verify valueOf equals on every small integer from -5 to 5 for exhaustive boundary coverage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfSmallExhaustive0003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-5).valueOf().equals(BigInt(-5))).assertTrue();
      expect(BigInt(-4).valueOf().equals(BigInt(-4))).assertTrue();
      expect(BigInt(-3).valueOf().equals(BigInt(-3))).assertTrue();
      expect(BigInt(-2).valueOf().equals(BigInt(-2))).assertTrue();
      expect(BigInt(-1).valueOf().equals(BigInt(-1))).assertTrue();
      expect(BigInt(0).valueOf().equals(BigInt(0))).assertTrue();
      expect(BigInt(1).valueOf().equals(BigInt(1))).assertTrue();
      expect(BigInt(2).valueOf().equals(BigInt(2))).assertTrue();
      expect(BigInt(3).valueOf().equals(BigInt(3))).assertTrue();
      expect(BigInt(4).valueOf().equals(BigInt(4))).assertTrue();
      expect(BigInt(5).valueOf().equals(BigInt(5))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0004
     * @tc.name testBigIntValueOfLeadingZeros0004
     * @tc.desc Verify valueOf toString on strings with multiple leading zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfLeadingZeros0004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('00000123').valueOf().toString()).assertEqual('123');
      expect(BigInt('-00000123').valueOf().toString()).assertEqual('-123');
      expect(BigInt('00000000000000000000000000001').valueOf().toString()).assertEqual('1');
      expect(BigInt('-00000000000000000000000000001').valueOf().toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0005
     * @tc.name testBigIntValueOfWhitespacePrefix0005
     * @tc.desc Verify valueOf toString on strings with leading/trailing whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfWhitespacePrefix0005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('  42').valueOf().toString()).assertEqual('42');
      expect(BigInt('-42  ').valueOf().toString()).assertEqual('-42');
      expect(BigInt('  -42').valueOf().toString()).assertEqual('-42');
      expect(BigInt('  0  ').valueOf().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0006
     * @tc.name testBigIntValueOfPlusPrefix0006
     * @tc.desc Verify valueOf toString on plus-prefixed numeric strings covers explicit positive sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfPlusPrefix0006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('+42').valueOf().toString()).assertEqual('42');
      expect(BigInt('+0').valueOf().toString()).assertEqual('0');
      expect(BigInt('+123456789').valueOf().toString()).assertEqual('123456789');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0007
     * @tc.name testBigIntValueOfArithmeticOperations0007
     * @tc.desc Verify valueOf on results of addition/subtraction/multiplication operations (merged _1800/_1900/_2000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfArithmeticOperations0007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(100);
      const b = BigInt(200);
      expect(a.operatorAdd(b).valueOf().equals(BigInt(300))).assertTrue();
      expect(BigInt(-50).operatorAdd(BigInt(50)).valueOf().toString()).assertEqual('0');
      expect(BigInt(9223372036854775807).operatorAdd(BigInt(1)).valueOf().toString()).assertEqual('9223372036854775808');
      expect(BigInt(10).operatorSubtract(BigInt(20)).valueOf().equals(BigInt(-10))).assertTrue();
      expect(BigInt(0).operatorSubtract(BigInt(1)).valueOf().toString()).assertEqual('-1');
      expect(BigInt(-9223372036854775808).operatorSubtract(BigInt(1)).valueOf().toString()).assertEqual('-9223372036854775809');
      expect(BigInt(-3).operatorMultiply(BigInt(4)).valueOf().equals(BigInt(-12))).assertTrue();
      expect(BigInt(-3).operatorMultiply(BigInt(-4)).valueOf().equals(BigInt(12))).assertTrue();
      expect(BigInt(123456789).operatorMultiply(BigInt(2)).valueOf().toString()).assertEqual('246913578');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0008
     * @tc.name testBigIntValueOfTripleIdempotent0008
     * @tc.desc Verify valueOf is stable across three consecutive calls on various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfTripleIdempotent0008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pos = BigInt(42);
      const neg = BigInt(-99);
      const large = BigInt('9007199254740993');
      const zero = BigInt(0);
      expect(pos.valueOf().equals(pos.valueOf())).assertTrue();
      expect(pos.valueOf().equals(pos.valueOf())).assertTrue();
      expect(neg.valueOf().equals(neg.valueOf())).assertTrue();
      expect(neg.valueOf().equals(neg.valueOf())).assertTrue();
      expect(large.valueOf().equals(large.valueOf())).assertTrue();
      expect(zero.valueOf().equals(zero.valueOf())).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0009
     * @tc.name testBigIntValueOfPowerOfTwoBoundaries0009
     * @tc.desc Verify valueOf toString at 2^n boundaries including 2^53, 2^64, 2^128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfPowerOfTwoBoundaries0009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9007199254740992).valueOf().toString()).assertEqual('9007199254740992');
      expect(BigInt('18446744073709551616').valueOf().toString()).assertEqual('18446744073709551616');
      expect(BigInt('-18446744073709551616').valueOf().toString()).assertEqual('-18446744073709551616');
      expect(BigInt('340282366920938463463374607431768211456').valueOf().toString()).assertEqual('340282366920938463463374607431768211456');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0010
     * @tc.name testBigIntValueOfIntShortBoundaries0010
     * @tc.desc Verify valueOf toString on BigInt constructed from int/short type range boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfIntShortBoundaries0010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt(127).valueOf().toString()).assertEqual('127');
      expect(BigInt(-128).valueOf().toString()).assertEqual('-128');
      expect(BigInt(32767).valueOf().toString()).assertEqual('32767');
      expect(BigInt(-32768).valueOf().toString()).assertEqual('-32768');
      expect(BigInt(2147483647).valueOf().toString()).assertEqual('2147483647');
      expect(BigInt(-2147483648).valueOf().toString()).assertEqual('-2147483648');
      expect(BigInt(65536).valueOf().toString()).assertEqual('65536');
      expect(BigInt('4294967296').valueOf().toString()).assertEqual('4294967296');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0011
     * @tc.name testBigIntValueOfChainCall0011
     * @tc.desc Verify chained valueOf calls return equivalent BigInt to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfChainCall0011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(123456);
      expect(v.valueOf().valueOf().equals(v)).assertTrue();
      expect(v.valueOf().valueOf().valueOf().toString()).assertEqual('123456');
      expect(BigInt(-789).valueOf().valueOf().equals(BigInt(-789))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0012
     * @tc.name testBigIntValueOfAfterNegate0012
     * @tc.desc Verify valueOf toString after negate operation preserves correct magnitude with flipped sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfAfterNegate0012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).negate().valueOf().toString()).assertEqual('-100');
      expect(BigInt(-100).negate().valueOf().toString()).assertEqual('100');
      expect(BigInt(0).negate().valueOf().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0013
     * @tc.name testBigIntValueOfStringVsNumberEqual0013
     * @tc.desc Verify valueOf from string construction and number construction with same value are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfStringVsNumberEqual0013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(999).valueOf().equals(BigInt('999').valueOf())).assertTrue();
      expect(BigInt(0).valueOf().equals(BigInt('0').valueOf())).assertTrue();
      expect(BigInt(2147483647).valueOf().equals(BigInt('2147483647').valueOf())).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0014
     * @tc.name testBigIntValueOfBooleanConstruct0014
     * @tc.desc Verify valueOf on BigInt constructed from boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfBooleanConstruct0014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(false).valueOf().toString()).assertEqual('0');
      expect(BigInt(true).valueOf().toString()).assertEqual('1');
      expect(BigInt(false).valueOf().equals(BigInt(0))).assertTrue();
      expect(BigInt(true).valueOf().equals(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0015
     * @tc.name testBigIntValueOfNegativeZero0015
     * @tc.desc Verify valueOf on negative zero string forms normalizes to positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfNegativeZero0015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-0').valueOf().toString()).assertEqual('0');
      expect(BigInt('-000').valueOf().toString()).assertEqual('0');
      expect(BigInt('0').valueOf().toString()).assertEqual('0');
      expect(BigInt('-0000').valueOf().toString()).assertEqual('0');
      expect(BigInt('+0').valueOf().toString()).assertEqual('0');
      expect(BigInt('-0x0').valueOf().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0016
     * @tc.name testBigIntValueOfReverseOperation0016
     * @tc.desc Verify valueOf is unchanged after add-subtract round-trip operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfReverseOperation0016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(100);
      expect(v.operatorAdd(BigInt(5)).operatorSubtract(BigInt(5)).valueOf().equals(v)).assertTrue();
      const w = BigInt(-50);
      expect(w.operatorSubtract(BigInt(10)).operatorAdd(BigInt(10)).valueOf().equals(w)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0017
     * @tc.name testBigIntValueOfMassiveNumber0017
     * @tc.desc Verify valueOf toString on 500+ digit massive BigInt for extreme scale coverage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfMassiveNumber0017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s = '1' + '0'.repeat(499);
      expect(BigInt(s).valueOf().toString()).assertEqual(s);
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0018
     * @tc.name testBigIntValueOfFromULongBoundary0018
     * @tc.desc Verify valueOf on fromULong at 32-bit unsigned boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfFromULongBoundary0018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(4294967295).valueOf().toString()).assertEqual('4294967295');
      expect(BigInt.fromULong(4294967296).valueOf().toString()).assertEqual('4294967296');
      expect(BigInt.fromULong(4294967295).valueOf().equals(BigInt('4294967295'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0019
     * @tc.name testBigIntValueOfMixedCaseHex0019
     * @tc.desc Verify valueOf on mixed-case hex strings (0xFF vs 0xff) produces equal BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfMixedCaseHex0019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const parseHex = (str: string): BigInt => {
        let s = str;
        let isNegative = false;

        if (s.indexOf('-') === 0) {
          isNegative = true;
          s = s.substring(1);
        }

        if (s.indexOf('0x') === 0 || s.indexOf('0X') === 0) {
          s = s.substring(2);
        }

        let decimalStr = BigInt(0).toString();
        for (let i = 0; i < s.length; i++) {
          const c = s[i];
          let digitValue = 0;
          if (c >= '0' && c <= '9') {
            digitValue = c.charCodeAt(0) - '0'.charCodeAt(0);
          } else if (c >= 'A' && c <= 'F') {
            digitValue = c.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
          } else if (c >= 'a' && c <= 'f') {
            digitValue = c.charCodeAt(0) - 'a'.charCodeAt(0) + 10;
          } else {
            throw new Error(`Invalid hex character: ${c}`);
          }
          decimalStr = (BigInt(decimalStr) * BigInt(16) + BigInt(digitValue)).toString();
        }

        const finalStr = isNegative ? '-' + decimalStr : decimalStr;
        return BigInt(finalStr);
      };

      const val1 = parseHex('0xFF');
      const val2 = parseHex('0xff');
      expect(val1.valueOf().equals(val2.valueOf())).assertTrue();

      const val3 = parseHex('0xAbC');
      const val4 = parseHex('0xabc');
      expect(val3.valueOf().equals(val4.valueOf())).assertTrue();

      const val5 = parseHex('-0xFF');
      const val6 = parseHex('-0xff');
      expect(val5.valueOf().equals(val6.valueOf())).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0020
     * @tc.name testBigIntValueOfSignMutualExclusive0020
     * @tc.desc Verify valueOf equality and sign correlation across positive/negative values in a loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfSignMutualExclusive0020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const values: BigInt[] = [BigInt(-100), BigInt(-1), BigInt(0), BigInt(1), BigInt(100), BigInt(9223372036854775807), BigInt(-9223372036854775808), BigInt('999999999999999999999999999999')];
      for (let i = 0; i < values.length; i++) {
        const v = values[i];
        const val = v.valueOf();
        expect(val.equals(v)).assertTrue();
        expect(val.positive() === v.positive()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0021
     * @tc.name testBigIntValueOfDivResult0021
     * @tc.desc Verify valueOf on division result (TC099)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfDivResult0021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorDivide(BigInt(3)).valueOf().toString()).assertEqual('33');
      expect(BigInt(-100).operatorDivide(BigInt(3)).valueOf().toString()).assertEqual('-33');
      expect(BigInt(0).operatorDivide(BigInt(5)).valueOf().toString()).assertEqual('0');
      expect(BigInt(9223372036854775807).operatorDivide(BigInt(1)).valueOf().toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0022
     * @tc.name testBigIntValueOfModResult0022
     * @tc.desc Verify valueOf on modulo result (TC100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfModResult0022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100n % 3n).valueOf().toString()).assertEqual('1');
      expect(BigInt(-100n % 3n).valueOf().toString()).assertEqual('-1');
      expect(BigInt(7n % 7n).valueOf().toString()).assertEqual('0');
      expect(BigInt(123456789n % 10000n).valueOf().toString()).assertEqual('6789');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0023
     * @tc.name testBigIntValueOfPowResult0023
     * @tc.desc Verify valueOf on pow result including 2^100 extremely large value (merged _3900/_5100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfPowResult0023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).pow(BigInt(10)).valueOf().toString()).assertEqual('1024');
      expect(BigInt(2).pow(BigInt(0)).valueOf().toString()).assertEqual('1');
      expect(BigInt(3).pow(BigInt(5)).valueOf().toString()).assertEqual('243');
      expect(BigInt(10).pow(BigInt(3)).valueOf().toString()).assertEqual('1000');
      const pow100 = BigInt('1267650600228229401496703205376');
      expect(pow100.valueOf().toString()).assertEqual('1267650600228229401496703205376');
      expect(pow100.valueOf().equals(pow100)).assertTrue();
      const negPow100 = BigInt('-1267650600228229401496703205376');
      expect(negPow100.valueOf().toString()).assertEqual('-1267650600228229401496703205376');
      expect(negPow100.valueOf().equals(negPow100)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0024
     * @tc.name testBigIntValueOfShiftResult0024
     * @tc.desc Verify valueOf on left/right shift result (TC102, TC103)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfShiftResult0024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorLeftShift(BigInt(10)).valueOf().toString()).assertEqual('1024');
      expect(BigInt(1024).operatorRightShift(BigInt(5)).valueOf().toString()).assertEqual('32');
      expect(BigInt(100).operatorLeftShift(BigInt(0)).valueOf().toString()).assertEqual('100');
      expect(BigInt(-8).operatorRightShift(BigInt(2)).valueOf().toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0025
     * @tc.name testBigIntValueOfBitAndResult0025
     * @tc.desc Verify valueOf on bitwise AND result (TC104)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfBitAndResult0025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).operatorBitwiseAnd(BigInt(15)).valueOf().toString()).assertEqual('15');
      expect(BigInt(123).operatorBitwiseAnd(BigInt(0)).valueOf().toString()).assertEqual('0');
      expect(BigInt(0xFF).operatorBitwiseAnd(BigInt(0x0F)).valueOf().toString()).assertEqual('15');
      expect(BigInt(-1).operatorBitwiseAnd(BigInt(255)).valueOf().toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0026
     * @tc.name testBigIntValueOfBitOrResult0026
     * @tc.desc Verify valueOf on bitwise OR result (TC105)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfBitOrResult0026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(240).operatorBitwiseOr(BigInt(15)).valueOf().toString()).assertEqual('255');
      expect(BigInt(0).operatorBitwiseOr(BigInt(0)).valueOf().toString()).assertEqual('0');
      expect(BigInt(1).operatorBitwiseOr(BigInt(2)).valueOf().toString()).assertEqual('3');
      expect(BigInt(-1).operatorBitwiseOr(BigInt(0)).valueOf().toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0027
     * @tc.name testBigIntValueOfBitXorResult0027
     * @tc.desc Verify valueOf on bitwise XOR result (TC106)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfBitXorResult0027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).operatorBitwiseXor(BigInt(15)).valueOf().toString()).assertEqual('240');
      expect(BigInt(123).operatorBitwiseXor(BigInt(123)).valueOf().toString()).assertEqual('0');
      expect(BigInt(7).operatorBitwiseXor(BigInt(3)).valueOf().toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0028
     * @tc.name testBigIntValueOfBitNotResult0028
     * @tc.desc Verify valueOf on bitwise NOT result (TC107)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfBitNotResult0028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).operatorBitwiseNot().valueOf().toString()).assertEqual('-256');
      expect(BigInt(0).operatorBitwiseNot().valueOf().toString()).assertEqual('-1');
      expect(BigInt(-1).operatorBitwiseNot().valueOf().toString()).assertEqual('0');
      expect(BigInt(1).operatorBitwiseNot().valueOf().toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0029
     * @tc.name testBigIntValueOfComparison0029
     * @tc.desc Verify valueOf return value can participate in comparison operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfComparison0029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(100).valueOf();
      expect(v.operatorLessThan(BigInt(101))).assertTrue();
      expect(v.operatorGreaterThan(BigInt(99))).assertTrue();
      expect(v.operatorLessThan(BigInt(100))).assertFalse();
      expect(v.operatorGreaterThan(BigInt(100))).assertFalse();
      const neg = BigInt(-50).valueOf();
      expect(neg.operatorLessThan(BigInt(0))).assertTrue();
      expect(neg.operatorGreaterThan(BigInt(-100))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0030
     * @tc.name testBigIntValueOfRadixConvert0030
     * @tc.desc Verify valueOf return value toString(radix) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfRadixConvert0030', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).valueOf().toString(16)).assertEqual('ff');
      expect(BigInt(10).valueOf().toString(2)).assertEqual('1010');
      expect(BigInt(64).valueOf().toString(8)).assertEqual('100');
      expect(BigInt(35).valueOf().toString(36)).assertEqual('z');
      expect(BigInt(0).valueOf().toString(16)).assertEqual('0');
      expect(BigInt(-255).valueOf().toString(16)).assertEqual('-ff');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0031
     * @tc.name testBigIntValueOfDoubleValue0031
     * @tc.desc Verify valueOf return value doubleValue() conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfDoubleValue0031', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(99).valueOf().doubleValue()).assertEqual(99);
      expect(BigInt(0).valueOf().doubleValue()).assertEqual(0);
      expect(BigInt(-123).valueOf().doubleValue()).assertEqual(-123);
      expect(BigInt(9007199254740992).valueOf().doubleValue()).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0032
     * @tc.name testBigIntValueOfGetLong0032
     * @tc.desc Verify valueOf return value getLong() conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfGetLong0032', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(700700).valueOf().getLong()).assertEqual(700700);
      expect(BigInt(0).valueOf().getLong()).assertEqual(0);
      expect(BigInt(9223372036854775807).valueOf().getLong()).assertEqual(9223372036854775807);
      expect(BigInt(-9223372036854775808).valueOf().getLong()).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0033
     * @tc.name testBigIntValueOfImmutability0033
     * @tc.desc Verify valueOf does not modify original BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfImmutability0033', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src1 = BigInt(333);
      src1.valueOf();
      expect(src1.toString()).assertEqual('333');

      const src2 = BigInt('18446744073709551615');
      src2.valueOf();
      expect(src2.toString()).assertEqual('18446744073709551615');

      const src3 = BigInt(-88888);
      src3.valueOf();
      expect(src3.toString()).assertEqual('-88888');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0034
     * @tc.name testBigIntValueOfChainedArithmetic0034
     * @tc.desc Verify valueOf return value can chain into arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfChainedArithmetic0034', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(10).valueOf();
      expect(v.operatorAdd(BigInt(5)).toString()).assertEqual('15');
      expect(v.operatorSubtract(BigInt(3)).toString()).assertEqual('7');
      expect(v.operatorMultiply(BigInt(7)).toString()).assertEqual('70');

      const neg = BigInt(55).valueOf();
      expect(neg.negate().toString()).assertEqual('-55');

      const powVal = BigInt(2).valueOf();
      expect(powVal.pow(BigInt(10)).toString()).assertEqual('1024');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0035
     * @tc.name testBigIntValueOfTenPow0035
     * @tc.desc Verify valueOf on 10^50 extremely large value (TC095)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfTenPow0035', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v50 = BigInt('1000000000000000000000000000000000000000000000000');
      expect(v50.valueOf().toString()).assertEqual('1000000000000000000000000000000000000000000000000');
      expect(v50.valueOf().equals(v50)).assertTrue();

      const negV50 = BigInt('-1000000000000000000000000000000000000000000000000');
      expect(negV50.valueOf().toString()).assertEqual('-1000000000000000000000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0036
     * @tc.name testBigIntValueOfNegZeroArithmetic0036
     * @tc.desc Verify valueOf on negative zero participates in arithmetic correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfNegZeroArithmetic0036', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(-0).valueOf();
      expect(v.operatorAdd(BigInt(0)).toString()).assertEqual('0');
      expect(v.operatorAdd(BigInt(888)).toString()).assertEqual('888');
      expect(v.equals(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0037
     * @tc.name testBigIntValueOfSelfAdd0037
     * @tc.desc Verify valueOf return value added to itself doubles correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfSelfAdd0037', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt('9007199254740993').valueOf();
      expect(v.operatorAdd(v).toString()).assertEqual('18014398509481986');
      const v2 = BigInt(99).valueOf();
      expect(v2.operatorAdd(v2).toString()).assertEqual('198');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0038
     * @tc.name testBigIntValueOfIdentityElement0038
     * @tc.desc Verify valueOf on 1n (identity for multiplication) and 0n (identity for addition)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfIdentityElement0038', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const one = BigInt(1).valueOf();
      expect(one.operatorMultiply(BigInt(999)).toString()).assertEqual('999');
      const zero = BigInt(0).valueOf();
      expect(zero.operatorAdd(BigInt(888)).toString()).assertEqual('888');
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0039
     * @tc.name testBigIntValueOfLiteralNegZero0039
     * @tc.desc Verify valueOf on numeric literal negative zero new BigInt(-0) returns "0" (VOF-INIT-001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfLiteralNegZero0039', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nz: BigInt = new BigInt(-0).valueOf();
      expect(nz.toString()).assertEqual('0');
      const pz: BigInt = new BigInt(0).valueOf();
      expect(pz.equals(nz)).assertTrue();
      expect(nz.doubleValue()).assertEqual(0);
      expect(nz.getLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0040
     * @tc.name testBigIntValueOfNumericLiterals0040
     * @tc.desc Verify valueOf on BigInt constructed from numeric literals hex/octal/binary/scientific (VOF-INIT-002)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfNumericLiterals0040', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(0xff).valueOf().toString()).assertEqual('255');
      expect(new BigInt(0o777).valueOf().toString()).assertEqual('511');
      expect(new BigInt(0b1010).valueOf().toString()).assertEqual('10');
      expect(new BigInt(1e3).valueOf().toString()).assertEqual('1000');
      expect(new BigInt(0xff).valueOf().equals(new BigInt('255').valueOf())).assertTrue();
      expect(new BigInt(0o777).valueOf().equals(new BigInt('511').valueOf())).assertTrue();
      expect(new BigInt(0b1010).valueOf().equals(new BigInt('10').valueOf())).assertTrue();
      expect(new BigInt(1e3).valueOf().equals(new BigInt('1000').valueOf())).assertTrue();
    });
    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_EXT_0041
     * @tc.name testBigIntValueOfDoubleConstructed0041
     * @tc.desc Verify valueOf on BigInt constructed from double integer 100.0 returns '100' (VOF-01)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfDoubleConstructed0041', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(100.0).valueOf().toString()).assertEqual('100');
      expect(new BigInt(0.0).valueOf().toString()).assertEqual('0');
      expect(new BigInt(-50.0).valueOf().toString()).assertEqual('-50');
      expect(new BigInt(1e6).valueOf().toString()).assertEqual('1000000');
      expect(new BigInt(1e3).valueOf().equals(new BigInt(1000).valueOf())).assertTrue();
    });
    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_EXT_0042
     * @tc.name testBigIntValueOfDoubleValueEqualsOriginal0042
     * @tc.desc Verify valueOf return value's doubleValue equals original BigInt's doubleValue (VOF-06)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfDoubleValueEqualsOriginal0042', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src: BigInt = new BigInt(999);
      expect(src.valueOf().doubleValue()).assertEqual(src.doubleValue());
      const srcNeg: BigInt = new BigInt(-777);
      expect(srcNeg.valueOf().doubleValue()).assertEqual(srcNeg.doubleValue());
      const srcZero: BigInt = new BigInt(0);
      expect(srcZero.valueOf().doubleValue()).assertEqual(srcZero.doubleValue());
      const srcLarge: BigInt = new BigInt(9007199254740992);
      expect(srcLarge.valueOf().doubleValue()).assertEqual(srcLarge.doubleValue());
    });

  });
}
