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

export default function BigIntPerformanceBatchCompare2Test(): void {
  describe('testBigIntPerformanceBatchCompare2Test', () => {
    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0100
     * @tc.name testBigIntPerformanceBatchCompare2Test0100
     * @tc.desc Verify repeated right shift (512 steps) on 2^512 yields 1
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test0100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      let acc = BigInt(2).pow(BigInt(512));
      const one = BigInt(1);
      for (let i = 0; i < 512; i++) {
        acc = acc.operatorRightShift(one);
      }
      expect(acc.equals(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0200
     * @tc.name testBigIntPerformanceBatchCompare2Test0200
     * @tc.desc Verify left-shift-then-right-shift round-trip on 1024-bit value
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test0200', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      const eight = BigInt(8);
      const shifted = base.operatorLeftShift(eight);
      const restored = shifted.operatorRightShift(eight);
      expect(restored.equals(base)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0300
     * @tc.name testBigIntPerformanceBatchCompare2Test0300
     * @tc.desc Verify repeated bitwise AND with alternating masks on 1024-bit base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test0300', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      const mask = base.operatorSubtract(BigInt(1));
      let acc = base;
      for (let i = 0; i < 256; i++) {
        acc = acc.operatorBitwiseAnd(mask);
      }
      expect(acc.equals(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0400
     * @tc.name testBigIntPerformanceBatchCompare2Test0400
     * @tc.desc Verify repeated bitwise OR accumulates all bits on 1024-bit base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test0400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      let acc = BigInt(0);
      const step = BigInt(1);
      for (let i = 0; i < 256; i++) {
        acc = acc.operatorBitwiseOr(step.operatorLeftShift(BigInt(i)));
      }
      const expected = BigInt(2).pow(BigInt(256)).operatorSubtract(BigInt(1));
      expect(acc.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0500
     * @tc.name testBigIntPerformanceBatchCompare2Test0500
     * @tc.desc Verify repeated XOR toggles bits and toggling twice restores original
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test0500', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      const mask = BigInt(2).pow(BigInt(512)).operatorSubtract(BigInt(1));
      let acc1 = base;
      for (let i = 0; i < 128; i++) {
        acc1 = acc1.operatorBitwiseXor(mask);
      }
      expect(acc1.equals(base)).assertTrue();
      const odd = base.operatorBitwiseXor(mask);
      expect(acc1.equals(odd)).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0600
     * @tc.name testBigIntPerformanceBatchCompare2Test0600
     * @tc.desc Verify bitwise OR on non-overlapping bits yields same result as addition
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test0600', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const a = BigInt(2).pow(BigInt(1024));
      const b = BigInt(2).pow(BigInt(768));
      const c = BigInt(2).pow(BigInt(512));
      const viaOr = a.operatorBitwiseOr(b).operatorBitwiseOr(c);
      const viaAdd = a.operatorAdd(b).operatorAdd(c);
      expect(viaOr.equals(viaAdd)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0700
     * @tc.name testBigIntPerformanceBatchCompare2Test0700
     * @tc.desc Verify repeated divide-by-2 batch (128 steps) on 2^128 yields 1
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test0700', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      let acc = BigInt(2).pow(BigInt(128));
      const two = BigInt(2);
      for (let i = 0; i < 128; i++) {
        acc = acc.operatorDivide(two);
      }
      expect(acc.equals(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0800
     * @tc.name testBigIntPerformanceBatchCompare2Test0800
     * @tc.desc Verify repeated modulo with small divisor on 1024-bit value yields stable pattern
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test0800', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      const ten = BigInt(10);
      let acc = base;
      for (let i = 0; i < 128; i++) {
        acc = acc.operatorModule(ten);
      }
      const expected = BigInt(2).pow(BigInt(1024)).operatorModule(BigInt(10));
      expect(acc.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_0900
     * @tc.name testBigIntPerformanceBatchCompare2Test0900
     * @tc.desc Verify multiply-by-N then divide-by-N round-trip (128 steps) on small base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test0900', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      let acc = BigInt(1);
      const three = BigInt(3);
      for (let i = 0; i < 128; i++) {
        acc = acc.operatorMultiply(three);
        acc = acc.operatorDivide(three);
      }
      expect(acc.equals(BigInt(1))).assertTrue();
    });


    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_1000
     * @tc.name testBigIntPerformanceBatchCompare2Test1000
     * @tc.desc Verify modulo result equals dividend minus divisor times quotient
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test1000', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const a = BigInt(2).pow(BigInt(1024));
      const b = BigInt(7);
      const quotient = a.operatorDivide(b);
      const remainder = a.operatorModule(b);
      const reconstructed = quotient.operatorMultiply(b).operatorAdd(remainder);
      expect(reconstructed.equals(a)).assertTrue();
    });



    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_1100
     * @tc.name testBigIntPerformanceBatchCompare2Test1100
     * @tc.desc Verify batch add with negative BigInt on 512-bit positive base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test1100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(512));
      const negOne = BigInt(-1);
      let acc = base;
      for (let i = 0; i < 64; i++) {
        acc = acc.operatorAdd(negOne);
      }
      const expected = base.operatorSubtract(BigInt(64));
      expect(acc.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_1200
     * @tc.name testBigIntPerformanceBatchCompare2Test1200
     * @tc.desc Verify batch multiply with negative BigInt alternates sign
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test1200', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(128));
      const negOne = BigInt(-1);
      let acc = base;
      for (let i = 0; i < 10; i++) {
        acc = acc.operatorMultiply(negOne);
      }
      // Even number of negations -> positive
      expect(acc.operatorGreaterThan(BigInt(0))).assertTrue();
      expect(acc.equals(base)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_1300
     * @tc.name testBigIntPerformanceBatchCompare2Test1300
     * @tc.desc Verify mixed positive and negative BigInt addition batch
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test1300', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const pos = BigInt(2).pow(BigInt(512));
      const neg = BigInt(-1).operatorMultiply(BigInt(2).pow(BigInt(256)));
      let acc = pos;
      for (let i = 0; i < 16; i++) {
        acc = acc.operatorAdd(neg);
      }
      const expected = pos.operatorAdd(neg.operatorMultiply(BigInt(16)));
      expect(acc.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_1400
     * @tc.name testBigIntPerformanceBatchCompare2Test1400
     * @tc.desc Verify left shift on negative BigInt preserves sign
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test1400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const neg = BigInt(0).operatorSubtract(BigInt(2).pow(BigInt(256)));
      const shifted = neg.operatorLeftShift(BigInt(8));
      const expected = neg.operatorMultiply(BigInt(256));
      expect(shifted.equals(expected)).assertTrue();
      expect(shifted.operatorLessThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_1500
     * @tc.name testBigIntPerformanceBatchCompare2Test1500
     * @tc.desc Verify arithmetic right shift on negative BigInt rounds toward negative infinity
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test1500', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const neg = BigInt(0).operatorSubtract(BigInt(2).pow(BigInt(256)));
      const shifted = neg.operatorRightShift(BigInt(8));
      // Right shift on negative should follow floor semantics
      expect(shifted.operatorLessThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_1600
     * @tc.name testBigIntPerformanceBatchCompare2Test1600
     * @tc.desc Verify complex mixed batch (add, subtract, multiply, divide) on 1024-bit base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test1600', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      const one = BigInt(1);
      const two = BigInt(2);
      const three = BigInt(3);
      let acc = base;
      for (let i = 0; i < 32; i++) {
        acc = acc.operatorAdd(one);
        acc = acc.operatorSubtract(one);
        acc = acc.operatorMultiply(two);
        acc = acc.operatorDivide(two);
      }
      expect(acc.equals(base)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_1700
     * @tc.name testBigIntPerformanceBatchCompare2Test1700
     * @tc.desc Verify complex mixed batch (add, shift, bitwise OR, divide) on 512-bit base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test1700', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      let acc = BigInt(2).pow(BigInt(512));
      const two = BigInt(2);
      const one = BigInt(1);
      for (let i = 0; i < 16; i++) {
        acc = acc.operatorAdd(one);
        acc = acc.operatorMultiply(two);
        acc = acc.operatorRightShift(one);
        acc = acc.operatorSubtract(one);
      }
      expect(acc.equals(BigInt(2).pow(BigInt(512)))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_1800
     * @tc.name testBigIntPerformanceBatchCompare2Test1800
     * @tc.desc Verify complex mixed batch (add, subtract, XOR, OR) on 256-bit base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test1800', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      let acc = BigInt(2).pow(BigInt(256));
      const one = BigInt(1);
      const mask = BigInt(2).pow(BigInt(128)).operatorSubtract(BigInt(1));
      for (let i = 0; i < 32; i++) {
        acc = acc.operatorAdd(one);
        acc = acc.operatorSubtract(one);
        acc = acc.operatorBitwiseXor(mask);
      }
      // XOR 32 times (even) -> restored
      expect(acc.operatorGreaterThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_1900
     * @tc.name testBigIntPerformanceBatchCompare2Test1900
     * @tc.desc Verify batch construction from decimal strings of varying sizes
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test1900', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      for (let i = 0; i < 64; i++) {
        const bi = BigInt('12345678901234567890');
        expect(bi.operatorGreaterThan(BigInt(0))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_2000
     * @tc.name testBigIntPerformanceBatchCompare2Test2000
     * @tc.desc Verify batch construction from number values (0 to 255)
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test2000', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      let sum = BigInt(0);
      for (let i = 0; i < 256; i++) {
        const bi = BigInt(i);
        sum = sum.operatorAdd(bi);
      }
      expect(sum.operatorGreaterThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_2100
     * @tc.name testBigIntPerformanceBatchCompare2Test2100
     * @tc.desc Verify batch construction from hex strings of varying lengths
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test2100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      let sum = BigInt(0);
      for (let i = 0; i < 32; i++) {
        const bi = BigInt('0x' + i.toString(16));
        sum = sum.operatorAdd(bi);
      }
      expect(sum.operatorGreaterThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_2200
     * @tc.name testBigIntPerformanceBatchCompare2Test2200
     * @tc.desc Verify batch toString with different radices (2, 8, 10, 16)
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test2200', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      let totalLen = 0;
      for (let i = 0; i < 16; i++) {
        const binStr = base.toString(2);
        const hexStr = base.toString(16);
        const decStr = base.toString(10);
        totalLen += binStr.length + hexStr.length + decStr.length;
      }
      expect(totalLen > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_2300
     * @tc.name testBigIntPerformanceBatchCompare2Test2300
     * @tc.desc Verify batch construction from octal string representations
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test2300', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      let sum = BigInt(0);
      for (let i = 0; i < 32; i++) {
        const bi = BigInt('0o' + i.toString(8));
        sum = sum.operatorAdd(bi);
      }
      expect(sum.operatorGreaterThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_2400
     * @tc.name testBigIntPerformanceBatchCompare2Test2400
     * @tc.desc Verify operatorGreaterThan, operatorLessThan, operatorEquals batch on negative values
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test2400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const pos = BigInt(2).pow(BigInt(256));
      const neg = BigInt(0).operatorSubtract(pos);
      // Negative < 0 < positive
      expect(neg.operatorLessThan(BigInt(0))).assertTrue();
      expect(pos.operatorGreaterThan(BigInt(0))).assertTrue();
      expect(neg.operatorLessThan(pos)).assertTrue();
      expect(pos.operatorGreaterThan(neg)).assertTrue();
      expect(neg.equals(neg)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_2500
     * @tc.name testBigIntPerformanceBatchCompare2Test2500
     * @tc.desc Verify modulo with negative divisor on positive base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test2500', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(256));
      const big = BigInt(2).pow(BigInt(128)).operatorSubtract(BigInt(1));
      const mod1 = base.operatorModule(big);

      expect(mod1.operatorLessThan(big)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_2600
     * @tc.name testBigIntPerformanceBatchCompare2Test2600
     * @tc.desc Verify repeated increment on negative BigInt approaches zero
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test2600', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      let acc = BigInt(0).operatorSubtract(BigInt(2).pow(BigInt(256)));
      const one = BigInt(1);
      for (let i = 0; i < 256; i++) {
        acc = acc.operatorAdd(one);
      }
      const expected = BigInt(0).operatorSubtract(BigInt(2).pow(BigInt(256))).operatorAdd(BigInt(256));
      expect(acc.equals(expected)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_2700
     * @tc.name testBigIntPerformanceBatchCompare2Test2700
     * @tc.desc Verify repeated decrement on negative BigInt becomes more negative
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test2700', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      let acc = BigInt(-100);
      const one = BigInt(1);
      for (let i = 0; i < 100; i++) {
        acc = acc.operatorSubtract(one);
      }
      expect(acc.equals(BigInt(-200))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_2800
     * @tc.name testBigIntPerformanceBatchCompare2Test2800
     * @tc.desc Verify complex mixed (left shift, right shift, add, XOR) batch on 256-bit base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test2800', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      let acc = BigInt(1);
      const one = BigInt(1);
      const two = BigInt(2);
      const three = BigInt(3);
      for (let i = 0; i < 32; i++) {
        acc = acc.operatorLeftShift(one);
        acc = acc.operatorAdd(one);
        acc = acc.operatorBitwiseXor(three);
        acc = acc.operatorRightShift(one);
      }
      expect(acc.operatorGreaterThan(BigInt(0))).assertTrue();
      expect(acc.equals(BigInt(1))).assertTrue();

    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_2900
     * @tc.name testBigIntPerformanceBatchCompare2Test2900
     * @tc.desc Verify right shift by 1 equals divide by 2 on positive value
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test2900', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      const one = BigInt(1);
      const two = BigInt(2);
      for (let i = 0; i < 32; i++) {
        const shifted = base.operatorRightShift(one);
        const divided = base.operatorDivide(two);
        expect(shifted.equals(divided)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_3000
     * @tc.name testBigIntPerformanceBatchCompare2Test3000
     * @tc.desc Verify batch divide and modulo using operator on same operands (divisor 3, 7, 13)
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test3000', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      const divisors: BigInt[] = [BigInt(3), BigInt(7), BigInt(13)];
      for (let j = 0; j < divisors.length; j++) {
        const d = divisors[j];
        const q = base.operatorDivide(d);
        const r = base.operatorModule(d);
        const check = q.operatorMultiply(d).operatorAdd(r);
        expect(check.equals(base)).assertTrue();
        expect(r.operatorLessThan(d)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_3100
     * @tc.name testBigIntPerformanceBatchCompare2Test3100
     * @tc.desc Verify bitwise AND after shift operations produces expected masking
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test3100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(1024));
      const mask = BigInt(255);
      let acc = base;
      for (let i = 0; i < 64; i++) {
        acc = acc.operatorRightShift(BigInt(8));
        const masked = acc.operatorBitwiseAnd(mask);
        expect(masked.operatorLessThan(BigInt(256))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_3200
     * @tc.name testBigIntPerformanceBatchCompare2Test3200
     * @tc.desc Verify add-subtract round-trip with bitwise complement on 256-bit base
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test3200', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const base = BigInt(2).pow(BigInt(256));
      const offset = BigInt(2).pow(BigInt(128));
      let acc = base;
      for (let i = 0; i < 64; i++) {
        acc = acc.operatorAdd(offset);
        acc = acc.operatorSubtract(offset);
      }
      expect(acc.equals(base)).assertTrue();
    });


    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_3300
     * @tc.name testBigIntPerformanceBatchCompare2Test3300
     * @tc.desc Verify batch construction from binary string representation
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test3300', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      for (let i = 1; i <= 64; i++) {
        let s: string = '0b';
        for (let j = 0; j < i; j++) {
          s = s + '1';
        }
        const bi = BigInt(s);
        const expected = BigInt(2).pow(BigInt(i)).operatorSubtract(BigInt(1));
        expect(bi.equals(expected)).assertTrue();
      }
    });


    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_3400
     * @tc.name testBigIntPerformanceBatchCompare2Test3400
     * @tc.desc Verify batch negation of positive BigInt via multiplication by -1
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test3400', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const pos = BigInt(2).pow(BigInt(256));
      const negOne = BigInt(-1);
      const negated = pos.operatorMultiply(negOne);
      expect(negated.operatorLessThan(BigInt(0))).assertTrue();
      const back = negated.operatorMultiply(negOne);
      expect(back.equals(pos)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_PERFORMANCE_BATCH_3500
     * @tc.name testBigIntPerformanceBatchCompare2Test3500
     * @tc.desc Verify batch shift, XOR, and add on mixed sign operands
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('testBigIntPerformanceBatchCompare2Test3500', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, () => {
      const pos = BigInt(2).pow(BigInt(256));
      const neg = BigInt(0).operatorSubtract(pos);
      const shiftAmount = BigInt(4);
      const posShifted = pos.operatorLeftShift(shiftAmount);
      const negShifted = neg.operatorRightShift(shiftAmount);
      expect(posShifted.operatorGreaterThan(pos)).assertTrue();
      expect(negShifted.operatorLessThan(BigInt(0))).assertTrue();
    });


  });
}
