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

export default function BigIntToLocaleString2Test_2(): void {
  describe('BigIntToLocaleString2Test_2', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_0100
     * @tc.name testBigIntToLocale2Test001
     * @tc.desc Verify useGrouping true with different locale formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(123456789);
      expect(v.toLocaleString('en-US', { useGrouping: true })).assertEqual('123,456,789');
      expect(v.toLocaleString('zh-CN', { useGrouping: true })).assertEqual('123,456,789');
      expect(v.toLocaleString('de-DE', { useGrouping: true })).assertEqual('123.456.789');
      expect(v.toLocaleString('fr-FR', { useGrouping: true })).assertEqual('123 456 789');
      expect(v.toLocaleString('ja-JP', { useGrouping: true })).assertEqual('123,456,789');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_0200
     * @tc.name testBigIntToLocale2Test002
     * @tc.desc Verify compact notation with short and long display across values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(1500000);
      const shortOpts: BigIntToLocaleStringOptions = { notation: 'compact', compactDisplay: 'short' };
      const longOpts: BigIntToLocaleStringOptions = { notation: 'compact', compactDisplay: 'long' };
      const shortResult: string = v.toLocaleString('en-US', shortOpts);
      const longResult: string = v.toLocaleString('en-US', longOpts);
      expect(shortResult).assertEqual('1.5M');
      expect(longResult).assertEqual('1.5 million');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_0300
     * @tc.name testBigIntToLocale2Test003
     * @tc.desc Verify locale array argument returns non-empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(123456789);
      const locales: Intl.LocalesArgument = ['en-US', 'zh-CN'];
      expect(v.toLocaleString(locales, { useGrouping: false })).assertEqual('123456789');
      expect(v.toLocaleString(locales).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_0400
     * @tc.name testBigIntToLocale2Test004
     * @tc.desc Verify negative values with useGrouping true produce non-empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-1000).toLocaleString('en-US', { useGrouping: true })).assertEqual('-1,000');
      expect(BigInt(-1000000).toLocaleString('en-US', { useGrouping: true })).assertEqual('-1,000,000');
      expect(BigInt(-123456789).toLocaleString('en-US', { useGrouping: true })).assertEqual('-123,456,789');
      expect(BigInt(-1).toLocaleString('en-US', { useGrouping: true })).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_0500
     * @tc.name testBigIntToLocale2Test005
     * @tc.desc Verify zero with various option combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
      expect(BigInt(0).toLocaleString('en-US', { notation: 'standard' })).assertEqual('0');
      expect(BigInt(0).toLocaleString('en-US', { notation: 'compact', compactDisplay: 'short' })).assertEqual('0');
      expect(BigInt(0).toLocaleString('zh-CN', { useGrouping: true })).assertEqual('0');
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_0600
     * @tc.name testBigIntToLocale2Test006
     * @tc.desc Verify additional invalid BCP 47 locale patterns throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let caughtCount: number = 0;
      try { BigInt(1).toLocaleString('12345'); } catch (e) { caughtCount++; }
      try { BigInt(1).toLocaleString('invalid-locale-!@#'); } catch (e) { caughtCount++; }
      try { BigInt(1).toLocaleString('-'); } catch (e) { caughtCount++; }
      try { BigInt(1).toLocaleString('en_U_S'); } catch (e) { caughtCount++; }
      expect(caughtCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_0700
     * @tc.name testBigIntToLocale2Test007
     * @tc.desc Verify short and long compactDisplay produce different strings for same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(1000000);
      const shortResult: string = v.toLocaleString('en-US', { notation: 'compact', compactDisplay: 'short' });
      const longResult: string = v.toLocaleString('en-US', { notation: 'compact', compactDisplay: 'long' });
      expect(shortResult).assertEqual('1M');
      expect(longResult).assertEqual('1 million');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_0800
     * @tc.name testBigIntToLocale2Test008
     * @tc.desc Verify toLocaleString with locale and options on string/hex constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('123456').toLocaleString('en-US', { useGrouping: false })).assertEqual('123456');
      expect(BigInt('0xFF').toLocaleString('de-DE', { useGrouping: false })).assertEqual('255');
      expect(BigInt('0xFF').negate().toLocaleString('en-US', { useGrouping: false })).assertEqual('-255');
      expect(BigInt('0b1010').toLocaleString('en-US', { useGrouping: false })).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_0900
     * @tc.name testBigIntToLocale2Test009
     * @tc.desc Verify style decimal option with multiple locales produces non-empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const opts: BigIntToLocaleStringOptions = { style: 'decimal' };
      expect(BigInt(42).toLocaleString('en-US', opts)).assertEqual('42');
      expect(BigInt(-42).toLocaleString('en-US', opts)).assertEqual('-42');
      expect(BigInt(0).toLocaleString('en-US', opts)).assertEqual('0');
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_1000
     * @tc.name testBigIntToLocale2Test010
     * @tc.desc Verify diverse BCP 47 region locales all produce non-empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(1000000);
      expect(v.toLocaleString('ko-KR', { useGrouping: false })).assertEqual('1000000');
      expect(v.toLocaleString('pt-BR', { useGrouping: false })).assertEqual('1000000');
      expect(v.toLocaleString('it-IT', { useGrouping: false })).assertEqual('1000000');
      expect(v.toLocaleString('es-ES', { useGrouping: false })).assertEqual('1000000');
      expect(v.toLocaleString('ru-RU', { useGrouping: false })).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_1100
     * @tc.name testBigIntToLocale2Test011
     * @tc.desc Verify sign handling for positive, negative, and zero values across locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(1000);
      const neg = BigInt(-1000);
      const zero = BigInt(0);

      expect(v.toLocaleString('en-US').length).assertLarger(0);
      expect(v.toLocaleString('zh-CN').length).assertLarger(0);
      expect(v.toLocaleString('de-DE').length).assertLarger(0);


      const negStr = neg.toLocaleString('en-US');
      expect(negStr.length).assertLarger(0);
      expect(negStr.includes('-')).assertTrue();

      const negStrCN = neg.toLocaleString('zh-CN');
      expect(negStrCN.length).assertLarger(0);
      expect(negStrCN.includes('-')).assertTrue();


      const zeroStr = zero.toLocaleString('en-US');
      expect(zeroStr).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_1200
     * @tc.name testBigIntToLocale2Test012
     * @tc.desc Verify style="currency" with different currency codes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(1000);
      
      const optsUSD: BigIntToLocaleStringOptions = { style: 'currency', currency: 'USD' };
      const usdResult = v.toLocaleString('en-US', optsUSD);
      expect(usdResult.length).assertLarger(0);
      expect(usdResult.includes('$')).assertTrue();
      
      const optsEUR: BigIntToLocaleStringOptions = { style: 'currency', currency: 'EUR' };
      const eurResult = v.toLocaleString('de-DE', optsEUR);
      expect(eurResult.length).assertLarger(0);
      expect(eurResult.includes('€')).assertTrue();
      
      const optsCNY: BigIntToLocaleStringOptions = { style: 'currency', currency: 'CNY' };
      const cnyResult = v.toLocaleString('zh-CN', optsCNY);
      expect(cnyResult.length).assertLarger(0);
      expect(cnyResult.includes('¥')).assertTrue();
      
      const optsJPY: BigIntToLocaleStringOptions = { style: 'currency', currency: 'JPY' };
      const jpyResult = v.toLocaleString('ja-JP', optsJPY);
      expect(jpyResult.length).assertLarger(0);
      expect(jpyResult.includes('￥')).assertTrue();
      
      const optsGBP: BigIntToLocaleStringOptions = { style: 'currency', currency: 'GBP' };
      const gbpResult = v.toLocaleString('en-GB', optsGBP);
      expect(gbpResult.length).assertLarger(0);
      expect(gbpResult.includes('£')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_1300
     * @tc.name testBigIntToLocale2Test013
     * @tc.desc Verify currencyDisplay options (symbol/code/name)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(50);

      const optsSymbol: BigIntToLocaleStringOptions = { style: 'currency', currency: 'USD', currencyDisplay: 'symbol' };
      expect(v.toLocaleString('en-US', optsSymbol).includes('$')).assertTrue();
      

      const optsCode: BigIntToLocaleStringOptions = { style: 'currency', currency: 'USD', currencyDisplay: 'code' };
      expect(v.toLocaleString('en-US', optsCode).includes('USD')).assertTrue();
      

      const optsName: BigIntToLocaleStringOptions = { style: 'currency', currency: 'USD', currencyDisplay: 'name' };
      expect(v.toLocaleString('en-US', optsName).includes('dollar')).assertTrue();
      

      const optsEURSymbol: BigIntToLocaleStringOptions = { style: 'currency', currency: 'EUR', currencyDisplay: 'symbol' };
      expect(v.toLocaleString('de-DE', optsEURSymbol).includes('€')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_1400
     * @tc.name testBigIntToLocale2Test014
     * @tc.desc Verify style="percent" formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(100);
      const opts: BigIntToLocaleStringOptions = { style: 'percent' };
      
      expect(v.toLocaleString('en-US', opts).includes('%')).assertTrue();
      expect(v.toLocaleString('de-DE', opts).includes('%')).assertTrue();
      expect(v.toLocaleString('zh-CN', opts).includes('%')).assertTrue();
      expect(BigInt(0).toLocaleString('en-US', opts).includes('0')).assertTrue();
      expect(BigInt(-50).toLocaleString('en-US', opts).includes('-')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_1500
     * @tc.name testBigIntToLocale2Test015
     * @tc.desc Verify style="unit" with different unit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(1000);
      const optsKM: BigIntToLocaleStringOptions = { style: 'unit', unit: 'kilometer' };
      expect(v.toLocaleString('en-US', optsKM).length).assertLarger(0);
      
      const optsM: BigIntToLocaleStringOptions = { style: 'unit', unit: 'meter' };
      expect(v.toLocaleString('en-US', optsM).length).assertLarger(0);
      
      const optsKG: BigIntToLocaleStringOptions = { style: 'unit', unit: 'kilogram' };
      expect(v.toLocaleString('en-US', optsKG).length).assertLarger(0);
      
      const optsL: BigIntToLocaleStringOptions = { style: 'unit', unit: 'liter' };
      expect(v.toLocaleString('en-US', optsL).length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_1600
     * @tc.name testBigIntToLocale2Test016
     * @tc.desc Verify minimumSignificantDigits and maximumSignificantDigits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(1234567);
      
      const optsMin: BigIntToLocaleStringOptions = { minimumSignificantDigits: 3 };
      expect(v.toLocaleString('en-US', optsMin).length).assertLarger(0);

      const optsMax: BigIntToLocaleStringOptions = { maximumSignificantDigits: 4 };
      expect(v.toLocaleString('en-US', optsMax).length).assertLarger(0);

      const optsBoth: BigIntToLocaleStringOptions = { minimumSignificantDigits: 2, maximumSignificantDigits: 5 };
      expect(v.toLocaleString('en-US', optsBoth).length).assertLarger(0);

      const optsOne: BigIntToLocaleStringOptions = { minimumSignificantDigits: 1 };
      expect(BigInt(5).toLocaleString('en-US', optsOne)).assertEqual('5');

      const optsMaxEdge: BigIntToLocaleStringOptions = { maximumSignificantDigits: 21 };
      expect(v.toLocaleString('en-US', optsMaxEdge).length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_1700
     * @tc.name testBigIntToLocale2Test017
     * @tc.desc Verify numberingSystem option with different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(1234567);

      const optsLatn: BigIntToLocaleStringOptions = { numberingSystem: 'latn' };
      expect(v.toLocaleString('en-US', optsLatn).length).assertLarger(0);

      const optsArab: BigIntToLocaleStringOptions = { numberingSystem: 'arab' };
      expect(v.toLocaleString('ar-SA', optsArab).length).assertLarger(0);

      const optsHanidec: BigIntToLocaleStringOptions = { numberingSystem: 'hanidec' };
      expect(v.toLocaleString('zh-CN', optsHanidec).length).assertLarger(0);

      const optsThai: BigIntToLocaleStringOptions = { numberingSystem: 'thai' };
      expect(v.toLocaleString('th-TH', optsThai).length).assertLarger(0);

      const optsDeva: BigIntToLocaleStringOptions = { numberingSystem: 'deva' };
      expect(v.toLocaleString('hi-IN', optsDeva).length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_1800
     * @tc.name testBigIntToLocale2Test018
     * @tc.desc Verify compact notation across multiple locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(1000000);
      const shortOpts: BigIntToLocaleStringOptions = { notation: 'compact', compactDisplay: 'short' };
      const longOpts: BigIntToLocaleStringOptions = { notation: 'compact', compactDisplay: 'long' };

      expect(v.toLocaleString('en-US', shortOpts)).assertEqual('1M');
      expect(v.toLocaleString('en-US', longOpts)).assertEqual('1 million');

      expect(v.toLocaleString('zh-CN', shortOpts)).assertEqual('100万');
      expect(v.toLocaleString('zh-CN', longOpts)).assertEqual('100万');

      expect(v.toLocaleString('de-DE', shortOpts).length).assertLarger(0);

      expect(v.toLocaleString('ja-JP', shortOpts)).assertEqual('100万');

      expect(v.toLocaleString('fr-FR', shortOpts).length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_1900
     * @tc.name testBigIntToLocale2Test019
     * @tc.desc Verify formatting of very large numbers (10^12 to 10^18)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const v12 = BigInt('1000000000000');
      expect(v12.toLocaleString('en-US', { useGrouping: false })).assertEqual('1000000000000');
      expect(v12.toLocaleString('en-US', { useGrouping: true })).assertEqual('1,000,000,000,000');

      const v15 = BigInt('1000000000000000');
      expect(v15.toLocaleString('en-US', { useGrouping: false })).assertEqual('1000000000000000');

      const v18 = BigInt('1000000000000000000');
      expect(v18.toLocaleString('en-US', { useGrouping: false })).assertEqual('1000000000000000000');

      const longMax = BigInt('9223372036854775807');
      const noGroupStr: string = longMax.toLocaleString('en-US', { useGrouping: false });
      expect(noGroupStr.length).assertLarger(0);
      const groupStr: string = longMax.toLocaleString('en-US', { useGrouping: true });
      expect(groupStr.length).assertLarger(0);
      expect(groupStr.length).assertLarger(noGroupStr.length);

      const longMin = BigInt('-9223372036854775808');
      expect(longMin.toLocaleString('en-US').startsWith('-')).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_2000
     * @tc.name testBigIntToLocale2Test020
     * @tc.desc Verify special locale values (empty string, undefined, empty array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(1234567);

      expect(v.toLocaleString(undefined).length).assertLarger(0);

      const emptyArray: Intl.LocalesArgument = [];
      expect(v.toLocaleString(emptyArray).length).assertLarger(0);

      expect(v.toLocaleString('en-US-u-nu-latn').length).assertLarger(0);

      expect(v.toLocaleString('ar-EG-u-nu-arab').length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_2100
     * @tc.name testBigIntToLocale2Test021
     * @tc.desc Verify missing locale forms: pure language, script, illegal BCP47 patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = BigInt(1234567);
      expect(v.toLocaleString('en', { useGrouping: false })).assertEqual('1234567');
      expect(v.toLocaleString('zh', { useGrouping: false })).assertEqual('1234567');
      expect(v.toLocaleString('zh-Hans-CN', { useGrouping: false })).assertEqual('1234567');
      expect(v.toLocaleString('zh-Hant-TW', { useGrouping: false })).assertEqual('1234567');
      expect((): void => { BigInt(1).toLocaleString('x'); }).assertThrowError('RangeError');
      expect((): void => { BigInt(1).toLocaleString('!!!'); }).assertThrowError('RangeError');
      expect((): void => { BigInt(1).toLocaleString('en US'); }).assertThrowError('RangeError');
      expect((): void => { BigInt(1).toLocaleString('<script>alert(1)</script>'); }).assertThrowError('RangeError');
      expect((): void => { BigInt(1).toLocaleString('enenenenenenenenenenen'); }).assertThrowError('RangeError');
      expect((): void => { BigInt(1).toLocaleString(['xx-INVALID', 'en-US']); }).not().assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_2200
     * @tc.name testBigIntToLocale2Test022
     * @tc.desc Verify toLocaleString on extreme large values: 2^128-1, 2^256-1, 10^100 (googol)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('340282366920938463463374607431768211455').toLocaleString('en-US', { useGrouping: false })).assertEqual('340282366920938463463374607431768211455');
      expect(BigInt('115792089237316195423570985008687907853269984665640564039457584007913129639935').toLocaleString('en-US', { useGrouping: false })).assertEqual('115792089237316195423570985008687907853269984665640564039457584007913129639935');
      expect(BigInt('10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000').toLocaleString('en-US', { useGrouping: false })).assertEqual('10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
      expect(BigInt('340282366920938463463374607431768211455').toLocaleString('en-US', { notation: 'scientific' }).length).assertLarger(0);
      expect(BigInt('340282366920938463463374607431768211455').toLocaleString('en-US', { notation: 'compact', compactDisplay: 'short' }).length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_2300
     * @tc.name testBigIntToLocale2Test023
     * @tc.desc Verify immutability: 10 consecutive calls, negative large, and options combo do not change original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2Test023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: BigInt = BigInt(555666777);
      for (let i = 0; i < 10; i++) {
        v.toLocaleString('en-US');
      }
      expect(v.toString()).assertEqual('555666777');

      const vNeg: BigInt = BigInt(-123456);
      vNeg.toLocaleString('en-US');
      vNeg.toLocaleString('zh-CN');
      expect(vNeg.toString()).assertEqual('-123456');

      const vLarge: BigInt = BigInt('999999999999999999999999999999');
      vLarge.toLocaleString('en-US');
      vLarge.toLocaleString('de-DE');
      expect(vLarge.toString()).assertEqual('999999999999999999999999999999');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_EXT_2400
     * @tc.name testBigIntToLocale2ExtTest024
     * @tc.desc Verify notation engineering produces non-empty result for large values (TLS-21)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2ExtTest024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: BigInt = BigInt(1234567);
      const engResult: string = v.toLocaleString('en-US', { notation: 'engineering' });
      expect(engResult.length).assertLarger(0);
      const vLarge: BigInt = BigInt('12345678901234567890');
      const engLarge: string = vLarge.toLocaleString('en-US', { notation: 'engineering' });
      expect(engLarge.length).assertLarger(0);
      const vNeg: BigInt = BigInt(-1234567);
      const engNeg: string = vNeg.toLocaleString('en-US', { notation: 'engineering' });
      expect(engNeg.length).assertLarger(0);
      const vZero: BigInt = BigInt(0);
      const engZero: string = vZero.toLocaleString('en-US', { notation: 'engineering' });
      expect(engZero.indexOf('0')).assertLarger(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_2_EXT_2500
     * @tc.name testBigIntToLocale2ExtTest025
     * @tc.desc Verify locale array with three elements as fallback list (TLS-01)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale2ExtTest025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v: BigInt = BigInt(123456789);
      const locales: Intl.LocalesArgument = ['de-DE', 'fr-FR', 'en-US'];
      expect(v.toLocaleString(locales, { useGrouping: false })).assertEqual('123456789');
      expect(v.toLocaleString(locales).length > 0).assertTrue();
      const invalidFallback: Intl.LocalesArgument = ['xx-INVALID', 'en-US'];
      expect((): void => {
        v.toLocaleString(invalidFallback, { useGrouping: false });
      }).not().assertThrowError('RangeError');
    });
  });
}
