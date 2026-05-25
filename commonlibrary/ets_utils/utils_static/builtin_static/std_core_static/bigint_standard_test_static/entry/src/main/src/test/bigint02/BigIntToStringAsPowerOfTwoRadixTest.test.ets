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

export default function BigIntToStringAsPowerOfTwoRadixTest(): void {
  describe('BigInt.toStringAsPowerOfTwoRadix (mindmap toStringAsPowerOfTwoRadix)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_POT_RADIX_0100
     * @tc.name testBigIntToStringAsPowerOfTwoRadix0100
     * @tc.desc Verify valid power-of-two radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPowerOfTwoRadix0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sample255 = 255; // 0xFF
      const radixHex = 16; // power-of-two radix
      const radixBin = 2;

      expect(BigInt(sample255).toStringAsPowerOfTwoRadix(radixHex)).assertEqual('ff');
      expect(BigInt(8).toStringAsPowerOfTwoRadix(radixBin)).assertEqual('1000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_POT_RADIX_0200
     * @tc.name testBigIntToStringAsPowerOfTwoRadixInvalidArgZero0200
     * @tc.desc Verify zero radix throws Error (current runtime behavior)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPowerOfTwoRadixInvalidArgZero0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(255).toStringAsPowerOfTwoRadix(0);
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_POT_RADIX_0300
     * @tc.name testBigIntToStringAsPowerOfTwoRadixInvalidArgNegative0300
     * @tc.desc Verify negative radix throws Error (current runtime behavior)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPowerOfTwoRadixInvalidArgNegative0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(255).toStringAsPowerOfTwoRadix(-2);
      }).assertThrowError('Error');
    });
  });
}
