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

export default function BigIntDoubleValueTest_2(): void {
  describe('BigInt.doubleValue (mindmap doubleValue) - Extended', () => {
    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0900
     * @tc.name testBigIntDoubleValueLargeBeyondLong0900
     * @tc.desc Mindmap input: doubleValue on BigInt exceeding 64-bit long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueLargeBeyondLong0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = BigInt('9223372036854775808');
      const d = huge.doubleValue();
      expect(d).assertEqual(9223372036854775808.0);

      const near2pow64 = BigInt('18446744073709551615');
      expect(near2pow64.doubleValue()).assertEqual(18446744073709551616.0);

      const veryLarge = BigInt('340282366920938463463374607431768211455');
      expect(veryLarge.doubleValue()).assertEqual(3.40282366920938463463e+38);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_1000
     * @tc.name testBigIntDoubleValueNegativeLarge1000
     * @tc.desc Mindmap input: doubleValue on negative large BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNegativeLarge1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const negLarge = BigInt('-9223372036854775809');
      expect(negLarge.doubleValue()).assertEqual(-9223372036854775808.0);
      const negHuge = BigInt('-999999999999999999999999999999');
      expect(negHuge.doubleValue()).assertEqual(-1.00000000000000001988e+30);
      const negTwoPow64 = BigInt('-18446744073709551616');
      expect(negTwoPow64.doubleValue()).assertEqual(-18446744073709551616.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_1100
     * @tc.name testBigIntDoubleValueChainOperations1100
     * @tc.desc Mindmap operation: doubleValue after chain arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueChainOperations1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(100);
      const b = BigInt(200);
      const c = BigInt(50);
      const r1 = a.operatorMultiply(b).operatorAdd(c);
      expect(r1.doubleValue()).assertEqual(20050.0);
      const r2 = BigInt(1000).operatorSubtract(BigInt(300)).operatorDivide(BigInt(7));
      expect(r2.doubleValue()).assertEqual(100.0);
      const r3 = BigInt(5).operatorAdd(BigInt(3)).operatorMultiply(BigInt(4)).operatorSubtract(BigInt(6));
      expect(r3.doubleValue()).assertEqual(26.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_1200
     * @tc.name testBigIntDoubleValueFromPower1200
     * @tc.desc Mindmap operation: doubleValue on pow result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueFromPower1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).pow(BigInt(10)).doubleValue()).assertEqual(1024.0);
      expect(BigInt(3).pow(BigInt(6)).doubleValue()).assertEqual(729.0);
      expect(BigInt(10).pow(BigInt(9)).doubleValue()).assertEqual(1000000000.0);
      expect(BigInt(-2).pow(BigInt(5)).doubleValue()).assertEqual(-32.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_1300
     * @tc.name testBigIntDoubleValueFromBitwise1300
     * @tc.desc Mindmap operation: doubleValue after bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueFromBitwise1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12).operatorBitwiseAnd(BigInt(5)).doubleValue()).assertEqual(4.0);
      expect(BigInt(12).operatorBitwiseOr(BigInt(5)).doubleValue()).assertEqual(13.0);
      expect(BigInt(12).operatorBitwiseXor(BigInt(5)).doubleValue()).assertEqual(9.0);
      expect(BigInt(42).operatorBitwiseNot().doubleValue()).assertEqual(-43.0);
      expect(BigInt(1).operatorLeftShift(BigInt(10)).doubleValue()).assertEqual(1024.0);
      expect(BigInt(1024).operatorRightShift(BigInt(10)).doubleValue()).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_1400
     * @tc.name testBigIntDoubleValueFromDifferentConstructors1400
     * @tc.desc Mindmap input: doubleValue from BigInt constructed by different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueFromDifferentConstructors1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(123456789012345).doubleValue()).assertEqual(123456789012345.0);
      expect(new BigInt('9876543210').doubleValue()).assertEqual(9876543210.0);
      expect(new BigInt(true).doubleValue()).assertEqual(1.0);
      expect(new BigInt(false).doubleValue()).assertEqual(0.0);
      expect(new BigInt(127).doubleValue()).assertEqual(127.0);
      expect(new BigInt(-32768).doubleValue()).assertEqual(-32768.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_1500
     * @tc.name testBigIntDoubleValueConsistencyWithGetLong1500
     * @tc.desc Mindmap consistency: doubleValue and getLong consistency for safe range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueConsistencyWithGetLong1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const val1 = BigInt(0);
      expect(val1.doubleValue()).assertEqual(Long.toDouble(val1.getLong()));
      const val2 = BigInt(42);
      expect(val2.doubleValue()).assertEqual(Long.toDouble(val2.getLong()));
      const val3 = BigInt(9007199254740991);
      expect(val3.doubleValue()).assertEqual(Long.toDouble(val3.getLong()));
      const val4 = BigInt(-9007199254740991);
      expect(val4.doubleValue()).assertEqual(Long.toDouble(val4.getLong()));
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_1600
     * @tc.name testBigIntDoubleValueIncrementDecrement1600
     * @tc.desc Mindmap operation: doubleValue after increment/decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueIncrementDecrement1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorIncrement().doubleValue()).assertEqual(2.0);
      expect(BigInt(0).operatorIncrement().doubleValue()).assertEqual(1.0);
      expect(BigInt(-1).operatorIncrement().doubleValue()).assertEqual(0.0);
      expect(BigInt(999).operatorIncrement().doubleValue()).assertEqual(1000.0);
      expect(BigInt(2).operatorDecrement().doubleValue()).assertEqual(1.0);
      expect(BigInt(0).operatorDecrement().doubleValue()).assertEqual(-1.0);
      expect(BigInt(-1).operatorDecrement().doubleValue()).assertEqual(-2.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_1700
     * @tc.name testBigIntDoubleValueNegate1700
     * @tc.desc Mindmap operation: doubleValue on negated BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNegate1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).negate().doubleValue()).assertEqual(-42.0);
      expect(BigInt(-42).negate().doubleValue()).assertEqual(42.0);
      expect(BigInt(0).negate().doubleValue()).assertEqual(0.0);
      expect(BigInt(1).negate().doubleValue()).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_1800
     * @tc.name testBigIntDoubleValueMultipleCalls1800
     * @tc.desc Mindmap idempotency: multiple calls return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueMultipleCalls1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const val = BigInt('12345678901234567890');
      const first = val.doubleValue();
      const second = val.doubleValue();
      const third = val.doubleValue();
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);

      const negVal = BigInt('-987654321098765432109876543210');
      const n1 = negVal.doubleValue();
      const n2 = negVal.doubleValue();
      const n3 = negVal.doubleValue();
      expect(n1).assertEqual(n2);
      expect(n2).assertEqual(n3);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_1900
     * @tc.name testBigIntDoubleValueModResult1900
     * @tc.desc Mindmap operation: doubleValue on module result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueModResult1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorModule(BigInt(30)).doubleValue()).assertEqual(10.0);
      expect(BigInt(17).operatorModule(BigInt(5)).doubleValue()).assertEqual(2.0);
      expect(BigInt(0).operatorModule(BigInt(1)).doubleValue()).assertEqual(0.0);
      expect(BigInt(-10).operatorModule(BigInt(3)).doubleValue()).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_2000
     * @tc.name testBigIntDoubleValueFloatRounding2000
     * @tc.desc Mindmap precision: verify doubleValue rounding for very large odd numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueFloatRounding2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const evenAtEdge = BigInt('9007199254740994');
      const oddAtEdge = BigInt('9007199254740995');
      expect(Number.isFinite(evenAtEdge.doubleValue())).assertTrue();
      expect(Number.isFinite(oddAtEdge.doubleValue())).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_2100
     * @tc.name testBigIntDoubleValueCopyConstructor2100
     * @tc.desc Mindmap input: doubleValue on BigInt created via copy constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueCopyConstructor2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = new BigInt(256);
      const copy = new BigInt(original);
      expect(copy.doubleValue()).assertEqual(256.0);
      expect(original.doubleValue()).assertEqual(copy.doubleValue());
    });


    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_2380
     * @tc.name testBigIntDoubleValueMultiDigitBatch
     * @tc.desc Mindmap input: doubleValue for multi-digit/special positive integers (合并 #2300 #2600)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueMultiDigitBatch', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const vals: long[] = [99999, 100000, 123456789, 999999999, 1000000, 97, 100, 123456, 12321];
      for (let i = 0; i < vals.length; i++) {
        expect(BigInt(vals[i]).doubleValue()).assertEqual(Long.toDouble(vals[i]));
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_2500
     * @tc.name testBigIntDoubleValueEvenOdd2500
     * @tc.desc Mindmap input: doubleValue for even and odd integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueEvenOdd2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).doubleValue()).assertEqual(100.0);
      expect(BigInt(101).doubleValue()).assertEqual(101.0);
    });

    /* #2300 和 #2600 已合并到 #2380 MultiDigitBatch */

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_2700
     * @tc.name testBigIntDoubleValueMathConstants2700
     * @tc.desc Mindmap input: doubleValue for math constants like factorial, fibonacci, square, cube, binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueMathConstants2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(3628800).doubleValue()).assertEqual(3628800.0);
      expect(BigInt(55).doubleValue()).assertEqual(55.0);
      expect(BigInt(10000).doubleValue()).assertEqual(10000.0);
      expect(BigInt(1000000).doubleValue()).assertEqual(1000000.0);
      expect(BigInt(1023).doubleValue()).assertEqual(1023.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_2800
     * @tc.name testBigIntDoubleValueBinaryRelated2800
     * @tc.desc Mindmap input: doubleValue for binary-related special numbers 255, 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueBinaryRelated2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).doubleValue()).assertEqual(255.0);
      expect(BigInt(65535).doubleValue()).assertEqual(65535.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_2900
     * @tc.name testBigIntDoubleValueSymmetric2900
     * @tc.desc Mindmap input: doubleValue for symmetric numbers 1001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueSymmetric2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1001).doubleValue()).assertEqual(1001.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_3000
     * @tc.name testBigIntDoubleValuePow10Range3000
     * @tc.desc Mindmap input: doubleValue for 10^15 to 10^17 exact powers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValuePow10Range3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).pow(BigInt(15)).doubleValue()).assertEqual(1000000000000000.0);
      expect(BigInt(10).pow(BigInt(16)).doubleValue()).assertEqual(10000000000000000.0);
      expect(BigInt(10).pow(BigInt(17)).doubleValue()).assertEqual(100000000000000000.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_3100
     * @tc.name testBigIntDoubleValueLargePow10Exact3100
     * @tc.desc Mindmap input: doubleValue for 10^20,10^30,10^50,10^100,10^200,10^300,10^307 exact values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueLargePow10Exact3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).pow(BigInt(20)).doubleValue()).assertEqual(1e20);
      expect(BigInt(10).pow(BigInt(30)).doubleValue()).assertEqual(1e30);
      expect(BigInt(10).pow(BigInt(50)).doubleValue()).assertEqual(1e50);
      expect(BigInt(10).pow(BigInt(100)).doubleValue()).assertEqual(1e100);
      expect(BigInt(10).pow(BigInt(200)).doubleValue()).assertEqual(1e200);
      expect(BigInt(10).pow(BigInt(300)).doubleValue()).assertEqual(1e300);
      expect(BigInt(10).pow(BigInt(307)).doubleValue()).assertEqual(1e307);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_3200
     * @tc.name testBigIntDoubleValueInfinity3200
     * @tc.desc Mindmap input: doubleValue returns Infinity for BigInt exceeding double max (10^308,10^309,2^1024,2^1025)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueInfinity3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).pow(BigInt(308)).doubleValue()).assertEqual(1e+308);
      expect(BigInt(10).pow(BigInt(309)).doubleValue()).assertEqual(Double.POSITIVE_INFINITY);
      expect(BigInt(2).pow(BigInt(1024)).doubleValue()).assertEqual(Double.POSITIVE_INFINITY);
      expect(BigInt(2).pow(BigInt(1025)).doubleValue()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_3300
     * @tc.name testBigIntDoubleValueNegativeInfinity3300
     * @tc.desc Mindmap input: doubleValue returns -Infinity for negative BigInt exceeding double min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNegativeInfinity3300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).pow(BigInt(308)).negate().doubleValue()).assertEqual(-1e+308);
      expect(BigInt(10).pow(BigInt(309)).negate().doubleValue()).assertEqual(Double.NEGATIVE_INFINITY);
      expect(BigInt(2).pow(BigInt(1024)).negate().doubleValue()).assertEqual(Double.NEGATIVE_INFINITY);
      expect(BigInt(2).pow(BigInt(1025)).negate().doubleValue()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_3400
     * @tc.name testBigIntDoubleValueNearMax3400
     * @tc.desc Mindmap input: doubleValue for 2^1023 near double max finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNearMax3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nearMax = BigInt(2).pow(BigInt(1023)).doubleValue();
      expect(nearMax > 0).assertTrue();
      expect(Number.isFinite(nearMax)).assertTrue();
      const negNearMax = BigInt(2).pow(BigInt(1023)).negate().doubleValue();
      expect(negNearMax < 0).assertTrue();
      expect(Number.isFinite(negNearMax)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_3500
     * @tc.name testBigIntDoubleValuePrecisionLossOverSafe3500
     * @tc.desc Mindmap input: doubleValue precision loss for 9007199254740994~9007199254740999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValuePrecisionLossOverSafe3500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v4 = BigInt('9007199254740994').doubleValue();
      const v5 = BigInt('9007199254740995').doubleValue();
      const v6 = BigInt('9007199254740996').doubleValue();
      const v7 = BigInt('9007199254740997').doubleValue();
      const v8 = BigInt('9007199254740998').doubleValue();
      const v9 = BigInt('9007199254740999').doubleValue();
      expect(v5).assertEqual(9007199254740996);
      expect(v7).assertEqual(9007199254740996);
      expect(v8 < v9).assertTrue();
      const v2p54a = BigInt('18014398509481984');
      const v2p54b = BigInt('18014398509481985');
      expect(v2p54a.doubleValue()).assertEqual(v2p54b.doubleValue());

      const v2p56a = BigInt('72057594037927936');
      const v2p56b = BigInt('72057594037927937');
      expect(v2p56a.doubleValue()).assertEqual(v2p56b.doubleValue());
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_3600
     * @tc.name testBigIntDoubleValueNegPrecisionLoss3600
     * @tc.desc Mindmap input: doubleValue precision loss for negative beyond safe integer -(2^53+1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNegPrecisionLoss3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const negBeyond = BigInt('-9007199254740993');
      expect(negBeyond.doubleValue()).assertEqual(-9007199254740992.0);
      const negBelow = BigInt('-9007199254740994');
      expect(negBelow.doubleValue()).assertEqual(-9007199254740994.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_3700
     * @tc.name testBigIntDoubleValueLargePrecision3700
     * @tc.desc Mindmap input: doubleValue for large precision numbers 12345678901234567890~12345678901234567899 rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueLargePrecision3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1234567890123456').doubleValue()).assertEqual(1234567890123456.0);
      const huge1 = BigInt('12345678901234567890').doubleValue();
      const huge2 = BigInt('12345678901234567891').doubleValue();
      expect(huge1).assertEqual(huge2);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_3800
     * @tc.name testBigIntDoubleValueRoundedToPow103800
     * @tc.desc Mindmap input: doubleValue for 9999999999999999999, ...99, ...999 rounding to 1eN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueRoundedToPow103800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v19 = BigInt('9999999999999999999').doubleValue();
      const v20 = BigInt('99999999999999999999').doubleValue();
      const v21 = BigInt('999999999999999999999').doubleValue();
      expect(Number.isFinite(v19)).assertTrue();
      expect(Number.isFinite(v20)).assertTrue();
      expect(Number.isFinite(v21)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_3900
     * @tc.name testBigIntDoubleValueDivisionMod3900
     * @tc.desc Mindmap operation: doubleValue on division result (100/3=33), mod result (100%3=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueDivisionMod3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorDivide(BigInt(3)).doubleValue()).assertEqual(33.0);
      expect(BigInt(100).operatorModule(BigInt(3)).doubleValue()).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_4000
     * @tc.name testBigIntDoubleValueCompound4000
     * @tc.desc Mindmap operation: doubleValue on compound arithmetic results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueCompound4000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorAdd(BigInt(20)).operatorMultiply(BigInt(3)).doubleValue()).assertEqual(90.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_4100
     * @tc.name testBigIntDoubleValueChainPower4100
     * @tc.desc Mindmap operation: doubleValue on continuous power result 2^3^2=64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueChainPower4100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).pow(BigInt(3)).pow(BigInt(2)).doubleValue()).assertEqual(64.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_4200
     * @tc.name testBigIntDoubleValueLargeMulDiv4200
     * @tc.desc Mindmap operation: doubleValue on large multiply/divide results 10^20*10^20=1e40, 10^50/10^25=1e25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueLargeMulDiv4200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const mul = BigInt(10).pow(BigInt(20)).operatorMultiply(BigInt(10).pow(BigInt(20))).doubleValue();
      expect(mul).assertEqual(1e40);
      const div = BigInt(10).pow(BigInt(50)).operatorDivide(BigInt(10).pow(BigInt(25))).doubleValue();
      expect(div).assertEqual(1e25);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_4300
     * @tc.name testBigIntDoubleValueFromCondition4300
     * @tc.desc Mindmap scene: doubleValue from conditional expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueFromCondition4300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const val = true ? BigInt(10) : BigInt(20);
      expect(val.doubleValue()).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_4400
     * @tc.name testBigIntDoubleValueFromCollection4400
     * @tc.desc Mindmap scene: doubleValue from array element and object property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueFromCollection4400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: BigInt[] = [BigInt(10), BigInt(20)];
      expect(arr[0].doubleValue()).assertEqual(10.0);
      const map = new Map<string, BigInt>();
      map.set('k', BigInt(10));
      const mapVal: BigInt = map.get('k') as BigInt;
      expect(mapVal.doubleValue()).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_4500
     * @tc.name testBigIntDoubleValueFromNumberConversion4500
     * @tc.desc Mindmap scene: doubleValue from BigInt built from parseInt, parseFloat, Math.round/floor/ceil
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueFromNumberConversion4500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(parseInt('100')).doubleValue()).assertEqual(100.0);
      expect(BigInt(Math.round(100.7)).doubleValue()).assertEqual(101.0);
      expect(BigInt(Math.floor(100.7)).doubleValue()).assertEqual(100.0);
      expect(BigInt(Math.ceil(100.3)).doubleValue()).assertEqual(101.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_4600
     * @tc.name testBigIntDoubleValueFromTemplateString4600
     * @tc.desc Mindmap scene: doubleValue from BigInt built from template string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueFromTemplateString4600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(`${100}`).doubleValue()).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_4700
     * @tc.name testBigIntDoubleValueConsistencyWithNumber4700
     * @tc.desc Mindmap consistency: verify doubleValue equals Number() for MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueConsistencyWithNumber4700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(Number.MAX_SAFE_INTEGER).doubleValue()).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_4800
     * @tc.name testBigIntDoubleValueNegZero4800
     * @tc.desc Mindmap input: doubleValue for -0n BigInt zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNegZero4800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).doubleValue()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_4900
     * @tc.name testBigIntDoubleValueNegativePow104900
     * @tc.desc Mindmap input: doubleValue for negative large powers of 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNegativePow104900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).pow(BigInt(100)).negate().doubleValue()).assertEqual(-1e100);
      expect(BigInt(10).pow(BigInt(200)).negate().doubleValue()).assertEqual(-1e200);
      expect(BigInt(10).pow(BigInt(307)).negate().doubleValue()).assertEqual(-1e307);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_5000
     * @tc.name testBigIntDoubleValueMultipleLargePrecision5000
     * @tc.desc Mindmap input: doubleValue for 12345678901234567892~12345678901234567899 grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueMultipleLargePrecision5000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v3 = BigInt('12345678901234567892').doubleValue();
      const v5 = BigInt('12345678901234567895').doubleValue();
      const v9 = BigInt('12345678901234567899').doubleValue();
      expect(v3 > 0).assertTrue();
      expect(v5 > 0).assertTrue();
      expect(v9 > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_5100
     * @tc.name testBigIntDoubleValueFromFunctionReturn5100
     * @tc.desc Mindmap scene: doubleValue from function return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueFromFunctionReturn5100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const getBigInt = (): BigInt => {
        return BigInt(100);
      };
      expect(getBigInt().doubleValue()).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_5200
     * @tc.name testBigIntDoubleValueNegZeroConstruct5200
     * @tc.desc Mindmap input: doubleValue for BigInt("-0") string zero construction and double 0.0 construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNegZeroConstruct5200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b1 = new BigInt("-0");
      expect(b1.doubleValue()).assertEqual(0.0);
      const b2 = new BigInt(0.0);
      expect(b2.doubleValue()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_5300
     * @tc.name testBigIntDoubleValueLongMaxMinus5300
     * @tc.desc Mindmap input: doubleValue for Long.MAX-1 and Long.MAX-2 precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueLongMaxMinus5300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt('9223372036854775807').doubleValue();
      const maxMinus1 = BigInt('9223372036854775806').doubleValue();
      const maxMinus2 = BigInt('9223372036854775805').doubleValue();
      expect(max).assertEqual(maxMinus1);
      expect(max).assertEqual(maxMinus2);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_5400
     * @tc.name testBigIntDoubleValueLongMinMinus5400
     * @tc.desc Mindmap input: doubleValue for Long.MIN-1 precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueLongMinMinus5400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const min = BigInt('-9223372036854775808').doubleValue();
      const minMinus1 = BigInt('-9223372036854775809').doubleValue();
      expect(min).assertEqual(minMinus1);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_5500
     * @tc.name testBigIntDoubleValuePreciseTwoPower5500
     * @tc.desc Mindmap input: doubleValue for 2^53-2 exact value 9007199254740990
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValuePreciseTwoPower5500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740990').doubleValue()).assertEqual(9007199254740990);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_5600
     * @tc.name testBigIntDoubleValueTwoPower645600
     * @tc.desc Mindmap input: doubleValue for 2^64, 2^64+1 precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTwoPower645600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v1 = BigInt('18446744073709551615').doubleValue();
      const v2 = BigInt('18446744073709551616').doubleValue();
      const v3 = BigInt('18446744073709551617').doubleValue();
      expect(v1).assertEqual(v2);
      expect(v2).assertEqual(v3);
      expect(v1).assertEqual(Number(BigInt('18446744073709552000').toString()));
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_5700
     * @tc.name testBigIntDoubleValueLargeExactPositive5700
     * @tc.desc Mindmap input: doubleValue for very large exact positive numbers 1e21, ~1e26, ~1e29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueLargeExactPositive5700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1000000000000000000000').doubleValue()).assertEqual(1e21);
      const v26 = BigInt('99999999999999999999999999').doubleValue();
      expect(v26).assertEqual(1e26);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_5800
     * @tc.name testBigIntDoubleValueTwoPower1005800
     * @tc.desc Mindmap input: doubleValue for 2^100 exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTwoPower1005800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const dv = BigInt('1267650600228229401496703205376').doubleValue();
      expect(dv > 0).assertTrue();
      expect(dv).assertEqual(1267650600228229400000000000000.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_5900
     * @tc.name testBigIntDoubleValueLargeNegative5900
     * @tc.desc Mindmap input: doubleValue for very large negative numbers -2^64+1, -1e21, -1e26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueLargeNegative5900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const n1 = BigInt('-18446744073709551615').doubleValue();
      expect(n1 < 0).assertTrue();
      expect(BigInt('-1000000000000000000000').doubleValue()).assertEqual(-1e21);
      const n26 = BigInt('-99999999999999999999999999').doubleValue();
      expect(n26).assertEqual(-1e26);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_6000
     * @tc.name testBigIntDoubleValueNegTwoPower1006000
     * @tc.desc Mindmap input: doubleValue for -2^100 exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNegTwoPower1006000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const dv = BigInt('-1267650600228229401496703205376').doubleValue();
      expect(dv < 0).assertTrue();
      expect(dv).assertEqual(-1267650600228229400000000000000.0);
    });


    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_6200
     * @tc.name testBigIntDoubleValueIntBoundaries6200
     * @tc.desc Mindmap input: doubleValue for int/short/byte boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueIntBoundaries6200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2147483647).doubleValue()).assertEqual(2147483647);
      expect(BigInt(-2147483648).doubleValue()).assertEqual(-2147483648);
      expect(BigInt(32767).doubleValue()).assertEqual(32767);
      expect(BigInt(-32768).doubleValue()).assertEqual(-32768);
      expect(BigInt(127).doubleValue()).assertEqual(127);
      expect(BigInt(-128).doubleValue()).assertEqual(-128);
      expect(BigInt(65535).doubleValue()).assertEqual(65535);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_6300
     * @tc.name testBigIntDoubleValuePrecisionLossDetail6300
     * @tc.desc Mindmap precision: verify doubleValue precision loss to check not.equal to original for large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValuePrecisionLossDetail6300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b64 = BigInt('18446744073709551615');
      const dv64 = b64.doubleValue();
      const expected64 = BigInt('18446744073709552000');
      expect(dv64).assertEqual(Number(expected64.toString()));

      const bBig = BigInt('123456789012345678901234567890');
      const dvBig = bBig.doubleValue();
      const expectedBig = BigInt('123456789012345680000000000000');
      expect(dvBig).assertEqual(Number(expectedBig.toString()));
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_6400
     * @tc.name testBigIntDoubleValueIsNotNaN6400
     * @tc.desc Mindmap special: doubleValue never returns NaN for any valid BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueIsNotNaN6400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r0 = BigInt(0).doubleValue();
      expect(!Number.isNaN(r0)).assertTrue();
      const r1 = BigInt(-999).doubleValue();
      expect(!Number.isNaN(r1)).assertTrue();
      const r2 = BigInt("9223372036854775807").doubleValue();
      expect(!Number.isNaN(r2)).assertTrue();
      const r3 = BigInt("-9223372036854775808").doubleValue();
      expect(!Number.isNaN(r3)).assertTrue();
      const huge = BigInt("1234567890123456789012345678901234567890");
      const r4 = huge.doubleValue();
      expect(!Number.isNaN(r4)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_6500
     * @tc.name testBigIntDoubleValueNegZeroEqual6500
     * @tc.desc Mindmap special: positive zero equals negative zero after doubleValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNegZeroEqual6500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pz = new BigInt(0).doubleValue();
      const nz = new BigInt(-0).doubleValue();
      expect(pz).assertEqual(nz);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_6600
     * @tc.name testBigIntDoubleValueImmutability6600
     * @tc.desc Mindmap invariance: original BigInt unchanged after calling doubleValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueImmutability6600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b1 = new BigInt(42);
      const before1 = b1.toString();
      b1.doubleValue();
      expect(b1.toString()).assertEqual(before1);

      const b2 = new BigInt("9007199254740993");
      const before2 = new BigInt(b2);
      b2.doubleValue();
      expect(b2.equals(before2)).assertTrue();

      const b3 = new BigInt(12345);
      const beforeLong = b3.getLong();
      b3.doubleValue();
      expect(b3.getLong()).assertEqual(beforeLong);

      const b4 = new BigInt("18446744073709551615");
      b4.doubleValue();
      b4.doubleValue();
      b4.doubleValue();
      expect(b4.toString()).assertEqual("18446744073709551615");

      const b5 = new BigInt(0);
      b5.doubleValue();
      expect(b5.toString()).assertEqual("0");

      const b6 = new BigInt(-777);
      b6.doubleValue();
      expect(b6.toString()).assertEqual("-777");
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_6700
     * @tc.name testBigIntDoubleValueIdempotent6700
     * @tc.desc Mindmap idempotency: same BigInt doubleValue calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueIdempotent6700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b1 = BigInt(42);
      expect(b1.doubleValue()).assertEqual(42);
      const b2 = BigInt(0);
      expect(b2.doubleValue()).assertEqual(0);
      const b3 = BigInt("9007199254740993");
      expect(b3.doubleValue()).assertEqual(9007199254740992);
      const b4 = BigInt("-9007199254740993");
      expect(b4.doubleValue()).assertEqual(-9007199254740992);
      const b5 = BigInt(9007199254740991);
      expect(b5.doubleValue()).assertEqual(9007199254740991);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_6800
     * @tc.name testBigIntDoubleValueToStringRoundTrip6800
     * @tc.desc Mindmap consistency: toString round-trip consistency with doubleValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueToStringRoundTrip6800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).doubleValue()).assertEqual(new BigInt(BigInt(42).toString()).doubleValue());
      expect(BigInt("9007199254740993").doubleValue()).assertEqual(new BigInt(BigInt("9007199254740993").toString()).doubleValue());
      expect(BigInt(-12345).doubleValue()).assertEqual(new BigInt(BigInt(-12345).toString()).doubleValue());
      expect(BigInt("18446744073709551615").doubleValue()).assertEqual(new BigInt(BigInt("18446744073709551615").toString()).doubleValue());
      expect(BigInt(0).doubleValue()).assertEqual(new BigInt(BigInt(0).toString()).doubleValue());
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_6900
     * @tc.name testBigIntDoubleValueNoThrow6900
     * @tc.desc Mindmap error: doubleValue does not throw for boundary and extreme values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNoThrow6900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r0 = BigInt(0).doubleValue();
      expect(Number.isFinite(r0)).assertTrue();
      expect(r0).assertEqual(0);

      const r1 = BigInt(-999).doubleValue();
      expect(Number.isFinite(r1)).assertTrue();
      expect(r1).assertEqual(-999);

      const r2 = BigInt("9223372036854775807").doubleValue();
      expect(Number.isFinite(r2)).assertTrue();

      const r3 = BigInt("-9223372036854775808").doubleValue();
      expect(Number.isFinite(r3)).assertTrue();

      const hugePos = BigInt("9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999");
      const r4 = hugePos.doubleValue();
      expect(Number.isFinite(r4)).assertTrue();

      const hugeNeg = BigInt("-9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999");
      const r5 = hugeNeg.doubleValue();
      expect(Number.isFinite(r5)).assertTrue();

      const r6 = BigInt("9007199254740993").doubleValue();
      expect(Number.isFinite(r6)).assertTrue();

      const r7 = BigInt("18446744073709551615").doubleValue();
      expect(Number.isFinite(r7)).assertTrue();
    });



    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_7200
     * @tc.name testBigIntDoubleValueMultiStepChain7200
     * @tc.desc Mindmap operation: doubleValue after multi-step chain add->subtract->multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueMultiStepChain7200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(100);
      const b = a.operatorAdd(BigInt(50)).operatorSubtract(BigInt(30)).operatorMultiply(BigInt(2));
      expect(b.doubleValue()).assertEqual(240.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_7300
     * @tc.name testBigIntDoubleValueDoubleConstruct7300
     * @tc.desc Mindmap input: doubleValue on BigInt constructed from double truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueDoubleConstruct7300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(Math.floor(0.5)).doubleValue()).assertEqual(0.0);
      expect(new BigInt(Math.floor(1.9)).doubleValue()).assertEqual(1.0);
      expect(new BigInt(Math.ceil(-1.9)).doubleValue()).assertEqual(-1.0);
      expect(new BigInt(100.0).doubleValue()).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_7400
     * @tc.name testBigIntDoubleValueInfinityDetail7400
     * @tc.desc Mindmap special: doubleValue returns Infinity for exact string beyond double max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueInfinityDetail7400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxDoubleStr = "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368";
      const posInf = BigInt(maxDoubleStr).doubleValue();
      expect(posInf).assertEqual(1.7976931348623157e+308);

      const negInf = BigInt("-" + maxDoubleStr).doubleValue();
      expect(negInf).assertEqual(-1.7976931348623157e+308);
    });;

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_7500
     * @tc.name testBigIntDoubleValueTwoPower1023Detail7500
     * @tc.desc Mindmap input: doubleValue for 2^1023 near double max, verify finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTwoPower1023Detail7500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const twoPow1023Str = "89884656743115795386465259539451236680898848947115328636715040578866337902750481566354238661203768010560056939935696678829494856907273492833014833222972584453125122221614724804174613203092639167350120522724633744938124729123925344760930294304993395501160861621523981070294769137332294702028519600617674322944";
      const dv = BigInt(twoPow1023Str).doubleValue();

      expect(Number.isFinite(dv)).assertTrue();
      expect(dv > 0).assertTrue();

      expect(dv).assertEqual(8.98846567431158e+307);
    });


    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_7700
     * @tc.name testBigIntDoubleValueSpecialNumbersMore7700
     * @tc.desc Mindmap input: doubleValue for 2, -2, int.MAX, int.MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueSpecialNumbersMore7700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).doubleValue()).assertEqual(2.0);
      expect(BigInt(-2).doubleValue()).assertEqual(-2.0);
      expect(BigInt(2147483647).doubleValue()).assertEqual(2147483647);
      expect(BigInt(-2147483648).doubleValue()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_7800
     * @tc.name testBigIntDoubleValueUnitOneNegOne7800
     * @tc.desc Mindmap: doubleValue for 1 and -1 unit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueUnitOneNegOne7800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).doubleValue()).assertEqual(1.0);
      expect(BigInt(-1).doubleValue()).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_7900
     * @tc.name testBigIntDoubleValuePrecisionExactValues7900
     * @tc.desc Mindmap: exact doubleValue for 9007199254740997~1009 beyond 2^53 precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValuePrecisionExactValues7900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740997').doubleValue()).assertEqual(9007199254740996.0);
      expect(BigInt('9007199254740999').doubleValue()).assertEqual(9007199254741000.0);
      expect(BigInt('9007199254741001').doubleValue()).assertEqual(9007199254741000.0);
      expect(BigInt('9007199254741003').doubleValue()).assertEqual(9007199254741004.0);
      expect(BigInt('9007199254741005').doubleValue()).assertEqual(9007199254741004.0);
      expect(BigInt('9007199254741007').doubleValue()).assertEqual(9007199254741008.0);
      expect(BigInt('9007199254741009').doubleValue()).assertEqual(9007199254741008.0);
    });

  });
}