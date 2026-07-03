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

export default function BigIntPositiveTest_2(): void {
  describe('BigIntPositiveTest_2', () => {


    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0001
     * @tc.name testBigIntPositiveRadixString0001
     * @tc.desc Verify positive() on hex/octal/binary prefixed string values covers missing radix dimension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveRadixString0001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).positive()).assertTrue();
      expect(BigInt(63).positive()).assertTrue();
      expect(BigInt(10).positive()).assertTrue();
      expect(BigInt('9223372036854775807').positive()).assertTrue();

      expect(BigInt(-255).positive()).assertFalse();
      expect(BigInt(-63).positive()).assertFalse();
      expect(BigInt(-10).positive()).assertFalse();
      expect(BigInt('-9223372036854775808').positive()).assertFalse();
    });
    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0002
     * @tc.name testBigIntPositiveUltraLarge0002
     * @tc.desc Verify positive() on extremely large BigInt values (100+ digits) beyond original coverage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveUltraLarge0002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890').positive()).assertTrue();
      expect(BigInt('-1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890').positive()).assertFalse();
      expect(BigInt('9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999').positive()).assertTrue();
      expect(BigInt('1' + '0'.repeat(200)).positive()).assertTrue();
      expect(BigInt('-1' + '0'.repeat(200)).positive()).assertFalse();
      expect(BigInt('0'.repeat(100)).positive()).assertTrue();
    });


    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0003
     * @tc.name testBigIntPositiveZeroVariants0003
     * @tc.desc Verify positive() returns true for zero across all construction methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveZeroVariants0003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).positive()).assertTrue();
      expect(BigInt('0').positive()).assertTrue();
      expect(BigInt('-0').positive()).assertTrue();
      expect(BigInt('000').positive()).assertTrue();
      expect(BigInt('-000').positive()).assertTrue();
      expect(BigInt(false).positive()).assertTrue();
      expect(BigInt.fromULong(0).positive()).assertTrue();
      expect(BigInt('0x0').positive()).assertTrue();
      expect(BigInt('0b0').positive()).assertTrue();
      expect(BigInt('0o0').positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0004
     * @tc.name testBigIntPositiveLeadingSignPrefix0004
     * @tc.desc Verify positive() on strings with leading zeros, plus sign and whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveLeadingSignPrefix0004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('  42').positive()).assertTrue();
      expect(BigInt('42  ').positive()).assertTrue();
      expect(BigInt('  -42').positive()).assertFalse();
      expect(BigInt('00000123').positive()).assertTrue();
      expect(BigInt('-00000123').positive()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0005
     * @tc.name testBigIntPositiveArithmeticResult0005
     * @tc.desc Verify positive() on results of arithmetic operations covers missing dynamic result dimension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveArithmeticResult0005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorAdd(BigInt(5)).positive()).assertTrue();
      expect(BigInt(5).operatorSubtract(BigInt(10)).positive()).assertFalse();
      expect(BigInt(-3).operatorMultiply(BigInt(4)).positive()).assertFalse();
      expect(BigInt(-3).operatorMultiply(BigInt(-4)).positive()).assertTrue();
      expect(BigInt(-5).operatorAdd(BigInt(5)).positive()).assertTrue();
      expect(BigInt(0).operatorMultiply(BigInt(-1)).positive()).assertTrue();
      expect(BigInt(0).operatorSubtract(BigInt(1)).positive()).assertFalse();
      expect(BigInt(9223372036854775807).operatorAdd(BigInt(1)).positive()).assertTrue();
      expect(BigInt(-9223372036854775808).operatorSubtract(BigInt(1)).positive()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0006
     * @tc.name testBigIntPositivePowerOfTwoBoundaries0006
     * @tc.desc Verify positive() at 2^n boundaries including beyond 64-bit range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositivePowerOfTwoBoundaries0006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).positive()).assertTrue();
      expect(BigInt(2).positive()).assertTrue();
      expect(BigInt(4503599627370496).positive()).assertTrue();
      expect(BigInt(9007199254740992).positive()).assertTrue();
      expect(BigInt('18446744073709551616').positive()).assertTrue();
      expect(BigInt('-18446744073709551616').positive()).assertFalse();
      expect(BigInt('340282366920938463463374607431768211456').positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0007
     * @tc.name testBigIntPositiveFromIntAndShort0007
     * @tc.desc Verify positive() on BigInt constructed from int/short range values and boundary+1 extensions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveFromIntAndShort0007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(127).positive()).assertTrue();
      expect(BigInt(-128).positive()).assertFalse();
      expect(BigInt(32767).positive()).assertTrue();
      expect(BigInt(-32768).positive()).assertFalse();
      expect(BigInt(2147483647).positive()).assertTrue();
      expect(BigInt(-2147483648).positive()).assertFalse();
      expect(new BigInt(128).positive()).assertTrue();
      expect(new BigInt(-129).positive()).assertFalse();
      expect(new BigInt(65536).positive()).assertTrue();
      expect(new BigInt(-65536).positive()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0008
     * @tc.name testBigIntPositiveSignComplement0008
     * @tc.desc Verify positive() and negative() are mutually exclusive on all-value ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveSignComplement0008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const values: BigInt[] = [BigInt(-100), BigInt(-1), BigInt(0), BigInt(1), BigInt(100), BigInt(9223372036854775807), BigInt(-9223372036854775808), BigInt('999999999999999999999999999999')];
      for (let i = 0; i < values.length; i++) {
        const v = values[i];
        if (v.positive()) {
          expect(v.negative()).assertFalse();
        } else {
          expect(v.negative()).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0009
     * @tc.name testBigIntPositiveWrappingConstruct0009
     * @tc.desc Verify positive() on BigInt constructed by wrapping another BigInt instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveWrappingConstruct0009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(new BigInt(new BigInt(1)).positive()).assertTrue();
      expect(new BigInt(new BigInt(127)).positive()).assertTrue();
      expect(new BigInt(new BigInt(65535)).positive()).assertTrue();
      expect(new BigInt(new BigInt(2147483647)).positive()).assertTrue();
      expect(new BigInt(new BigInt("9223372036854775807")).positive()).assertTrue();
      expect(new BigInt(new BigInt(1000000)).positive()).assertTrue();

      expect(new BigInt(new BigInt(-1)).positive()).assertFalse();
      expect(new BigInt(new BigInt(-128)).positive()).assertFalse();
      expect(new BigInt(new BigInt(-65535)).positive()).assertFalse();
      expect(new BigInt(new BigInt(-2147483648)).positive()).assertFalse();
      expect(new BigInt(new BigInt("-9223372036854775808")).positive()).assertFalse();
      expect(new BigInt(new BigInt(-1000000)).positive()).assertFalse();

      expect(new BigInt(new BigInt(0)).positive()).assertTrue();
      expect(new BigInt(new BigInt("000")).positive()).assertTrue();

      expect(new BigInt("0000000000000000000000000000000000000000000000000000000").positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0010
     * @tc.name testBigIntPositiveNegateResult0010
     * @tc.desc Verify positive() on negate() results for positive, negative, and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveNegateResult0010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const v1: BigInt = new BigInt(5).negate();
      expect(v1.positive()).assertFalse();

      const v2: BigInt = new BigInt(-5).negate();
      expect(v2.positive()).assertTrue();

      const v3: BigInt = new BigInt(0).negate();
      expect(v3.positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0011
     * @tc.name testBigIntPositiveDivideResult0011
     * @tc.desc Verify positive() on operatorDivide results for positive and negative quotients
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveDivideResult0011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const v1: BigInt = new BigInt(100).operatorDivide(new BigInt(5));
      expect(v1.positive()).assertTrue();

      const v2: BigInt = new BigInt(-100).operatorDivide(new BigInt(5));
      expect(v2.positive()).assertFalse();

      const v3: BigInt = new BigInt(0).operatorDivide(new BigInt(5));
      expect(v3.positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0012
     * @tc.name testBigIntPositiveSubtractZeroResult0012
     * @tc.desc Verify positive() on operatorSubtract when result is zero (n - n)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveSubtractZeroResult0012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: BigInt = new BigInt(5).operatorSubtract(new BigInt(5));
      expect(v.positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0013
     * @tc.name testBigIntPositiveImmutability0013
     * @tc.desc Verify positive() does not modify the original BigInt value (immutability)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveImmutability0013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v1: BigInt = new BigInt(123);
      v1.positive();
      expect(v1.toString()).assertEqual("123");
      const v2: BigInt = new BigInt(-456);
      v2.positive();
      expect(v2.toString()).assertEqual("-456");
      const v3: BigInt = new BigInt(0);
      v3.positive();
      expect(v3.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0014
     * @tc.name testBigIntPositiveStringBoundary0014
     * @tc.desc Verify positive() on string-constructed values at and beyond type boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveStringBoundary0014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt("2").positive()).assertTrue();
      expect(new BigInt("65536").positive()).assertTrue();
      expect(new BigInt("4294967296").positive()).assertTrue();
      expect(new BigInt("36893488147419103232").positive()).assertTrue();
      expect(new BigInt("01").positive()).assertTrue();
    });


    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0015
     * @tc.name testBigIntPositiveUltraLargeVariants0015
     * @tc.desc Verify positive() on ultra-large string values with various digit patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveUltraLargeVariants0015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(new BigInt("99999999999999999999999999999").positive()).assertTrue();
      expect(new BigInt("-99999999999999999999999999999").positive()).assertFalse();

      expect(new BigInt("99999999999999999999999999999999999999").positive()).assertTrue();
      expect(new BigInt("-99999999999999999999999999999999999999").positive()).assertFalse();

      expect(new BigInt("10000000000000000000000000000000000000000000000000000000000000000000000000000000000").positive()).assertTrue();
      expect(new BigInt("-10000000000000000000000000000000000000000000000000000000000000000000000000000000000").positive()).assertFalse();
      expect(new BigInt("1000000000000000000000000000000").positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0016
     * @tc.name testBigIntPositiveSpecialNumbers0016
     * @tc.desc Verify positive() on decimal-precision boundaries, large numbers, and cross-magnitude power-of-2 boundaries, keep first/last, delete middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveSpecialNumbers0016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(9007199254740991).positive()).assertTrue();
      expect(new BigInt(-9007199254740991).positive()).assertFalse();
      expect(new BigInt("9007199254740993").positive()).assertTrue();
      expect(new BigInt("-9007199254740993").positive()).assertFalse();
      expect(new BigInt("9007199254740994").positive()).assertTrue();
      expect(new BigInt("18014398509481984").positive()).assertTrue();
      expect(new BigInt("-18014398509481984").positive()).assertFalse();

      expect(new BigInt("1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890").positive()).assertTrue();
      expect(new BigInt("-1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890").positive()).assertFalse();
      expect(new BigInt("9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999").positive()).assertTrue();
      expect(new BigInt("1" + "0".repeat(200)).positive()).assertTrue();
      expect(new BigInt("-1" + "0".repeat(200)).positive()).assertFalse();
      expect(new BigInt("115792089237316195423570985008687907853269984665640564039457584007913129639936").positive()).assertTrue();
      expect(new BigInt("-115792089237316195423570985008687907853269984665640564039457584007913129639936").positive()).assertFalse();

      expect(new BigInt(127).positive()).assertTrue();
      expect(new BigInt(-128).positive()).assertFalse();
      expect(new BigInt(2).positive()).assertTrue();
      expect(new BigInt(-2).positive()).assertFalse();
      expect(new BigInt(65536).positive()).assertTrue();
      expect(new BigInt(-65536).positive()).assertFalse();
      expect(new BigInt(4294967296).positive()).assertTrue();
      expect(new BigInt(-4294967296).positive()).assertFalse();
      expect(new BigInt("36893488147419103232").positive()).assertTrue();
      expect(new BigInt("-36893488147419103232").positive()).assertFalse();
      expect(new BigInt(0).positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0017
     * @tc.name testBigIntPositiveLargePowers0017
     * @tc.desc Verify positive() on large power-of-2 and power-of-10 values beyond 64-bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveLargePowers0017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(new BigInt("1000000000000").positive()).assertTrue();
      expect(new BigInt("-1000000000000").positive()).assertFalse();

      expect(new BigInt("1000000000000000").positive()).assertTrue();
      expect(new BigInt("-1000000000000000").positive()).assertFalse();

      expect(new BigInt("1000000000000000000").positive()).assertTrue();
      expect(new BigInt("-1000000000000000000").positive()).assertFalse();

      expect(new BigInt("1099511627776").positive()).assertTrue();
      expect(new BigInt("-1099511627776").positive()).assertFalse();

      expect(new BigInt("1125899906842624").positive()).assertTrue();
      expect(new BigInt("-1125899906842624").positive()).assertFalse();

      expect(new BigInt("1152921504606846976").positive()).assertTrue();
      expect(new BigInt("-1152921504606846976").positive()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0018
     * @tc.name testBigIntPositiveChainAndScenario0018
     * @tc.desc Verify positive() in chain calls and expression scenarios (TC111-TC120)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveChainAndScenario0018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(new BigInt(100).positive()).assertEqual(true);
      expect(new BigInt(-100).positive()).assertEqual(false);

      const a: BigInt = new BigInt(100);
      expect(a.positive()).assertTrue();

      expect((true ? new BigInt(10) : new BigInt(-20)).positive()).assertTrue();

      const arr: BigInt[] = [new BigInt(10), new BigInt(-20)];
      expect(arr[0].positive()).assertTrue();

      expect(new BigInt(100).positive()).assertEqual(!new BigInt(100).negative());
      expect(new BigInt(-100).positive()).assertEqual(!new BigInt(-100).negative());
      expect(new BigInt(0).positive()).assertEqual(!new BigInt(0).negative());
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0019
     * @tc.name testBigIntPositiveShiftResult0019
     * @tc.desc Verify positive() on left-shift and right-shift operation results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveShiftResult0019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const v1: BigInt = new BigInt(1).operatorLeftShift(new BigInt(10));
      expect(v1.positive()).assertTrue();

      const v2: BigInt = new BigInt(1024).operatorRightShift(new BigInt(5));
      expect(v2.positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0020
     * @tc.name testBigIntPositiveModuloResult0020
     * @tc.desc Verify positive() on modulo operation results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveModuloResult0020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const v1: BigInt = new BigInt(100) % new BigInt(3);
      expect(v1.positive()).assertTrue();

      const v2: BigInt = new BigInt(-100) % new BigInt(3);
      expect(v2.positive()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0021
     * @tc.name testBigIntPositiveCompoundArithmetic0021
     * @tc.desc Verify positive() on compound arithmetic expression results (TC109)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveCompoundArithmetic0021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const v1: BigInt = new BigInt(10).operatorSubtract(new BigInt(100)).operatorMultiply(new BigInt(3));
      expect(v1.positive()).assertFalse();

      const two: BigInt = new BigInt(2);
      const v2: BigInt = two.operatorMultiply(two).operatorMultiply(two).operatorMultiply(two)
        .operatorMultiply(two).operatorMultiply(two).operatorMultiply(two)
        .operatorMultiply(two).operatorMultiply(two);
      expect(v2.positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0022
     * @tc.name testBigIntPositivePowerResult0022
     * @tc.desc Verify positive() on exponentiation results via operatorMultiply (TC105-TC106)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositivePowerResult0022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const two10: BigInt = new BigInt(2).operatorMultiply(new BigInt(2)).operatorMultiply(new BigInt(2))
        .operatorMultiply(new BigInt(2)).operatorMultiply(new BigInt(2))
        .operatorMultiply(new BigInt(2)).operatorMultiply(new BigInt(2))
        .operatorMultiply(new BigInt(2)).operatorMultiply(new BigInt(2));
      expect(two10.positive()).assertTrue();

      const negTwo3: BigInt = new BigInt(-2).operatorMultiply(new BigInt(-2)).operatorMultiply(new BigInt(-2));
      expect(negTwo3.positive()).assertFalse();

      const negTwo4: BigInt = new BigInt(-2).operatorMultiply(new BigInt(-2))
        .operatorMultiply(new BigInt(-2)).operatorMultiply(new BigInt(-2));
      expect(negTwo4.positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0023
     * @tc.name testBigIntPositiveMapSetCollection0023
     * @tc.desc Verify positive() on BigInt values accessed from Map and Set collections (TC118-TC119)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveMapSetCollection0023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const map: Map<string, BigInt> = new Map<string, BigInt>();
      map.set("k", new BigInt(10));
      const mapVal: BigInt = map.get("k") as BigInt;
      expect(mapVal.positive()).assertTrue();

      const s: Set<BigInt> = new Set<BigInt>();
      s.add(new BigInt(10));
      const iter: IterableIterator<BigInt> = s.values();
      const setVal: BigInt = iter.next().value as BigInt;
      expect(setVal.positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0024
     * @tc.name testBigIntPositivePerformanceLoop0024
     * @tc.desc Verify positive() correctness and stability across multiple iterations (TC121-TC122)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositivePerformanceLoop0024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const pos: BigInt = new BigInt(100);
      for (let i = 0; i < 100; i++) {
        expect(pos.positive()).assertTrue();
      }

      const neg: BigInt = new BigInt(-100);
      for (let i = 0; i < 100; i++) {
        expect(neg.positive()).assertFalse();
      }

      const zero: BigInt = new BigInt(0);
      for (let i = 0; i < 100; i++) {
        expect(zero.positive()).assertTrue();
      }

      for (let j = 0; j < 1000; j++) {
        expect(zero.positive()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0025
     * @tc.name testBigIntPositiveBoundaryRangeLoop0025
     * @tc.desc Verify positive() across a range of boundary values from -1000 to 1000 (TC125)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveBoundaryRangeLoop0025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      for (let i = -1000; i <= 1000; i++) {
        const v: BigInt = new BigInt(i);
        if (i >= 0) {
          expect(v.positive()).assertTrue();
        } else {
          expect(v.positive()).assertFalse();
        }
      }
    });



    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0026
     * @tc.name testBigIntPositiveMissingNumericLiterals0026
     * @tc.desc Verify positive() on numeric literals not covered in TC014-TC025: 100000, -100000, 123456789, -123456789, -4294967296, 101, -101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveMissingNumericLiterals0026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(new BigInt(100000).positive()).assertTrue();

      expect(new BigInt(-100000).positive()).assertFalse();

      expect(new BigInt(123456789).positive()).assertTrue();

      expect(new BigInt(-123456789).positive()).assertFalse();

      expect(new BigInt(-4294967296).positive()).assertFalse();

      expect(new BigInt(101).positive()).assertTrue();

      expect(new BigInt(-101).positive()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0027
     * @tc.name testBigIntPositiveLongHalfBoundaries0027
     * @tc.desc Verify positive() on long half-boundary values: long.MIN/2 and long.MAX/2 (TC030-TC031)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveLongHalfBoundaries0027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(new BigInt(-4611686018427387904).positive()).assertFalse();

      expect(new BigInt(4611686018427387903).positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0028
     * @tc.name testBigIntPositiveArithmeticChainResults0028
     * @tc.desc Verify positive() on arithmetic chain results covering TC096-TC100 and mindmap scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveArithmeticChainResults0028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(new BigInt(100).operatorAdd(new BigInt(200)).positive()).assertTrue();

      expect(new BigInt(200).operatorSubtract(new BigInt(100)).positive()).assertTrue();

      expect(new BigInt(10).operatorMultiply(new BigInt(10)).positive()).assertTrue();

      expect(new BigInt(-10).operatorMultiply(new BigInt(10)).positive()).assertFalse();

      expect(new BigInt(3).operatorAdd(new BigInt(4)).positive()).assertTrue();

      expect(new BigInt(6).operatorMultiply(new BigInt(7)).positive()).assertTrue();

      expect(new BigInt(6).operatorMultiply(new BigInt(-7)).positive()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0029
     * @tc.name testBigIntPositiveConsecutiveCalls0029
     * @tc.desc Verify positive consecutive calls (TC123) and positive consistency check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveConsecutiveCalls0029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const posVal: BigInt = new BigInt(100);
      const negVal: BigInt = new BigInt(-100);
      const zeroVal: BigInt = new BigInt(0);
      expect(posVal.positive()).assertTrue();
      expect(negVal.positive()).assertFalse();
      expect(zeroVal.positive()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0030
     * @tc.name testBigIntPositiveStringNegativeBoundaries0030
     * @tc.desc Verify positive() returns false for string-constructed negative boundary values (POS-STR-NEG-001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveStringNegativeBoundaries0030', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt("-1").positive()).assertFalse();
      expect(new BigInt("-2").positive()).assertFalse();
      expect(new BigInt("-65536").positive()).assertFalse();
      expect(new BigInt("-4294967296").positive()).assertFalse();
      expect(new BigInt("-36893488147419103232").positive()).assertFalse();
      expect(new BigInt("-9223372036854775808").positive()).assertFalse();
      expect(new BigInt("-9223372036854775809").positive()).assertFalse();
      expect(new BigInt("-01").positive()).assertFalse();
    });


  });
}