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
  describe('BigInt.toStringAsPowerOfTwoRadix (mindmap)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_POT_RADIX_0100
     * @tc.name testBigIntToStringAsPowerOfTwoRadix0100
     * @tc.desc Verify valid power-of-two radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPowerOfTwoRadix0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(new BigInt(255).toStringAsPowerOfTwoRadix(16)).assertEqual('ff');
        expect(new BigInt(8).toStringAsPowerOfTwoRadix(2)).assertEqual('1000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_POT_RADIX_0200
     * @tc.name testBigIntToStringAsPowerOfTwoRadixNegative0200
     * @tc.desc Mindmap return value: negative value power-of-two radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPowerOfTwoRadixNegative0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-8).toStringAsPowerOfTwoRadix(2)).assertEqual('1000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_POT_RADIX_0300
     * @tc.name testBigIntToStringAsPowerOfTwoRadixRadix40300
     * @tc.desc Mindmap return value: radix 4 and 8 power-of-two conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPowerOfTwoRadixRadix40300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).toStringAsPowerOfTwoRadix(4)).assertEqual('3333');
      expect(BigInt(64).toStringAsPowerOfTwoRadix(8)).assertEqual('100');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_POT_RADIX_0400
     * @tc.name testBigIntToStringAsPowerOfTwoRadixInvalidArg0400
     * @tc.desc Mindmap error handling: invalid power-of-two radix throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPowerOfTwoRadixInvalidArg0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(255).toStringAsPowerOfTwoRadix(0);
      }).assertThrowError('Error');
      expect((): void => {
        BigInt(255).toStringAsPowerOfTwoRadix(-2);
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_POT_RADIX_0500
     * @tc.name testBigIntToStringAsPowerOfTwoRadixInvalidArgRadix10500
     * @tc.desc Mindmap error handling: radix 1 and negative non-power radix throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPowerOfTwoRadixInvalidArgRadix10500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(255).toStringAsPowerOfTwoRadix(1);
      }).assertThrowError('Error');
      expect((): void => {
        BigInt(255).toStringAsPowerOfTwoRadix(-1);
      }).assertThrowError('Error');
      expect((): void => {
        BigInt(255).toStringAsPowerOfTwoRadix(-8);
      }).assertThrowError('Error');
    });
  });
}
