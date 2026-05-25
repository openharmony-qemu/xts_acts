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

export default function BigIntToLocaleString1Test(): void {
  describe('BigInt.toLocaleString no-arg (mindmap toLocaleString_1)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0100
     * @tc.name testBigIntToLocaleString1Default0100
     * @tc.desc Verify default toLocaleString formats million-scale values with grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Default0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1000000).toLocaleString()).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0200
     * @tc.name testBigIntToLocaleString1Zero0200
     * @tc.desc Verify default toLocaleString for zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Zero0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toLocaleString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0300
     * @tc.name testBigIntToLocaleString1Negative0300
     * @tc.desc Verify default toLocaleString for negative million-scale values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Negative0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-1000000).toLocaleString()).assertEqual('-1,000,000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0400
     * @tc.name testBigIntToLocaleString1SmallPositive0400
     * @tc.desc Verify default toLocaleString for small positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1SmallPositive0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).toLocaleString()).assertEqual('42');
      expect(BigInt(1).toLocaleString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0500
     * @tc.name testBigIntToLocaleString1Large0500
     * @tc.desc Verify default toLocaleString for values beyond safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Large0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775807').toLocaleString()).assertEqual('9,223,372,036,854,775,807');
    });
  });
}
