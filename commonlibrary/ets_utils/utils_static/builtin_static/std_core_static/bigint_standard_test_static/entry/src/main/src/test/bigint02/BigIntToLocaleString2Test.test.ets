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

export default function BigIntToLocaleString2Test(): void {
  describe('BigInt.toLocaleString(locales, options) (mindmap toLocaleString_2)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0100
     * @tc.name testBigIntToLocaleString2EnUsGrouping0100
     * @tc.desc Verify toLocaleString with en-US locale produces expected grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2EnUsGrouping0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1000000).toLocaleString('en-US')).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0200
     * @tc.name testBigIntToLocaleString2ZhCnCompact0200
     * @tc.desc Verify toLocaleString with zh-CN compact notation options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2ZhCnCompact0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1000000).toLocaleString('zh-CN', { notation: 'compact', compactDisplay: 'short' })).assertEqual('100万');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0300
     * @tc.name testBigIntToLocaleString2ZeroEnUs0300
     * @tc.desc Verify toLocaleString with en-US locale for zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2ZeroEnUs0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toLocaleString('en-US')).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0400
     * @tc.name testBigIntToLocaleString2ZeroDeDe0400
     * @tc.desc Verify toLocaleString with de-DE locale for zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2ZeroDeDe0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toLocaleString('de-DE')).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0500
     * @tc.name testBigIntToLocaleString2NegativeEnUs0500
     * @tc.desc Verify toLocaleString with en-US locale for negative million-scale value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2NegativeEnUs0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-1000000).toLocaleString('en-US')).assertEqual('-1,000,000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0600
     * @tc.name testBigIntToLocaleString2NegativeSmallDeDe0600
     * @tc.desc Verify toLocaleString with de-DE locale for small negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2NegativeSmallDeDe0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-42).toLocaleString('de-DE')).assertEqual('-42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0700
     * @tc.name testBigIntToLocaleString2NegativeMillionDeDe0700
     * @tc.desc Verify toLocaleString with de-DE locale for negative million-scale value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2NegativeMillionDeDe0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-1000000).toLocaleString('de-DE')).assertEqual('-1.000.000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0800
     * @tc.name testBigIntToLocaleString2EnUsLarge0800
     * @tc.desc Verify toLocaleString with en-US locale for seven-digit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2EnUsLarge0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1234567).toLocaleString('en-US')).assertEqual('1,234,567');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0900
     * @tc.name testBigIntToLocaleString2FrFrLarge0900
     * @tc.desc Verify toLocaleString with fr-FR locale for seven-digit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2FrFrLarge0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1234567).toLocaleString('fr-FR')).assertEqual('1\u202f234\u202f567');
    });
  });
}
