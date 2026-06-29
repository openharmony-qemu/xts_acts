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

export default function BigIntToString3Test2(): void {
  describe('BigInt.toString(radix double) ext (mindmap toString_3)', () => {

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_1300
     * @tc.name testBigIntToString3DoubleRadixBoundary1300
     * @tc.desc Verify toString with double radix at boundary values 1.9 throws, 2.0 and 36.0 work, 36.1 works (truncated to 36)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3DoubleRadixBoundary1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radix_1_9: double = 1.9;
      const radix2_0: double = 2.0;
      const radix36_0: double = 36.0;
      const radix36_1: double = 36.1;
      expect((): void => {
        BigInt(10).toString(Double.toInt(radix_1_9));
      }).assertThrowError('RangeError');
      expect(BigInt(1).toString(Double.toInt(radix2_0))).assertEqual('1');
      expect(BigInt(36).toString(Double.toInt(radix36_0))).assertEqual('10');
      expect(BigInt(36).toString(Double.toInt(radix36_1))).assertEqual('10');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_EXT_2000
     * @tc.name testBigIntToString3OtherRadicesDouble2000
     * @tc.desc Verify toString with double-derived radices 15,17-36 on value 10 or 35 (complements int radix)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3OtherRadicesDouble2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radix15: double = 15.0;
      const radix17: double = 17.0;
      const radix18: double = 18.0;
      const radix19: double = 19.0;
      const radix20: double = 20.0;
      const radix21: double = 21.0;
      const radix22: double = 22.0;
      const radix23: double = 23.0;
      const radix24: double = 24.0;
      const radix25: double = 25.0;
      const radix26: double = 26.0;
      const radix27: double = 27.0;
      const radix28: double = 28.0;
      const radix29: double = 29.0;
      const radix30: double = 30.0;
      const radix31: double = 31.0;
      const radix32: double = 32.0;
      const radix33: double = 33.0;
      const radix34: double = 34.0;
      const radix35: double = 35.0;
      const radix36: double = 36.0;
      expect(BigInt(10).toString(Double.toInt(radix15))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix17))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix18))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix19))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix20))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix21))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix22))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix23))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix24))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix25))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix26))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix27))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix28))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix29))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix30))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix31))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix32))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix33))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix34))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix35))).assertEqual('a');
      expect(BigInt(10).toString(Double.toInt(radix36))).assertEqual('a');
      expect(BigInt(35).toString(Double.toInt(radix36))).assertEqual('z');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_EXT_2600
     * @tc.name testBigIntToString3InvalidRadixDouble2600
     * @tc.desc Verify toString with out-of-range double-derived radix throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3InvalidRadixDouble2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radix0: double = 0.0;
      const radix1: double = 1.0;
      const radix37: double = 37.0;
      const radix100: double = 100.0;
      const radixNeg: double = -1.0;
      expect((): void => {
        BigInt(10).toString(Double.toInt(radix0));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(Double.toInt(radix1));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(Double.toInt(radix37));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(Double.toInt(radix100));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixNeg));
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_EXT_2700
     * @tc.name testBigIntToString3NanDoubleRadix2700
     * @tc.desc Verify toString with NaN double radix throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3NanDoubleRadix2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radixNaN: double = NaN;
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixNaN));
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_EXT_2800
     * @tc.name testBigIntToString3InfinityDoubleRadix2800
     * @tc.desc Verify toString with Infinity double radix throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3InfinityDoubleRadix2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radixInf: double = Infinity;
      const radixNegInf: double = -Infinity;
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixInf));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixNegInf));
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_EXT_3000
     * @tc.name testBigIntToString3TruncatedDoubleRadix3000
     * @tc.desc Verify toString with truncated double radix (2.7->2, 16.7->16) produces correct output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3TruncatedDoubleRadix3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radix2_7: double = 2.7;
      const radix16_7: double = 16.7;
      const radix10_4: double = 10.4;
      expect(BigInt(5).toString(Double.toInt(radix2_7))).assertEqual('101');
      expect(BigInt(255).toString(Double.toInt(radix16_7))).assertEqual('ff');
      expect(BigInt(12345).toString(Double.toInt(radix10_4))).assertEqual('12345');
      expect(Double.toInt(radix16_7)).assertEqual(16);
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_EXT_3200
     * @tc.name testBigIntToString3NegativeDoubleRadix3200
     * @tc.desc Verify toString with negative double radix (-2.0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3NegativeDoubleRadix3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const radixNeg2: double = -2.0;
      const radixNeg36: double = -36.0;
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixNeg2));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixNeg36));
      }).assertThrowError('RangeError');
    });
  });
}
