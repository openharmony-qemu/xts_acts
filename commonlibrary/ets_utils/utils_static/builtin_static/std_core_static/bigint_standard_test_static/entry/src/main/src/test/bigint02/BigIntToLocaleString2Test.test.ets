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
     * @tc.name testBigIntToLocaleString2Locales0100
     * @tc.desc Mindmap input: BCP 47 locale strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2Locales0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(123456789);

      expect(v.toLocaleString('en-US').length > 0).assertTrue();
      expect(v.toLocaleString('zh-CN').length > 0).assertTrue();
      expect(v.toLocaleString('en-GB').length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0200
     * @tc.name testBigIntToLocaleString2OptionsOnly0200
     * @tc.desc Mindmap input: undefined locales with options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2OptionsOnly0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(1000000);

      expect(v.toLocaleString(undefined, { notation: 'compact', compactDisplay: 'short' }).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0300
     * @tc.name testBigIntToLocaleString2LocaleAndOptions0300
     * @tc.desc Mindmap input: locales and options together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2LocaleAndOptions0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(1000000);

      expect(v.toLocaleString('en-US', { notation: 'compact', compactDisplay: 'short' }).length > 0).assertTrue();
      expect(v.toLocaleString('zh-CN', { notation: 'standard' }).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0400
     * @tc.name testBigIntToLocaleString2ZeroNegative0400
     * @tc.desc Mindmap return value: zero and negative formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2ZeroNegative0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toLocaleString('en-US').length > 0).assertTrue();
      expect(BigInt(-42).toLocaleString('en-US').length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0500
     * @tc.name testBigIntToLocaleString2Large0500
     * @tc.desc Mindmap return value: large magnitude with locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2Large0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740993').toLocaleString('en-US').length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0600
     * @tc.name testBigIntToLocaleString2ReturnType0600
     * @tc.desc Mindmap return value: toLocaleString returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2ReturnType0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(1).toLocaleString('en-US'))).assertEqual(Class.from<string>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0700
     * @tc.name testBigIntToLocaleString2InvalidArgLocale0700
     * @tc.desc Mindmap error handling: illegal BCP 47 locale throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2InvalidArgLocale0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(1).toLocaleString('invalid-locale-!@#$');
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0800
     * @tc.name testBigIntToLocaleString2InvalidArgOptions0800
     * @tc.desc Mindmap error handling: invalid options notation and non-object options throw on device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2InvalidArgOptions0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(1).toLocaleString('en-US', { notation: 'invalidValue' });
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(1).toLocaleString('en-US', true as object as BigIntToLocaleStringOptions);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0900
     * @tc.name testBigIntToLocaleString2LongBounds0900
     * @tc.desc Mindmap boundary: signed long extrema with locale and options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2LongBounds0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const opts: BigIntToLocaleStringOptions = { useGrouping: false };

      expect(BigInt('9223372036854775807').toLocaleString('en-US', opts)).assertEqual('9223372036854775807');
      expect(BigInt('-9223372036854775808').toLocaleString('en-US', opts)).assertEqual('-9223372036854775808');
      expect(BigInt(0).toLocaleString('en-US', opts)).assertEqual('0');
    });
  });
}
