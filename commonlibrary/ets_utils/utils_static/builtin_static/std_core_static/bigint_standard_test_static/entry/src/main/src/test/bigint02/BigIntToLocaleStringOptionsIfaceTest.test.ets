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

export default function BigIntToLocaleStringOptionsIfaceTest(): void {
  describe('BigInt.toLocaleString with options (mindmap toLocaleString_options_iface)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPTIONS_IFACE_0100
     * @tc.name testBigIntToLocaleStringWithOptions0100
     * @tc.desc Verify BigInt uses BigIntToLocaleStringOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringWithOptions0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const val = BigInt(1234567);
        const opts: BigIntToLocaleStringOptions = { notation: 'standard' };
        expect(val.toLocaleString('en-US', opts)).assertEqual('1,234,567');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPTIONS_IFACE_0200
     * @tc.name testBigIntToLocaleStringCompactShort0200
     * @tc.desc Verify BigIntToLocaleStringOptions with compact notation and short compactDisplay
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringCompactShort0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const val = BigInt(1000000);
        const opts: BigIntToLocaleStringOptions = { notation: 'compact', compactDisplay: 'short' };
        expect(val.toLocaleString('zh-CN', opts)).assertEqual('100万');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPTIONS_IFACE_0300
     * @tc.name testBigIntToLocaleStringCompactLong0300
     * @tc.desc Verify BigIntToLocaleStringOptions with compact notation and long compactDisplay
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringCompactLong0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const val = BigInt(1000000);
        const opts: BigIntToLocaleStringOptions = { notation: 'compact', compactDisplay: 'long' };
        expect(val.toLocaleString('en-US', opts)).assertEqual('1 million');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPTIONS_IFACE_0400
     * @tc.name testBigIntToLocaleStringNegativeStandard0400
     * @tc.desc Verify BigIntToLocaleStringOptions standard notation for negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringNegativeStandard0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const val = BigInt(-1234567);
        const opts: BigIntToLocaleStringOptions = { notation: 'standard' };
        expect(val.toLocaleString('en-US', opts)).assertEqual('-1,234,567');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPTIONS_IFACE_0500
     * @tc.name testBigIntToLocaleStringZeroOptions0500
     * @tc.desc Verify BigIntToLocaleStringOptions with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringZeroOptions0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const val = BigInt(0);
        const opts: BigIntToLocaleStringOptions = { notation: 'standard' };
        expect(val.toLocaleString('en-US', opts)).assertEqual('0');
      });
  });
}
