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

export default function BigIntToLocaleStringOptionsIfaceTest2(): void {
  describe('BigInt.toLocaleString with options ext (mindmap toLocaleString_options_iface)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_IFACE_0700
     * @tc.name testBigIntToLocaleStringOptionsIfaceMinIntegerDigits0700
     * @tc.desc Verify minimumIntegerDigits produces leading-zero padded output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsIfaceMinIntegerDigits0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: string = BigInt(42).toLocaleString('en-US', { minimumIntegerDigits: 5, useGrouping: false });
      expect(result).assertEqual('00042');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_IFACE_0800
     * @tc.name testBigIntToLocaleStringOptionsIfaceMinMaxFractionDigits0800
     * @tc.desc Verify minimum and maximum fraction digits with toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsIfaceMinMaxFractionDigits0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const opts: BigIntToLocaleStringOptions = { minimumFractionDigits: 2, maximumFractionDigits: 4 };
      const result: string = BigInt(123).toLocaleString('en-US', opts);
      expect(result).assertEqual('123.00');
    });


    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_IFACE_1500
     * @tc.name testBigIntToLocaleStringOptionsIfaceLocaleMatcher1500
     * @tc.desc Verify localeMatcher best fit and lookup both produce non-empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsIfaceLocaleMatcher1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1000).toLocaleString('en-US', { localeMatcher: 'best fit' })).assertEqual('1,000');
      expect(BigInt(1000).toLocaleString('en-US', { localeMatcher: 'lookup' })).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_IFACE_1600
     * @tc.name testBigIntToLocaleStringOptionsIfaceAllOptionsCombined1600
     * @tc.desc Verify multiple options combined together produce non-empty output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsIfaceAllOptionsCombined1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const opts: BigIntToLocaleStringOptions = {
        notation: 'compact',
        compactDisplay: 'short',
        minimumIntegerDigits: 1,
        useGrouping: true
      };
      expect(BigInt(2500000).toLocaleString('en-US', opts)).assertEqual('2.5M');
      expect(BigInt(0).toLocaleString('en-US', opts)).assertEqual('0');
      expect(BigInt(-2500000).toLocaleString('en-US', opts)).assertEqual('-2.5M');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_IFACE_1800
     * @tc.name testBigIntToLocaleStringOptionsIfaceNegativeWithOptions1800
     * @tc.desc Verify negative value formatting with various option combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsIfaceNegativeWithOptions1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-1).toLocaleString('en-US', { minimumIntegerDigits: 3, useGrouping: false })).assertEqual('-001');
      expect(BigInt(-123456).toLocaleString('en-US', { useGrouping: true })).assertEqual('-123,456');
      expect(BigInt(-999).toLocaleString('en-US', { notation: 'compact', compactDisplay: 'short' }).length).assertLarger(0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_OPT_IFACE_1900
     * @tc.name testBigIntToLocaleStringOptionsIfaceUltraLarge1900
     * @tc.desc Verify huge BigInt with various option combinations produces non-empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleStringOptionsIfaceUltraLarge1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = BigInt('99999999999999999999999999999999999999999999999999');
      expect(huge.toLocaleString('en-US', { useGrouping: false })).assertEqual('99999999999999999999999999999999999999999999999999');
      expect(huge.toLocaleString('en-US', { notation: 'compact', compactDisplay: 'short' }).length).assertLarger(0);
      expect(huge.toLocaleString('en-US', { minimumIntegerDigits: 20, useGrouping: false }).length).assertLarger(0);
    });

  });
}
