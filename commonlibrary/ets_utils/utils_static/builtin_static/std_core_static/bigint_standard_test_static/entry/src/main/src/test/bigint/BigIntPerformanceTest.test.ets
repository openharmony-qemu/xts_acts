'use static';
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
      const p1024 = BigInt(2).pow(BigInt(1024));
      const p1023 = BigInt(2).pow(BigInt(1023));

      expect(p1024.toString().length).assertEqual(309);
      expect(p1024.operatorGreaterThan(p1023)).assertTrue();
      expect(p1024.operatorMultiply(BigInt(2)).equals(BigInt(2).pow(BigInt(1025)))).assertTrue();
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
      const p2048 = BigInt(2).pow(BigInt(2048));
      const p2047 = BigInt(2).pow(BigInt(2047));

      expect(p2048.toString().length).assertEqual(617);
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
      const expected = BigInt(2).pow(BigInt(1024));
      const half = BigInt(2).pow(BigInt(512));
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
      const expected = BigInt(2).pow(BigInt(64));
      let acc = BigInt(1);
      const two = BigInt(2);
      for (let i = 0; i < 64; i++) {
        acc = acc.operatorMultiply(two);
      }

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
      const base = BigInt(2).pow(BigInt(1024));
      const one = BigInt(1);
      let acc = base;
      for (let i = 0; i < 64; i++) {
        acc = acc.operatorAdd(one);
      }

      expect(acc.toString().length).assertEqual(309);
      expect(acc.operatorGreaterThan(base)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_0600
     * @tc.name testBigIntPerformancePow4096Bits0600
     * @tc.desc Verify 2^4096 pow completes with 1234-digit decimal result
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformancePow4096Bits0600', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const p4096 = BigInt(2).pow(BigInt(4096));
      const p4095 = BigInt(2).pow(BigInt(4095));

      expect(p4096.toString().length).assertEqual(1234);
      expect(p4096.operatorGreaterThan(p4095)).assertTrue();
      expect(p4096.operatorMultiply(BigInt(2)).equals(BigInt(2).pow(BigInt(4097)))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_0700
     * @tc.name testBigIntPerformanceBatchSubtract0700
     * @tc.desc Verify repeated subtract-one batch (64 steps) on 1024-bit base plus offset
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchSubtract0700', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      const one = BigInt(1);
      const offset = BigInt(64);
      let acc = base.operatorAdd(offset);
      for (let i = 0; i < 64; i++) {
        acc = acc.operatorSubtract(one);
      }

      expect(acc.equals(base)).assertTrue();
      expect(acc.toString().length).assertEqual(309);
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_0800
     * @tc.name testBigIntPerformanceBatchIncrement0800
     * @tc.desc Verify repeated operatorIncrement batch (128 steps) on 1024-bit base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchIncrement0800', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      const expected = base.operatorAdd(BigInt(128));
      let acc = base;
      for (let i = 0; i < 128; i++) {
        acc = acc.operatorIncrement();
      }

      expect(acc.equals(expected)).assertTrue();
      expect(acc.toString().length).assertEqual(309);
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_0900
     * @tc.name testBigIntPerformanceBatchDecrement0900
     * @tc.desc Verify repeated operatorDecrement batch (128 steps) on 1024-bit base plus offset
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchDecrement0900', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      const offset = BigInt(128);
      let acc = base.operatorAdd(offset);
      for (let i = 0; i < 128; i++) {
        acc = acc.operatorDecrement();
      }

      expect(acc.equals(base)).assertTrue();
      expect(acc.toString().length).assertEqual(309);
    });
  });
}
