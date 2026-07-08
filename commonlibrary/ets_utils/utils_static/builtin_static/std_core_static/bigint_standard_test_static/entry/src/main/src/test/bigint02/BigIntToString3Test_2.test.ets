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
import { describe, it, expect ,afterAll, afterEach, beforeAll, beforeEach } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntToString3Test_2(): void {
  describe('BigIntToString3Test_2', () => {
    beforeAll((): void => {
    });
    beforeEach(():void=>{
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_3_0100
     * @tc.name testBigIntToString3Test001
     * @tc.desc Verify toString with double radix at boundary values 1.9 throws, 2.0 and 36.0 work, 36.1 works (truncated to 36)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3Test001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_3_EXT_0200
     * @tc.name testBigIntToString3ExtTest002
     * @tc.desc Verify toString with double-derived radices 15 36 (complements int radix)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3ExtTest002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const radix15: double = 15.0;
      const radix36: double = 36.0;
      expect(BigInt(10).toString(Double.toInt(radix15))).assertEqual('a');
      expect(BigInt(35).toString(Double.toInt(radix36))).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_3_EXT_0300
     * @tc.name testBigIntToString3ExtTest003
     * @tc.desc Verify toString with out-of-range double-derived radix throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3ExtTest003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_3_EXT_0400
     * @tc.name testBigIntToString3ExtTest004
     * @tc.desc Verify toString with NaN double radix throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3ExtTest004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const radixNaN: double = Double.NaN;
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixNaN));
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_3_EXT_0500
     * @tc.name testBigIntToString3ExtTest005
     * @tc.desc Verify toString with Infinity double radix throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3ExtTest005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const radixInf: double = Double.POSITIVE_INFINITY;
      const radixNegInf: double = Double.NEGATIVE_INFINITY;
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixInf));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixNegInf));
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_3_EXT_0600
     * @tc.name testBigIntToString3ExtTest006
     * @tc.desc Verify toString with truncated double radix (2.7->2, 16.7->16) produces correct output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3ExtTest006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const radix2_7: double = 2.7;
      const radix16_7: double = 16.7;
      const radix10_4: double = 10.4;
      expect(BigInt(5).toString(Double.toInt(radix2_7))).assertEqual('101');
      expect(BigInt(255).toString(Double.toInt(radix16_7))).assertEqual('ff');
      expect(BigInt(12345).toString(Double.toInt(radix10_4))).assertEqual('12345');
      expect(Double.toInt(radix16_7)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_3_EXT_0700
     * @tc.name testBigIntToString3ExtTest007
     * @tc.desc Verify toString with negative double radix (-2.0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3ExtTest007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const radixNeg2: double = -2.0;
      const radixNeg36: double = -36.0;
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixNeg2));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(10).toString(Double.toInt(radixNeg36));
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_3_EXT_0800
     * @tc.name testBigIntToString3ExtTest008
     * @tc.desc Verify toString with double-derived radix 3 produces correct exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3ExtTest008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const radix3_0: double = 3.0;
      const radix3_7: double = 3.7;
      expect(BigInt(10).toString(Double.toInt(radix3_0))).assertEqual('101');
      expect(BigInt(10).toString(Double.toInt(radix3_7))).assertEqual('101');
      expect(Double.toInt(radix3_7)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOSTRING_3_EXT_0900
     * @tc.name testBigIntToString3ExtTest009
     * @tc.desc Verify toString with double-derived radix 7 produces correct exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3ExtTest009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const radix7_0: double = 7.0;
      const radix7_8: double = 7.8;
      expect(BigInt(10).toString(Double.toInt(radix7_0))).assertEqual('13');
      expect(BigInt(10).toString(Double.toInt(radix7_8))).assertEqual('13');
      expect(Double.toInt(radix7_8)).assertEqual(7);
    });
  });
}
