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
     * @tc.name testBigIntToLocaleString2Locale0100
     * @tc.desc Verify toLocaleString with locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2Locale0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const s = new BigInt(1000000).toLocaleString('en-US');
        expect(s.length > 0).assertTrue();
        const zh = new BigInt(1000000).toLocaleString('zh-CN', { notation: 'compact', compactDisplay: 'short' });
        expect(zh.length > 0).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0200
     * @tc.name testBigIntToLocaleString2Zero0200
     * @tc.desc Verify toLocaleString with locale for zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2Zero0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(0).toLocaleString('en-US')).assertEqual('0');
        expect(new BigInt(0).toLocaleString('de-DE')).assertEqual('0');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0300
     * @tc.name testBigIntToLocaleString2Negative0300
     * @tc.desc Verify toLocaleString with locale for negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2Negative0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const en = new BigInt(-1000000).toLocaleString('en-US');
        expect(en.length > 0).assertTrue();
        expect(en.indexOf('-') >= 0).assertTrue();
        const de = new BigInt(-42).toLocaleString('de-DE');
        expect(de.length > 0).assertTrue();
        expect(de.indexOf('-') >= 0).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0400
     * @tc.name testBigIntToLocaleString2Locales0400
     * @tc.desc Verify toLocaleString with different locale parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2Locales0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const enUs = new BigInt(1234567).toLocaleString('en-US');
        const frFr = new BigInt(1234567).toLocaleString('fr-FR');
        expect(enUs.length > 0).assertTrue();
        expect(frFr.length > 0).assertTrue();
      });
  });
}
