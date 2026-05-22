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

function ulongRoundTrip(bi: BigInt): string {
  return BigInt.fromULong(bi.getULong()).toString();
}

export default function BigIntGetULongTest(): void {
  describe('BigInt.getULong (mindmap getULong)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0100
     * @tc.name testBigIntGetULongPositive0100
     * @tc.desc Verify getULong for small and medium positive BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongPositive0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(42).getULong()).assertEqual(42);
        expect(BigInt(1).getULong()).assertEqual(1);
        expect(BigInt(100).getULong()).assertEqual(100);
        expect(BigInt(0).getULong()).assertEqual(0);
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0200
     * @tc.name testBigIntGetULongNegativeAsUnsigned0200
     * @tc.desc Verify negative BigInt values truncate to unsigned 64-bit long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongNegativeAsUnsigned0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(ulongRoundTrip(BigInt(-1))).assertEqual('18446744073709551615');
        expect(ulongRoundTrip(BigInt(-2))).assertEqual('18446744073709551614');
        expect(ulongRoundTrip(BigInt(-42))).assertEqual('18446744073709551574');
        expect(ulongRoundTrip(BigInt('-9223372036854775808'))).assertEqual('9223372036854775808');
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0300
     * @tc.name testBigIntGetULongLargePositive0300
     * @tc.desc Verify getULong for values at and beyond signed long maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongLargePositive0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(ulongRoundTrip(BigInt('9223372036854775808'))).assertEqual('9223372036854775808');
        expect(ulongRoundTrip(BigInt('18446744073709551614'))).assertEqual('18446744073709551614');
        expect(ulongRoundTrip(BigInt('18446744073709551615'))).assertEqual('18446744073709551615');
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0400
     * @tc.name testBigIntGetULongOverflowWrap0400
     * @tc.desc Verify getULong wraps values beyond uint64 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongOverflowWrap0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(ulongRoundTrip(BigInt('18446744073709551616'))).assertEqual('0');
        expect(ulongRoundTrip(BigInt('18446744073709551617'))).assertEqual('1');
        expect(ulongRoundTrip(BigInt('18446744073709551716'))).assertEqual('100');
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0500
     * @tc.name testBigIntGetULongFromULongSymmetry0500
     * @tc.desc Verify getULong round-trips with BigInt.fromULong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongFromULongSymmetry0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const cases: BigInt[] = [BigInt(42), BigInt(0), BigInt('18446744073709551615')];
        for (let i = 0; i < cases.length; i++) {
          const original = cases[i];
          const restored = BigInt.fromULong(original.getULong());
          expect(restored.equals(original)).assertTrue();
        }
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0600
     * @tc.name testBigIntGetULongNoThrow0600
     * @tc.desc Verify getULong does not throw on large or negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongNoThrow0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let ok = true;
        try {
          expect(BigInt(8).getULong()).assertEqual(8);
          ulongRoundTrip(BigInt('-99999999999999999999999'));
          ulongRoundTrip(BigInt('99999999999999999999999'));
        } catch (_e) {
          ok = false;
        }
        expect(ok).assertTrue();
      });
  });
}
