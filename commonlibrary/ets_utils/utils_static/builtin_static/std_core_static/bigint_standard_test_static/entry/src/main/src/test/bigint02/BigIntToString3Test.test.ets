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

export default function BigIntToString3Test(): void {
  describe('BigInt.toString(radix double (mindmap toString_3)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0100
     * @tc.name testBigIntToString3DoubleRadix0100
     * @tc.desc Verify toString with radix supplied as double then narrowed to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3DoubleRadix0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const sample255 = 255;
        const radix16: double = 16.0;
        const radix2: double = 2.0;
        const radix8: double = 8.0;
        expect(new BigInt(sample255).toString(Double.toInt(radix16))).assertEqual('ff');
        expect(new BigInt(10).toString(Double.toInt(radix2))).assertEqual('1010');
        expect(new BigInt(10).toString(Double.toInt(radix8))).assertEqual('12');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0200
     * @tc.name testBigIntToString3Negative0200
     * @tc.desc Verify toString with double-derived radix on negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3Negative0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const sample255 = 255;
        const radix16: double = 16.0;
        expect(new BigInt(-sample255).toString(Double.toInt(radix16))).assertEqual('-ff');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0300
     * @tc.name testBigIntToString3ReturnType0300
     * @tc.desc Mindmap return value: toString with double-derived radix returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3ReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radix16: double = 16.0;

      expect(Class.of(BigInt(255).toString(Double.toInt(radix16)))).assertEqual(Class.from<string>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0400
     * @tc.name testBigIntToString3InvalidArgRadix0400
     * @tc.desc Mindmap error handling: invalid radix from double throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3InvalidArgRadix0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radixBelowMin: double = 1.0;
      const radixAboveMax: double = 37.0;

      expect((): void => {
        BigInt(10).toString(Double.toInt(radixBelowMin));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixAboveMax));
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0500
     * @tc.name testBigIntToString3RadixBounds0500
     * @tc.desc Verify minimum radix 2 and maximum radix 36 via double narrowed to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3RadixBounds0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radix2: double = 2.0;
      const radix36: double = 36.0;

      expect(BigInt(36).toString(Double.toInt(radix36))).assertEqual('10');
      expect(BigInt(1).toString(Double.toInt(radix2))).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0600
     * @tc.name testBigIntToString3ZeroAndLongBounds0600
     * @tc.desc Verify zero and signed long extrema with double-derived radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3ZeroAndLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radix10: double = 10.0;
      const radix16: double = 16.0;

      expect(BigInt(0).toString(Double.toInt(radix10))).assertEqual('0');
      expect(BigInt(9223372036854775807).toString(Double.toInt(radix16))).assertEqual('7fffffffffffffff');
      expect(BigInt(-9223372036854775808).toString(Double.toInt(radix16))).assertEqual('-8000000000000000');
    });
  });
}
