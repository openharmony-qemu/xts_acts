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
  PERF_POW2_EXP_512,
  PERF_POW2_EXP_1023,
  PERF_POW2_EXP_1024,
  PERF_POW2_EXP_1025,
  PERF_POW2_EXP_2047,
  PERF_POW2_EXP_2048,
  PERF_POW2_EXP_64,
  PERF_BATCH_ADD_ONE_64,
  PERF_BATCH_MULT_BY_TWO_64,
  PERF_DEC_LEN_POW2_1024,
  PERF_DEC_LEN_POW2_2048,
  perfBatchAddOne,
  perfBatchMultiplyByTwo,
  perfPow2
} from '../BigIntPerformanceLimits';

export default function BigIntPerformanceTest(): void {
  describe('BigInt large-integer performance scenarios', () => {
    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_0100
     * @tc.name testBigIntPerformancePow1024Bits0100
     * @tc.desc Verify 2^1024 pow completes with 309-digit decimal result
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformancePow1024Bits0100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p1024 = perfPow2(PERF_POW2_EXP_1024);
      const p1023 = perfPow2(PERF_POW2_EXP_1023);

      expect(p1024.toString().length).assertEqual(PERF_DEC_LEN_POW2_1024);
      expect(p1024.operatorGreaterThan(p1023)).assertTrue();
      expect(p1024.operatorMultiply(BigInt(PERF_BASE_TWO)).equals(perfPow2(PERF_POW2_EXP_1025))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_0200
     * @tc.name testBigIntPerformancePow2048Bits0200
     * @tc.desc Verify 2^2048 pow completes with 617-digit decimal result
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformancePow2048Bits0200', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p2048 = perfPow2(PERF_POW2_EXP_2048);
      const p2047 = perfPow2(PERF_POW2_EXP_2047);

      expect(p2048.toString().length).assertEqual(PERF_DEC_LEN_POW2_2048);
      expect(p2048.operatorGreaterThan(p2047)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_0300
     * @tc.name testBigIntPerformanceMultiply1024Bits0300
     * @tc.desc Verify multiplying two 512-bit powers yields 2^1024
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceMultiply1024Bits0300', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const expected = perfPow2(PERF_POW2_EXP_1024);
      const half = perfPow2(PERF_POW2_EXP_512);
      const product = half.operatorMultiply(half);

      expect(product.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_0400
     * @tc.name testBigIntPerformanceBatchMultiply0400
     * @tc.desc Verify repeated multiply-by-2 batch (64 steps) reaches 2^64
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchMultiply0400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const expected = perfPow2(PERF_POW2_EXP_64);
      const acc = perfBatchMultiplyByTwo(PERF_BATCH_MULT_BY_TWO_64);

      expect(acc.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_0500
     * @tc.name testBigIntPerformanceBatchAdd0500
     * @tc.desc Verify batch add on 1024-bit base increases value without shrinking width
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchAdd0500', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = perfPow2(PERF_POW2_EXP_1024);
      const acc = perfBatchAddOne(base, PERF_BATCH_ADD_ONE_64);

      expect(acc.toString().length).assertEqual(PERF_DEC_LEN_POW2_1024);
      expect(acc.operatorGreaterThan(base)).assertTrue();
    });
  });
}
