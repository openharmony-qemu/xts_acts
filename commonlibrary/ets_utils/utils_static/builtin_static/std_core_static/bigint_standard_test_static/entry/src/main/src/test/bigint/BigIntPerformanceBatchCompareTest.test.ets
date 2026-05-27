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
      const expected = BigInt(2).pow(BigInt(4096));
      let acc = BigInt(2);
      for (let i = 0; i < 12; i++) {
        acc = acc.operatorMultiply(acc);
      }

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
      const expected = BigInt(2).pow(BigInt(256));
      let acc = BigInt(1);
      const two = BigInt(2);
      for (let i = 0; i < 256; i++) {
        acc = acc.operatorMultiply(two);
      }

      expect(acc.equals(expected)).assertTrue();
      expect(acc.toString().length).assertEqual(78);
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
      const expected = BigInt(2).pow(BigInt(512));
      let acc = BigInt(1);
      const one = BigInt(1);
      for (let i = 0; i < 512; i++) {
        acc = acc.operatorLeftShift(one);
      }

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
      const base = BigInt(2).pow(BigInt(2048));
      const one = BigInt(1);
      const two = BigInt(2);
      let acc = base;
      for (let i = 0; i < 32; i++) {
        acc = acc.operatorAdd(one);
        acc = acc.operatorMultiply(two);
      }

      expect(acc.toString().length).assertEqual(627);
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
      const base = BigInt(2).pow(BigInt(1024));
      const two = BigInt(2);
      const viaAdd = base.operatorAdd(base);
      const viaMul = base.operatorMultiply(two);

      expect(viaAdd.equals(viaMul)).assertTrue();
      expect(viaMul.equals(BigInt(2).pow(BigInt(1025)))).assertTrue();
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
      const a = BigInt(2).pow(BigInt(1024));
      const b = BigInt(2).pow(BigInt(512));
      const product = a.operatorMultiply(b);
      const restored = product.operatorDivide(b);

      expect(restored.equals(a)).assertTrue();
      expect(product.equals(BigInt(2).pow(BigInt(1536)))).assertTrue();
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
      const viaPow = BigInt(2).pow(BigInt(256));
      let viaBatch = BigInt(1);
      const two = BigInt(2);
      for (let i = 0; i < 256; i++) {
        viaBatch = viaBatch.operatorMultiply(two);
      }

      expect(viaPow.equals(viaBatch)).assertTrue();
    });
  });
}
