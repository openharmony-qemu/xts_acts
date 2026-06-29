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

export default function BigIntOperatorGreaterThan2Test(): void {
  describe('testBigIntOperatorGreaterThan2Test', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0100
     * @tc.name testBigIntOperatorGreaterThan2Test0100
     * @tc.desc operatorGreaterThan zero-related boundary comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorGreaterThan(BigInt(0))).assertFalse();
      expect(BigInt(1).operatorGreaterThan(BigInt(0))).assertTrue();
      expect(BigInt(-1).operatorGreaterThan(BigInt(0))).assertFalse();
      expect(BigInt(0).operatorGreaterThan(BigInt(1))).assertFalse();
      expect(BigInt(0).operatorGreaterThan(BigInt(-1))).assertTrue();
      expect(BigInt(1).operatorGreaterThan(BigInt(-1))).assertTrue();
      expect(BigInt(-1).operatorGreaterThan(BigInt(1))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0200
     * @tc.name testBigIntOperatorGreaterThan2Test0200
     * @tc.desc operatorGreaterThan across byte/short/int/long min/max boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(127).operatorGreaterThan(BigInt(-128))).assertTrue();
      expect(BigInt(-128).operatorGreaterThan(BigInt(127))).assertFalse();
      expect(BigInt(32767).operatorGreaterThan(BigInt(127))).assertTrue();
      expect(BigInt(-32768).operatorGreaterThan(BigInt(-128))).assertFalse();
      expect(BigInt(2147483647).operatorGreaterThan(BigInt(32767))).assertTrue();
      expect(BigInt(-2147483648).operatorGreaterThan(BigInt(-32768))).assertFalse();
      expect(BigInt('9223372036854775807').operatorGreaterThan(BigInt(2147483647))).assertTrue();
      expect(BigInt('-9223372036854775808').operatorGreaterThan(BigInt(-2147483648))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0300
     * @tc.name testBigIntOperatorGreaterThan2Test0300
     * @tc.desc operatorGreaterThan large positive number comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('99999999999999999999').operatorGreaterThan(BigInt(1))).assertTrue();
      expect(BigInt(1).operatorGreaterThan(BigInt('99999999999999999999'))).assertFalse();
      expect(BigInt('9223372036854775808').operatorGreaterThan(BigInt('9223372036854775807'))).assertTrue();
      expect(BigInt('88888888888888888888').operatorGreaterThan(BigInt('77777777777777777777'))).assertTrue();
      expect(BigInt('11111111111111111111').operatorGreaterThan(BigInt('22222222222222222222'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0400
     * @tc.name testBigIntOperatorGreaterThan2Test0400
     * @tc.desc operatorGreaterThan large negative number comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-11111111111111111111').operatorGreaterThan(BigInt('-22222222222222222222'))).assertTrue();
      expect(BigInt('-99999999999999999999').operatorGreaterThan(BigInt('-11111111111111111111'))).assertFalse();
      expect(BigInt('-9223372036854775808').operatorGreaterThan(BigInt('-99999999999999999999'))).assertTrue();
      expect(BigInt('-99999999999999999999').operatorGreaterThan(BigInt('-9223372036854775808'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0500
     * @tc.name testBigIntOperatorGreaterThan2Test0500
     * @tc.desc operatorGreaterThan cross-sign and large-value cross comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('99999999999999999999').operatorGreaterThan(BigInt('-99999999999999999999'))).assertTrue();
      expect(BigInt('-99999999999999999999').operatorGreaterThan(BigInt('99999999999999999999'))).assertFalse();
      expect(BigInt('1000000000000000000000000000000').operatorGreaterThan(BigInt('-1000000000000000000000000000000')))
        .assertTrue();
      expect(BigInt(1).operatorGreaterThan(BigInt('-9223372036854775808'))).assertTrue();
      expect(BigInt(-1).operatorGreaterThan(BigInt('9223372036854775807'))).assertFalse();
      expect(BigInt(1).operatorGreaterThan(BigInt('-999999999999'))).assertTrue();
      expect(BigInt(-1).operatorGreaterThan(BigInt('999999999999'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0600
     * @tc.name testBigIntOperatorGreaterThan2Test0600
     * @tc.desc operatorGreaterThan equal value comparisons return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).operatorGreaterThan(BigInt(42))).assertFalse();
      expect(BigInt(-42).operatorGreaterThan(BigInt(-42))).assertFalse();
      expect(BigInt('12345678901234567890').operatorGreaterThan(BigInt('12345678901234567890'))).assertFalse();
      expect(BigInt('-12345678901234567890').operatorGreaterThan(BigInt('-12345678901234567890'))).assertFalse();
      expect(BigInt('9223372036854775807').operatorGreaterThan(BigInt('9223372036854775807'))).assertFalse();
      expect(BigInt('-9223372036854775808').operatorGreaterThan(BigInt('-9223372036854775808'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0700
     * @tc.name testBigIntOperatorGreaterThan2Test0700
     * @tc.desc operatorGreaterThan does not mutate operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(100);
      const b = BigInt(50);
      const origA = a.toString();
      const origB = b.toString();
      a.operatorGreaterThan(b);
      expect(a.toString()).assertEqual(origA);
      expect(b.toString()).assertEqual(origB);

      const c = BigInt(42);
      const d = BigInt(42);
      c.operatorGreaterThan(d);
      c.operatorGreaterThan(BigInt(0));
      c.operatorGreaterThan(BigInt(-1));
      expect(c.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0800
     * @tc.name testBigIntOperatorGreaterThan2Test0800
     * @tc.desc operatorGreaterThan returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof BigInt(10).operatorGreaterThan(BigInt(5))).assertEqual('boolean');
      expect(typeof BigInt(5).operatorGreaterThan(BigInt(10))).assertEqual('boolean');
      expect(typeof BigInt(7).operatorGreaterThan(BigInt(7))).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0900
     * @tc.name testBigIntOperatorGreaterThan2Test0900
     * @tc.desc operatorGreaterThan compare operatorDivide result with divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorDivide(BigInt(3)).operatorGreaterThan(BigInt(3))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_1000
     * @tc.name testBigIntOperatorGreaterThan2Test1000
     * @tc.desc operatorGreaterThan compare negative division result with smaller negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt(-100).operatorDivide(BigInt(3)).operatorGreaterThan(BigInt(-50))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_1100
     * @tc.name testBigIntOperatorGreaterThan2Test1100
     * @tc.desc operatorGreaterThan compare positive modulo result with a small number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt(50).operatorModule(BigInt(13)).operatorGreaterThan(BigInt(5))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_1200
     * @tc.name testBigIntOperatorGreaterThan2Test1200
     * @tc.desc operatorGreaterThan compare negative modulo result with modulus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt(-50).operatorModule(BigInt(13)).operatorGreaterThan(BigInt(-13))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_1300
     * @tc.name testBigIntOperatorGreaterThan2Test1300
     * @tc.desc operatorGreaterThan compare sum of two negatives with a smaller negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt(-60).operatorAdd(BigInt(-50)).operatorGreaterThan(BigInt(-200))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_1400
     * @tc.name testBigIntOperatorGreaterThan2Test1400
     * @tc.desc operatorGreaterThan compare zero product with negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt(999).operatorMultiply(BigInt(0)).operatorGreaterThan(BigInt(-1))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_1500
     * @tc.name testBigIntOperatorGreaterThan2Test1500
     * @tc.desc operatorGreaterThan compare pow with zero exponent against zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).pow(BigInt(0)).operatorGreaterThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_1600
     * @tc.name testBigIntOperatorGreaterThan2Test1600
     * @tc.desc operatorGreaterThan compare negative base with even exponent (positive result) against a small number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(BigInt(-5).pow(BigInt(2)).operatorGreaterThan(BigInt(10))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_1700
     * @tc.name testBigIntOperatorGreaterThan2Test1700
     * @tc.desc operatorGreaterThan compare asIntN truncated negative with a regular negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt.asIntN(8, BigInt(-300)).operatorGreaterThan(BigInt(-100))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_1800
     * @tc.name testBigIntOperatorGreaterThan2Test1800
     * @tc.desc operatorGreaterThan compare asUintN 32-bit max with a 16-bit max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt.asUintN(32, BigInt(4294967295)).operatorGreaterThan(BigInt(65535))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_1900
     * @tc.name testBigIntOperatorGreaterThan2Test1900
     * @tc.desc operatorGreaterThan compare fromULong(0) with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(0).operatorGreaterThan(BigInt(0))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_2000
     * @tc.name testBigIntOperatorGreaterThan2Test2000
     * @tc.desc operatorGreaterThan compare fromULong small value with negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(1).operatorGreaterThan(BigInt(-1))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_2100
     * @tc.name testBigIntOperatorGreaterThan2Test2100
     * @tc.desc operatorGreaterThan compare getLong reconstructed value with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt(1).getLong()).operatorGreaterThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_2200
     * @tc.name testBigIntOperatorGreaterThan2Test2200
     * @tc.desc operatorGreaterThan compare getULong from negative BigInt (treated as unsigned) with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let uLong = BigInt(-1).getULong()
      expect(BigInt.fromULong(uLong).operatorGreaterThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_2300
     * @tc.name testBigIntOperatorGreaterThan2Test2300
     * @tc.desc operatorGreaterThan compare hexadecimal parsed string with decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt("0x" + BigInt(255).toString(16)).operatorGreaterThan(BigInt(200))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_2400
     * @tc.name testBigIntOperatorGreaterThan2Test2400
     * @tc.desc operatorGreaterThan compare octal parsed string with decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt("0o"+BigInt(100).toString(8)).operatorGreaterThan(BigInt(99))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_2500
     * @tc.name testBigIntOperatorGreaterThan2Test2500
     * @tc.desc operatorGreaterThan compare binary parsed string with decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt("0b"+BigInt(42).toString(2)).operatorGreaterThan(BigInt(41))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_2600
     * @tc.name testBigIntOperatorGreaterThan2Test2600
     * @tc.desc operatorGreaterThan compare sum of two same-sign large numbers with a regular number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt('5000000000000000000')
          .operatorAdd(BigInt('5000000000000000000'))
          .operatorGreaterThan(BigInt('9000000000000000000'))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_2700
     * @tc.name testBigIntOperatorGreaterThan2Test2700
     * @tc.desc operatorGreaterThan compare subtraction result that stays the same (a - 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test2700',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(BigInt(777).operatorSubtract(BigInt(0)).operatorGreaterThan(BigInt(776))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_2800
     * @tc.name testBigIntOperatorGreaterThan2Test2800
     * @tc.desc operatorGreaterThan compare product of two negatives (positive result) with a big number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test2800',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(BigInt(-100).operatorMultiply(BigInt(-200)).operatorGreaterThan(BigInt(15000))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_2900
     * @tc.name testBigIntOperatorGreaterThan2Test2900
     * @tc.desc operatorGreaterThan compare bitwise AND zero result with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt(7).operatorBitwiseAnd(BigInt(8)).operatorGreaterThan(BigInt(0))).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_3000
     * @tc.name testBigIntOperatorGreaterThan2Test3000
     * @tc.desc operatorGreaterThan compare bitwise OR with one operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt(240).operatorBitwiseOr(BigInt(15)).operatorGreaterThan(BigInt(255))).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_3100
     * @tc.name testBigIntOperatorGreaterThan2Test3100
     * @tc.desc operatorGreaterThan compare bitwise XOR of same value (result 0) with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt(123).operatorBitwiseXor(BigInt(123)).operatorGreaterThan(BigInt(0))).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_3200
     * @tc.name testBigIntOperatorGreaterThan2Test3200
     * @tc.desc operatorGreaterThan compare left shift of negative number with a smaller negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test3200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(BigInt(-1).operatorLeftShift(BigInt(8)).operatorGreaterThan(BigInt(-300))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_3300
     * @tc.name testBigIntOperatorGreaterThan2Test3300
     * @tc.desc operatorGreaterThan compare right shift of small positive to zero with negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test3300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt(1).operatorRightShift(new BigInt(1)).operatorGreaterThan(BigInt(-1))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_3400
     * @tc.name testBigIntOperatorGreaterThan2Test3400
     * @tc.desc operatorGreaterThan compare bitwise NOT of positive with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test3400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(BigInt(5).operatorBitwiseNot().operatorGreaterThan(BigInt(0))).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_3500
     * @tc.name testBigIntOperatorGreaterThan2Test3500
     * @tc.desc operatorGreaterThan compare bitwise NOT of negative (positive result) with a big number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test3500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(BigInt(-5).operatorBitwiseNot().operatorGreaterThan(BigInt(0))).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_3600
     * @tc.name testBigIntOperatorGreaterThan2Test3600
     * @tc.desc operatorGreaterThan compare incremented negative with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt(-10).operatorIncrement().operatorGreaterThan(BigInt(-9))).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_3700
     * @tc.name testBigIntOperatorGreaterThan2Test3700
     * @tc.desc operatorGreaterThan compare decremented large number with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt('1000000000000000000').operatorDecrement().operatorGreaterThan(BigInt('999999999999999999')))
          .assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_3800
     * @tc.name testBigIntOperatorGreaterThan2Test3800
     * @tc.desc operatorGreaterThan compare negate of a small negative with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test3800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt(-1).negate().operatorGreaterThan(BigInt(0))).assertTrue();
      });


    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_3900
     * @tc.name testBigIntOperatorGreaterThan2Test3900
     * @tc.desc operatorGreaterThan compare string with leading zeros vs same without
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(BigInt('00123').operatorGreaterThan(BigInt('123'))).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_4000
     * @tc.name testBigIntOperatorGreaterThan2Test4000
     * @tc.desc operatorGreaterThan compare negative string with leading zeros vs same without
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThan2Test4000',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(BigInt('-00123').operatorGreaterThan(BigInt('-123'))).assertFalse();
      });
  });
}
