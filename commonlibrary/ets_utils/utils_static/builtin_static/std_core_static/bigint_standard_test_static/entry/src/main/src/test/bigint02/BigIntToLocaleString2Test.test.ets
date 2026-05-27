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
  LONG_MAX_STR,
  LONG_MIN_STR,
  DOUBLE_MAX_SAFE_INTEGER_PLUS_TWO_STR,
  LOCALE_EN_US,
  LOCALE_ZH_CN,
  LOCALE_EN_GB,
  LOCALE_STRING_OPTS_NO_GROUPING,
  LOCALE_STRING_OPTS_COMPACT_SHORT,
  LOCALE_STRING_OPTS_STANDARD,
  LOCALE_STRING_VALUE_MILLION,
  LOCALE_STRING_VALUE_GROUPED,
  TO_STRING_SMALL_NEGATIVE
} from '../BigIntTestLimits.test';

export default function BigIntToLocaleString2Test(): void {
  describe('BigInt.toLocaleString(locales, options) (mindmap toLocaleString_2)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0100
     * @tc.name testBigIntToLocaleString2Locales0100
     * @tc.desc Mindmap input: BCP 47 locale strings format grouped value without separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2Locales0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(LOCALE_STRING_VALUE_GROUPED);

      expect(v.toLocaleString(LOCALE_EN_US, LOCALE_STRING_OPTS_NO_GROUPING)).assertEqual('123456789');
      expect(v.toLocaleString(LOCALE_ZH_CN, LOCALE_STRING_OPTS_NO_GROUPING)).assertEqual('123456789');
      expect(v.toLocaleString(LOCALE_EN_GB, LOCALE_STRING_OPTS_NO_GROUPING)).assertEqual('123456789');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0200
     * @tc.name testBigIntToLocaleString2OptionsOnly0200
     * @tc.desc Mindmap input: undefined locales with compact options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2OptionsOnly0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(LOCALE_STRING_VALUE_MILLION);
      const compactOpts: BigIntToLocaleStringOptions = LOCALE_STRING_OPTS_COMPACT_SHORT;

      expect(v.toLocaleString(undefined, compactOpts).length > 0).assertTrue();
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
      const v = BigInt(LOCALE_STRING_VALUE_MILLION);
      const compactOpts: BigIntToLocaleStringOptions = LOCALE_STRING_OPTS_COMPACT_SHORT;
      const standardOpts: BigIntToLocaleStringOptions = LOCALE_STRING_OPTS_STANDARD;

      expect(v.toLocaleString(LOCALE_EN_US, compactOpts).length > 0).assertTrue();
      expect(v.toLocaleString(LOCALE_ZH_CN, standardOpts).length > 0).assertTrue();
      expect(v.toLocaleString(LOCALE_EN_US, LOCALE_STRING_OPTS_NO_GROUPING)).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0400
     * @tc.name testBigIntToLocaleString2ZeroNegative0400
     * @tc.desc Mindmap return value: zero and negative formatting exact decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2ZeroNegative0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toLocaleString(LOCALE_EN_US, LOCALE_STRING_OPTS_NO_GROUPING)).assertEqual('0');
      expect(BigInt(TO_STRING_SMALL_NEGATIVE).toLocaleString(LOCALE_EN_US, LOCALE_STRING_OPTS_NO_GROUPING)).assertEqual('-42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0500
     * @tc.name testBigIntToLocaleString2Large0500
     * @tc.desc Mindmap return value: large magnitude with locale exact decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2Large0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(DOUBLE_MAX_SAFE_INTEGER_PLUS_TWO_STR).toLocaleString(LOCALE_EN_US, LOCALE_STRING_OPTS_NO_GROUPING))
        .assertEqual(DOUBLE_MAX_SAFE_INTEGER_PLUS_TWO_STR);
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
      expect(Class.of(BigInt(1).toLocaleString(LOCALE_EN_US, LOCALE_STRING_OPTS_NO_GROUPING))).assertEqual(Class.from<string>());
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
      expect((): void => {
        BigInt(1).toLocaleString('');
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_2_0800
     * @tc.name testBigIntToLocaleString2InvalidArgOptions0800
     * @tc.desc Mindmap error handling: invalid options and non-object options throw on device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString2InvalidArgOptions0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const invalidNotation: BigIntToLocaleStringOptions = { notation: 'invalidValue' };
      const invalidStyle: BigIntToLocaleStringOptions = { style: 'invalidStyle' };
      const invalidCompact: BigIntToLocaleStringOptions = { compactDisplay: 'invalidCompact' };

      expect((): void => {
        BigInt(1).toLocaleString(LOCALE_EN_US, invalidNotation);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(1).toLocaleString(LOCALE_EN_US, invalidStyle);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(1).toLocaleString(LOCALE_EN_US, invalidCompact);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(1).toLocaleString(LOCALE_EN_US, null as object as BigIntToLocaleStringOptions);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        BigInt(1).toLocaleString(LOCALE_EN_US, 'abc' as object as BigIntToLocaleStringOptions);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        BigInt(1).toLocaleString(LOCALE_EN_US, 123 as object as BigIntToLocaleStringOptions);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        BigInt(1).toLocaleString(LOCALE_EN_US, true as object as BigIntToLocaleStringOptions);
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
      expect(BigInt(LONG_MAX_STR).toLocaleString(LOCALE_EN_US, LOCALE_STRING_OPTS_NO_GROUPING)).assertEqual(LONG_MAX_STR);
      expect(BigInt(LONG_MIN_STR).toLocaleString(LOCALE_EN_US, LOCALE_STRING_OPTS_NO_GROUPING)).assertEqual(LONG_MIN_STR);
      expect(BigInt(0).toLocaleString(LOCALE_EN_US, LOCALE_STRING_OPTS_NO_GROUPING)).assertEqual('0');
    });
  });
}
