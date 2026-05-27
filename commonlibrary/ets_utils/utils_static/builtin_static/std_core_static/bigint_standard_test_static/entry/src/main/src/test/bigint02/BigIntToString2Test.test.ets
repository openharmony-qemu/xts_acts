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
import {
  LONG_MAX,
  LONG_MIN,
  LONG_MAX_RADIX16_STR,
  LONG_MIN_RADIX16_STR,
  SAMPLE_BYTE_MAGNITUDE,
  SAMPLE_BYTE_RADIX16_STR,
  SAMPLE_BYTE_RADIX16_NEGATED_STR,
  SAMPLE_BYTE_RADIX2_STR,
  SAMPLE_DECIMAL_MAGNITUDE,
  SAMPLE_DECIMAL_RADIX2_STR,
  SAMPLE_DECIMAL_RADIX8_STR
} from '../BigIntTestLimits';

export default function BigIntToString2Test(): void {
  describe('BigInt.toString(radix int) (mindmap toString_2)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0100
     * @tc.name testBigIntToString2RadixBasic0100
     * @tc.desc Mindmap input: common radix conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2RadixBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(SAMPLE_BYTE_MAGNITUDE).toString(16)).assertEqual(SAMPLE_BYTE_RADIX16_STR);
      expect(BigInt(SAMPLE_DECIMAL_MAGNITUDE).toString(2)).assertEqual(SAMPLE_DECIMAL_RADIX2_STR);
      expect(BigInt(SAMPLE_DECIMAL_MAGNITUDE).toString(8)).assertEqual(SAMPLE_DECIMAL_RADIX8_STR);
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0200
     * @tc.name testBigIntToString2RadixBounds0200
     * @tc.desc Mindmap input: minimum radix 2 and maximum radix 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2RadixBounds0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(36).toString(36)).assertEqual('10');
      expect(BigInt(1).toString(2)).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0300
     * @tc.name testBigIntToString2Negative0300
     * @tc.desc Mindmap return value: negative value radix output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Negative0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-SAMPLE_BYTE_MAGNITUDE).toString(16)).assertEqual(SAMPLE_BYTE_RADIX16_NEGATED_STR);
      expect(BigInt(LONG_MIN).toString(16)).assertEqual('-' + LONG_MIN_RADIX16_STR);
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0400
     * @tc.name testBigIntToString2Radix20400
     * @tc.desc Mindmap return value: byte-wide magnitude binary conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Radix20400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(SAMPLE_BYTE_MAGNITUDE).toString(2)).assertEqual(SAMPLE_BYTE_RADIX2_STR);
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0500
     * @tc.name testBigIntToString2ReturnType0500
     * @tc.desc Mindmap return value: toString returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2ReturnType0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(SAMPLE_DECIMAL_MAGNITUDE).toString(10))).assertEqual(Class.from<string>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0600
     * @tc.name testBigIntToString2InvalidArgRadix0600
     * @tc.desc Mindmap error handling: radix outside 2..36 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2InvalidArgRadix0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(SAMPLE_DECIMAL_MAGNITUDE).toString(1);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(SAMPLE_DECIMAL_MAGNITUDE).toString(37);
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0700
     * @tc.name testBigIntToString2LongBounds0700
     * @tc.desc Mindmap return value: signed long extrema radix-16 strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2LongBounds0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(LONG_MAX);
      const min = BigInt(LONG_MIN);

      expect(max.toString(16)).assertEqual(LONG_MAX_RADIX16_STR);
      expect(min.toString(16)).assertEqual('-' + LONG_MIN_RADIX16_STR);
      expect(max.toString(2)).assertEqual(max.toStringAsBinary());
    });
  });
}
