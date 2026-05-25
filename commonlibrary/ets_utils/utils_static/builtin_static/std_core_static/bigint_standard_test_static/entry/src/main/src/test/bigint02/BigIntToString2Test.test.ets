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

export default function BigIntToString2Test(): void {
  describe('BigInt.toString(radix int) (mindmap toString_2)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0100
     * @tc.name testBigIntToString2ZeroRadix0100
     * @tc.desc Verify toString with radix for zero across legal radix range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ZeroRadix0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toString(2)).assertEqual('0');
      expect(BigInt(0).toString(10)).assertEqual('0');
      expect(BigInt(0).toString(16)).assertEqual('0');
      expect(BigInt(0).toString(36)).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0200
     * @tc.name testBigIntToString2RadixBounds0200
     * @tc.desc Verify minimum radix 2 and maximum radix 36 conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2RadixBounds0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radixMin = 2;
      const radixMax = 36;

      expect(BigInt(1).toString(radixMin)).assertEqual('1');
      expect(BigInt(35).toString(radixMax)).assertEqual('z');
      expect(BigInt(36).toString(radixMax)).assertEqual('10');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0300
     * @tc.name testBigIntToString2RepresentativeRadices0300
     * @tc.desc Verify common radix conversions on a byte-aligned sample
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2RepresentativeRadices0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sample255 = 255; // 0xFF

      expect(BigInt(sample255).toString(2)).assertEqual('11111111');
      expect(BigInt(sample255).toString(8)).assertEqual('377');
      expect(BigInt(sample255).toString(16)).assertEqual('ff');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0400
     * @tc.name testBigIntToString2Negative0400
     * @tc.desc Verify toString radix with negative small and string-constructed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Negative0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sample255 = 255;

      expect(BigInt(-1).toString(10)).assertEqual('-1');
      expect(BigInt(-sample255).toString(16)).assertEqual('-ff');
      expect(BigInt('-255').toString(16)).assertEqual('-ff');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0500
     * @tc.name testBigIntToString2LongBounds0500
     * @tc.desc Verify toString radix at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2LongBounds0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9223372036854775807).toString(10)).assertEqual('9223372036854775807');
      expect(BigInt(9223372036854775807).toString(16)).assertEqual('7fffffffffffffff');
      expect(BigInt(-9223372036854775808).toString(10)).assertEqual('-9223372036854775808');
      expect(BigInt(-9223372036854775808).toString(16)).assertEqual('-8000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0600
     * @tc.name testBigIntToString2InvalidArgRadix0600
     * @tc.desc Verify toString throws RangeError for radix outside 2..36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2InvalidArgRadix0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radixZero = 0;
      const radixBelowMin = 1;
      const radixAboveMax = 37;

      expect((): void => {
        BigInt(10).toString(radixZero);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(radixBelowMin);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(radixAboveMax);
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0700
     * @tc.name testBigIntToString2VeryLargePositive0700
     * @tc.desc Verify toString radix for very large positive magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2VeryLargePositive0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = '999999999999999999999999999999';

      expect(BigInt('18446744073709551616').toString(16)).assertEqual('10000000000000000');
      expect(BigInt(huge).toString(10)).assertEqual(huge);
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0800
     * @tc.name testBigIntToString2VeryLargeNegative0800
     * @tc.desc Verify toString radix for very large negative magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2VeryLargeNegative0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = '999999999999999999999999999999';

      expect(BigInt('-' + huge).toString(10)).assertEqual('-' + huge);
      expect(BigInt('-18446744073709551616').toString(16)).assertEqual('-10000000000000000');
    });
  });
}
