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
import {
  PERF_FACTOR_FIVE,
  PERF_POW2_EXP_1024,
  PERF_POW2_EXP_2048,
  PERF_POW2_EXP_4095,
  PERF_POW2_EXP_4096,
  PERF_BATCH_SUBTRACT_ONE_128,
  PERF_POW2_EXP_512,
  PERF_DEC_LEN_POW2_4095,
  PERF_DEC_LEN_POW2_4096,
  perfBatchSubtractOne,
  perfPow2
} from '../BigIntPerformanceLimits';

export default function BigIntPerformanceLargeIntegerTest(): void {
  describe('BigInt ultra-large integer performance scenarios', () => {
    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0100
     * @tc.name testBigIntPerformanceLargePow4096Bits0100
     * @tc.desc Verify 2^4096 pow completes with 1234-digit decimal result
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargePow4096Bits0100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = perfPow2(PERF_POW2_EXP_4096);
      const p4095 = perfPow2(PERF_POW2_EXP_4095);

      expect(p4096.toString().length).assertEqual(PERF_DEC_LEN_POW2_4096);
      expect(p4096.operatorGreaterThan(p4095)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0200
     * @tc.name testBigIntPerformanceLargeMultiply4096Bits0200
     * @tc.desc Verify multiplying two 2048-bit powers yields 2^4096
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeMultiply4096Bits0200', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const expected = perfPow2(PERF_POW2_EXP_4096);
      const half = perfPow2(PERF_POW2_EXP_2048);
      const product = half.operatorMultiply(half);

      expect(product.equals(expected)).assertTrue();
      expect(product.toString().length).assertEqual(PERF_DEC_LEN_POW2_4096);
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0300
     * @tc.name testBigIntPerformanceLargeSubtract4096Bits0300
     * @tc.desc Verify subtract on 4096-bit base preserves magnitude after many steps
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeSubtract4096Bits0300', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = perfPow2(PERF_POW2_EXP_4096);
      const acc = perfBatchSubtractOne(base, PERF_BATCH_SUBTRACT_ONE_128);

      expect(acc.toString().length).assertEqual(PERF_DEC_LEN_POW2_4096);
      expect(acc.operatorLessThan(base)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0400
     * @tc.name testBigIntPerformanceLargeDivideMod2048Bits0400
     * @tc.desc Verify divide and modulo on 2048-bit product round-trip correctly
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeDivideMod2048Bits0400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const half = perfPow2(PERF_POW2_EXP_2048);
      const factor = BigInt(PERF_FACTOR_FIVE);
      const product = half.operatorMultiply(factor);
      const quotient = product.operatorDivide(factor);
      const remainder = product.operatorModule(factor);

      expect(quotient.equals(half)).assertTrue();
      expect(remainder.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0500
     * @tc.name testBigIntPerformanceLargeBitwise1024Bits0500
     * @tc.desc Verify bitwise OR and AND on non-overlapping 1024-bit powers
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeBitwise1024Bits0500', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p1024 = perfPow2(PERF_POW2_EXP_1024);
      const p512 = perfPow2(PERF_POW2_EXP_512);
      const combined = p1024.operatorBitwiseOr(p512);
      const masked = p1024.operatorBitwiseAnd(p512);

      expect(combined.equals(p1024.operatorAdd(p512))).assertTrue();
      expect(masked.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0600
     * @tc.name testBigIntPerformanceLargeToString4096Bits0600
     * @tc.desc Verify decimal toString on 4096-bit value has expected width and prefix
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargeToString4096Bits0600', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = perfPow2(PERF_POW2_EXP_4096);
      const text = p4096.toString();

      expect(text.length).assertEqual(PERF_DEC_LEN_POW2_4096);
      expect(text.startsWith('1')).assertTrue();
      expect(text.endsWith('0')).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_LARGE_0700
     * @tc.name testBigIntPerformanceLargePow4095Boundary0700
     * @tc.desc Verify 2^4095 is one digit shorter than 2^4096 and strictly less
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceLargePow4095Boundary0700', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = perfPow2(PERF_POW2_EXP_4096);
      const p4095 = perfPow2(PERF_POW2_EXP_4095);

      expect(p4095.toString().length).assertEqual(PERF_DEC_LEN_POW2_4095);
      expect(p4095.operatorLessThan(p4096)).assertTrue();
      expect(p4095.operatorAdd(BigInt(1)).operatorLessThan(p4096)).assertTrue();
    });
  });
}
