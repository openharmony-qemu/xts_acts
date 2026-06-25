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

export default function BigIntBoundaryValuesTest(): void {
  describe('BigInt boundary values (signed long extrema, zero, negatives)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BOUNDARY_0100
     * @tc.name testBigIntBoundaryValuesLongMaxMinConstruction0100
     * @tc.desc Verify integral and decimal string construction at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValuesLongMaxMinConstruction0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longMax: long = 9223372036854775807;
      const longMin: long = -9223372036854775808;
      const maxStr = '9223372036854775807';
      const minStr = '-9223372036854775808';

      expect(BigInt(longMax).toString()).assertEqual(maxStr);
      expect(BigInt(longMin).toString()).assertEqual(minStr);
      expect(BigInt(maxStr).toString()).assertEqual(maxStr);
      expect(BigInt(minStr).toString()).assertEqual(minStr);
      expect(BigInt(longMax).equals(BigInt(maxStr))).assertTrue();
      expect(BigInt(longMin).equals(BigInt(minStr))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BOUNDARY_0200
     * @tc.name testBigIntBoundaryValuesLongMaxMinArithmetic0200
     * @tc.desc Verify add and subtract one step across signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValuesLongMaxMinArithmetic0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);
      const one = BigInt(1);

      expect(max.operatorAdd(one).toString()).assertEqual('9223372036854775808');
      expect(min.operatorSubtract(one).toString()).assertEqual('-9223372036854775809');
      expect(max.operatorAdd(max).toString()).assertEqual('18446744073709551614');
      expect(min.operatorAdd(min).toString()).assertEqual('-18446744073709551616');
      expect(max.operatorAdd(min).toString()).assertEqual('-1');
      expect(min.operatorDivide(BigInt(-1)).toString()).assertEqual('9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BOUNDARY_0300
     * @tc.name testBigIntBoundaryValuesLongMaxMinCompare0300
     * @tc.desc Verify comparison operators at signed long extrema and adjacent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValuesLongMaxMinCompare0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);
      const maxPlusOne = BigInt('9223372036854775808');
      const minMinusOne = BigInt('-9223372036854775809');

      expect(max.operatorLessThan(maxPlusOne)).assertTrue();
      expect(maxPlusOne.operatorGreaterThan(max)).assertTrue();
      expect(min.operatorLessThan(minMinusOne)).assertFalse();
      expect(minMinusOne.operatorLessThan(min)).assertTrue();
      expect(max.operatorGreaterThanEqual(max)).assertTrue();
      expect(min.operatorLessThanEqual(min)).assertTrue();
      expect(max.operatorGreaterThan(min)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BOUNDARY_0400
     * @tc.name testBigIntBoundaryValuesZeroArithmetic0400
     * @tc.desc Verify zero identity and special cases for core arithmetic operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValuesZeroArithmetic0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = BigInt(0);
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);

      expect(zero.operatorAdd(zero).toString()).assertEqual('0');
      expect(zero.operatorSubtract(zero).toString()).assertEqual('0');
      expect(max.operatorMultiply(zero).toString()).assertEqual('0');
      expect(min.operatorMultiply(zero).toString()).assertEqual('0');
      expect(zero.operatorDivide(BigInt(1)).toString()).assertEqual('0');
      expect(max.operatorModule(BigInt(1)).toString()).assertEqual('0');
      expect(zero.operatorModule(BigInt(5)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BOUNDARY_0500
     * @tc.name testBigIntBoundaryValuesZeroSignAndEquals0500
     * @tc.desc Verify zero sign predicates and equality at boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValuesZeroSignAndEquals0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = BigInt(0);
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);

      expect(zero.negative()).assertFalse();
      expect(zero.positive()).assertTrue();
      expect(max.negative()).assertFalse();
      expect(max.positive()).assertTrue();
      expect(min.negative()).assertTrue();
      expect(min.positive()).assertFalse();
      expect(zero.equals(new BigInt())).assertTrue();
      expect(max.equals(BigInt('9223372036854775807'))).assertTrue();
      expect(min.equals(BigInt('-9223372036854775808'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BOUNDARY_0600
     * @tc.name testBigIntBoundaryValuesLongMinNegate0600
     * @tc.desc Verify negate at -9223372036854775808 and adjacent negative boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValuesLongMinNegate0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const min = BigInt(-9223372036854775808);
      const max = BigInt(9223372036854775807);
      const negOne = BigInt(-1);

      expect(min.negate().toString()).assertEqual('9223372036854775808');
      expect(max.negate().toString()).assertEqual('-9223372036854775807');
      expect(negOne.negate().toString()).assertEqual('1');
      expect(min.negate().negate().toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BOUNDARY_0700
     * @tc.name testBigIntBoundaryValuesBeyondLongRange0700
     * @tc.desc Verify string magnitudes just outside signed long range stay exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValuesBeyondLongRange0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxPlusOne = BigInt('9223372036854775808');
      const minMinusOne = BigInt('-9223372036854775809');
      const one = BigInt(1);

      expect(maxPlusOne.operatorSubtract(one).toString()).assertEqual('9223372036854775807');
      expect(minMinusOne.operatorAdd(one).toString()).assertEqual('-9223372036854775808');
      expect(maxPlusOne.getLong()).assertEqual(-9223372036854775808);
      expect(minMinusOne.getLong()).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_BIGINT_STD_BOUNDARY_0800
     * @tc.name testBigIntBoundaryValuesIncrementDecrement0800
     * @tc.desc Verify increment and decrement at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValuesIncrementDecrement0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);

      expect(max.operatorIncrement().toString()).assertEqual('9223372036854775808');
      expect(min.operatorDecrement().toString()).assertEqual('-9223372036854775809');
      expect(BigInt('-9223372036854775807').operatorDecrement().toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BOUNDARY_0900
     * @tc.name testBigIntBoundaryValuesULongMax0900
     * @tc.desc Verify unsigned 64-bit maximum (2^64-1) construction and relations to long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValuesULongMax0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const umax = BigInt('18446744073709551615');
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);

      expect(umax.toString()).assertEqual('18446744073709551615');
      expect(BigInt.fromULong(-1).equals(umax)).assertTrue();
      expect(umax.operatorGreaterThan(max)).assertTrue();
      expect(max.operatorSubtract(min).toString()).assertEqual('18446744073709551615');
      expect(BigInt.asUintN(64, umax).toString()).assertEqual('18446744073709551615');
      expect(umax.positive()).assertTrue();
      expect(umax.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BOUNDARY_1000
     * @tc.name testBigIntBoundaryValuesNegativeAdjacent1000
     * @tc.desc Verify sign and comparison at negative magnitudes adjacent to long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValuesNegativeAdjacent1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const negMax = BigInt(-9223372036854775807);
      const minMinusOne = BigInt('-9223372036854775809');
      const min = BigInt(-9223372036854775808);

      expect(negMax.negative()).assertTrue();
      expect(negMax.positive()).assertFalse();
      expect(minMinusOne.negative()).assertTrue();
      expect(negMax.operatorGreaterThan(min)).assertTrue();
      expect(minMinusOne.operatorLessThan(min)).assertTrue();
      expect(negMax.operatorIncrement().toString()).assertEqual('-9223372036854775806');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BOUNDARY_1100
     * @tc.name testBigIntBoundaryValuesBitwiseAtExtrema1100
     * @tc.desc Verify bitwise operators at 9223372036854775807, -9223372036854775808, and ULONG_MAX magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBoundaryValuesBitwiseAtExtrema1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);
      const umax = BigInt('18446744073709551615');

      expect(max.operatorBitwiseXor(min).toString()).assertEqual('-1');
      expect(umax.operatorBitwiseAnd(max).toString()).assertEqual('9223372036854775807');
      expect(umax.operatorBitwiseOr(BigInt(0)).toString()).assertEqual('18446744073709551615');
      expect(min.operatorBitwiseNot().toString()).assertEqual('9223372036854775807');
    });
  });
}
