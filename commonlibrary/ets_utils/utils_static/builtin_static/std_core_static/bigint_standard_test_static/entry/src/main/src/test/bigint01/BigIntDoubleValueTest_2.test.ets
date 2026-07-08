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
import { describe, it, expect,beforeAll,beforeEach,afterEach,afterAll } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntDoubleValueTest_2(): void {
  describe('BigIntDoubleValueTest_2', () => {
    beforeAll((): void => {
    });
    beforeEach(async():void=>{
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_0100
     * @tc.name testBigIntDoubleValueTest001
     * @tc.desc Mindmap input: doubleValue on BigInt exceeding 64-bit long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const huge = BigInt('9223372036854775808');
      const d = huge.doubleValue();
      expect(d).assertEqual(9223372036854775808.0);

      const near2pow64 = BigInt('18446744073709551615');
      expect(near2pow64.doubleValue()).assertEqual(18446744073709551616.0);

      const veryLarge = BigInt('340282366920938463463374607431768211455');
      expect(veryLarge.doubleValue()).assertEqual(3.40282366920938463463e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_0200
     * @tc.name testBigIntDoubleValueTest002
     * @tc.desc Mindmap input: doubleValue on negative large BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negLarge = BigInt('-9223372036854775809');
      expect(negLarge.doubleValue()).assertEqual(-9223372036854775808.0);
      const negHuge = BigInt('-999999999999999999999999999999');
      expect(negHuge.doubleValue()).assertEqual(-1.00000000000000001988e+30);
      const negTwoPow64 = BigInt('-18446744073709551616');
      expect(negTwoPow64.doubleValue()).assertEqual(-18446744073709551616.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_0300
     * @tc.name testBigIntDoubleValueTest003
     * @tc.desc Mindmap operation: doubleValue after chain arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_0400
     * @tc.name testBigIntDoubleValueTest004
     * @tc.desc Mindmap operation: doubleValue on pow result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).pow(BigInt(10)).doubleValue()).assertEqual(1024.0);
      expect(BigInt(3).pow(BigInt(6)).doubleValue()).assertEqual(729.0);
      expect(BigInt(10).pow(BigInt(9)).doubleValue()).assertEqual(1000000000.0);
      expect(BigInt(-2).pow(BigInt(5)).doubleValue()).assertEqual(-32.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_0500
     * @tc.name testBigIntDoubleValueTest005
     * @tc.desc Mindmap operation: doubleValue after bitwise operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(12).operatorBitwiseAnd(BigInt(5)).doubleValue()).assertEqual(4.0);
      expect(BigInt(12).operatorBitwiseOr(BigInt(5)).doubleValue()).assertEqual(13.0);
      expect(BigInt(12).operatorBitwiseXor(BigInt(5)).doubleValue()).assertEqual(9.0);
      expect(BigInt(42).operatorBitwiseNot().doubleValue()).assertEqual(-43.0);
      expect(BigInt(1).operatorLeftShift(BigInt(10)).doubleValue()).assertEqual(1024.0);
      expect(BigInt(1024).operatorRightShift(BigInt(10)).doubleValue()).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_0600
     * @tc.name testBigIntDoubleValueTest006
     * @tc.desc Mindmap input: doubleValue from BigInt constructed by different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new BigInt(123456789012345).doubleValue()).assertEqual(123456789012345.0);
      expect(new BigInt('9876543210').doubleValue()).assertEqual(9876543210.0);
      expect(new BigInt(true).doubleValue()).assertEqual(1.0);
      expect(new BigInt(false).doubleValue()).assertEqual(0.0);
      expect(new BigInt(127).doubleValue()).assertEqual(127.0);
      expect(new BigInt(-32768).doubleValue()).assertEqual(-32768.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_0700
     * @tc.name testBigIntDoubleValueTest007
     * @tc.desc Mindmap consistency: doubleValue and getLong consistency for safe range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_0800
     * @tc.name testBigIntDoubleValueTest008
     * @tc.desc Mindmap operation: doubleValue after increment/decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorIncrement().doubleValue()).assertEqual(2.0);
      expect(BigInt(0).operatorIncrement().doubleValue()).assertEqual(1.0);
      expect(BigInt(-1).operatorIncrement().doubleValue()).assertEqual(0.0);
      expect(BigInt(999).operatorIncrement().doubleValue()).assertEqual(1000.0);
      expect(BigInt(2).operatorDecrement().doubleValue()).assertEqual(1.0);
      expect(BigInt(0).operatorDecrement().doubleValue()).assertEqual(-1.0);
      expect(BigInt(-1).operatorDecrement().doubleValue()).assertEqual(-2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_0900
     * @tc.name testBigIntDoubleValueTest009
     * @tc.desc Mindmap operation: doubleValue on negated BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(42).negate().doubleValue()).assertEqual(-42.0);
      expect(BigInt(-42).negate().doubleValue()).assertEqual(42.0);
      expect(BigInt(0).negate().doubleValue()).assertEqual(0.0);
      expect(BigInt(1).negate().doubleValue()).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_1000
     * @tc.name testBigIntDoubleValueTest010
     * @tc.desc Mindmap idempotency: multiple calls return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_1100
     * @tc.name testBigIntDoubleValueTest011
     * @tc.desc Mindmap operation: doubleValue on module result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorModule(BigInt(30)).doubleValue()).assertEqual(10.0);
      expect(BigInt(17).operatorModule(BigInt(5)).doubleValue()).assertEqual(2.0);
      expect(BigInt(0).operatorModule(BigInt(1)).doubleValue()).assertEqual(0.0);
      expect(BigInt(-10).operatorModule(BigInt(3)).doubleValue()).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_1200
     * @tc.name testBigIntDoubleValueTest012
     * @tc.desc Mindmap precision: verify doubleValue rounding for very large odd numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const evenAtEdge = BigInt('9007199254740994');
      const oddAtEdge = BigInt('9007199254740995');
      expect(Number.isFinite(evenAtEdge.doubleValue())).assertTrue();
      expect(Number.isFinite(oddAtEdge.doubleValue())).assertTrue();
      expect(evenAtEdge.doubleValue()).assertEqual(9007199254740994.0);
      expect(oddAtEdge.doubleValue()).assertEqual(9007199254740996.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_1300
     * @tc.name testBigIntDoubleValueTest013
     * @tc.desc Mindmap input: doubleValue on BigInt created via copy constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new BigInt(256);
      const copy = new BigInt(original);
      expect(copy.doubleValue()).assertEqual(256.0);
      expect(original.doubleValue()).assertEqual(copy.doubleValue());
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_1400
     * @tc.name testBigIntDoubleValueTest014
     * @tc.desc Mindmap input: doubleValue for multi-digit/special positive integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vals: long[] = [99999, 100000, 123456789, 999999999, 1000000, 97, 100, 123456, 12321];
      for (let i = 0; i < vals.length; i++) {
        expect(BigInt(vals[i]).doubleValue()).assertEqual(Long.toDouble(vals[i]));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_1500
     * @tc.name testBigIntDoubleValueTest015
     * @tc.desc Mindmap input: doubleValue for even and odd integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).doubleValue()).assertEqual(100.0);
      expect(BigInt(101).doubleValue()).assertEqual(101.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_1600
     * @tc.name testBigIntDoubleValueTest016
     * @tc.desc Mindmap input: doubleValue for math constants like factorial, fibonacci, square, cube, binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(3628800).doubleValue()).assertEqual(3628800.0);
      expect(BigInt(55).doubleValue()).assertEqual(55.0);
      expect(BigInt(10000).doubleValue()).assertEqual(10000.0);
      expect(BigInt(1000000).doubleValue()).assertEqual(1000000.0);
      expect(BigInt(1023).doubleValue()).assertEqual(1023.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_1700
     * @tc.name testBigIntDoubleValueTest017
     * @tc.desc Mindmap input: doubleValue for binary-related special numbers 255, 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(255).doubleValue()).assertEqual(255.0);
      expect(BigInt(65535).doubleValue()).assertEqual(65535.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_1800
     * @tc.name testBigIntDoubleValueTest018
     * @tc.desc Mindmap input: doubleValue for symmetric numbers 1001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1001).doubleValue()).assertEqual(1001.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_1900
     * @tc.name testBigIntDoubleValueTest019
     * @tc.desc Mindmap input: doubleValue for 10^15 to 10^17 exact powers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).pow(BigInt(15)).doubleValue()).assertEqual(1000000000000000.0);
      expect(BigInt(10).pow(BigInt(16)).doubleValue()).assertEqual(10000000000000000.0);
      expect(BigInt(10).pow(BigInt(17)).doubleValue()).assertEqual(100000000000000000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_2000
     * @tc.name testBigIntDoubleValueTest020
     * @tc.desc Mindmap input: doubleValue for 10^20,10^30,10^50,10^100,10^200,10^300,10^307 exact values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).pow(BigInt(20)).doubleValue()).assertEqual(1e20);
      expect(BigInt(10).pow(BigInt(30)).doubleValue()).assertEqual(1e30);
      expect(BigInt(10).pow(BigInt(50)).doubleValue()).assertEqual(1e50);
      expect(BigInt(10).pow(BigInt(100)).doubleValue()).assertEqual(1e100);
      expect(BigInt(10).pow(BigInt(200)).doubleValue()).assertEqual(1e200);
      expect(BigInt(10).pow(BigInt(300)).doubleValue()).assertEqual(1e300);
      expect(BigInt(10).pow(BigInt(307)).doubleValue()).assertEqual(1e307);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_2100
     * @tc.name testBigIntDoubleValueTest021
     * @tc.desc Mindmap input: doubleValue returns Infinity for BigInt exceeding double max (10^308,10^309,2^1024,2^1025)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).pow(BigInt(308)).doubleValue()).assertEqual(1e+308);
      expect(BigInt(10).pow(BigInt(309)).doubleValue()).assertEqual(Double.POSITIVE_INFINITY);
      expect(BigInt(2).pow(BigInt(1024)).doubleValue()).assertEqual(Double.POSITIVE_INFINITY);
      expect(BigInt(2).pow(BigInt(1025)).doubleValue()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_2200
     * @tc.name testBigIntDoubleValueTest022
     * @tc.desc Mindmap input: doubleValue returns -Infinity for negative BigInt exceeding double min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).pow(BigInt(308)).negate().doubleValue()).assertEqual(-1e+308);
      expect(BigInt(10).pow(BigInt(309)).negate().doubleValue()).assertEqual(Double.NEGATIVE_INFINITY);
      expect(BigInt(2).pow(BigInt(1024)).negate().doubleValue()).assertEqual(Double.NEGATIVE_INFINITY);
      expect(BigInt(2).pow(BigInt(1025)).negate().doubleValue()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_2300
     * @tc.name testBigIntDoubleValueTest023
     * @tc.desc Mindmap input: doubleValue for 2^1023 near double max finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nearMax = BigInt(2).pow(BigInt(1023)).doubleValue();
      expect(nearMax > 0).assertTrue();
      expect(Number.isFinite(nearMax)).assertTrue();
      expect(nearMax).assertEqual(8.98846567431158e307);
      const negNearMax = BigInt(2).pow(BigInt(1023)).negate().doubleValue();
      expect(negNearMax < 0).assertTrue();
      expect(Number.isFinite(negNearMax)).assertTrue();
      expect(negNearMax).assertEqual(-8.98846567431158e307);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_2400
     * @tc.name testBigIntDoubleValueTest024
     * @tc.desc Verify doubleValue precision gap doubles at each power-of-two boundary beyond 2^53: 2^54, 2^55,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v2p54a = BigInt('18014398509481984');
      const v2p54b = BigInt('18014398509481985');
      expect(v2p54a.doubleValue()).assertEqual(v2p54b.doubleValue());
      const v2p55a = BigInt('36028797018963968');
      const v2p55b = BigInt('36028797018963969');
      expect(v2p55a.doubleValue()).assertEqual(v2p55b.doubleValue());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_2500
     * @tc.name testBigIntDoubleValueTest025
     * @tc.desc Mindmap input: doubleValue precision loss for negative beyond safe integer -(2^53+1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negBeyond = BigInt('-9007199254740993');
      expect(negBeyond.doubleValue()).assertEqual(-9007199254740992.0);
      const negBelow = BigInt('-9007199254740994');
      expect(negBelow.doubleValue()).assertEqual(-9007199254740994.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_2600
     * @tc.name testBigIntDoubleValueTest026
     * @tc.desc Mindmap input: doubleValue for large precision numbers 12345678901234567890~12345678901234567899 rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('1234567890123456').doubleValue()).assertEqual(1234567890123456.0);
      const huge1 = BigInt('12345678901234567890').doubleValue();
      const huge2 = BigInt('12345678901234567891').doubleValue();
      expect(huge1).assertEqual(huge2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_2700
     * @tc.name testBigIntDoubleValueTest027
     * @tc.desc Mindmap input: doubleValue for 9999999999999999999, ...99, ...999 rounding to 1eN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v19 = BigInt('9999999999999999999').doubleValue();
      const v20 = BigInt('99999999999999999999').doubleValue();
      const v21 = BigInt('999999999999999999999').doubleValue();
      expect(Number.isFinite(v19)).assertTrue();
      expect(Number.isFinite(v20)).assertTrue();
      expect(Number.isFinite(v21)).assertTrue();
      expect(v19).assertEqual(10000000000000000000.0);
      expect(v20).assertEqual(100000000000000000000.0);
      expect(v21).assertEqual(1000000000000000000000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_2800
     * @tc.name testBigIntDoubleValueTest028
     * @tc.desc Mindmap operation: doubleValue on division result (100/3=33), mod result (100%3=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorDivide(BigInt(3)).doubleValue()).assertEqual(33.0);
      expect(BigInt(100).operatorModule(BigInt(3)).doubleValue()).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_2900
     * @tc.name testBigIntDoubleValueTest029
     * @tc.desc Mindmap operation: doubleValue on compound arithmetic results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorAdd(BigInt(20)).operatorMultiply(BigInt(3)).doubleValue()).assertEqual(90.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_3000
     * @tc.name testBigIntDoubleValueTest030
     * @tc.desc Mindmap operation: doubleValue on continuous power result 2^3^2=64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest030', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).pow(BigInt(3)).pow(BigInt(2)).doubleValue()).assertEqual(64.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_3100
     * @tc.name testBigIntDoubleValueTest031
     * @tc.desc Mindmap operation: doubleValue on large multiply/divide results 10^20*10^20=1e40, 10^50/10^25=1e25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest031', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mul = BigInt(10).pow(BigInt(20)).operatorMultiply(BigInt(10).pow(BigInt(20))).doubleValue();
      expect(mul).assertEqual(1e40);
      const div = BigInt(10).pow(BigInt(50)).operatorDivide(BigInt(10).pow(BigInt(25))).doubleValue();
      expect(div).assertEqual(1e25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_3200
     * @tc.name testBigIntDoubleValueTest032
     * @tc.desc Mindmap scene: doubleValue from conditional expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest032', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val = true ? BigInt(10) : BigInt(20);
      expect(val.doubleValue()).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_3300
     * @tc.name testBigIntDoubleValueTest033
     * @tc.desc Mindmap scene: doubleValue from array element and object property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest033', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigInt[] = [BigInt(10), BigInt(20)];
      expect(arr[0].doubleValue()).assertEqual(10.0);
      const map = new Map<string, BigInt>();
      map.set('k', BigInt(10));
      const mapVal: BigInt = map.get('k') as BigInt;
      expect(mapVal.doubleValue()).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_3400
     * @tc.name testBigIntDoubleValueTest034
     * @tc.desc Mindmap scene: doubleValue from BigInt built from parseInt, parseFloat, Math.round/floor/ceil
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest034', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(parseInt('100')).doubleValue()).assertEqual(100.0);
      expect(BigInt(Math.round(100.7)).doubleValue()).assertEqual(101.0);
      expect(BigInt(Math.floor(100.7)).doubleValue()).assertEqual(100.0);
      expect(BigInt(Math.ceil(100.3)).doubleValue()).assertEqual(101.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_3500
     * @tc.name testBigIntDoubleValueTest035
     * @tc.desc Mindmap scene: doubleValue from BigInt built from template string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest035', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(`${100}`).doubleValue()).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_3600
     * @tc.name testBigIntDoubleValueTest036
     * @tc.desc Mindmap consistency: verify doubleValue equals Number() for MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest036', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(Number.MAX_SAFE_INTEGER).doubleValue()).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_3700
     * @tc.name testBigIntDoubleValueTest037
     * @tc.desc Mindmap input: doubleValue for -0n BigInt zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest037', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).doubleValue()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_3800
     * @tc.name testBigIntDoubleValueTest038
     * @tc.desc Mindmap input: doubleValue for negative large powers of 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest038', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).pow(BigInt(100)).negate().doubleValue()).assertEqual(-1e100);
      expect(BigInt(10).pow(BigInt(200)).negate().doubleValue()).assertEqual(-1e200);
      expect(BigInt(10).pow(BigInt(307)).negate().doubleValue()).assertEqual(-1e307);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_3900
     * @tc.name testBigIntDoubleValueTest039
     * @tc.desc Mindmap input: doubleValue for 12345678901234567892~12345678901234567899 grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest039', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v3 = BigInt('12345678901234567892').doubleValue();
      const v5 = BigInt('12345678901234567895').doubleValue();
      const v9 = BigInt('12345678901234567899').doubleValue();
      expect(v3 > 0).assertTrue();
      expect(v5 > 0).assertTrue();
      expect(v9 > 0).assertTrue();
      expect(v3).assertEqual(v5);
      expect(v5).assertEqual(v9);
      expect(v3).assertEqual(12345678901234567168.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_4000
     * @tc.name testBigIntDoubleValueTest040
     * @tc.desc Mindmap scene: doubleValue from function return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest040', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const getBigInt = (): BigInt => {
        return BigInt(100);
      };
      expect(getBigInt().doubleValue()).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_4100
     * @tc.name testBigIntDoubleValueTest041
     * @tc.desc Mindmap input: doubleValue for BigInt("-0") string zero construction and double 0.0 construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest041', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new BigInt("-0");
      expect(b1.doubleValue()).assertEqual(0.0);
      const b2 = new BigInt(0.0);
      expect(b2.doubleValue()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_4200
     * @tc.name testBigIntDoubleValueTest042
     * @tc.desc Mindmap input: doubleValue for Long.MAX-1 and Long.MAX-2 precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest042', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = BigInt('9223372036854775807').doubleValue();
      const maxMinus1 = BigInt('9223372036854775806').doubleValue();
      const maxMinus2 = BigInt('9223372036854775805').doubleValue();
      expect(max).assertEqual(maxMinus1);
      expect(max).assertEqual(maxMinus2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_4300
     * @tc.name testBigIntDoubleValueTest043
     * @tc.desc Mindmap input: doubleValue for Long.MIN-1 precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest043', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = BigInt('-9223372036854775808').doubleValue();
      const minMinus1 = BigInt('-9223372036854775809').doubleValue();
      expect(min).assertEqual(minMinus1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_4400
     * @tc.name testBigIntDoubleValueTest044
     * @tc.desc Mindmap input: doubleValue for 2^53-2 exact value 9007199254740990
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest044', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9007199254740990').doubleValue()).assertEqual(9007199254740990);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_4500
     * @tc.name testBigIntDoubleValueTest045
     * @tc.desc Mindmap input: doubleValue for 2^64, 2^64+1 precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest045', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = BigInt('18446744073709551615').doubleValue();
      const v2 = BigInt('18446744073709551616').doubleValue();
      const v3 = BigInt('18446744073709551617').doubleValue();
      expect(v1).assertEqual(v2);
      expect(v2).assertEqual(v3);
      expect(v1).assertEqual(Number(BigInt('18446744073709552000').toString()));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_4600
     * @tc.name testBigIntDoubleValueTest046
     * @tc.desc Mindmap input: doubleValue for very large exact positive numbers 1e21, ~1e26, ~1e29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest046', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('1000000000000000000000').doubleValue()).assertEqual(1e21);
      const v26 = BigInt('99999999999999999999999999').doubleValue();
      expect(v26).assertEqual(1e26);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_4700
     * @tc.name testBigIntDoubleValueTest047
     * @tc.desc Mindmap input: doubleValue for 2^100 exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest047', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dv = BigInt('1267650600228229401496703205376').doubleValue();
      expect(dv > 0).assertTrue();
      expect(dv).assertEqual(1267650600228229400000000000000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_4800
     * @tc.name testBigIntDoubleValueTest048
     * @tc.desc Mindmap input: doubleValue for very large negative numbers -2^64+1, -1e21, -1e26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest048', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n1 = BigInt('-18446744073709551615').doubleValue();
      expect(n1 < 0).assertTrue();
      expect(n1).assertEqual(-18446744073709551616.0);
      expect(BigInt('-1000000000000000000000').doubleValue()).assertEqual(-1e21);
      const n26 = BigInt('-99999999999999999999999999').doubleValue();
      expect(n26).assertEqual(-1e26);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_4900
     * @tc.name testBigIntDoubleValueTest049
     * @tc.desc Mindmap input: doubleValue for -2^100 exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest049', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dv = BigInt('-1267650600228229401496703205376').doubleValue();
      expect(dv < 0).assertTrue();
      expect(dv).assertEqual(-1267650600228229400000000000000.0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_5000
     * @tc.name testBigIntDoubleValueTest050
     * @tc.desc Mindmap input: doubleValue for int/short/byte boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest050', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2147483647).doubleValue()).assertEqual(2147483647);
      expect(BigInt(-2147483648).doubleValue()).assertEqual(-2147483648);
      expect(BigInt(32767).doubleValue()).assertEqual(32767);
      expect(BigInt(-32768).doubleValue()).assertEqual(-32768);
      expect(BigInt(127).doubleValue()).assertEqual(127);
      expect(BigInt(-128).doubleValue()).assertEqual(-128);
      expect(BigInt(65535).doubleValue()).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_5100
     * @tc.name testBigIntDoubleValueTest051
     * @tc.desc Mindmap precision: verify doubleValue precision loss to check not.equal to original for large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest051', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_5200
     * @tc.name testBigIntDoubleValueTest052
     * @tc.desc Mindmap special: doubleValue never returns NaN for any valid BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest052', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_5300
     * @tc.name testBigIntDoubleValueTest053
     * @tc.desc Mindmap special: positive zero equals negative zero after doubleValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest053', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pz = new BigInt(0).doubleValue();
      const nz = new BigInt(-0).doubleValue();
      expect(pz).assertEqual(nz);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_5400
     * @tc.name testBigIntDoubleValueTest054
     * @tc.desc Mindmap invariance: original BigInt unchanged after calling doubleValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest054', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_5500
     * @tc.name testBigIntDoubleValueTest055
     * @tc.desc Mindmap idempotency: same BigInt doubleValue calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest055', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_5600
     * @tc.name testBigIntDoubleValueTest056
     * @tc.desc Mindmap consistency: toString round-trip consistency with doubleValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest056', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(42).doubleValue()).assertEqual(new BigInt(BigInt(42).toString()).doubleValue());
      expect(BigInt("9007199254740993").doubleValue()).assertEqual(new BigInt(BigInt("9007199254740993").toString()).doubleValue());
      expect(BigInt(-12345).doubleValue()).assertEqual(new BigInt(BigInt(-12345).toString()).doubleValue());
      expect(BigInt("18446744073709551615").doubleValue()).assertEqual(new BigInt(BigInt("18446744073709551615").toString()).doubleValue());
      expect(BigInt(0).doubleValue()).assertEqual(new BigInt(BigInt(0).toString()).doubleValue());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_5700
     * @tc.name testBigIntDoubleValueTest057
     * @tc.desc Mindmap error: doubleValue does not throw for boundary and extreme values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest057', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_5800
     * @tc.name testBigIntDoubleValueTest058
     * @tc.desc Mindmap operation: doubleValue after multi-step chain add->subtract->multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest058', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(100);
      const b = a.operatorAdd(BigInt(50)).operatorSubtract(BigInt(30)).operatorMultiply(BigInt(2));
      expect(b.doubleValue()).assertEqual(240.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_5900
     * @tc.name testBigIntDoubleValueTest059
     * @tc.desc Mindmap input: doubleValue on BigInt constructed from double truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest059', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new BigInt(Math.floor(0.5)).doubleValue()).assertEqual(0.0);
      expect(new BigInt(Math.floor(1.9)).doubleValue()).assertEqual(1.0);
      expect(new BigInt(Math.ceil(-1.9)).doubleValue()).assertEqual(-1.0);
      expect(new BigInt(100.0).doubleValue()).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_6000
     * @tc.name testBigIntDoubleValueTest060
     * @tc.desc Mindmap special: doubleValue returns Infinity for exact string beyond double max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest060', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxDoubleStr = "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368";
      const posInf = BigInt(maxDoubleStr).doubleValue();
      expect(posInf).assertEqual(1.7976931348623157e+308);

      const negInf = BigInt("-" + maxDoubleStr).doubleValue();
      expect(negInf).assertEqual(-1.7976931348623157e+308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_6100
     * @tc.name testBigIntDoubleValueTest061
     * @tc.desc Mindmap input: doubleValue for 2^1023 near double max, verify finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest061', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPow1023Str = "89884656743115795386465259539451236680898848947115328636715040578866337902750481566354238661203768010560056939935696678829494856907273492833014833222972584453125122221614724804174613203092639167350120522724633744938124729123925344760930294304993395501160861621523981070294769137332294702028519600617674322944";
      const dv = BigInt(twoPow1023Str).doubleValue();

      expect(Number.isFinite(dv)).assertTrue();
      expect(dv > 0).assertTrue();

      expect(dv).assertEqual(8.98846567431158e+307);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_6200
     * @tc.name testBigIntDoubleValueTest062
     * @tc.desc Mindmap input: doubleValue for 2, -2, int.MAX, int.MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest062', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).doubleValue()).assertEqual(2.0);
      expect(BigInt(-2).doubleValue()).assertEqual(-2.0);
      expect(BigInt(2147483647).doubleValue()).assertEqual(2147483647);
      expect(BigInt(-2147483648).doubleValue()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_6300
     * @tc.name testBigIntDoubleValueTest063
     * @tc.desc Mindmap: doubleValue for 1 and -1 unit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest063', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).doubleValue()).assertEqual(1.0);
      expect(BigInt(-1).doubleValue()).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_DOUBLEVALUE_6400
     * @tc.name testBigIntDoubleValueTest064
     * @tc.desc Verify doubleValue precision loss beyond 2^53 (IEEE 754 double precision)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueTest064', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPow53 = 9007199254740992;
      expect(BigInt('9007199254740992').doubleValue()).assertEqual(twoPow53);
      expect(BigInt('9007199254740993').doubleValue()).assertEqual(twoPow53);
      expect(BigInt('9007199254740994').doubleValue()).assertEqual(twoPow53 + 2);
      expect(BigInt('9007199254740995').doubleValue()).assertEqual(twoPow53 + 4);
      expect(BigInt('9007199254740996').doubleValue()).assertEqual(twoPow53 + 4);
      expect(BigInt('-9007199254740992').doubleValue()).assertEqual(-twoPow53);
      expect(BigInt('-9007199254740993').doubleValue()).assertEqual(-twoPow53);
      expect(BigInt(0).doubleValue()).assertEqual(0.0);
      const gap = BigInt('9007199254740994').doubleValue() - BigInt('9007199254740992').doubleValue();
      expect(gap).assertEqual(2.0);
    });
  });
}