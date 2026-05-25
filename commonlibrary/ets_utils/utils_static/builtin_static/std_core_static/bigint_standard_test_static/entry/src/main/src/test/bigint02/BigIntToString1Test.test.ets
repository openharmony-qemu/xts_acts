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

export default function BigIntToString1Test(): void {
  describe('BigInt.toString no-arg (mindmap toString_1)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0100
     * @tc.name testBigIntToString1Zero0100
     * @tc.desc Verify no-arg toString for zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1Zero0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toString()).assertEqual('0');
      expect(BigInt(false).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0200
     * @tc.name testBigIntToString1UnitSigns0200
     * @tc.desc Verify no-arg toString for plus and minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1UnitSigns0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).toString()).assertEqual('1');
      expect(BigInt(-1).toString()).assertEqual('-1');
      expect(BigInt(true).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0300
     * @tc.name testBigIntToString1SmallSigned0300
     * @tc.desc Verify no-arg toString for typical small signed integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1SmallSigned0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).toString()).assertEqual('42');
      expect(BigInt(-42).toString()).assertEqual('-42');
      expect(BigInt('77').toString()).assertEqual('77');
      expect(BigInt('-88').toString()).assertEqual('-88');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0400
     * @tc.name testBigIntToString1LongBounds0400
     * @tc.desc Verify no-arg toString at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1LongBounds0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9223372036854775807).toString()).assertEqual('9223372036854775807');
      expect(BigInt(-9223372036854775808).toString()).assertEqual('-9223372036854775808');
      expect(BigInt(2147483647).toString()).assertEqual('2147483647');
      expect(BigInt(-2147483648).toString()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0500
     * @tc.name testBigIntToString1BeyondLongDecimal0500
     * @tc.desc Verify no-arg toString for decimal strings beyond long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1BeyondLongDecimal0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxSafe = '9007199254740991'; // 2^53 - 1, still within exact long/string construction

      expect(BigInt(maxSafe).toString()).assertEqual(maxSafe);
      expect(BigInt('-' + maxSafe).toString()).assertEqual('-' + maxSafe);
      expect(BigInt('9007199254740993').toString()).assertEqual('9007199254740993');
      expect(BigInt('9223372036854775808').toString()).assertEqual('9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0600
     * @tc.name testBigIntToString1VeryLargePositive0600
     * @tc.desc Verify no-arg toString for very large positive magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1VeryLargePositive0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = '999999999999999999999999999999';

      expect(BigInt(huge).toString()).assertEqual(huge);
      expect(BigInt('18446744073709551615').toString()).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0700
     * @tc.name testBigIntToString1VeryLargeNegative0700
     * @tc.desc Verify no-arg toString for very large negative magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1VeryLargeNegative0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = '999999999999999999999999999999';

      expect(BigInt('-' + huge).toString()).assertEqual('-' + huge);
      expect(BigInt('-18446744073709551616').toString()).assertEqual('-18446744073709551616');
    });
  });
}
