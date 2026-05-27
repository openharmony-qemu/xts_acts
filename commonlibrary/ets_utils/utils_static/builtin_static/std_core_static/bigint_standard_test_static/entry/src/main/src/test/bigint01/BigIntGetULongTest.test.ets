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
import Utils from '../Util.test';

export default function BigIntGetULongTest(): void {
  describe('BigInt.getULong (mindmap getULong)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0100
     * @tc.name testBigIntGetULongPositive0100
     * @tc.desc Mindmap input: getULong for small positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongPositive0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).getULong()).assertEqual(42);
      expect(BigInt(1).getULong()).assertEqual(1);
      expect(BigInt(0).getULong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0200
     * @tc.name testBigIntGetULongNegativeAsUnsigned0200
     * @tc.desc Mindmap input: negative BigInt truncates to unsigned long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongNegativeAsUnsigned0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt(-1))).assertEqual('18446744073709551615');
      expect(Utils.ulongRoundTrip(BigInt(-42))).assertEqual('18446744073709551574');
      expect(Utils.ulongRoundTrip(BigInt('-9223372036854775808'))).assertEqual('9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0300
     * @tc.name testBigIntGetULongLargePositive0300
     * @tc.desc Mindmap input: getULong beyond signed long maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongLargePositive0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt('9223372036854775808'))).assertEqual('9223372036854775808');
      expect(Utils.ulongRoundTrip(BigInt('18446744073709551615'))).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0400
     * @tc.name testBigIntGetULongOverflowWrap0400
     * @tc.desc Mindmap return value: getULong wraps beyond uint64 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongOverflowWrap0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt('18446744073709551616'))).assertEqual('0');
      expect(Utils.ulongRoundTrip(BigInt('18446744073709551617'))).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0500
     * @tc.name testBigIntGetULongFromULongSymmetry0500
     * @tc.desc Mindmap return value: getULong round-trips with fromULong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongFromULongSymmetry0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt('18446744073709551615');
      const restored = BigInt.fromULong(original.getULong());

      expect(restored.equals(original)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0600
     * @tc.name testBigIntGetULongReturnType0600
     * @tc.desc Mindmap return value: getULong returns long carrier for unsigned bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongReturnType0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(42).getULong())).assertEqual(Class.from<long>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0700
     * @tc.name testBigIntGetULongNoThrow0700
     * @tc.desc Mindmap error handling: getULong does not throw on large or negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongNoThrow0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(8).getULong()).assertEqual(8);
      expect(Utils.ulongRoundTrip(BigInt('99999999999999999999999'))).assertEqual('200376420520689663');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0800
     * @tc.name testBigIntGetULongSignedLongBounds0800
     * @tc.desc Mindmap input: getULong at signed long extrema maps to expected unsigned carriers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongSignedLongBounds0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9223372036854775807).getULong()).assertEqual(9223372036854775807);
      expect(Utils.ulongRoundTrip(BigInt('-9223372036854775808'))).assertEqual('9223372036854775808');
    });
  });
}
