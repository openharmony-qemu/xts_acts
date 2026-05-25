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
  describe('BigInt.toString(radix double) (mindmap toString_3)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0100
     * @tc.name testBigIntToString3DoubleRadix0100
     * @tc.desc Verify toString with radix supplied as double then narrowed to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3DoubleRadix0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sample255 = 255; // 0xFF: byte-aligned sample for radix conversion
      const radix16: double = 16.0; // hex
      const radix2: double = 2.0;
      const radix8: double = 8.0;

      expect(BigInt(sample255).toString(Double.toInt(radix16))).assertEqual('ff');
      expect(BigInt(10).toString(Double.toInt(radix2))).assertEqual('1010');
      expect(BigInt(10).toString(Double.toInt(radix8))).assertEqual('12');
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

      expect(BigInt(-sample255).toString(Double.toInt(radix16))).assertEqual('-ff');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0300
     * @tc.name testBigIntToString3InvalidArgRadix0300
     * @tc.desc Verify toString throws RangeError for invalid radix from double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3InvalidArgRadix0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radixBelowMin: double = 1.0; // legal int radix starts at 2
      const radixAboveMax: double = 37.0; // legal int radix ends at 36

      expect((): void => {
        BigInt(10).toString(Double.toInt(radixBelowMin));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixAboveMax));
      }).assertThrowError('RangeError');
    });
  });
}
