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

class NegObj {
  a: BigInt = BigInt(0);
}

export default function BigIntNegativeTest_2(): void {
  describe('BigInt.negative - extended coverage', () => {
    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0800
     * @tc.name testBigIntNegativeHexStr0800
     * @tc.desc negative() with hex string constructor values (positive and negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeHexStr0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).negative()).assertFalse();
      expect(BigInt('-255').negative()).assertTrue();
      expect(BigInt(9223372036854775807).negative()).assertFalse();
      expect(BigInt('-9223372036854775808').negative()).assertTrue();
      expect(BigInt(0).negative()).assertFalse();
      expect(BigInt(-1).negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0810
     * @tc.name testBigIntNegativeOctStr0810
     * @tc.desc negative() with octal string constructor values (positive and negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeOctStr0810', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(63).negative()).assertFalse();
      expect(BigInt(-63).negative()).assertTrue();
      expect(BigInt(8589934591).negative()).assertFalse();
      expect(BigInt(-8589934591).negative()).assertTrue();
      expect(BigInt(0).negative()).assertFalse();
      expect(BigInt(-1).negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0820
     * @tc.name testBigIntNegativeBinStr0820
     * @tc.desc negative() with binary string constructor values (positive and negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeBinStr0820', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).negative()).assertFalse();
      expect(BigInt(-255).negative()).assertTrue();
      expect(BigInt(1).negative()).assertFalse();
      expect(BigInt(-1).negative()).assertTrue();
      expect(BigInt(0).negative()).assertFalse();
      expect(BigInt(-10).negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0830
     * @tc.name testBigIntNegativeTypeBoundaryBatch
     * @tc.desc negative() across byte/short/int/long/unsigned type boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTypeBoundaryBatch', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const positives: BigInt[] = [BigInt(127), BigInt(0), BigInt(1), BigInt(32767), BigInt(128),
        BigInt(2147483647), BigInt(32768), BigInt(100000), BigInt('9223372036854775807'),
        BigInt(2147483648), BigInt(5000000000), BigInt(255), BigInt(65535), BigInt(4294967295)];
      const negatives: BigInt[] = [BigInt(-128), BigInt(-1), BigInt(-55), BigInt(-32768),
        BigInt(-129), BigInt(-20000), BigInt(-2147483648), BigInt(-32769), BigInt(-100000),
        BigInt('-9223372036854775808'), BigInt(-2147483649), BigInt(-5000000000),
        BigInt(-65535), BigInt(-4294967296), BigInt('-4611686018427387904')];
      for (let i = 0; i < positives.length; i++) {
        expect(positives[i].negative()).assertFalse();
      }
      for (let i = 0; i < negatives.length; i++) {
        expect(negatives[i].negative()).assertTrue();
      }
      expect(BigInt(4611686018427387903).negative()).assertFalse();
      expect(BigInt(-4611686018427387904).negative()).assertTrue();
    });
    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0870
     * @tc.name testBigIntNegativeLargeDigitsBatch
     * @tc.desc negative() for 40/50/100/200-digit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeLargeDigitsBatch', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const data: string[] = [
        '1234567890123456789012345678901234567890',
        '99999999999999999999999999999999999999999999999999',
        '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999',
        '10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
      ];
      for (let i = 0; i < data.length; i++) {
        expect(BigInt(data[i]).negative()).assertFalse();
        expect(BigInt('-' + data[i]).negative()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0890
     * @tc.name testBigIntNegativeZeroAllForms0890
     * @tc.desc negative() with zero from all constructor forms returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeZeroAllForms0890', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).negative()).assertFalse();
      expect(BigInt('0').negative()).assertFalse();
      expect(BigInt('0x0').negative()).assertFalse();
      expect(BigInt('0o0').negative()).assertFalse();
      expect(BigInt('0b0').negative()).assertFalse();
      expect(BigInt(false).negative()).assertFalse();
      expect(BigInt.fromULong(0).negative()).assertFalse();
      expect(BigInt(-0).negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0900
     * @tc.name testBigIntNegativeFromULongBounds0900
     * @tc.desc negative() with fromULong at power-of-2 boundaries, always non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeFromULongBounds0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(1).negative()).assertFalse();
      expect(BigInt.fromULong(2).negative()).assertFalse();
      expect(BigInt.fromULong(255).negative()).assertFalse();
      expect(BigInt.fromULong(256).negative()).assertFalse();
      expect(BigInt.fromULong(65535).negative()).assertFalse();
      expect(BigInt.fromULong(65536).negative()).assertFalse();
      expect(BigInt.fromULong(4294967295).negative()).assertFalse();
      expect(BigInt.fromULong(4294967296).negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0910
     * @tc.name testBigIntNegativeFromULongNeg0910
     * @tc.desc negative() with fromULong with negative args (unsigned interpretation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeFromULongNeg0910', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(-1).negative()).assertFalse();
      expect(BigInt.fromULong(-128).negative()).assertFalse();
      expect(BigInt.fromULong(-32768).negative()).assertFalse();
      expect(BigInt.fromULong(-2147483648).negative()).assertFalse();
      expect(BigInt.fromULong(-9223372036854775808).negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0920
     * @tc.name testBigIntNegativePowSign0920
     * @tc.desc negative() after pow() - even exponent yields non-negative, odd keeps sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativePowSign0920', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const p1: BigInt = BigInt(2).pow(BigInt(10));
      expect(p1.negative()).assertFalse();
      const p2: BigInt = BigInt(10).pow(BigInt(3));
      expect(p2.negative()).assertFalse();
      const p3: BigInt = BigInt(-2).pow(BigInt(2));
      expect(p3.negative()).assertFalse();
      const p4: BigInt = BigInt(-2).pow(BigInt(4));
      expect(p4.negative()).assertFalse();
      const p5: BigInt = BigInt(-2).pow(BigInt(3));
      expect(p5.negative()).assertTrue();
      const p6: BigInt = BigInt(-2).pow(BigInt(5));
      expect(p6.negative()).assertTrue();
      const p7: BigInt = BigInt(-10).pow(BigInt(2));
      expect(p7.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0930
     * @tc.name testBigIntNegativeBitwiseNot0930
     * @tc.desc negative() after bitwise NOT - positive becomes negative, negative becomes non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeBitwiseNot0930', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bn1: BigInt = BigInt(1).operatorBitwiseNot();
      expect(bn1.negative()).assertTrue();
      const bn2: BigInt = BigInt(-1).operatorBitwiseNot();
      expect(bn2.negative()).assertFalse();
      const bn3: BigInt = BigInt(0).operatorBitwiseNot();
      expect(bn3.negative()).assertTrue();
      const bn4: BigInt = BigInt(127).operatorBitwiseNot();
      expect(bn4.negative()).assertTrue();
      const bn5: BigInt = BigInt(-128).operatorBitwiseNot();
      expect(bn5.negative()).assertFalse();
      const bn6: BigInt = BigInt(65536).operatorBitwiseNot();
      expect(bn6.negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0940
     * @tc.name testBigIntNegativeBitwiseAndOrXor0940
     * @tc.desc negative() after bitwise AND/OR/XOR operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeBitwiseAndOrXor0940', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bo1: BigInt = BigInt(-1).operatorBitwiseOr(BigInt(1));
      expect(bo1.negative()).assertTrue();

      const bx1: BigInt = BigInt(-1).operatorBitwiseXor(BigInt(1));
      expect(bx1.negative()).assertTrue();

      const ba2: BigInt = BigInt(255).operatorBitwiseAnd(BigInt(-256));
      expect(ba2.negative()).assertFalse();
      expect(ba2.equals(BigInt(0))).assertTrue();

      const bx2: BigInt = BigInt(0).operatorBitwiseXor(BigInt(-1));
      expect(bx2.negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0950
     * @tc.name testBigIntNegativeNegateMulti0950
     * @tc.desc negative() after 1-4 negate operations - sign pattern correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeNegateMulti0950', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const n1: BigInt = BigInt(42).negate();
      expect(n1.negative()).assertTrue();
      const n2: BigInt = BigInt(-42).negate();
      expect(n2.negative()).assertFalse();
      const n3: BigInt = BigInt(0).negate();
      expect(n3.negative()).assertFalse();
      const n4: BigInt = BigInt(42).negate().negate();
      expect(n4.negative()).assertFalse();
      const n5: BigInt = BigInt(-42).negate().negate();
      expect(n5.negative()).assertTrue();
      const n6: BigInt = BigInt(42).negate().negate().negate();
      expect(n6.negative()).assertTrue();
      const n7: BigInt = BigInt(-42).negate().negate().negate();
      expect(n7.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0960
     * @tc.name testBigIntNegativeCrossFormatConsistency0960
     * @tc.desc negative() same result from number vs string vs hex for same numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeCrossFormatConsistency0960', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).negative()).assertEqual(BigInt('255').negative());
      expect(BigInt(-255).negative()).assertEqual(BigInt('-255').negative());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0970
     * @tc.name testBigIntNegativeCrossConstructorConsistency0970
     * @tc.desc negative() consistent across different constructor types for same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeCrossConstructorConsistency0970', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(127).negative()).assertEqual(BigInt('127').negative());
      expect(BigInt(-128).negative()).assertEqual(BigInt('-128').negative());
      expect(BigInt(0).negative()).assertEqual(BigInt('0').negative());
      expect(BigInt.fromULong(100).negative()).assertEqual(BigInt(100).negative());
      expect(BigInt.fromULong(255).negative()).assertEqual(BigInt('255').negative());
      expect(BigInt.fromULong(0).negative()).assertEqual(BigInt(0).negative());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0980
     * @tc.name testBigIntNegativeArithmeticChain0980
     * @tc.desc negative() after arithmetic expression chains (add/sub/mul/div)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeArithmeticChain0980', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a1: BigInt = BigInt(100).operatorAdd(BigInt(200));
      expect(a1.negative()).assertFalse();
      const a2: BigInt = BigInt(-100).operatorAdd(BigInt(-200));
      expect(a2.negative()).assertTrue();
      const s1: BigInt = BigInt(100).operatorSubtract(BigInt(30));
      expect(s1.negative()).assertFalse();
      const s2: BigInt = BigInt(30).operatorSubtract(BigInt(100));
      expect(s2.negative()).assertTrue();
      const m1: BigInt = BigInt(10).operatorMultiply(BigInt(-20));
      expect(m1.negative()).assertTrue();
      const m2: BigInt = BigInt(-10).operatorMultiply(BigInt(-20));
      expect(m2.negative()).assertFalse();
      const d1: BigInt = BigInt(100).operatorDivide(BigInt(-3));
      expect(d1.negative()).assertTrue();
      const d2: BigInt = BigInt(-100).operatorDivide(BigInt(-3));
      expect(d2.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_0990
     * @tc.name testBigIntNegativeShiftOperations0990
     * @tc.desc negative() after left shift and right shift operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeShiftOperations0990', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ls1: BigInt = BigInt(1).operatorLeftShift(BigInt(10));
      expect(ls1.negative()).assertFalse();
      const ls2: BigInt = BigInt(1).operatorLeftShift(BigInt(63));
      expect(ls2.negative()).assertFalse();
      const rs1: BigInt = BigInt(100).operatorRightShift(BigInt(2));
      expect(rs1.negative()).assertFalse();
      const rs2: BigInt = BigInt(-100).operatorRightShift(BigInt(2));
      expect(rs2.negative()).assertTrue();
      const rs3: BigInt = BigInt(-1).operatorRightShift(BigInt(10));
      expect(rs3.negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1000
     * @tc.name testBigIntNegativeConstructorBigInt1000
     * @tc.desc negative() with BigInt copy constructor and fromULong comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeConstructorBigInt1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt(-42);
      const copy = BigInt(original);
      expect(copy.negative()).assertTrue();

      const posOriginal = BigInt(999);
      const posCopy = BigInt(posOriginal);
      expect(posCopy.negative()).assertFalse();

      const zeroCopy = BigInt(BigInt(0));
      expect(zeroCopy.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1010
     * @tc.name testBigIntNegativeEvenOddPrimeBatch1010
     * @tc.desc negative() for even/odd/prime int and string constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeEvenOddPrimeBatch1010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).negative()).assertFalse();
      expect(BigInt(-100).negative()).assertTrue();
      expect(BigInt(101).negative()).assertFalse();
      expect(BigInt(-101).negative()).assertTrue();
      expect(BigInt(97).negative()).assertFalse();
      expect(BigInt(-97).negative()).assertTrue();
      expect(BigInt('100').negative()).assertFalse();
      expect(BigInt('-100').negative()).assertTrue();
      expect(BigInt('101').negative()).assertFalse();
      expect(BigInt('-101').negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1050
     * @tc.name testBigIntNegativePowerOfTen1050
     * @tc.desc negative() for powers of ten: 10^3 through 10^9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativePowerOfTen1050', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1000).negative()).assertFalse();
      expect(BigInt(-1000).negative()).assertTrue();
      expect(BigInt(10000).negative()).assertFalse();
      expect(BigInt(100000).negative()).assertFalse();
      expect(BigInt(-100000).negative()).assertTrue();
      expect(BigInt(1000000).negative()).assertFalse();
      expect(BigInt(10000000).negative()).assertFalse();
      expect(BigInt(100000000).negative()).assertFalse();
      expect(BigInt(1000000000).negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1070
     * @tc.name testBigIntNegativeLargePowers1070
     * @tc.desc negative() for large powers: 10^12, 10^15, 10^18 and 2^40, 2^50, 2^60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeLargePowers1070', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1000000000000').negative()).assertFalse();
      expect(BigInt('-1000000000000').negative()).assertTrue();
      expect(BigInt('1000000000000000').negative()).assertFalse();
      expect(BigInt('-1000000000000000').negative()).assertTrue();
      expect(BigInt('1000000000000000000').negative()).assertFalse();
      expect(BigInt('-1000000000000000000').negative()).assertTrue();
      expect(BigInt('1152921504606846976').negative()).assertFalse();
      expect(BigInt('-1152921504606846976').negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1080
     * @tc.name testBigIntNegativeFibBigInt1080
     * @tc.desc negative() on Fibonacci number and large signed boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeFibBigInt1080', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1134903170).negative()).assertFalse();
      expect(BigInt('-9223372036854775808').negative()).assertTrue();
      expect(BigInt('9223372036854775807').negative()).assertFalse();
      expect(BigInt('1099511627776').negative()).assertFalse();
      expect(BigInt('-1099511627776').negative()).assertTrue();
      expect(BigInt('1125899906842624').negative()).assertFalse();
      expect(BigInt('-1125899906842624').negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1090
     * @tc.name testBigIntNegativeModuloResult1090
     * @tc.desc negative() after modulo operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeModuloResult1090', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const mod1: BigInt = BigInt(100).operatorModule(BigInt(3));
      expect(mod1.negative()).assertFalse();
      const mod2: BigInt = BigInt(-100).operatorModule(BigInt(3));
      expect(mod2.negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1100
     * @tc.name testBigIntNegativeConditionalExpr1100
     * @tc.desc negative() on result of ternary conditional expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeConditionalExpr1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v1: BigInt = true ? BigInt(-10) : BigInt(20);
      expect(v1.negative()).assertTrue();
      const v2: BigInt = false ? BigInt(10) : BigInt(20);
      expect(v2.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1110
     * @tc.name testBigIntNegativeCollectionAccess1110
     * @tc.desc negative() on BigInt values accessed from arrays, objects, Map, and Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeCollectionAccess1110', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr1: BigInt[] = [BigInt(-10), BigInt(20)];
      expect(arr1[0].negative()).assertTrue();
      const arr2: BigInt[] = [BigInt(10), BigInt(-20)];
      expect(arr2[1].negative()).assertTrue();
      const obj: NegObj = new NegObj();
      obj.a = BigInt(-10);
      expect((obj.a as BigInt).negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1120
     * @tc.name testBigIntNegativeSequenceCheck1120
     * @tc.desc negative() used with every() and map() for sequence sign checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeSequenceCheck1120', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const posArr: BigInt[] = [BigInt(1), BigInt(2), BigInt(3)];
      expect(posArr.every((n: BigInt): boolean => !n.negative())).assertTrue();
      const negArr: BigInt[] = [BigInt(-1), BigInt(-2), BigInt(-3)];
      expect(negArr.every((n: BigInt): boolean => n.negative())).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1130
     * @tc.name testBigIntNegativeMixedSequence1130
     * @tc.desc negative() on mixed sign sequence mapped to boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeMixedSequence1130', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const mixArr: BigInt[] = [BigInt(-1), BigInt(0), BigInt(1)];
      const result: boolean[] = mixArr.map((n: BigInt): boolean => n.negative());
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
      expect(result[2]).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1150
     * @tc.name testBigIntNegativeLargeNegativeValues1150
     * @tc.desc negative() for various large negative numbers from -1000000000 through -999999999999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeLargeNegativeValues1150', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-2).negative()).assertTrue();
      expect(BigInt(-123456789).negative()).assertTrue();
      expect(BigInt(-1000000000).negative()).assertTrue();
      expect(BigInt(-2000000000).negative()).assertTrue();
      expect(BigInt(-3000000000).negative()).assertTrue();
      expect(BigInt(-4000000000).negative()).assertTrue();
      expect(BigInt(-5000000000).negative()).assertTrue();
      expect(BigInt('-1000000000000').negative()).assertTrue();
      expect(BigInt('-999999999999999').negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1160
     * @tc.name testBigIntNegativeChainDoubleNegate1160
     * @tc.desc negative() chained with negation for double-flip and multi-level chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeChainDoubleNegate1160', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-10).negate().negative()).assertFalse();
      expect(BigInt(-10).negate().negate().negative()).assertTrue();
      const t1: BigInt = BigInt(-10);
      expect(t1.negative()).assertTrue();
      expect(t1.negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1170
     * @tc.name testBigIntNegativeConsistencyWithLessThan1170
     * @tc.desc negative() result consistent with comparison operator < 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeConsistencyWithLessThan1170', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const bn1: boolean = BigInt(-100).negative();
      expect(bn1).assertTrue();

      const bn2: boolean = BigInt(-100) < BigInt(0);
      expect(bn2).assertTrue();

      const bn3: boolean = BigInt(0).negative();
      expect(bn3).assertFalse();

      const bn4: boolean = BigInt(0) < BigInt(0);
      expect(bn4).assertFalse();

      const bn5: boolean = BigInt(100).negative();
      expect(bn5).assertFalse();

      const bn6: boolean = BigInt(100) < BigInt(0);
      expect(bn6).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1180
     * @tc.name testBigIntNegativePrecisionString1180
     * @tc.desc negative() with leading-zero and plus-sign string formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativePrecisionString1180', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-00000123').negative()).assertTrue();
      expect(BigInt('-0777').negative()).assertTrue();
      expect(BigInt('+0').negative()).assertFalse();
      expect(BigInt('000').negative()).assertFalse();
      expect(BigInt('00000123').negative()).assertFalse();
      expect(BigInt('0777').negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATIVE_1190
     * @tc.name testBigIntNegativeOperatorNegateChain1190
     * @tc.desc negative() after operatorNegate() for sign change verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeOperatorNegateChain1190', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const n1: BigInt = BigInt(5).negate();
      expect(n1.negative()).assertTrue();
      const n2: BigInt = BigInt(-5).negate();
      expect(n2.negative()).assertFalse();
      const n3: BigInt = BigInt(0).negate();
      expect(n3.negative()).assertFalse();
    });
  });
}