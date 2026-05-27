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
  PERF_BASE_TWO,
  PERF_ONE,
  PERF_POW2_EXP_1024,
  PERF_POW2_EXP_1025,
  PERF_POW2_EXP_1536,
  PERF_POW2_EXP_2048,
  PERF_POW2_EXP_256,
  PERF_POW2_EXP_4096,
  PERF_POW2_EXP_512,
  PERF_BATCH_MIXED_OPS_32,
  PERF_BATCH_MULT_BY_TWO_256,
  PERF_BATCH_SQUARE_12,
  PERF_BATCH_LEFT_SHIFT_512,
  PERF_DEC_LEN_POW2_256,
  PERF_DEC_LEN_MIXED_OPS_2048_BASE,
  perfBatchLeftShiftByOne,
  perfBatchMultiplyByTwo,
  perfBatchSquareFromTwo,
  perfPow2
} from '../BigIntPerformanceLimits';

export default function BigIntPerformanceBatchCompareTest(): void {
  describe('BigInt batch operation and operation-type comparison scenarios', () => {
    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0100
     * @tc.name testBigIntPerformanceBatchSquaring4096Bits0100
     * @tc.desc Verify repeated squaring (12 steps) reaches 2^4096 from base 2
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchSquaring4096Bits0100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const expected = perfPow2(PERF_POW2_EXP_4096);
      const acc = perfBatchSquareFromTwo(PERF_BATCH_SQUARE_12);

      expect(acc.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0200
     * @tc.name testBigIntPerformanceBatchMultiply256Steps0200
     * @tc.desc Verify repeated multiply-by-2 batch (256 steps) reaches 2^256
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchMultiply256Steps0200', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const expected = perfPow2(PERF_POW2_EXP_256);
      const acc = perfBatchMultiplyByTwo(PERF_BATCH_MULT_BY_TWO_256);

      expect(acc.equals(expected)).assertTrue();
      expect(acc.toString().length).assertEqual(PERF_DEC_LEN_POW2_256);
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0300
     * @tc.name testBigIntPerformanceBatchLeftShift512Steps0300
     * @tc.desc Verify repeated left shift (512 steps) on 1 yields 2^512
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchLeftShift512Steps0300', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const expected = perfPow2(PERF_POW2_EXP_512);
      const acc = perfBatchLeftShiftByOne(PERF_BATCH_LEFT_SHIFT_512);

      expect(acc.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0400
     * @tc.name testBigIntPerformanceBatchMixedOps2048Bits0400
     * @tc.desc Verify alternating add and multiply batch on 2048-bit base stays consistent
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchMixedOps2048Bits0400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = perfPow2(PERF_POW2_EXP_2048);
      const one = BigInt(PERF_ONE);
      const two = BigInt(PERF_BASE_TWO);
      let acc = base;
      for (let step = 0; step < PERF_BATCH_MIXED_OPS_32; step++) {
        acc = acc.operatorAdd(one);
        acc = acc.operatorMultiply(two);
      }

      expect(acc.toString().length).assertEqual(PERF_DEC_LEN_MIXED_OPS_2048_BASE);
      expect(acc.operatorGreaterThan(base)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0500
     * @tc.name testBigIntPerformanceCompareAddVsMultiply0500
     * @tc.desc Verify doubling via add matches multiply on 1024-bit base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceCompareAddVsMultiply0500', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = perfPow2(PERF_POW2_EXP_1024);
      const two = BigInt(PERF_BASE_TWO);
      const viaAdd = base.operatorAdd(base);
      const viaMul = base.operatorMultiply(two);

      expect(viaAdd.equals(viaMul)).assertTrue();
      expect(viaMul.equals(perfPow2(PERF_POW2_EXP_1025))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0600
     * @tc.name testBigIntPerformanceCompareMultiplyDivide0600
     * @tc.desc Verify multiply-then-divide round-trip on 1024-bit and 512-bit operands
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceCompareMultiplyDivide0600', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const a = perfPow2(PERF_POW2_EXP_1024);
      const b = perfPow2(PERF_POW2_EXP_512);
      const product = a.operatorMultiply(b);
      const restored = product.operatorDivide(b);

      expect(restored.equals(a)).assertTrue();
      expect(product.equals(perfPow2(PERF_POW2_EXP_1536))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0700
     * @tc.name testBigIntPerformanceComparePowVsBatchMultiply0700
     * @tc.desc Verify pow and batch multiply-by-2 produce identical 2^256 results
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceComparePowVsBatchMultiply0700', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const viaPow = perfPow2(PERF_POW2_EXP_256);
      const viaBatch = perfBatchMultiplyByTwo(PERF_BATCH_MULT_BY_TWO_256);

      expect(viaPow.equals(viaBatch)).assertTrue();
    });
  });
}
