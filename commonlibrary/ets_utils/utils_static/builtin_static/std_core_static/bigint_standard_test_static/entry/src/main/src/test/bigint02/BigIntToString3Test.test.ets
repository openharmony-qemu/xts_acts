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
  describe('BigInt.toString(radix double)（导图 toString_3）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0100
     * @tc.name testBigIntToString3DoubleRadix0100
     * @tc.desc Verify toString accepts double radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3DoubleRadix0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const radix16: double = 16.0;
        const radix2: double = 2.0;
        const radix8: double = 8.0;
        expect(new BigInt(255).toString(Double.toInt(radix16))).assertEqual('ff');
        expect(new BigInt(10).toString(Double.toInt(radix2))).assertEqual('1010');
        expect(new BigInt(10).toString(Double.toInt(radix8))).assertEqual('12');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0200
     * @tc.name testBigIntToString3Default0200
     * @tc.desc Verify toString without radix is decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3Default0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(255).toString()).assertEqual('255');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0300
     * @tc.name testBigIntToString3Zero0300
     * @tc.desc Verify toString for zero with and without radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3Zero0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(0).toString()).assertEqual('0');
        expect(new BigInt(0).toString(16)).assertEqual('0');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0400
     * @tc.name testBigIntToString3Large0400
     * @tc.desc Verify toString with radix on very large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3Large0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const radix16: double = 16.0;
        expect(new BigInt('18446744073709551616').toString(Double.toInt(radix16)))
          .assertEqual('10000000000000000');
        expect(new BigInt('999999999999999999999999999999').toString())
          .assertEqual('999999999999999999999999999999');
      });
  });
}
