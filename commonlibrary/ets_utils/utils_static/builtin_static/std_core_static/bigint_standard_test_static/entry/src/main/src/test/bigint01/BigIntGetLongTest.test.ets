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

export default function BigIntGetLongTest(): void {
  describe('BigInt.getLong (mindmap getLong)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0100
     * @tc.name testBigIntGetLongPositive0100
     * @tc.desc Verify getLong for positive BigInt values within long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongPositive0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(1).getLong()).assertEqual(1);
        expect(BigInt(42).getLong()).assertEqual(42);
        expect(BigInt(1000000).getLong()).assertEqual(1000000);
        expect(BigInt(127).getLong()).assertEqual(127);
        expect(BigInt(32767).getLong()).assertEqual(32767);
        expect(BigInt(2147483647).getLong()).assertEqual(2147483647);
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0200
     * @tc.name testBigIntGetLongNegative0200
     * @tc.desc Verify getLong for negative BigInt values within long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongNegative0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(-1).getLong()).assertEqual(-1);
        expect(BigInt(-42).getLong()).assertEqual(-42);
        expect(BigInt(-1000000).getLong()).assertEqual(-1000000);
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0300
     * @tc.name testBigIntGetLongZero0300
     * @tc.desc Verify getLong returns zero for BigInt zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongZero0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(0).getLong()).assertEqual(0);
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0400
     * @tc.name testBigIntGetLongBoundary0400
     * @tc.desc Verify getLong at signed long min and max without overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongBoundary0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(9223372036854775807).getLong()).assertEqual(9223372036854775807);
        expect(BigInt(-9223372036854775808).getLong()).assertEqual(-9223372036854775808);
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0500
     * @tc.name testBigIntGetLongOverflowWrap0500
     * @tc.desc Verify getLong truncates to signed 64-bit (LONG_MIN..LONG_MAX) with two's-complement wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongOverflowWrap0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt('9223372036854775808').getLong()).assertEqual(-9223372036854775808); // LONG_MAX + 1
        expect(BigInt('-9223372036854775809').getLong()).assertEqual(9223372036854775807); // LONG_MIN - 1
        expect(BigInt('18446744073709551616').getLong()).assertEqual(0); // 2^64 wraps to 0
        expect(BigInt('-18446744073709551617').getLong()).assertEqual(-1);
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0600
     * @tc.name testBigIntGetLongApiSemantics0600
     * @tc.desc Document getLong as non-throwing signed long narrow; out-of-range values wrap mod 2^64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongApiSemantics0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const within = BigInt(9223372036854775807);
        expect(within.getLong()).assertEqual(9223372036854775807);
        expect(within.getLong()).assertEqual(within.getLong());
        const wrapped = BigInt('9223372036854775808');
        expect(wrapped.getLong()).assertEqual(-9223372036854775808);
        expect(wrapped.getLong()).assertEqual(-9223372036854775808);
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0700
     * @tc.name testBigIntGetLongConsistent0700
     * @tc.desc Verify repeated getLong calls return the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongConsistent0700',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v = BigInt(8);
        const first = v.getLong();
        expect(first).assertEqual(8);
        expect(v.getLong()).assertEqual(first);
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETLONG_0800
     * @tc.name testBigIntGetLongNoThrow0800
     * @tc.desc Verify getLong on out-of-range values does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongNoThrow0800',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt('9223372036854775808').getLong()).assertEqual(-9223372036854775808);
        expect(BigInt('18446744073709551616').getLong()).assertEqual(0);
        expect(BigInt('-99999999999999999999999').getLong()).assertEqual(-200376420520689663);
      });
  });
}
